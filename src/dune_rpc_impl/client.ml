open Import

let client ?handler connection init ~f =
  Client.client
    ?handler
    ~private_menu:[ Request Decl.build; Request Decl.format; Request Decl.status ]
    connection
    init
    ~f
;;
