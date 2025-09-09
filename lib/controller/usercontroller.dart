import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:postgres/postgres.dart';
import 'package:uplift/dbConnection.dart';
import 'package:uplift/model/usermodel.dart';

class UserController {
  Future<bool> userSignUp(User user) async {
    try {
      // Get the active DB connection
      PostgreSQLConnection conn = await DatabaseConnection().getConnection();

      // Check if connection is active
      if (conn.isClosed) {
        print('Warning: DB connection was closed. Reconnecting...');
        conn = await DatabaseConnection().getConnection();
        return false;
      } else {
        //Hash the password using sha256
        String hashedPassword = hashPassword(user.encryptedPassword);

        await conn.query(
          '''
      INSERT INTO users (username, emailAddress, encryptedPassword) 
      VALUES (@username, @emailAddress, @encryptedPassword)
      ''',
          substitutionValues: {
            'username': user.username,
            'emailAddress': user.emailAddress,
            'encryptedPassword': hashedPassword,
          },
        );
        return true;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<User?> userSignIn(String username, String password) async {
    try {
      // Get the active DB connection
      PostgreSQLConnection conn = await DatabaseConnection().getConnection();

      // Check if connection is active
      if (conn.isClosed) {
        print('Warning: DB connection was closed. Reconnecting...');
        conn = await DatabaseConnection().getConnection();
        return null;
      } else {
        //Hash the password using sha256
        String hashedPassword = hashPassword(password);

        final result = await conn.query(
          '''
          SELECT * FROM users WHERE username = @username AND encryptedPassword = @encryptedPassword
          ''',
          substitutionValues: {
            'username': username,
            'encryptedPassword': hashedPassword,
          },
        );
        if (result.isNotEmpty) {
          final row = result.first;
          return User(
            userID: row[0] as int,
            username: row[1] as String,
            emailAddress: row[2] as String,
            encryptedPassword: row[3] as String,
            gender: row[4] as String?,
            age: row[5] as int?,
            location: row[6] as String?,
            cgpa: row[7] as double?,
            cgpaGoal: row[8] as double?,
            instituteName: row[9] as String?,
          );
        } else {
          return null;
        }
      }
    } catch (e){
      print('Error: $e');
      return null;
    }
  }

  Future<bool> resetPassword(String email, String newPassword) async {
    try {
      // Get the active DB connection
      PostgreSQLConnection conn = await DatabaseConnection().getConnection();

      // Check if connection is active
      if (conn.isClosed) {
        print('Warning: DB connection was closed. Reconnecting...');
        conn = await DatabaseConnection().getConnection();
        return false;
      } else {
        //Hash the password using sha256
        String hashedPassword = hashPassword(newPassword);

        await conn.query(
          '''
          UPDATE users SET encryptedPassword = @encryptedPassword WHERE emailAddress = @emailAddress
          ''',
          substitutionValues: {
            'emailAddress': email,
            'encryptedPassword': hashedPassword,
          },
        );
        return true;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

}