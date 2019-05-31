open Prims
let (unpack_lsp_query :
  (Prims.string * FStar_Util.json) Prims.list -> FStar_JsonHelper.lsp_query)
  =
  fun r ->
    let qid =
      let uu____23 = FStar_JsonHelper.try_assoc "id" r in
      FStar_All.pipe_right uu____23
        (FStar_Util.map_option FStar_JsonHelper.js_str_int) in
    try
      (fun uu___3_36 ->
         match () with
         | () ->
             let method_37 =
               let uu____39 = FStar_JsonHelper.assoc "method" r in
               FStar_All.pipe_right uu____39 FStar_JsonHelper.js_str in
             let uu____42 =
               match method_37 with
               | "initialize" ->
                   let uu____44 =
                     let uu____51 =
                       let uu____53 = FStar_JsonHelper.arg "processId" r in
                       FStar_All.pipe_right uu____53 FStar_JsonHelper.js_int in
                     let uu____56 =
                       let uu____58 = FStar_JsonHelper.arg "rootUri" r in
                       FStar_All.pipe_right uu____58 FStar_JsonHelper.js_str in
                     (uu____51, uu____56) in
                   FStar_JsonHelper.Initialize uu____44
               | "initialized" -> FStar_JsonHelper.Initialized
               | "shutdown" -> FStar_JsonHelper.Shutdown
               | "exit" -> FStar_JsonHelper.Exit
               | "$/cancelRequest" ->
                   let uu____67 =
                     let uu____69 = FStar_JsonHelper.arg "id" r in
                     FStar_All.pipe_right uu____69
                       FStar_JsonHelper.js_str_int in
                   FStar_JsonHelper.Cancel uu____67
               | "workspace/didChangeWorkspaceFolders" ->
                   let uu____73 =
                     let uu____74 = FStar_JsonHelper.arg "event" r in
                     FStar_All.pipe_right uu____74
                       FStar_JsonHelper.js_wsch_event in
                   FStar_JsonHelper.FolderChange uu____73
               | "workspace/didChangeConfiguration" ->
                   FStar_JsonHelper.ChangeConfig
               | "workspace/didChangeWatchedFiles" ->
                   FStar_JsonHelper.ChangeWatch
               | "workspace/symbol" ->
                   let uu____79 =
                     let uu____81 = FStar_JsonHelper.arg "query" r in
                     FStar_All.pipe_right uu____81 FStar_JsonHelper.js_str in
                   FStar_JsonHelper.Symbol uu____79
               | "workspace/executeCommand" ->
                   let uu____85 =
                     let uu____87 = FStar_JsonHelper.arg "command" r in
                     FStar_All.pipe_right uu____87 FStar_JsonHelper.js_str in
                   FStar_JsonHelper.ExecCommand uu____85
               | "textDocument/didOpen" ->
                   let uu____91 =
                     let uu____92 = FStar_JsonHelper.arg "textDocument" r in
                     FStar_All.pipe_right uu____92
                       FStar_JsonHelper.js_txdoc_item in
                   FStar_JsonHelper.DidOpen uu____91
               | "textDocument/didChange" -> FStar_JsonHelper.DidChange
               | "textDocument/willSave" ->
                   let uu____96 = FStar_JsonHelper.js_txdoc_id r in
                   FStar_JsonHelper.WillSave uu____96
               | "textDocument/willSaveWaitUntil" ->
                   let uu____99 = FStar_JsonHelper.js_txdoc_id r in
                   FStar_JsonHelper.WillSaveWait uu____99
               | "textDocument/didSave" ->
                   let uu____102 = FStar_JsonHelper.js_txdoc_id r in
                   FStar_JsonHelper.DidSave uu____102
               | "textDocument/didClose" ->
                   let uu____105 = FStar_JsonHelper.js_txdoc_id r in
                   FStar_JsonHelper.DidClose uu____105
               | "textDocument/completion" ->
                   let uu____108 =
                     let uu____113 = FStar_JsonHelper.js_txdoc_pos r in
                     let uu____114 =
                       let uu____115 = FStar_JsonHelper.arg "context" r in
                       FStar_All.pipe_right uu____115
                         FStar_JsonHelper.js_compl_context in
                     (uu____113, uu____114) in
                   FStar_JsonHelper.Completion uu____108
               | "completionItem/resolve" -> FStar_JsonHelper.Resolve
               | "textDocument/hover" ->
                   let uu____119 = FStar_JsonHelper.js_txdoc_pos r in
                   FStar_JsonHelper.Hover uu____119
               | "textDocument/signatureHelp" ->
                   let uu____121 = FStar_JsonHelper.js_txdoc_pos r in
                   FStar_JsonHelper.SignatureHelp uu____121
               | "textDocument/declaration" ->
                   let uu____123 = FStar_JsonHelper.js_txdoc_pos r in
                   FStar_JsonHelper.Declaration uu____123
               | "textDocument/definition" ->
                   let uu____125 = FStar_JsonHelper.js_txdoc_pos r in
                   FStar_JsonHelper.Definition uu____125
               | "textDocument/typeDefinition" ->
                   let uu____127 = FStar_JsonHelper.js_txdoc_pos r in
                   FStar_JsonHelper.TypeDefinition uu____127
               | "textDocument/implementation" ->
                   let uu____129 = FStar_JsonHelper.js_txdoc_pos r in
                   FStar_JsonHelper.Implementation uu____129
               | "textDocument/references" -> FStar_JsonHelper.References
               | "textDocument/documentHighlight" ->
                   let uu____132 = FStar_JsonHelper.js_txdoc_pos r in
                   FStar_JsonHelper.DocumentHighlight uu____132
               | "textDocument/documentSymbol" ->
                   FStar_JsonHelper.DocumentSymbol
               | "textDocument/codeAction" -> FStar_JsonHelper.CodeAction
               | "textDocument/codeLens" -> FStar_JsonHelper.CodeLens
               | "codeLens/resolve" -> FStar_JsonHelper.CodeLensResolve
               | "textDocument/documentLink" -> FStar_JsonHelper.DocumentLink
               | "documentLink/resolve" ->
                   FStar_JsonHelper.DocumentLinkResolve
               | "textDocument/documentColor" ->
                   FStar_JsonHelper.DocumentColor
               | "textDocument/colorPresentation" ->
                   FStar_JsonHelper.ColorPresentation
               | "textDocument/formatting" -> FStar_JsonHelper.Formatting
               | "textDocument/rangeFormatting" ->
                   FStar_JsonHelper.RangeFormatting
               | "textDocument/onTypeFormatting" ->
                   FStar_JsonHelper.TypeFormatting
               | "textDocument/rename" -> FStar_JsonHelper.Rename
               | "textDocument/prepareRename" ->
                   let uu____146 = FStar_JsonHelper.js_txdoc_pos r in
                   FStar_JsonHelper.PrepareRename uu____146
               | "textDocument/foldingRange" -> FStar_JsonHelper.FoldingRange
               | m ->
                   let uu____150 = FStar_Util.format1 "Unknown method '%s'" m in
                   FStar_JsonHelper.BadProtocolMsg uu____150 in
             { FStar_JsonHelper.query_id = qid; FStar_JsonHelper.q = uu____42
             }) ()
    with
    | FStar_JsonHelper.MissingKey msg ->
        {
          FStar_JsonHelper.query_id = qid;
          FStar_JsonHelper.q = (FStar_JsonHelper.BadProtocolMsg msg)
        }
    | FStar_JsonHelper.UnexpectedJsonType (expected, got) ->
        FStar_JsonHelper.wrap_jsfail qid expected got
let (deserialize_lsp_query : FStar_Util.json -> FStar_JsonHelper.lsp_query) =
  fun js_query ->
    try
      (fun uu___57_170 ->
         match () with
         | () ->
             let uu____171 =
               FStar_All.pipe_right js_query FStar_JsonHelper.js_assoc in
             unpack_lsp_query uu____171) ()
    with
    | FStar_JsonHelper.UnexpectedJsonType (expected, got) ->
        FStar_JsonHelper.wrap_jsfail FStar_Pervasives_Native.None expected
          got
let (parse_lsp_query : Prims.string -> FStar_JsonHelper.lsp_query) =
  fun query_str ->
    FStar_Util.print1_error ">>> %s\n" query_str;
    (let uu____205 = FStar_Util.json_of_string query_str in
     match uu____205 with
     | FStar_Pervasives_Native.None ->
         {
           FStar_JsonHelper.query_id = FStar_Pervasives_Native.None;
           FStar_JsonHelper.q =
             (FStar_JsonHelper.BadProtocolMsg "Json parsing failed")
         }
     | FStar_Pervasives_Native.Some request -> deserialize_lsp_query request)
let (run_exit : FStar_JsonHelper.repl_state -> Prims.int) =
  fun st -> (Prims.parse_int "0")
let (run_query :
  FStar_JsonHelper.repl_state ->
    FStar_JsonHelper.lquery ->
      (FStar_JsonHelper.optresponse * FStar_JsonHelper.either_st_exit))
  =
  fun st ->
    fun q ->
      match q with
      | FStar_JsonHelper.Initialize (pid, rootUri) ->
          ((FStar_Pervasives_Native.Some
              (FStar_Util.Inl FStar_JsonHelper.js_servcap)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.Initialized ->
          (FStar_Pervasives_Native.None, (FStar_Util.Inl st))
      | FStar_JsonHelper.Shutdown ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.Exit ->
          let uu____260 =
            let uu____261 = run_exit st in FStar_Util.Inr uu____261 in
          (FStar_Pervasives_Native.None, uu____260)
      | FStar_JsonHelper.Cancel id1 ->
          (FStar_Pervasives_Native.None, (FStar_Util.Inl st))
      | FStar_JsonHelper.FolderChange evt ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.ChangeConfig ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.ChangeWatch ->
          (FStar_Pervasives_Native.None, (FStar_Util.Inl st))
      | FStar_JsonHelper.Symbol sym ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.ExecCommand cmd ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.DidOpen
          { FStar_JsonHelper.fname = f; FStar_JsonHelper.langId = uu____306;
            FStar_JsonHelper.version = uu____307;
            FStar_JsonHelper.text = t;_}
          ->
          let p = FStar_JsonHelper.uri_to_path f in
          let r =
            let uu____316 =
              FStar_Range.mk_pos (Prims.parse_int "1") (Prims.parse_int "0") in
            let uu____319 =
              FStar_Range.mk_pos (Prims.parse_int "1") (Prims.parse_int "0") in
            FStar_Range.mk_range p uu____316 uu____319 in
          let env =
            FStar_TypeChecker_Env.set_range st.FStar_JsonHelper.repl_env r in
          let st1 =
            let uu___99_324 = st in
            {
              FStar_JsonHelper.repl_line = (Prims.parse_int "1");
              FStar_JsonHelper.repl_column = (Prims.parse_int "0");
              FStar_JsonHelper.repl_fname = p;
              FStar_JsonHelper.repl_deps_stack =
                (uu___99_324.FStar_JsonHelper.repl_deps_stack);
              FStar_JsonHelper.repl_curmod =
                (uu___99_324.FStar_JsonHelper.repl_curmod);
              FStar_JsonHelper.repl_env = env;
              FStar_JsonHelper.repl_stdin =
                (uu___99_324.FStar_JsonHelper.repl_stdin);
              FStar_JsonHelper.repl_names =
                (uu___99_324.FStar_JsonHelper.repl_names)
            } in
          let uu____327 =
            let uu____328 = FStar_PushHelper.full_lax t st1 in
            FStar_Util.Inl uu____328 in
          (FStar_Pervasives_Native.None, uu____327)
      | FStar_JsonHelper.DidChange ->
          (FStar_Pervasives_Native.None, (FStar_Util.Inl st))
      | FStar_JsonHelper.WillSave txid ->
          (FStar_Pervasives_Native.None, (FStar_Util.Inl st))
      | FStar_JsonHelper.WillSaveWait txid ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.DidSave txid ->
          (FStar_Pervasives_Native.None, (FStar_Util.Inl st))
      | FStar_JsonHelper.DidClose txid ->
          (FStar_Pervasives_Native.None, (FStar_Util.Inl st))
      | FStar_JsonHelper.Completion (txpos, ctx) ->
          let uu____369 =
            let uu____370 = FStar_QueryHelper.complookup st txpos in
            FStar_Pervasives_Native.Some uu____370 in
          (uu____369, (FStar_Util.Inl st))
      | FStar_JsonHelper.Resolve ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.Hover txpos ->
          let uu____386 =
            let uu____387 =
              FStar_QueryHelper.hoverlookup st.FStar_JsonHelper.repl_env
                txpos in
            FStar_Pervasives_Native.Some uu____387 in
          (uu____386, (FStar_Util.Inl st))
      | FStar_JsonHelper.SignatureHelp txpos ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.Declaration txpos ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.Definition txpos ->
          let uu____410 =
            let uu____411 =
              FStar_QueryHelper.deflookup st.FStar_JsonHelper.repl_env txpos in
            FStar_Pervasives_Native.Some uu____411 in
          (uu____410, (FStar_Util.Inl st))
      | FStar_JsonHelper.TypeDefinition txpos ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.Implementation txpos ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.References ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.DocumentHighlight txpos ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.DocumentSymbol ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.CodeAction ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.CodeLens ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.CodeLensResolve ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.DocumentLink ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.DocumentLinkResolve ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.DocumentColor ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.ColorPresentation ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.Formatting ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.RangeFormatting ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.TypeFormatting ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.Rename ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.PrepareRename txpos ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.FoldingRange ->
          ((FStar_Pervasives_Native.Some (FStar_Util.Inl FStar_Util.JsonNull)),
            (FStar_Util.Inl st))
      | FStar_JsonHelper.BadProtocolMsg msg ->
          let uu____517 =
            let uu____518 =
              let uu____523 =
                FStar_JsonHelper.js_resperr FStar_JsonHelper.MethodNotFound
                  msg in
              FStar_Util.Inr uu____523 in
            FStar_Pervasives_Native.Some uu____518 in
          (uu____517, (FStar_Util.Inl st))
let rec (parse_header_len :
  FStar_Util.stream_reader -> Prims.int -> Prims.int) =
  fun stream ->
    fun len ->
      let uu____544 = FStar_Util.read_line stream in
      match uu____544 with
      | FStar_Pervasives_Native.Some s ->
          if FStar_Util.starts_with s "Content-Length: "
          then
            let uu____555 =
              let uu____557 =
                FStar_Util.substring_from s (Prims.parse_int "16") in
              FStar_Util.int_of_string uu____557 in
            parse_header_len stream uu____555
          else
            if FStar_Util.starts_with s "Content-Type: "
            then parse_header_len stream len
            else
              if s = ""
              then len
              else FStar_Exn.raise FStar_JsonHelper.MalformedHeader
      | FStar_Pervasives_Native.None ->
          FStar_Exn.raise FStar_JsonHelper.InputExhausted
let rec (read_lsp_query :
  FStar_Util.stream_reader -> FStar_JsonHelper.lsp_query) =
  fun stream ->
    try
      (fun uu___158_586 ->
         match () with
         | () ->
             let n1 = parse_header_len stream (Prims.parse_int "0") in
             let uu____590 = FStar_Util.nread stream n1 in
             (match uu____590 with
              | FStar_Pervasives_Native.Some s -> parse_lsp_query s
              | FStar_Pervasives_Native.None ->
                  let uu____598 =
                    let uu____600 = FStar_Util.string_of_int n1 in
                    FStar_Util.format1 "Could not read %s bytes" uu____600 in
                  FStar_JsonHelper.wrap_content_szerr uu____598)) ()
    with
    | FStar_JsonHelper.MalformedHeader ->
        (FStar_Util.print_error "[E] Malformed Content Header\n";
         read_lsp_query stream)
    | FStar_JsonHelper.InputExhausted -> read_lsp_query stream
let rec (go : FStar_JsonHelper.repl_state -> Prims.int) =
  fun st ->
    let query = read_lsp_query st.FStar_JsonHelper.repl_stdin in
    let uu____617 = run_query st query.FStar_JsonHelper.q in
    match uu____617 with
    | (r, state_opt) ->
        ((match r with
          | FStar_Pervasives_Native.Some response ->
              let response' =
                FStar_JsonHelper.json_of_response
                  query.FStar_JsonHelper.query_id response in
              ((let uu____637 = FStar_Util.string_of_json response' in
                FStar_Util.print1_error "<<< %s\n" uu____637);
               FStar_JsonHelper.write_jsonrpc response')
          | FStar_Pervasives_Native.None -> ());
         (match state_opt with
          | FStar_Util.Inl st' -> go st'
          | FStar_Util.Inr exitcode -> exitcode))
let (initial_repl_state : unit -> FStar_JsonHelper.repl_state) =
  fun uu____655 ->
    let initial_range =
      let uu____657 =
        FStar_Range.mk_pos (Prims.parse_int "1") (Prims.parse_int "0") in
      let uu____660 =
        FStar_Range.mk_pos (Prims.parse_int "1") (Prims.parse_int "0") in
      FStar_Range.mk_range "<input>" uu____657 uu____660 in
    let env = FStar_Universal.init_env FStar_Parser_Dep.empty_deps in
    let env1 = FStar_TypeChecker_Env.set_range env initial_range in
    let uu____666 = FStar_Util.open_stdin () in
    {
      FStar_JsonHelper.repl_line = (Prims.parse_int "1");
      FStar_JsonHelper.repl_column = (Prims.parse_int "0");
      FStar_JsonHelper.repl_fname = "<input>";
      FStar_JsonHelper.repl_deps_stack = [];
      FStar_JsonHelper.repl_curmod = FStar_Pervasives_Native.None;
      FStar_JsonHelper.repl_env = env1;
      FStar_JsonHelper.repl_stdin = uu____666;
      FStar_JsonHelper.repl_names = FStar_Interactive_CompletionTable.empty
    }
let (start_server : unit -> unit) =
  fun uu____683 ->
    let uu____684 = let uu____686 = initial_repl_state () in go uu____686 in
    FStar_All.exit uu____684