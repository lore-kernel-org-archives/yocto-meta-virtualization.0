Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB30C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 13:42:49 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.10708.1740663764159410750
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2025 05:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bu1xxQxY;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fe848040b1so1981334a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2025 05:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740663763; x=1741268563; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G/5wpCaZMOxMWQhYH0M1N2RRU5cfwJTrEa73BzHO7zk=;
        b=bu1xxQxY5nLvxU6wgL4WD6M4vYTZmtU9i3MrfOI/K2npg85EKV9/HsdXsT86opDJX/
         j1BYbfaZM5uce7XCSq6nu1D1PrRuIQTMl7WaHeMZhDSRxCzzfmv+ZcPmdgiIIv3cXFEO
         w+Zg7+O+2hySaElnelSsV1v6LbrvntJdc6v61VQcwDiIIAw+Ehrs5zOs/oMD0RL9cQzh
         MzlX+qYYCn9KEbJr/3/GeoMjyF3FFtkPM0tJIwZFvwc36NyeZgkjuUUZM2yFPgEBIKQr
         kzXHBwdLAtOBF2eZRFHNURX/jxk7ICwbxCWdmmLB+j0XyweNNbN9dSWf/BqOr4N3L4Rh
         Xzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740663763; x=1741268563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/5wpCaZMOxMWQhYH0M1N2RRU5cfwJTrEa73BzHO7zk=;
        b=sHHdhB6VKMhbZ51Iormp8awB+0nleunEHgBcoLuIQZ752zntsOTFaF+mBkib27OSIr
         tSg95LkePqY7wGsemICtZAM6LeT0S7uq7Wb7LnAYj85QwBcvOt31pQWoJUKDhzO3MIfV
         hhae+yNWMMX5QdXcw1omE3gVQ310S/m+UfSMYdvcRWNsig24S+LeV80SNh6M8XoV8G54
         RlnGCEiuVzHF+V8TNJLqGmD5aDGLvMMCoBRXkzRAWNE+stTnPGzDvENrhKhU9rcGbsBy
         tLhzS3Q36MmGR3jkvJ5pDjn+Yj2dMUOReN87etsaQz35KKbjyTuNgh9jwhqIJyOOdcBA
         jtmw==
X-Gm-Message-State: AOJu0Yw8gEkxP3ZmAWU0QXM3zxOTlKcaM8AVKnv3MX+HdkeW+ZSoGa5Q
	bcqivWcokRB58hmUXizj+kFMrbYlX7KT3DKg0udkjTaWqlOPgttRPsZ7WK+Uf2PghF//z3niMmm
	GD+n5aYgHL/uymk7Y40a+lh02Rao=
X-Gm-Gg: ASbGncs5ObXrqLe8JyUQwUUeqBCLlpzsjNZZyUc6s8l0i52ISMnBdQp+tmxqUmFnhDo
	04zxCMB7SY3ueMIy0JqOCUSVJNbtVN/vvHTM6g+h0bS/wsTVD+O0CDJyqpojIqboMpNx9LzNG/j
	ubi3V8klo=
X-Google-Smtp-Source: AGHT+IHWUKxlx4xI3/oyH6KxGSiM0oq5t8IOm0awtZcUjtMl/PmvelrazV9KoEXj0v3yhwlbdAcv6ZJr9ndK3/RwnHU=
X-Received: by 2002:a17:90a:d2cf:b0:2fe:b774:3ec8 with SMTP id
 98e67ed59e1d1-2feb7744f46mr432402a91.23.1740663763087; Thu, 27 Feb 2025
 05:42:43 -0800 (PST)
MIME-Version: 1.0
References: <20250227100913.309277-2-paolo.barbolini@m4ss.net>
In-Reply-To: <20250227100913.309277-2-paolo.barbolini@m4ss.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 27 Feb 2025 08:42:28 -0500
X-Gm-Features: AQ5f1JqzgPnQtgBK-aeiNER8vxonm6c9Uqfr9G6GrEdweIBMc8ZbUng4ZwyzZzs
Message-ID: <CADkTA4PFJ5u28z_qk5itjyyzBMEY6+dSf=7E2BWsBj4DkMp7=g@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] docker: upgrade to v27.5.1
To: paolo.barbolini@m4ss.net
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000045bc2e062f1fdda6"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2025 13:42:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9150

--00000000000045bc2e062f1fdda6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch, but I already have a flight of package
upgrades incoming (I do them at the M1 and M3.5
timeframes). I'll check my updates against this one, but there shouldn't be
any differences (except mine will
be slightly newer)

Cheers,

Bruce

On Thu, Feb 27, 2025 at 5:10=E2=80=AFAM Paolo Barbolini via lists.yoctoproj=
ect.org
<paolo.barbolini=3Dm4ss.net@lists.yoctoproject.org> wrote:

> Bumping moby to version v27.5.1, which comprises the following commits:
>
>     0ec92ba6a4 Clear RWLayer reference under container lock
>     95122b4bde Dockerfile: update runc binary to v1.2.4
>     a78ae66d0e pkg/ioutils: deprecate BytesPipe, NewBytesPipe, ErrClosed
>     d9c2cde3be pkg/ioutils: deprecate WriteCounter, NewWriteCounter
>     41697f61ec pkg/ioutils: deprecate NopFlusher
>     9b974d599a daemon: don't repeatedly call NumCPU if not needed
>     5b7034f4c6 pkg/sysinfo: Deprecate NumCPU
>     f53d72e0be Fix unit tests for an nftables host
>     c83f658829 Dockerfile: update containerd to v1.7.25
>     cf37b661dd pkg/ioutils: deprecate NopWriter
>     8a2fd51c84 pkg/ioutils: deprecate NopWriteCloser
>     70a866e37e Dockerfile: update RootlessKit to v2.3.2
>     ad04c7b55a Allow users to ignore missing br_netfilter
>     d57309014d Move integration/network/bridge_test.go to bridge subdir
>     b33299da85 Bridge: on network delete, make sure it's deleted from sto=
re
>     36706f0e5f ci: switch from jenkins to gha for arm64 build and tests
>     6c832d05c4 gha: set arm64 GO_VERSION to 1.22.10
>     c83862c541 update to go1.22.11 (fix CVE-2024-45341, CVE-2024-45336)
>     95d18194a4 gha: Adjust release branches
>     542e33c421 ci: update bake-action to v6
>     e85906c6a8 ci(bin-image): fix bake build
>     fbc854d9d3 Dockerfile: update docker CLI to v27.5.0
>     4c8ec29141 Dockerfile: update buildx to v0.20.0
>     0da7a2656e Dockerfile: update compose to v2.32.4
>
> Bumping docker-cli to version v27.5.1, which comprises the following
> commits:
>
>     e0b44d6d3f push: Don't default to DOCKER_DEFAULT_PLATFORM
>     330a8e4e23 c8d: Remove `docker convert` mention
>     bd43ca786b push: Improve note message and colors
>     5777558c77 fix: container stream should not be terminated by ctx
>     d36bdb0d84 test: e2e SIGTERM attached container on `docker run`
>     333103d93f chore: restore ctx without cancel on container run
>     4d67ef09c8 fix: ctx cancellation on login prompt
>     5dea9d881c Enable completion for 'image' sub commands
>     338e7a604c Dockerfile.dev: install bash-completion in dev container
>     6cd1f6f26d Makefile: add completion target
>     d60252954b cli/command/container: NewRunCommand: slight cleanup of
> completion
>     68fe829c96 cli/command/completion: add FileNames utility
>     d914a3f97e cli/command/completion: add EnvVarNames utility
>     7a4062a4a9 cli/command/completion: add FromList utility
>     4473f48847 cli/command/container: provide flag-completion for "docker
> create"
>     787caf2fe4 cmd/docker: fix completion for --context
>     3926ed6b24 cli/context/store: Names(): fix panic when called with
> nil-interface
>     36802176a7 cli/command/container: add completion for --cap-add,
> --cap-drop
>     d11e73d6e6 cli/command/container: add completion for --restart
>     ab8a2c0716 cli/command/container: add completion for --volumes-from
>     66ec7142ae cli/command/container: add completion for --stop-signal
>     dfe3c0c074 vendor: github.com/klauspost/compress v1.17.9
>     4f1a67e06b vendor: golang.org/x/sys v0.21.0
>     a8e2130643 vendor: golang.org/x/text v0.15.0
>     3577a17ce1 vendor: golang.org/x/crypto v0.23.0
>     e7bcae9053 vendor: golang.org/x/net v0.25.0
>     76863b46b7 vendor: golang.org/x/sync v0.7.0
>     2794ebd599 vendor: github.com/containerd/containerd v1.7.19
>     674f8d2979 vendor: github.com/prometheus/procfs v0.15.1
>     33e5c87957 vendor: google.golang.org/genproto/googleapis/api
> 49dd2c1f3d0b
>     5ab44a4690 vendor: github.com/docker/cli-docs-tool v0.8.0
>     54c8eb7941 docs: fix typos and version for cli-docs-tool scripts
>     c365c3cc8a Dockerfile: update buildx to v0.16.1
>     259d5e0f57 Dockerfile: update compose to v2.29.0
>     f7be714467 gha: check-pr-branch: verify major version only
>     ad47d2a2c1 gha: update to macOS 13, add macOS 14 arm64 (Apple Silicon
> M1)
>     ca9636a1c3 test spring-cleaning
>     8992378c87 add support for DOCKER_CUSTOM_HEADERS env-var (experimenta=
l)
>     c599566439 Allow for OomScoreAdj
>     b24c7417e4 vendor: github.com/containerd/containerd v1.7.20
>     b889b2562c vendor: github.com/docker/docker v27.1.0
>     a74040315e vendor: github.com/docker/docker v27.1.1
>     8a6f7d849d tests: fix flaxy `TestCloseRunningCommand` test
>     7f02bc9704 tests: fix other flaky `connhelper` tests
>     dfb8f2155a attach: don't return context cancelled error
>     1cf3637198 attach: wait for exit code from `ContainerWait`
>     53cb00a818 update to go1.21.13
>     c7f3031f74 tests/run: fix flaky `RunAttachTermination` test
>     edd71d77c7 vendor: golang.org/x/sys v0.22.0
>     40707e17b8 docs: refresh image versions in examples
>     54135b0724 gha: set permissions to read-only by default
>     984ef9072c plugins: don't panic on Close if PluginServer nil
>     946d1097b8 run: fix GetList return empty issue for throttledevice
>     bcd90be73a docs: fix link to http proxy document
>     73452e316f docs: update internal links after refactor
>     65dec14ac0 vendor: github.com/docker/docker f9522e5e96c3 (v27.1.2-dev=
)
>     3eaf30278f docs: update link to moved build context doc
>     0c29d6bac1 auth: add support for oauth device-code login
>     b8a38fd22d Refactor `cli/command/registry`
>     afb5e143b1 login: normalize `registry-1.docker.io`
>     ad7912a846 fallback to regular login if oauth login fails to start
>     83f6ca4a73 disable pseudoterminal creation
>     26536d1145 vendor: github.com/docker/docker v27.2.0-dev (9942d656bade=
)
>     99b647cfca image/list: Add `--tree` flag
>     ba43ae0bd2 cli/tree: Add `Content size` column
>     44a9ffa0ad list/tree: Align number right, text left
>     324cc5d30f list/tree: Sort by created date
>     ab55d75cf5 list/tree: Add an experimental warning
>     b719b10257 list/tree: Capitalize column headers
>     f42fa0b8e1 list/tree: Add spacing before the content and first image
>     7196200fc2 list/tree: Fix some escape codes included in nonTTY
>     7902b52714 list/tree: Print <untagged> as dangling image name
>     0c4e7478e2 list/tree: No extra spacing for graphdriver
>     1b3fa65759 login: add oauth escape hatch
>     a58af379e1 login: add e2e tests for oauth + escape hatch
>     2d7b8998c4 docs: use gh alert syntax for callouts
>     6ceb0aba82 cli/formatter: bracket IPv6 addrs prepended to ports
>     24837f9260 chore: update link to docker engine api reference
>     8e94ed15e6 vendor: github.com/docker/docker b27de4ef1634 (v27.2.0-dev=
)
>     d8af7812b5 cli/command/system: remove redundant nil-check (gosimple)
>     002cfcde85 cli/command: fix n-constant format string in call (govet)
>     4b71d0d1af e2e/global: fix n-constant format string in call (govet)
>     64b9e4cd16 cli: rename args that collided with builtins (predeclard)
>     88a49df297 vendor: github.com/docker/docker 3ab5c7d0036c (v27.2.0-dev=
)
>     32aadc9902 Revert "login: normalize `registry-1.docker.io`"
>     83072c0232 login: use normalized hostname when storing
>     8fcfc0b803 Dockerfile: update xx to v1.5.0
>     1a0b6a7a44 cli/connhelper: getConnectionHelper: move ssh-option funcs
> out of closure
>     7a50cd0f01 docs: update docker login reference
>     6274754e66 copynit: s/WEB BASED/WEB-BASED/
>     de2b49b074 scripts/build/plugins: don't override CGO_ENABLED set by
> .variables
>     1dfd11acc0 oauth/api: drain timer channel on each iteration
>     5bf5cb9ff6 update to go1.22.6
>     d0c1a80617 login: handle non-tty scenario consistently
>     869df10064 vendor.mod: put github.com/pkg/browser in the right group
>     41e61c45d9 [27.x] vendor: github.com/docker/docker v27.2.0
>     3db9538748 update to go1.22.7
>     324cdbca40 vendor: github.com/docker/docker v27.2.1-dev (8b539b8df240=
)
>     b1e50eea92 docs: rename plugins index file and add linkTitle
>     dbde5b3681 docs: add front matter title to deprecated.md
>     90559a6143 chore: fix style/lint issues in deprecated.md
>     4be6b1f3d7 info: stop printing "Expected" commits
>     c65ac2d90d volume/update: require 1 argument/fix panic
>     965699ba0f cli/command/volume TestUpdateCmd: adjust for older error
> messages
>     05fbfc6995 vendor: github.com/docker/docker v27.2.1
>     1fe06dd0e7 vendor: github.com/moby/sys/signal v0.7.1
>     7ff3daa446 vendor: github.com/moby/sys/symlink v0.3.0
>     4607c883c5 vendor: github.com/moby/sys/sequential v0.6.0
>     f68936ef2e vendor: dario.cat/mergo v1.0.1
>     d64740d347 vendor: golang.org/x/sys v0.24.0
>     5dde3d8570 vendor: golang.org/x/sync v0.8.0
>     090d1ff555 vendor: golang.org/x/time v0.6.0
>     295b75e5ff vendor: golang.org/x/term v0.23.0
>     49e33a03df vendor: golang.org/x/text v0.17.0
>     fbb0cfd86a vendor: golang.org/x/crypto v0.26.0
>     968341cc7d vendor: golang.org/x/net v0.28.0
>     1a199b63da vendor: tags.cncf.io/container-device-interface v0.8.0
>     2fc18b9874 vendor: google.golang.org/grpc v1.62.0
>     74bebe2719 vendor: github.com/docker/docker bf60e5cced83 (v27.3.0-dev=
)
>     b48720e65e command: check for wsl mount path on windows
>     7811c442d6 man: update dockerd man-page to include --feature flag
>     bc87ef962a man: fix duplicate word in --feature flag description
>     db7a014d37 man: dockerd: value is optional for --feature flag
>     245f79ff57 docs/reference: dockerd: add docs for --feature option
>     7c72283b37 man: dockerd: add description for --log-format option
>     84d4a5ef11 docs: dockerd: add documentation for --log-format option
>     d896559894 vendor: github.com/docker/docker v27.3.0-rc.1
>     6fdd11b012 Dockerfile: update buildx to v0.17.1
>     b5c6541769 Dockerfile: update compose to v2.29.4
>     81ca58bd20 docs: Fix --rm=3Dfalse flag in container_run.md
>     e2eb069aed gha: update codeql workflow to go1.22.7
>     4b5a196fee telemetry: pass otel errors to the otel handler for
> shutdown and force flush
>     c6dde25470 command: change drive to lowercase for wsl path
>     ca62759b0f vendor: github.com/docker/docker v27.3.0-rc2
>     460f1becc5 telemetry: fix early meterprovider shutdown
>     854695884a vendor: github.com/docker/docker v27.3.0
>     a4149b0c3d Dockerfile: update compose to v2.29.7
>     be9b9f3d70 Update `VERSION` file to `v27.3.1-dev`
>     23cea90233 docs: use important callout for buildkit vs legacy builder
>     fbd51c01c6 docs: fix anchor link to web-based login section
>     6445ae2f02 docs/reference: stop, restart: add flag descriptions
>     d2aec10148 docs: fix a typo in run.md
>     19279c9e53 opts: cleanup ParseEnvFile tests
>     6f5bfcb276 docs: fix inaccurate description of --restart=3Dunless-sto=
pped
>     132ecbce8b ci: update to go1.22.8
>     352ee0acd4 Images Tree: Change 'Used' to 'In Use'
>     4694fc8e45 Do not underline image name
>     25224ab615 opts: remove ErrBadKey as it's not used as a sentinel erro=
r
>     40539963c2 opts: parseKeyValueFile: cleanup and remove redundant
> trimming
>     9ab3d3a983 move parsing key-value files to a separate package
>     3a1e08d6de vendor: github.com/docker/docker v27.3.1
>     ed7d30ef89 vendor: golang.org/x/sys v0.25.0
>     e93d817980 vendor: golang.org/x/text v0.18.0
>     ae9b655aa8 vendor: golang.org/x/term v0.24.0
>     949859a39e vendor: golang.org/x/crypto v0.27.0
>     c93b0f1a0e vendor: golang.org/x/net v0.29.0
>     78be4c464f vendor: github.com/cespare/xxhash/v2 v2.3.0
>     5cbb4ca191 vendor: google.golang.org/protobuf v1.34.1
>     2668b11ce4 vendor: google.golang.org/grpc v1.66.2
>     52ac568385 cli/container: use github.com/moby/sys/capability for
> completions
>     e6c6658563 cli/command/container: add unit tests for completion helpe=
rs
>     64e98fa375 cli/command/completion: add Platforms
>     dd4b370d3c cli/command/container: add shell completion for --platform
> flags
>     099d4baeed cli/command/image: add shell completion for --platform fla=
gs
>     b6e7eba447 completion: ContainerNames: don't panic on nil filter
>     7d1fa132fb completion: add test for EnvVarNames
>     954dba4482 completion: add test for FileNames
>     62230c7ec2 completion: add test for FromList
>     02da13fb18 completion: add test for NoComplete
>     95e329d3e3 completion: add test for ContainerNames
>     77d002ae25 completion: add test for ImageNames
>     b68bf3afe4 completion: add test for NetworkNames
>     e2831282ee completion: add test for VolumeNames
>     b018e55ca4 Only complete removable containers if --force is not given
>     16201b3eb2 vendor: github.com/moby/swarmkit/v2
> v2.0.0-20241017191044-e8ecf83ee08e
>     d3bf82db86 cli/command/plugins: use errors.Join instead of custom
> cli.Errors
>     b3a55ecbba cli: deprecate Errors type
>     a8a8f68268 cli/command: ConfigureAuth: fix deprecation comment
>     dc36908ec5 Fix bash completion for `events --filter daemon=3D`
>     254b966b0d cli/command/container: set empty args in tests and discard
> output
>     df7e6e5c5f cli/command/container: TestWaitExitOrRemoved use subtests
>     365e7a5a4e cli/config/credentials: skip saving config-file if
> credentials didn't change
>     720da3c65a cil/config/credentials: remove newStore() test-utility
>     6736be779a cli/config/credentials: add test for save being idempotent
>     470ab05503 Buffer 'docker stats' text to avoid terminal flickering
>     35c87e326c update to go1.22.9
>     e15a979e3d docs: change link to desktop docs
>     2521abdb1b vendor: golang.org/x/sys v0.26.0
>     3f28d05292 vendor: google.golang.org/protobuf v1.35.1
>     46844b4f1d vendor: github.com/klauspost/compress v1.17.11
>     d23ab524c3 cli/command: PromptUserForCredentials: remove named output
> variables
>     05455f8505 cli/command: PromptUserForCredentials: inline
> isDefaultRegistry
>     97c25b7574 cli/command: PromptUserForCredentials: move "post" check
> for empty name
>     78dbcca264 cli/command: PromptUserForCredentials: move trimming where
> it's used
>     1377310110 cli/command: PromptUserForCredentials: always trim passwor=
d
>     da3a1c3027 cli/command: PromptUserForCredentials: print error on
> terminal restore fail
>     ddeb7eb4ed cli/command: PromptUserForCredentials: use consts for all
> hints
>     168a4bdc05 cli/command: PromptUserForCredentials: suppress unhandled
> errors
>     0dd07f0bfd docs: Link supported Go duration strings
>     9d5a2a6b66 docs: Correct `run` exit code 126 description
>     2734299993 docs: update example redis tags from 3.0.x to 7.4.x
>     7a906196ed golangci-lint: enable G204, add #nosec comments instead
>     1890ea0762 golangci-lint: move gosec excludes to linters-settings
>     35122a0692 golangci-lint: update comment, and disable
> "exclude-dirs-use-default"
>     df7113d7eb [27.x] cli: fix non-constant format string in call to
> errors.Errorf (govet)
>     8fe93724a3 bump golangci-lint to v1.61.0
>     0529d64f7f Dockerfile: update buildx to v0.18.0
>     9128f7b2d5 Dockerfile: update compose to v2.30.3
>     9e7d01bfb3 Add completion for `events --filter`
>     8caf347188 Add tests for completions that call the API
>     49b6551e97 [27.x] vendor: github.com/docker/docker 5765e9f35b00
> (v27.4-dev)
>     38e37778b0 Share the container completions
>     f9ccc50304 Add completion for `--attach`
>     7e35be13ea Add completion for `--ipc`
>     6f439ea4a4 Add completion for `--link`
>     83f79c3e86 Add completion for `--pid`
>     6d087eb91b Add completion for `--storage-opt`
>     99e60c4e39 Add completion for `--ulimit`
>     e25548d1c6 Add completion for `--userns`
>     83303411ee Add completion for `--detach-keys`
>     25ff89519f Add completion for `--security-opt`
>     d11291966d Add completion for --log-driver` and --log-opt`
>     78544cd587 Add completion for `--uts`
>     e20bcf3565 Add completion for `--cgroupns`
>     ce77f4a545 Add completion for `--volume-driver`
>     955e003345 Handle null completions with a default callback
>     a4dc3d78e5 vendor: github.com/docker/docker v27.4.0-rc.1
>     3df40364f6 update go:build tags to use go1.22
>     cfe6090d5d cli/command/container: fix missing go:build tag
>     877668c92a [27.x] vendor: google.golang.org/grpc v1.66.3
>     39d73afbdd Optimise `docker stats` to not require clearing the whole
> screen
>     6b9fb59d31 [27.x] vendor: github.com/docker/docker v27.4.0-rc.2
>     47a4f70d8a update golangci-lint to v1.62.0
>     5476e9e1dc cli-plugins: Fix searching inaccessible directories
>     790d09e8dc cli-plugins: Simplify addPluginCandidatesFromDir
>     26da5bf025 fix: ctx should cancel image pull on run
>     530cf098de test: `run` does not have error status on 27.x branch
>     f4fec76472 docs: fix janky rendering of toc on docs.docker.com
>     9348385006 vendor: github.com/docker/docker v27.4.0-rc.3
>     5a0508ccc8 cli/trust: GetNotaryRepository: remove uses of
> RepositoryInfo.Class
>     3284a80b05 update to go1.22.10
>     dc8511cd60 vendor: github.com/docker/docker v27.4.0-rc.4
>     6377f54f27 vendor: github.com/docker/docker v27.4.0
>     f9783ec5c6 update xx to v1.6.1 for compatibility with alpine 3.21
>     12d98b057f update go-md2man to v2.0.5
>     70815c1aa9 cli/command/system: remove netfilter warnings from tests
>     d3b59fbd93 cli/command/container: use local copy of pkg/system.IsAbs
>     a08a120bae cli/command/system: remove BridgeNfIptables,
> BridgeNfIp6tables in tests
>     d4dc4efef0 vendor: github.com/docker/docker v27.4.1
>     ef6bc69c04 vendor: github.com/Azure/go-ansiterm
> v0.0.0-20230124172434-306776ec8161
>     bcec6cb71a vendor: github.com/cenkalti/backoff/v4 v4.3.0
>     e3d2562114 vendor: github.com/go-logr/logr v1.4.2
>     d8f2d1b155 vendor: update prometheus dependencies
>     2d3e97f32d vendor: github.com/grpc-ecosystem/grpc-gateway/v2 v2.20.0
>     3e51dace7c [27.x] vendor: google.golang.org/genproto f6361c86f094
>     f264af6124 vendor: go.opentelemetry.io/otel v1.28.0
>     fd818019f5 vendor: go.opentelemetry.io/contrib/instrumentation/xxx
> v0.53.0
>     f009ed2b34 vendor: github.com/docker/docker c23af2910987 (27.x /
> v27.5.0-dev)
>     0e053a5cee vendor: github.com/docker/docker v27.5.0-rc.1
>     8b340f4e5c TestRunCopyFromContainerToFilesystem: use Tar without
> options
>     074820d7bb Fix cp test to separate source and destination
>     261d2241eb docs, man: remove confusing example for "--isolation"
>     5d973da95b docs: dockerd: --oom-score-adj flag
>     f068c14063 contrib/completion: remove --oom-score-adj daemon flag
>     0ced103038 vendor: github.com/docker/docker 43fc912ef59a
> (v27.5.0-rc.2)
>     919350df54 vendor: github.com/docker/docker v27.5.0-rc.2
>     b277537cbe gha/build: Publish bin image for release branches
>     e32d69e31c vendor: github.com/docker/docker 38b84dce32c4 (v27.5.0)
>     397c2f87d5 vendor: github.com/docker/docker v27.5.0
>     1ccfae7946 update to go1.22.11 (fix CVE-2024-45341, CVE-2024-45336)
>     fa1ba052d6 gha: Adjust release branches
>     777695f6d5 Dockerfile: update buildx to v0.20.0
>     fbc0a73b35 Dockerfile: update compose to v2.32.4
>
> Signed-off-by: Paolo Barbolini <paolo.barbolini@m4ss.net>
> ---
>  recipes-containers/docker/docker-moby_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-moby_git.bb
> b/recipes-containers/docker/docker-moby_git.bb
> index 9f45f175..b3f5effe 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -44,8 +44,8 @@ DESCRIPTION =3D "Linux container runtime \
>  # so we get that tag, and make it our SRCREVS:
>  #
>
> -SRCREV_moby =3D "43fc912ef59a83054ea7f6706df4d53a7dea4d80"
> -SRCREV_cli =3D "d41cb083c352853f94b292a87df4859c4a96dcc2"
> +SRCREV_moby =3D "4c9b3b011ae4c30145a7b344c870bdda01b454e2"
> +SRCREV_cli =3D "9f9e4058019a37304dc6572ffcbb409d529b59d8"
>  SRCREV_FORMAT =3D "moby"
>  SRC_URI =3D "\
>         git://
> github.com/moby/moby.git;nobranch=3D1;name=3Dmoby;protocol=3Dhttps;destsu=
ffix=3D${GO_SRCURI_DESTSUFFIX}
> <http://github.com/moby/moby.git;nobranch=3D1;name=3Dmoby;protocol=3Dhttp=
s;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D>
> \
> @@ -64,7 +64,7 @@ require docker.inc
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D
> "file://src/import/LICENSE;md5=3D4859e97a9c7780e77972d989f0823f28"
>
> -DOCKER_VERSION =3D "27.5.0-rc.2"
> +DOCKER_VERSION =3D "27.5.1"
>  PV =3D "${DOCKER_VERSION}+git${SRCREV_moby}"
>
>  CVE_PRODUCT =3D "docker mobyproject:moby"
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9149):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9149
> Mute This Topic: https://lists.yoctoproject.org/mt/111412608/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000045bc2e062f1fdda6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Tha=
nks for the patch, but I already have a flight of package upgrades=C2=A0inc=
oming (I do them at the M1 and M3.5</div><div class=3D"gmail_default" style=
=3D"font-size:small">timeframes). I&#39;ll check my updates=C2=A0against=C2=
=A0this one, but there shouldn&#39;t be any differences (except mine will</=
div><div class=3D"gmail_default" style=3D"font-size:small">be slightly newe=
r)</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Cheers,</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Feb 27, 2025 at 5:10=E2=80=AFAM Paolo Barbolini via <a href=3D"http://lis=
ts.yoctoproject.org">lists.yoctoproject.org</a> &lt;paolo.barbolini=3D<a hr=
ef=3D"mailto:m4ss.net@lists.yoctoproject.org">m4ss.net@lists.yoctoproject.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Bumping moby to version v27.5.1, which comprises the following commits:<b=
r>
<br>
=C2=A0 =C2=A0 0ec92ba6a4 Clear RWLayer reference under container lock<br>
=C2=A0 =C2=A0 95122b4bde Dockerfile: update runc binary to v1.2.4<br>
=C2=A0 =C2=A0 a78ae66d0e pkg/ioutils: deprecate BytesPipe, NewBytesPipe, Er=
rClosed<br>
=C2=A0 =C2=A0 d9c2cde3be pkg/ioutils: deprecate WriteCounter, NewWriteCount=
er<br>
=C2=A0 =C2=A0 41697f61ec pkg/ioutils: deprecate NopFlusher<br>
=C2=A0 =C2=A0 9b974d599a daemon: don&#39;t repeatedly call NumCPU if not ne=
eded<br>
=C2=A0 =C2=A0 5b7034f4c6 pkg/sysinfo: Deprecate NumCPU<br>
=C2=A0 =C2=A0 f53d72e0be Fix unit tests for an nftables host<br>
=C2=A0 =C2=A0 c83f658829 Dockerfile: update containerd to v1.7.25<br>
=C2=A0 =C2=A0 cf37b661dd pkg/ioutils: deprecate NopWriter<br>
=C2=A0 =C2=A0 8a2fd51c84 pkg/ioutils: deprecate NopWriteCloser<br>
=C2=A0 =C2=A0 70a866e37e Dockerfile: update RootlessKit to v2.3.2<br>
=C2=A0 =C2=A0 ad04c7b55a Allow users to ignore missing br_netfilter<br>
=C2=A0 =C2=A0 d57309014d Move integration/network/bridge_test.go to bridge =
subdir<br>
=C2=A0 =C2=A0 b33299da85 Bridge: on network delete, make sure it&#39;s dele=
ted from store<br>
=C2=A0 =C2=A0 36706f0e5f ci: switch from jenkins to gha for arm64 build and=
 tests<br>
=C2=A0 =C2=A0 6c832d05c4 gha: set arm64 GO_VERSION to 1.22.10<br>
=C2=A0 =C2=A0 c83862c541 update to go1.22.11 (fix CVE-2024-45341, CVE-2024-=
45336)<br>
=C2=A0 =C2=A0 95d18194a4 gha: Adjust release branches<br>
=C2=A0 =C2=A0 542e33c421 ci: update bake-action to v6<br>
=C2=A0 =C2=A0 e85906c6a8 ci(bin-image): fix bake build<br>
=C2=A0 =C2=A0 fbc854d9d3 Dockerfile: update docker CLI to v27.5.0<br>
=C2=A0 =C2=A0 4c8ec29141 Dockerfile: update buildx to v0.20.0<br>
=C2=A0 =C2=A0 0da7a2656e Dockerfile: update compose to v2.32.4<br>
<br>
Bumping docker-cli to version v27.5.1, which comprises the following commit=
s:<br>
<br>
=C2=A0 =C2=A0 e0b44d6d3f push: Don&#39;t default to DOCKER_DEFAULT_PLATFORM=
<br>
=C2=A0 =C2=A0 330a8e4e23 c8d: Remove `docker convert` mention<br>
=C2=A0 =C2=A0 bd43ca786b push: Improve note message and colors<br>
=C2=A0 =C2=A0 5777558c77 fix: container stream should not be terminated by =
ctx<br>
=C2=A0 =C2=A0 d36bdb0d84 test: e2e SIGTERM attached container on `docker ru=
n`<br>
=C2=A0 =C2=A0 333103d93f chore: restore ctx without cancel on container run=
<br>
=C2=A0 =C2=A0 4d67ef09c8 fix: ctx cancellation on login prompt<br>
=C2=A0 =C2=A0 5dea9d881c Enable completion for &#39;image&#39; sub commands=
<br>
=C2=A0 =C2=A0 338e7a604c Dockerfile.dev: install bash-completion in dev con=
tainer<br>
=C2=A0 =C2=A0 6cd1f6f26d Makefile: add completion target<br>
=C2=A0 =C2=A0 d60252954b cli/command/container: NewRunCommand: slight clean=
up of completion<br>
=C2=A0 =C2=A0 68fe829c96 cli/command/completion: add FileNames utility<br>
=C2=A0 =C2=A0 d914a3f97e cli/command/completion: add EnvVarNames utility<br=
>
=C2=A0 =C2=A0 7a4062a4a9 cli/command/completion: add FromList utility<br>
=C2=A0 =C2=A0 4473f48847 cli/command/container: provide flag-completion for=
 &quot;docker create&quot;<br>
=C2=A0 =C2=A0 787caf2fe4 cmd/docker: fix completion for --context<br>
=C2=A0 =C2=A0 3926ed6b24 cli/context/store: Names(): fix panic when called =
with nil-interface<br>
=C2=A0 =C2=A0 36802176a7 cli/command/container: add completion for --cap-ad=
d, --cap-drop<br>
=C2=A0 =C2=A0 d11e73d6e6 cli/command/container: add completion for --restar=
t<br>
=C2=A0 =C2=A0 ab8a2c0716 cli/command/container: add completion for --volume=
s-from<br>
=C2=A0 =C2=A0 66ec7142ae cli/command/container: add completion for --stop-s=
ignal<br>
=C2=A0 =C2=A0 dfe3c0c074 vendor: <a href=3D"http://github.com/klauspost/com=
press" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/compress</=
a> v1.17.9<br>
=C2=A0 =C2=A0 4f1a67e06b vendor: <a href=3D"http://golang.org/x/sys" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/sys</a> v0.21.0<br>
=C2=A0 =C2=A0 a8e2130643 vendor: <a href=3D"http://golang.org/x/text" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> v0.15.0<br>
=C2=A0 =C2=A0 3577a17ce1 vendor: <a href=3D"http://golang.org/x/crypto" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/crypto</a> v0.23.0<br>
=C2=A0 =C2=A0 e7bcae9053 vendor: <a href=3D"http://golang.org/x/net" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/net</a> v0.25.0<br>
=C2=A0 =C2=A0 76863b46b7 vendor: <a href=3D"http://golang.org/x/sync" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/sync</a> v0.7.0<br>
=C2=A0 =C2=A0 2794ebd599 vendor: <a href=3D"http://github.com/containerd/co=
ntainerd" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/contai=
nerd</a> v1.7.19<br>
=C2=A0 =C2=A0 674f8d2979 vendor: <a href=3D"http://github.com/prometheus/pr=
ocfs" rel=3D"noreferrer" target=3D"_blank">github.com/prometheus/procfs</a>=
 v0.15.1<br>
=C2=A0 =C2=A0 33e5c87957 vendor: <a href=3D"http://google.golang.org/genpro=
to/googleapis/api" rel=3D"noreferrer" target=3D"_blank">google.golang.org/g=
enproto/googleapis/api</a> 49dd2c1f3d0b<br>
=C2=A0 =C2=A0 5ab44a4690 vendor: <a href=3D"http://github.com/docker/cli-do=
cs-tool" rel=3D"noreferrer" target=3D"_blank">github.com/docker/cli-docs-to=
ol</a> v0.8.0<br>
=C2=A0 =C2=A0 54c8eb7941 docs: fix typos and version for cli-docs-tool scri=
pts<br>
=C2=A0 =C2=A0 c365c3cc8a Dockerfile: update buildx to v0.16.1<br>
=C2=A0 =C2=A0 259d5e0f57 Dockerfile: update compose to v2.29.0<br>
=C2=A0 =C2=A0 f7be714467 gha: check-pr-branch: verify major version only<br=
>
=C2=A0 =C2=A0 ad47d2a2c1 gha: update to macOS 13, add macOS 14 arm64 (Apple=
 Silicon M1)<br>
=C2=A0 =C2=A0 ca9636a1c3 test spring-cleaning<br>
=C2=A0 =C2=A0 8992378c87 add support for DOCKER_CUSTOM_HEADERS env-var (exp=
erimental)<br>
=C2=A0 =C2=A0 c599566439 Allow for OomScoreAdj<br>
=C2=A0 =C2=A0 b24c7417e4 vendor: <a href=3D"http://github.com/containerd/co=
ntainerd" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/contai=
nerd</a> v1.7.20<br>
=C2=A0 =C2=A0 b889b2562c vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.1.0=
<br>
=C2=A0 =C2=A0 a74040315e vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.1.1=
<br>
=C2=A0 =C2=A0 8a6f7d849d tests: fix flaxy `TestCloseRunningCommand` test<br=
>
=C2=A0 =C2=A0 7f02bc9704 tests: fix other flaky `connhelper` tests<br>
=C2=A0 =C2=A0 dfb8f2155a attach: don&#39;t return context cancelled error<b=
r>
=C2=A0 =C2=A0 1cf3637198 attach: wait for exit code from `ContainerWait`<br=
>
=C2=A0 =C2=A0 53cb00a818 update to go1.21.13<br>
=C2=A0 =C2=A0 c7f3031f74 tests/run: fix flaky `RunAttachTermination` test<b=
r>
=C2=A0 =C2=A0 edd71d77c7 vendor: <a href=3D"http://golang.org/x/sys" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/sys</a> v0.22.0<br>
=C2=A0 =C2=A0 40707e17b8 docs: refresh image versions in examples<br>
=C2=A0 =C2=A0 54135b0724 gha: set permissions to read-only by default<br>
=C2=A0 =C2=A0 984ef9072c plugins: don&#39;t panic on Close if PluginServer =
nil<br>
=C2=A0 =C2=A0 946d1097b8 run: fix GetList return empty issue for throttlede=
vice<br>
=C2=A0 =C2=A0 bcd90be73a docs: fix link to http proxy document<br>
=C2=A0 =C2=A0 73452e316f docs: update internal links after refactor<br>
=C2=A0 =C2=A0 65dec14ac0 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> f9522e5=
e96c3 (v27.1.2-dev)<br>
=C2=A0 =C2=A0 3eaf30278f docs: update link to moved build context doc<br>
=C2=A0 =C2=A0 0c29d6bac1 auth: add support for oauth device-code login<br>
=C2=A0 =C2=A0 b8a38fd22d Refactor `cli/command/registry`<br>
=C2=A0 =C2=A0 afb5e143b1 login: normalize `<a href=3D"http://registry-1.doc=
ker.io" rel=3D"noreferrer" target=3D"_blank">registry-1.docker.io</a>`<br>
=C2=A0 =C2=A0 ad7912a846 fallback to regular login if oauth login fails to =
start<br>
=C2=A0 =C2=A0 83f6ca4a73 disable pseudoterminal creation<br>
=C2=A0 =C2=A0 26536d1145 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.2.0=
-dev (9942d656bade)<br>
=C2=A0 =C2=A0 99b647cfca image/list: Add `--tree` flag<br>
=C2=A0 =C2=A0 ba43ae0bd2 cli/tree: Add `Content size` column<br>
=C2=A0 =C2=A0 44a9ffa0ad list/tree: Align number right, text left<br>
=C2=A0 =C2=A0 324cc5d30f list/tree: Sort by created date<br>
=C2=A0 =C2=A0 ab55d75cf5 list/tree: Add an experimental warning<br>
=C2=A0 =C2=A0 b719b10257 list/tree: Capitalize column headers<br>
=C2=A0 =C2=A0 f42fa0b8e1 list/tree: Add spacing before the content and firs=
t image<br>
=C2=A0 =C2=A0 7196200fc2 list/tree: Fix some escape codes included in nonTT=
Y<br>
=C2=A0 =C2=A0 7902b52714 list/tree: Print &lt;untagged&gt; as dangling imag=
e name<br>
=C2=A0 =C2=A0 0c4e7478e2 list/tree: No extra spacing for graphdriver<br>
=C2=A0 =C2=A0 1b3fa65759 login: add oauth escape hatch<br>
=C2=A0 =C2=A0 a58af379e1 login: add e2e tests for oauth + escape hatch<br>
=C2=A0 =C2=A0 2d7b8998c4 docs: use gh alert syntax for callouts<br>
=C2=A0 =C2=A0 6ceb0aba82 cli/formatter: bracket IPv6 addrs prepended to por=
ts<br>
=C2=A0 =C2=A0 24837f9260 chore: update link to docker engine api reference<=
br>
=C2=A0 =C2=A0 8e94ed15e6 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> b27de4e=
f1634 (v27.2.0-dev)<br>
=C2=A0 =C2=A0 d8af7812b5 cli/command/system: remove redundant nil-check (go=
simple)<br>
=C2=A0 =C2=A0 002cfcde85 cli/command: fix n-constant format string in call =
(govet)<br>
=C2=A0 =C2=A0 4b71d0d1af e2e/global: fix n-constant format string in call (=
govet)<br>
=C2=A0 =C2=A0 64b9e4cd16 cli: rename args that collided with builtins (pred=
eclard)<br>
=C2=A0 =C2=A0 88a49df297 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> 3ab5c7d=
0036c (v27.2.0-dev)<br>
=C2=A0 =C2=A0 32aadc9902 Revert &quot;login: normalize `<a href=3D"http://r=
egistry-1.docker.io" rel=3D"noreferrer" target=3D"_blank">registry-1.docker=
.io</a>`&quot;<br>
=C2=A0 =C2=A0 83072c0232 login: use normalized hostname when storing<br>
=C2=A0 =C2=A0 8fcfc0b803 Dockerfile: update xx to v1.5.0<br>
=C2=A0 =C2=A0 1a0b6a7a44 cli/connhelper: getConnectionHelper: move ssh-opti=
on funcs out of closure<br>
=C2=A0 =C2=A0 7a50cd0f01 docs: update docker login reference<br>
=C2=A0 =C2=A0 6274754e66 copynit: s/WEB BASED/WEB-BASED/<br>
=C2=A0 =C2=A0 de2b49b074 scripts/build/plugins: don&#39;t override CGO_ENAB=
LED set by .variables<br>
=C2=A0 =C2=A0 1dfd11acc0 oauth/api: drain timer channel on each iteration<b=
r>
=C2=A0 =C2=A0 5bf5cb9ff6 update to go1.22.6<br>
=C2=A0 =C2=A0 d0c1a80617 login: handle non-tty scenario consistently<br>
=C2=A0 =C2=A0 869df10064 vendor.mod: put <a href=3D"http://github.com/pkg/b=
rowser" rel=3D"noreferrer" target=3D"_blank">github.com/pkg/browser</a> in =
the right group<br>
=C2=A0 =C2=A0 41e61c45d9 [27.x] vendor: <a href=3D"http://github.com/docker=
/docker" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> =
v27.2.0<br>
=C2=A0 =C2=A0 3db9538748 update to go1.22.7<br>
=C2=A0 =C2=A0 324cdbca40 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.2.1=
-dev (8b539b8df240)<br>
=C2=A0 =C2=A0 b1e50eea92 docs: rename plugins index file and add linkTitle<=
br>
=C2=A0 =C2=A0 dbde5b3681 docs: add front matter title to deprecated.md<br>
=C2=A0 =C2=A0 90559a6143 chore: fix style/lint issues in deprecated.md<br>
=C2=A0 =C2=A0 4be6b1f3d7 info: stop printing &quot;Expected&quot; commits<b=
r>
=C2=A0 =C2=A0 c65ac2d90d volume/update: require 1 argument/fix panic<br>
=C2=A0 =C2=A0 965699ba0f cli/command/volume TestUpdateCmd: adjust for older=
 error messages<br>
=C2=A0 =C2=A0 05fbfc6995 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.2.1=
<br>
=C2=A0 =C2=A0 1fe06dd0e7 vendor: <a href=3D"http://github.com/moby/sys/sign=
al" rel=3D"noreferrer" target=3D"_blank">github.com/moby/sys/signal</a> v0.=
7.1<br>
=C2=A0 =C2=A0 7ff3daa446 vendor: <a href=3D"http://github.com/moby/sys/syml=
ink" rel=3D"noreferrer" target=3D"_blank">github.com/moby/sys/symlink</a> v=
0.3.0<br>
=C2=A0 =C2=A0 4607c883c5 vendor: <a href=3D"http://github.com/moby/sys/sequ=
ential" rel=3D"noreferrer" target=3D"_blank">github.com/moby/sys/sequential=
</a> v0.6.0<br>
=C2=A0 =C2=A0 f68936ef2e vendor: <a href=3D"http://dario.cat/mergo" rel=3D"=
noreferrer" target=3D"_blank">dario.cat/mergo</a> v1.0.1<br>
=C2=A0 =C2=A0 d64740d347 vendor: <a href=3D"http://golang.org/x/sys" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/sys</a> v0.24.0<br>
=C2=A0 =C2=A0 5dde3d8570 vendor: <a href=3D"http://golang.org/x/sync" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/sync</a> v0.8.0<br>
=C2=A0 =C2=A0 090d1ff555 vendor: <a href=3D"http://golang.org/x/time" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/time</a> v0.6.0<br>
=C2=A0 =C2=A0 295b75e5ff vendor: <a href=3D"http://golang.org/x/term" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/term</a> v0.23.0<br>
=C2=A0 =C2=A0 49e33a03df vendor: <a href=3D"http://golang.org/x/text" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> v0.17.0<br>
=C2=A0 =C2=A0 fbb0cfd86a vendor: <a href=3D"http://golang.org/x/crypto" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/crypto</a> v0.26.0<br>
=C2=A0 =C2=A0 968341cc7d vendor: <a href=3D"http://golang.org/x/net" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/net</a> v0.28.0<br>
=C2=A0 =C2=A0 1a199b63da vendor: <a href=3D"http://tags.cncf.io/container-d=
evice-interface" rel=3D"noreferrer" target=3D"_blank">tags.cncf.io/containe=
r-device-interface</a> v0.8.0<br>
=C2=A0 =C2=A0 2fc18b9874 vendor: <a href=3D"http://google.golang.org/grpc" =
rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> v1.62.0<br>
=C2=A0 =C2=A0 74bebe2719 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> bf60e5c=
ced83 (v27.3.0-dev)<br>
=C2=A0 =C2=A0 b48720e65e command: check for wsl mount path on windows<br>
=C2=A0 =C2=A0 7811c442d6 man: update dockerd man-page to include --feature =
flag<br>
=C2=A0 =C2=A0 bc87ef962a man: fix duplicate word in --feature flag descript=
ion<br>
=C2=A0 =C2=A0 db7a014d37 man: dockerd: value is optional for --feature flag=
<br>
=C2=A0 =C2=A0 245f79ff57 docs/reference: dockerd: add docs for --feature op=
tion<br>
=C2=A0 =C2=A0 7c72283b37 man: dockerd: add description for --log-format opt=
ion<br>
=C2=A0 =C2=A0 84d4a5ef11 docs: dockerd: add documentation for --log-format =
option<br>
=C2=A0 =C2=A0 d896559894 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.3.0=
-rc.1<br>
=C2=A0 =C2=A0 6fdd11b012 Dockerfile: update buildx to v0.17.1<br>
=C2=A0 =C2=A0 b5c6541769 Dockerfile: update compose to v2.29.4<br>
=C2=A0 =C2=A0 81ca58bd20 docs: Fix --rm=3Dfalse flag in container_run.md<br=
>
=C2=A0 =C2=A0 e2eb069aed gha: update codeql workflow to go1.22.7<br>
=C2=A0 =C2=A0 4b5a196fee telemetry: pass otel errors to the otel handler fo=
r shutdown and force flush<br>
=C2=A0 =C2=A0 c6dde25470 command: change drive to lowercase for wsl path<br=
>
=C2=A0 =C2=A0 ca62759b0f vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.3.0=
-rc2<br>
=C2=A0 =C2=A0 460f1becc5 telemetry: fix early meterprovider shutdown<br>
=C2=A0 =C2=A0 854695884a vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.3.0=
<br>
=C2=A0 =C2=A0 a4149b0c3d Dockerfile: update compose to v2.29.7<br>
=C2=A0 =C2=A0 be9b9f3d70 Update `VERSION` file to `v27.3.1-dev`<br>
=C2=A0 =C2=A0 23cea90233 docs: use important callout for buildkit vs legacy=
 builder<br>
=C2=A0 =C2=A0 fbd51c01c6 docs: fix anchor link to web-based login section<b=
r>
=C2=A0 =C2=A0 6445ae2f02 docs/reference: stop, restart: add flag descriptio=
ns<br>
=C2=A0 =C2=A0 d2aec10148 docs: fix a typo in run.md<br>
=C2=A0 =C2=A0 19279c9e53 opts: cleanup ParseEnvFile tests<br>
=C2=A0 =C2=A0 6f5bfcb276 docs: fix inaccurate description of --restart=3Dun=
less-stopped<br>
=C2=A0 =C2=A0 132ecbce8b ci: update to go1.22.8<br>
=C2=A0 =C2=A0 352ee0acd4 Images Tree: Change &#39;Used&#39; to &#39;In Use&=
#39;<br>
=C2=A0 =C2=A0 4694fc8e45 Do not underline image name<br>
=C2=A0 =C2=A0 25224ab615 opts: remove ErrBadKey as it&#39;s not used as a s=
entinel error<br>
=C2=A0 =C2=A0 40539963c2 opts: parseKeyValueFile: cleanup and remove redund=
ant trimming<br>
=C2=A0 =C2=A0 9ab3d3a983 move parsing key-value files to a separate package=
<br>
=C2=A0 =C2=A0 3a1e08d6de vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.3.1=
<br>
=C2=A0 =C2=A0 ed7d30ef89 vendor: <a href=3D"http://golang.org/x/sys" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/sys</a> v0.25.0<br>
=C2=A0 =C2=A0 e93d817980 vendor: <a href=3D"http://golang.org/x/text" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> v0.18.0<br>
=C2=A0 =C2=A0 ae9b655aa8 vendor: <a href=3D"http://golang.org/x/term" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/term</a> v0.24.0<br>
=C2=A0 =C2=A0 949859a39e vendor: <a href=3D"http://golang.org/x/crypto" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/crypto</a> v0.27.0<br>
=C2=A0 =C2=A0 c93b0f1a0e vendor: <a href=3D"http://golang.org/x/net" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/net</a> v0.29.0<br>
=C2=A0 =C2=A0 78be4c464f vendor: <a href=3D"http://github.com/cespare/xxhas=
h/v2" rel=3D"noreferrer" target=3D"_blank">github.com/cespare/xxhash/v2</a>=
 v2.3.0<br>
=C2=A0 =C2=A0 5cbb4ca191 vendor: <a href=3D"http://google.golang.org/protob=
uf" rel=3D"noreferrer" target=3D"_blank">google.golang.org/protobuf</a> v1.=
34.1<br>
=C2=A0 =C2=A0 2668b11ce4 vendor: <a href=3D"http://google.golang.org/grpc" =
rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> v1.66.2<br>
=C2=A0 =C2=A0 52ac568385 cli/container: use <a href=3D"http://github.com/mo=
by/sys/capability" rel=3D"noreferrer" target=3D"_blank">github.com/moby/sys=
/capability</a> for completions<br>
=C2=A0 =C2=A0 e6c6658563 cli/command/container: add unit tests for completi=
on helpers<br>
=C2=A0 =C2=A0 64e98fa375 cli/command/completion: add Platforms<br>
=C2=A0 =C2=A0 dd4b370d3c cli/command/container: add shell completion for --=
platform flags<br>
=C2=A0 =C2=A0 099d4baeed cli/command/image: add shell completion for --plat=
form flags<br>
=C2=A0 =C2=A0 b6e7eba447 completion: ContainerNames: don&#39;t panic on nil=
 filter<br>
=C2=A0 =C2=A0 7d1fa132fb completion: add test for EnvVarNames<br>
=C2=A0 =C2=A0 954dba4482 completion: add test for FileNames<br>
=C2=A0 =C2=A0 62230c7ec2 completion: add test for FromList<br>
=C2=A0 =C2=A0 02da13fb18 completion: add test for NoComplete<br>
=C2=A0 =C2=A0 95e329d3e3 completion: add test for ContainerNames<br>
=C2=A0 =C2=A0 77d002ae25 completion: add test for ImageNames<br>
=C2=A0 =C2=A0 b68bf3afe4 completion: add test for NetworkNames<br>
=C2=A0 =C2=A0 e2831282ee completion: add test for VolumeNames<br>
=C2=A0 =C2=A0 b018e55ca4 Only complete removable containers if --force is n=
ot given<br>
=C2=A0 =C2=A0 16201b3eb2 vendor: <a href=3D"http://github.com/moby/swarmkit=
/v2" rel=3D"noreferrer" target=3D"_blank">github.com/moby/swarmkit/v2</a> v=
2.0.0-20241017191044-e8ecf83ee08e<br>
=C2=A0 =C2=A0 d3bf82db86 cli/command/plugins: use errors.Join instead of cu=
stom cli.Errors<br>
=C2=A0 =C2=A0 b3a55ecbba cli: deprecate Errors type<br>
=C2=A0 =C2=A0 a8a8f68268 cli/command: ConfigureAuth: fix deprecation commen=
t<br>
=C2=A0 =C2=A0 dc36908ec5 Fix bash completion for `events --filter daemon=3D=
`<br>
=C2=A0 =C2=A0 254b966b0d cli/command/container: set empty args in tests and=
 discard output<br>
=C2=A0 =C2=A0 df7e6e5c5f cli/command/container: TestWaitExitOrRemoved use s=
ubtests<br>
=C2=A0 =C2=A0 365e7a5a4e cli/config/credentials: skip saving config-file if=
 credentials didn&#39;t change<br>
=C2=A0 =C2=A0 720da3c65a cil/config/credentials: remove newStore() test-uti=
lity<br>
=C2=A0 =C2=A0 6736be779a cli/config/credentials: add test for save being id=
empotent<br>
=C2=A0 =C2=A0 470ab05503 Buffer &#39;docker stats&#39; text to avoid termin=
al flickering<br>
=C2=A0 =C2=A0 35c87e326c update to go1.22.9<br>
=C2=A0 =C2=A0 e15a979e3d docs: change link to desktop docs<br>
=C2=A0 =C2=A0 2521abdb1b vendor: <a href=3D"http://golang.org/x/sys" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/sys</a> v0.26.0<br>
=C2=A0 =C2=A0 3f28d05292 vendor: <a href=3D"http://google.golang.org/protob=
uf" rel=3D"noreferrer" target=3D"_blank">google.golang.org/protobuf</a> v1.=
35.1<br>
=C2=A0 =C2=A0 46844b4f1d vendor: <a href=3D"http://github.com/klauspost/com=
press" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/compress</=
a> v1.17.11<br>
=C2=A0 =C2=A0 d23ab524c3 cli/command: PromptUserForCredentials: remove name=
d output variables<br>
=C2=A0 =C2=A0 05455f8505 cli/command: PromptUserForCredentials: inline isDe=
faultRegistry<br>
=C2=A0 =C2=A0 97c25b7574 cli/command: PromptUserForCredentials: move &quot;=
post&quot; check for empty name<br>
=C2=A0 =C2=A0 78dbcca264 cli/command: PromptUserForCredentials: move trimmi=
ng where it&#39;s used<br>
=C2=A0 =C2=A0 1377310110 cli/command: PromptUserForCredentials: always trim=
 password<br>
=C2=A0 =C2=A0 da3a1c3027 cli/command: PromptUserForCredentials: print error=
 on terminal restore fail<br>
=C2=A0 =C2=A0 ddeb7eb4ed cli/command: PromptUserForCredentials: use consts =
for all hints<br>
=C2=A0 =C2=A0 168a4bdc05 cli/command: PromptUserForCredentials: suppress un=
handled errors<br>
=C2=A0 =C2=A0 0dd07f0bfd docs: Link supported Go duration strings<br>
=C2=A0 =C2=A0 9d5a2a6b66 docs: Correct `run` exit code 126 description<br>
=C2=A0 =C2=A0 2734299993 docs: update example redis tags from 3.0.x to 7.4.=
x<br>
=C2=A0 =C2=A0 7a906196ed golangci-lint: enable G204, add #nosec comments in=
stead<br>
=C2=A0 =C2=A0 1890ea0762 golangci-lint: move gosec excludes to linters-sett=
ings<br>
=C2=A0 =C2=A0 35122a0692 golangci-lint: update comment, and disable &quot;e=
xclude-dirs-use-default&quot;<br>
=C2=A0 =C2=A0 df7113d7eb [27.x] cli: fix non-constant format string in call=
 to errors.Errorf (govet)<br>
=C2=A0 =C2=A0 8fe93724a3 bump golangci-lint to v1.61.0<br>
=C2=A0 =C2=A0 0529d64f7f Dockerfile: update buildx to v0.18.0<br>
=C2=A0 =C2=A0 9128f7b2d5 Dockerfile: update compose to v2.30.3<br>
=C2=A0 =C2=A0 9e7d01bfb3 Add completion for `events --filter`<br>
=C2=A0 =C2=A0 8caf347188 Add tests for completions that call the API<br>
=C2=A0 =C2=A0 49b6551e97 [27.x] vendor: <a href=3D"http://github.com/docker=
/docker" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> =
5765e9f35b00 (v27.4-dev)<br>
=C2=A0 =C2=A0 38e37778b0 Share the container completions<br>
=C2=A0 =C2=A0 f9ccc50304 Add completion for `--attach`<br>
=C2=A0 =C2=A0 7e35be13ea Add completion for `--ipc`<br>
=C2=A0 =C2=A0 6f439ea4a4 Add completion for `--link`<br>
=C2=A0 =C2=A0 83f79c3e86 Add completion for `--pid`<br>
=C2=A0 =C2=A0 6d087eb91b Add completion for `--storage-opt`<br>
=C2=A0 =C2=A0 99e60c4e39 Add completion for `--ulimit`<br>
=C2=A0 =C2=A0 e25548d1c6 Add completion for `--userns`<br>
=C2=A0 =C2=A0 83303411ee Add completion for `--detach-keys`<br>
=C2=A0 =C2=A0 25ff89519f Add completion for `--security-opt`<br>
=C2=A0 =C2=A0 d11291966d Add completion for --log-driver` and --log-opt`<br=
>
=C2=A0 =C2=A0 78544cd587 Add completion for `--uts`<br>
=C2=A0 =C2=A0 e20bcf3565 Add completion for `--cgroupns`<br>
=C2=A0 =C2=A0 ce77f4a545 Add completion for `--volume-driver`<br>
=C2=A0 =C2=A0 955e003345 Handle null completions with a default callback<br=
>
=C2=A0 =C2=A0 a4dc3d78e5 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.4.0=
-rc.1<br>
=C2=A0 =C2=A0 3df40364f6 update go:build tags to use go1.22<br>
=C2=A0 =C2=A0 cfe6090d5d cli/command/container: fix missing go:build tag<br=
>
=C2=A0 =C2=A0 877668c92a [27.x] vendor: <a href=3D"http://google.golang.org=
/grpc" rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> v1.6=
6.3<br>
=C2=A0 =C2=A0 39d73afbdd Optimise `docker stats` to not require clearing th=
e whole screen<br>
=C2=A0 =C2=A0 6b9fb59d31 [27.x] vendor: <a href=3D"http://github.com/docker=
/docker" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> =
v27.4.0-rc.2<br>
=C2=A0 =C2=A0 47a4f70d8a update golangci-lint to v1.62.0<br>
=C2=A0 =C2=A0 5476e9e1dc cli-plugins: Fix searching inaccessible directorie=
s<br>
=C2=A0 =C2=A0 790d09e8dc cli-plugins: Simplify addPluginCandidatesFromDir<b=
r>
=C2=A0 =C2=A0 26da5bf025 fix: ctx should cancel image pull on run<br>
=C2=A0 =C2=A0 530cf098de test: `run` does not have error status on 27.x bra=
nch<br>
=C2=A0 =C2=A0 f4fec76472 docs: fix janky rendering of toc on <a href=3D"htt=
p://docs.docker.com" rel=3D"noreferrer" target=3D"_blank">docs.docker.com</=
a><br>
=C2=A0 =C2=A0 9348385006 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.4.0=
-rc.3<br>
=C2=A0 =C2=A0 5a0508ccc8 cli/trust: GetNotaryRepository: remove uses of Rep=
ositoryInfo.Class<br>
=C2=A0 =C2=A0 3284a80b05 update to go1.22.10<br>
=C2=A0 =C2=A0 dc8511cd60 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.4.0=
-rc.4<br>
=C2=A0 =C2=A0 6377f54f27 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.4.0=
<br>
=C2=A0 =C2=A0 f9783ec5c6 update xx to v1.6.1 for compatibility with alpine =
3.21<br>
=C2=A0 =C2=A0 12d98b057f update go-md2man to v2.0.5<br>
=C2=A0 =C2=A0 70815c1aa9 cli/command/system: remove netfilter warnings from=
 tests<br>
=C2=A0 =C2=A0 d3b59fbd93 cli/command/container: use local copy of pkg/syste=
m.IsAbs<br>
=C2=A0 =C2=A0 a08a120bae cli/command/system: remove BridgeNfIptables, Bridg=
eNfIp6tables in tests<br>
=C2=A0 =C2=A0 d4dc4efef0 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.4.1=
<br>
=C2=A0 =C2=A0 ef6bc69c04 vendor: <a href=3D"http://github.com/Azure/go-ansi=
term" rel=3D"noreferrer" target=3D"_blank">github.com/Azure/go-ansiterm</a>=
 v0.0.0-20230124172434-306776ec8161<br>
=C2=A0 =C2=A0 bcec6cb71a vendor: <a href=3D"http://github.com/cenkalti/back=
off/v4" rel=3D"noreferrer" target=3D"_blank">github.com/cenkalti/backoff/v4=
</a> v4.3.0<br>
=C2=A0 =C2=A0 e3d2562114 vendor: <a href=3D"http://github.com/go-logr/logr"=
 rel=3D"noreferrer" target=3D"_blank">github.com/go-logr/logr</a> v1.4.2<br=
>
=C2=A0 =C2=A0 d8f2d1b155 vendor: update prometheus dependencies<br>
=C2=A0 =C2=A0 2d3e97f32d vendor: <a href=3D"http://github.com/grpc-ecosyste=
m/grpc-gateway/v2" rel=3D"noreferrer" target=3D"_blank">github.com/grpc-eco=
system/grpc-gateway/v2</a> v2.20.0<br>
=C2=A0 =C2=A0 3e51dace7c [27.x] vendor: <a href=3D"http://google.golang.org=
/genproto" rel=3D"noreferrer" target=3D"_blank">google.golang.org/genproto<=
/a> f6361c86f094<br>
=C2=A0 =C2=A0 f264af6124 vendor: <a href=3D"http://go.opentelemetry.io/otel=
" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel</a> v1.28.0=
<br>
=C2=A0 =C2=A0 fd818019f5 vendor: <a href=3D"http://go.opentelemetry.io/cont=
rib/instrumentation/xxx" rel=3D"noreferrer" target=3D"_blank">go.openteleme=
try.io/contrib/instrumentation/xxx</a> v0.53.0<br>
=C2=A0 =C2=A0 f009ed2b34 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> c23af29=
10987 (27.x / v27.5.0-dev)<br>
=C2=A0 =C2=A0 0e053a5cee vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.5.0=
-rc.1<br>
=C2=A0 =C2=A0 8b340f4e5c TestRunCopyFromContainerToFilesystem: use Tar with=
out options<br>
=C2=A0 =C2=A0 074820d7bb Fix cp test to separate source and destination<br>
=C2=A0 =C2=A0 261d2241eb docs, man: remove confusing example for &quot;--is=
olation&quot;<br>
=C2=A0 =C2=A0 5d973da95b docs: dockerd: --oom-score-adj flag<br>
=C2=A0 =C2=A0 f068c14063 contrib/completion: remove --oom-score-adj daemon =
flag<br>
=C2=A0 =C2=A0 0ced103038 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> 43fc912=
ef59a (v27.5.0-rc.2)<br>
=C2=A0 =C2=A0 919350df54 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.5.0=
-rc.2<br>
=C2=A0 =C2=A0 b277537cbe gha/build: Publish bin image for release branches<=
br>
=C2=A0 =C2=A0 e32d69e31c vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> 38b84dc=
e32c4 (v27.5.0)<br>
=C2=A0 =C2=A0 397c2f87d5 vendor: <a href=3D"http://github.com/docker/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v27.5.0=
<br>
=C2=A0 =C2=A0 1ccfae7946 update to go1.22.11 (fix CVE-2024-45341, CVE-2024-=
45336)<br>
=C2=A0 =C2=A0 fa1ba052d6 gha: Adjust release branches<br>
=C2=A0 =C2=A0 777695f6d5 Dockerfile: update buildx to v0.20.0<br>
=C2=A0 =C2=A0 fbc0a73b35 Dockerfile: update compose to v2.32.4<br>
<br>
Signed-off-by: Paolo Barbolini &lt;<a href=3D"mailto:paolo.barbolini@m4ss.n=
et" target=3D"_blank">paolo.barbolini@m4ss.net</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb=
" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a> b/recipes-con=
tainers/docker/<a href=3D"http://docker-moby_git.bb" rel=3D"noreferrer" tar=
get=3D"_blank">docker-moby_git.bb</a><br>
index 9f45f175..b3f5effe 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
@@ -44,8 +44,8 @@ DESCRIPTION =3D &quot;Linux container runtime \<br>
=C2=A0# so we get that tag, and make it our SRCREVS:<br>
=C2=A0#<br>
<br>
-SRCREV_moby =3D &quot;43fc912ef59a83054ea7f6706df4d53a7dea4d80&quot;<br>
-SRCREV_cli =3D &quot;d41cb083c352853f94b292a87df4859c4a96dcc2&quot;<br>
+SRCREV_moby =3D &quot;4c9b3b011ae4c30145a7b344c870bdda01b454e2&quot;<br>
+SRCREV_cli =3D &quot;9f9e4058019a37304dc6572ffcbb409d529b59d8&quot;<br>
=C2=A0SRCREV_FORMAT =3D &quot;moby&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/moby/moby.gi=
t;nobranch=3D1;name=3Dmoby;protocol=3Dhttps;destsuffix=3D$%7BGO_SRCURI_DEST=
SUFFIX%7D" rel=3D"noreferrer" target=3D"_blank">github.com/moby/moby.git;no=
branch=3D1;name=3Dmoby;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX=
}</a> \<br>
@@ -64,7 +64,7 @@ require docker.inc<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=3D4859e97a9c=
7780e77972d989f0823f28&quot;<br>
<br>
-DOCKER_VERSION =3D &quot;27.5.0-rc.2&quot;<br>
+DOCKER_VERSION =3D &quot;27.5.1&quot;<br>
=C2=A0PV =3D &quot;${DOCKER_VERSION}+git${SRCREV_moby}&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;docker mobyproject:moby&quot;<br>
-- <br>
2.48.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9149): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9149" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9149</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111412608/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111412608/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--00000000000045bc2e062f1fdda6--

