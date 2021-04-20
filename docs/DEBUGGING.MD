# Debugging dangerfile.dart

1. You need to add `--debug` to any command you wanted to run.
2. Waiting for the text `Observatory listening on http://127.0.0.1:8181/xxxxxxx=/`
3. **Don't forget** to put breakpoints in your `dangerfile.dart`

## On your editor

### VSCode

1. Open `.vscode/launch.json` or create one if you don't have it.

2. Add following configuration

   ```json
   {
     "name": "Danger Attach",
     "type": "dart",
     "request": "attach",
     "program": "tool/dangerfile.dart"
   }
   ```

   **Note:** It doesn't have to point to your `dangerfile.dart` , any dart file inside folder `bin` or `tool` in your workspace should be fine. [More detail](https://github.com/Dart-Code/Dart-Code/blob/9e400c826bc73f7ccd64e54e365af97859e98e2f/src/extension/providers/debug_config_provider.ts#L150)

3. Press `Run` on `Danger Attach` in `Run and Debug` tab

4. VSCode will ask for `VM Service URI`

![Image of VSCode Step 1]((https://github.com/danger/dart/blob/master/docs/images/vscode_1.png)

5. It will start at `yourdangerfile.dart.g.dart`, you can skip it

### Intellij or Android Studio

1. Go to `Run` > `Edit Configurations...`

![Image of Intellij Step 1]((https://github.com/danger/dart/blob/master/docs/images/intellij_1.png)

2. Press `+` button and select `Dart Remote Debug`

![Image of Intellij Step 2]((https://github.com/danger/dart/blob/master/docs/images/intellij_2.png)

3. Put 'Debug Danger' into name field, and press `OK`

![Image of Intellij Step 3]((https://github.com/danger/dart/blob/master/docs/images/intellij_3.png)

4. On the main window, select `Debug Danger` and press `Debug`

![Image of Intellij Step 4]((https://github.com/danger/dart/blob/master/docs/images/intellij_4.png)

5. It will ask for `VM Service URI`

![Image of Intellij Step 5]((https://github.com/danger/dart/blob/master/docs/images/intellij_5.png)

6. It will start at `yourdangerfile.dart.g.dart`, you can skip it
