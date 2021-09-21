# socket_test_ios

For testing the Absinthe GraphQL connection to Apollo on a Phoenix Backend.

1. Clone this Repo and open in Xcode 13.
2. Clone [Phoenix app](https://github.com/Func-Main/socket_test_server)
3. Start server and tunnel a connection to your localhost. iOS requires the connection to be established of wss / https. I use [ngrok](https://ngrok.com)
4. Edit [Config.swift](https://github.com/Func-Main/socket_test_ios/blob/main/SocketTester/Config.swift) for your endpoints.
5. Run in simulator
6. Tapping Trigger will send off a mutation which sends a new subscription message that will appear if the setup is working.
