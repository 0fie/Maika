{
  xdg.configFile = {
    "vesktop/settings/settings.json".text = builtins.toJSON {
      notifyAboutUpdates = true;
      autoUpdate = false;
      autoUpdateNotification = false;
      useQuickCss = true;
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
        "https://catppuccin.github.io/discord/dist/catppuccin-mocha-pink.theme.css"
      ];
      enabledThemes = [
      ];
      enableReactDevtools = false;
      frameless = false;
      transparent = false;
      winCtrlQ = false;
      disableMinSize = false;
      winNativeTitleBar = false;
      plugins = {
        BadgeAPI = {
          enabled = true;
        };
        ChatInputButtonAPI = {
          enabled = true;
        };
        CommandsAPI = {
          enabled = true;
        };
        ContextMenuAPI = {
          enabled = true;
        };
        MemberListDecoratorsAPI = {
          enabled = false;
        };
        MessageAccessoriesAPI = {
          enabled = false;
        };
        MessageDecorationsAPI = {
          enabled = false;
        };
        MessageEventsAPI = {
          enabled = true;
        };
        MessagePopoverAPI = {
          enabled = false;
        };
        NoticesAPI = {
          enabled = true;
        };
        ServerListAPI = {
          enabled = true;
        };
        NoTrack = {
          enabled = true;
        };
        Settings = {
          enabled = true;
          settingsLocation = "aboveActivity";
        };
        SupportHelper = {
          enabled = true;
        };
        AlwaysAnimate = {
          enabled = true;
        };
        AlwaysTrust = {
          enabled = true;
        };
        AnonymiseFileNames = {
          enabled = true;
        };
        BANger = {
          enabled = false;
        };
        BetterFolders = {
          enabled = false;
        };
        BetterGifAltText = {
          enabled = false;
        };
        BetterGifPicker = {
          enabled = true;
        };
        BetterNotesBox = {
          enabled = false;
        };
        BetterRoleContext = {
          enabled = false;
        };
        BetterRoleDot = {
          enabled = false;
        };
        BetterSettings = {
          enabled = true;
        };
        BetterUploadButton = {
          enabled = true;
        };
        BiggerStreamPreview = {
          enabled = false;
        };
        BlurNSFW = {
          enabled = true;
        };
        CallTimer = {
          enabled = false;
        };
        ClearURLs = {
          enabled = true;
        };
        ClientTheme = {
          enabled = false;
        };
        ColorSighted = {
          enabled = false;
        };
        ConsoleShortcuts = {
          enabled = false;
        };
        CopyUserURLs = {
          enabled = true;
        };
        CrashHandler = {
          enabled = true;
        };
        CustomRPC = {
          enabled = false;
        };
        Dearrow = {
          enabled = false;
        };
        Decor = {
          enabled = false;
        };
        DisableCallIdle = {
          enabled = false;
        };
        EmoteCloner = {
          enabled = true;
        };
        Experiments = {
          enabled = true;
        };
        F8Break = {
          enabled = false;
        };
        FakeNitro = {
          enabled = true;
        };
        FakeProfileThemes = {
          enabled = false;
        };
        FavoriteEmojiFirst = {
          enabled = true;
        };
        FavoriteGifSearch = {
          enabled = false;
        };
        FixCodeblockGap = {
          enabled = false;
        };
        FixSpotifyEmbeds = {
          enabled = false;
        };
        FixYoutubeEmbeds = {
          enabled = false;
        };
        ForceOwnerCrown = {
          enabled = false;
        };
        FriendInvites = {
          enabled = false;
        };
        FriendsSince = {
          enabled = false;
        };
        GameActivityToggle = {
          enabled = false;
        };
        GifPaste = {
          enabled = false;
        };
        GreetStickerPicker = {
          enabled = false;
        };
        HideAttachments = {
          enabled = false;
        };
        iLoveSpam = {
          enabled = false;
        };
        IgnoreActivities = {
          enabled = false;
        };
        ImageZoom = {
          enabled = false;
        };
        InvisibleChat = {
          enabled = false;
        };
        KeepCurrentChannel = {
          enabled = false;
        };
        LastFMRichPresence = {
          enabled = false;
        };
        LoadingQuotes = {
          enabled = true;
        };
        MemberCount = {
          enabled = false;
        };
        MessageClickActions = {
          enabled = false;
        };
        MessageLinkEmbeds = {
          enabled = false;
        };
        MessageLogger = {
          enabled = false;
        };
        MessageTags = {
          enabled = false;
        };
        MoreCommands = {
          enabled = false;
        };
        MoreKaomoji = {
          enabled = false;
        };
        MoreUserTags = {
          enabled = false;
        };
        Moyai = {
          enabled = false;
        };
        MutualGroupDMs = {
          enabled = false;
        };
        NewGuildSettings = {
          enabled = false;
        };
        NoBlockedMessages = {
          enabled = false;
        };
        NoDevtoolsWarning = {
          enabled = false;
        };
        NoF1 = {
          enabled = false;
        };
        NoMosaic = {
          enabled = false;
        };
        NoPendingCount = {
          enabled = false;
        };
        NoProfileThemes = {
          enabled = false;
        };
        NoReplyMention = {
          enabled = false;
        };
        NoScreensharePreview = {
          enabled = false;
        };
        NoTypingAnimation = {
          enabled = false;
        };
        NoUnblockToJump = {
          enabled = false;
        };
        NormalizeMessageLinks = {
          enabled = false;
        };
        NotificationVolume = {
          enabled = false;
        };
        NSFWGateBypass = {
          enabled = true;
        };
        OnePingPerDM = {
          enabled = false;
        };
        oneko = {
          enabled = false;
        };
        OpenInApp = {
          enabled = false;
        };
        OverrideForumDefaults = {
          enabled = false;
        };
        PermissionFreeWill = {
          enabled = true;
        };
        PermissionsViewer = {
          enabled = false;
        };
        petpet = {
          enabled = false;
        };
        PictureInPicture = {
          enabled = false;
        };
        PinDMs = {
          enabled = false;
        };
        PlainFolderIcon = {
          enabled = false;
        };
        PlatformIndicators = {
          enabled = false;
        };
        PreviewMessage = {
          enabled = true;
        };
        PronounDB = {
          enabled = false;
        };
        QuickMention = {
          enabled = false;
        };
        QuickReply = {
          enabled = false;
        };
        ReactErrorDecoder = {
          enabled = false;
        };
        ReadAllNotificationsButton = {
          enabled = true;
        };
        RelationshipNotifier = {
          enabled = true;
        };
        ResurrectHome = {
          enabled = false;
        };
        RevealAllSpoilers = {
          enabled = false;
        };
        ReverseImageSearch = {
          enabled = true;
        };
        ReviewDB = {
          enabled = false;
        };
        RoleColorEverywhere = {
          enabled = false;
        };
        SearchReply = {
          enabled = false;
        };
        SecretRingToneEnabler = {
          enabled = false;
        };
        SendTimestamps = {
          enabled = false;
        };
        ServerListIndicators = {
          enabled = false;
        };
        ServerProfile = {
          enabled = false;
        };
        ShikiCodeblocks = {
          enabled = false;
        };
        ShowAllMessageButtons = {
          enabled = false;
        };
        ShowConnections = {
          enabled = true;
        };
        ShowHiddenChannels = {
          enabled = true;
        };
        ShowMeYourName = {
          enabled = false;
          mode = "user-nick";
          displayNames = false;
          inReplies = false;
        };
        ShowTimeouts = {
          enabled = false;
        };
        SilentMessageToggle = {
          enabled = false;
        };
        SilentTyping = {
          enabled = false;
        };
        SortFriendRequests = {
          enabled = false;
        };
        SpotifyControls = {
          enabled = true;
        };
        SpotifyCrack = {
          enabled = false;
        };
        SpotifyShareCommands = {
          enabled = false;
        };
        StartupTimings = {
          enabled = false;
        };
        SuperReactionTweaks = {
          enabled = false;
        };
        TextReplace = {
          enabled = false;
        };
        ThemeAttributes = {
          enabled = false;
        };
        TimeBarAllActivities = {
          enabled = false;
        };
        Translate = {
          enabled = false;
        };
        TypingIndicator = {
          enabled = false;
        };
        TypingTweaks = {
          enabled = false;
        };
        Unindent = {
          enabled = false;
        };
        UnsuppressEmbeds = {
          enabled = false;
        };
        UrbanDictionary = {
          enabled = true;
        };
        UserVoiceShow = {
          enabled = false;
        };
        USRBG = {
          enabled = false;
          nitroFirst = true;
          voiceBackground = true;
        };
        ValidUser = {
          enabled = true;
        };
        VoiceChatDoubleClick = {
          enabled = false;
        };
        VcNarrator = {
          enabled = false;
        };
        VencordToolbox = {
          enabled = false;
        };
        ViewIcons = {
          enabled = false;
        };
        ViewRaw = {
          enabled = false;
        };
        VoiceMessages = {
          enabled = false;
        };
        WebContextMenus = {
          enabled = true;
          addBack = true;
        };
        WebKeybinds = {
          enabled = true;
        };
        WhoReacted = {
          enabled = true;
        };
        Wikisearch = {
          enabled = false;
        };
        XSOverlay = {
          enabled = false;
        };
      };
      notifications = {
        timeout = 5000;
        position = "bottom-right";
        useNative = "not-focused";
        logLimit = 50;
      };
      cloud = {
        authenticated = false;
        url = "https://api.vencord.dev/";
        settingsSync = false;
        settingsSyncVersion = 1713336128416;
      };
    };
  };
}
