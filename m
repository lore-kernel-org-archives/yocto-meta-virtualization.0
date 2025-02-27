Return-Path: <paolo.barbolini@m4ss.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E98C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 10:10:18 +0000 (UTC)
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
 by mx.groups.io with SMTP id smtpd.web10.7600.1740651009133846633
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2025 02:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@m4ss.net header.s=MBO0001 header.b=ctQ3felZ;
 spf=pass (domain: m4ss.net, ip: 195.10.208.55, mailfrom: paolo.barbolini@m4ss.net)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4Z3Rsh0hGyz9xP6;
	Thu, 27 Feb 2025 11:10:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m4ss.net; s=MBO0001;
	t=1740651000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iDHJWsd81jXNjhfE83K+CHJiZOerfAbC5WbjIw9GVrc=;
	b=ctQ3felZCQM+85YTZ6KysrnAuEZH0y/Ighw2iA4MnD2iMiXOgwQ27nyTiIazV5dwDRLqOW
	ExBJW3taTYcHw9mdCxj2I4YFYqVH7bH4oSreYx5gNgIiZn0xTitHJ5Ic0TU4FPzG6+oTMM
	uyho1lVtc0Bd+G9Hg7g6KpF+x5g+X2v4CNLjETgVD67ulItOgXUeYrTTHUBRUjaTRfT8SM
	fl/BGfrywM8AXMfJ5Vfxj6U6I715kSX15UWmF3QQQrI20/Q+IXCHGG6M2UvaCiB2Ahu6eg
	tMUh7GeHDArYClhfmmbzLXxUOC7XVss8ACodhn0mwDY2kOuPUUP3fRiRXki6Yw==
From: Paolo Barbolini <paolo.barbolini@m4ss.net>
To: meta-virtualization@lists.yoctoproject.org
Cc: Paolo Barbolini <paolo.barbolini@m4ss.net>
Subject: [PATCH] docker: upgrade to v27.5.1
Date: Thu, 27 Feb 2025 11:09:14 +0100
Message-ID: <20250227100913.309277-2-paolo.barbolini@m4ss.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2025 10:10:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9149

Bumping moby to version v27.5.1, which comprises the following commits:

    0ec92ba6a4 Clear RWLayer reference under container lock
    95122b4bde Dockerfile: update runc binary to v1.2.4
    a78ae66d0e pkg/ioutils: deprecate BytesPipe, NewBytesPipe, ErrClosed
    d9c2cde3be pkg/ioutils: deprecate WriteCounter, NewWriteCounter
    41697f61ec pkg/ioutils: deprecate NopFlusher
    9b974d599a daemon: don't repeatedly call NumCPU if not needed
    5b7034f4c6 pkg/sysinfo: Deprecate NumCPU
    f53d72e0be Fix unit tests for an nftables host
    c83f658829 Dockerfile: update containerd to v1.7.25
    cf37b661dd pkg/ioutils: deprecate NopWriter
    8a2fd51c84 pkg/ioutils: deprecate NopWriteCloser
    70a866e37e Dockerfile: update RootlessKit to v2.3.2
    ad04c7b55a Allow users to ignore missing br_netfilter
    d57309014d Move integration/network/bridge_test.go to bridge subdir
    b33299da85 Bridge: on network delete, make sure it's deleted from sto=
re
    36706f0e5f ci: switch from jenkins to gha for arm64 build and tests
    6c832d05c4 gha: set arm64 GO_VERSION to 1.22.10
    c83862c541 update to go1.22.11 (fix CVE-2024-45341, CVE-2024-45336)
    95d18194a4 gha: Adjust release branches
    542e33c421 ci: update bake-action to v6
    e85906c6a8 ci(bin-image): fix bake build
    fbc854d9d3 Dockerfile: update docker CLI to v27.5.0
    4c8ec29141 Dockerfile: update buildx to v0.20.0
    0da7a2656e Dockerfile: update compose to v2.32.4

Bumping docker-cli to version v27.5.1, which comprises the following comm=
its:

    e0b44d6d3f push: Don't default to DOCKER_DEFAULT_PLATFORM
    330a8e4e23 c8d: Remove `docker convert` mention
    bd43ca786b push: Improve note message and colors
    5777558c77 fix: container stream should not be terminated by ctx
    d36bdb0d84 test: e2e SIGTERM attached container on `docker run`
    333103d93f chore: restore ctx without cancel on container run
    4d67ef09c8 fix: ctx cancellation on login prompt
    5dea9d881c Enable completion for 'image' sub commands
    338e7a604c Dockerfile.dev: install bash-completion in dev container
    6cd1f6f26d Makefile: add completion target
    d60252954b cli/command/container: NewRunCommand: slight cleanup of co=
mpletion
    68fe829c96 cli/command/completion: add FileNames utility
    d914a3f97e cli/command/completion: add EnvVarNames utility
    7a4062a4a9 cli/command/completion: add FromList utility
    4473f48847 cli/command/container: provide flag-completion for "docker=
 create"
    787caf2fe4 cmd/docker: fix completion for --context
    3926ed6b24 cli/context/store: Names(): fix panic when called with nil=
-interface
    36802176a7 cli/command/container: add completion for --cap-add, --cap=
-drop
    d11e73d6e6 cli/command/container: add completion for --restart
    ab8a2c0716 cli/command/container: add completion for --volumes-from
    66ec7142ae cli/command/container: add completion for --stop-signal
    dfe3c0c074 vendor: github.com/klauspost/compress v1.17.9
    4f1a67e06b vendor: golang.org/x/sys v0.21.0
    a8e2130643 vendor: golang.org/x/text v0.15.0
    3577a17ce1 vendor: golang.org/x/crypto v0.23.0
    e7bcae9053 vendor: golang.org/x/net v0.25.0
    76863b46b7 vendor: golang.org/x/sync v0.7.0
    2794ebd599 vendor: github.com/containerd/containerd v1.7.19
    674f8d2979 vendor: github.com/prometheus/procfs v0.15.1
    33e5c87957 vendor: google.golang.org/genproto/googleapis/api 49dd2c1f=
3d0b
    5ab44a4690 vendor: github.com/docker/cli-docs-tool v0.8.0
    54c8eb7941 docs: fix typos and version for cli-docs-tool scripts
    c365c3cc8a Dockerfile: update buildx to v0.16.1
    259d5e0f57 Dockerfile: update compose to v2.29.0
    f7be714467 gha: check-pr-branch: verify major version only
    ad47d2a2c1 gha: update to macOS 13, add macOS 14 arm64 (Apple Silicon=
 M1)
    ca9636a1c3 test spring-cleaning
    8992378c87 add support for DOCKER_CUSTOM_HEADERS env-var (experimenta=
l)
    c599566439 Allow for OomScoreAdj
    b24c7417e4 vendor: github.com/containerd/containerd v1.7.20
    b889b2562c vendor: github.com/docker/docker v27.1.0
    a74040315e vendor: github.com/docker/docker v27.1.1
    8a6f7d849d tests: fix flaxy `TestCloseRunningCommand` test
    7f02bc9704 tests: fix other flaky `connhelper` tests
    dfb8f2155a attach: don't return context cancelled error
    1cf3637198 attach: wait for exit code from `ContainerWait`
    53cb00a818 update to go1.21.13
    c7f3031f74 tests/run: fix flaky `RunAttachTermination` test
    edd71d77c7 vendor: golang.org/x/sys v0.22.0
    40707e17b8 docs: refresh image versions in examples
    54135b0724 gha: set permissions to read-only by default
    984ef9072c plugins: don't panic on Close if PluginServer nil
    946d1097b8 run: fix GetList return empty issue for throttledevice
    bcd90be73a docs: fix link to http proxy document
    73452e316f docs: update internal links after refactor
    65dec14ac0 vendor: github.com/docker/docker f9522e5e96c3 (v27.1.2-dev=
)
    3eaf30278f docs: update link to moved build context doc
    0c29d6bac1 auth: add support for oauth device-code login
    b8a38fd22d Refactor `cli/command/registry`
    afb5e143b1 login: normalize `registry-1.docker.io`
    ad7912a846 fallback to regular login if oauth login fails to start
    83f6ca4a73 disable pseudoterminal creation
    26536d1145 vendor: github.com/docker/docker v27.2.0-dev (9942d656bade=
)
    99b647cfca image/list: Add `--tree` flag
    ba43ae0bd2 cli/tree: Add `Content size` column
    44a9ffa0ad list/tree: Align number right, text left
    324cc5d30f list/tree: Sort by created date
    ab55d75cf5 list/tree: Add an experimental warning
    b719b10257 list/tree: Capitalize column headers
    f42fa0b8e1 list/tree: Add spacing before the content and first image
    7196200fc2 list/tree: Fix some escape codes included in nonTTY
    7902b52714 list/tree: Print <untagged> as dangling image name
    0c4e7478e2 list/tree: No extra spacing for graphdriver
    1b3fa65759 login: add oauth escape hatch
    a58af379e1 login: add e2e tests for oauth + escape hatch
    2d7b8998c4 docs: use gh alert syntax for callouts
    6ceb0aba82 cli/formatter: bracket IPv6 addrs prepended to ports
    24837f9260 chore: update link to docker engine api reference
    8e94ed15e6 vendor: github.com/docker/docker b27de4ef1634 (v27.2.0-dev=
)
    d8af7812b5 cli/command/system: remove redundant nil-check (gosimple)
    002cfcde85 cli/command: fix n-constant format string in call (govet)
    4b71d0d1af e2e/global: fix n-constant format string in call (govet)
    64b9e4cd16 cli: rename args that collided with builtins (predeclard)
    88a49df297 vendor: github.com/docker/docker 3ab5c7d0036c (v27.2.0-dev=
)
    32aadc9902 Revert "login: normalize `registry-1.docker.io`"
    83072c0232 login: use normalized hostname when storing
    8fcfc0b803 Dockerfile: update xx to v1.5.0
    1a0b6a7a44 cli/connhelper: getConnectionHelper: move ssh-option funcs=
 out of closure
    7a50cd0f01 docs: update docker login reference
    6274754e66 copynit: s/WEB BASED/WEB-BASED/
    de2b49b074 scripts/build/plugins: don't override CGO_ENABLED set by .=
variables
    1dfd11acc0 oauth/api: drain timer channel on each iteration
    5bf5cb9ff6 update to go1.22.6
    d0c1a80617 login: handle non-tty scenario consistently
    869df10064 vendor.mod: put github.com/pkg/browser in the right group
    41e61c45d9 [27.x] vendor: github.com/docker/docker v27.2.0
    3db9538748 update to go1.22.7
    324cdbca40 vendor: github.com/docker/docker v27.2.1-dev (8b539b8df240=
)
    b1e50eea92 docs: rename plugins index file and add linkTitle
    dbde5b3681 docs: add front matter title to deprecated.md
    90559a6143 chore: fix style/lint issues in deprecated.md
    4be6b1f3d7 info: stop printing "Expected" commits
    c65ac2d90d volume/update: require 1 argument/fix panic
    965699ba0f cli/command/volume TestUpdateCmd: adjust for older error m=
essages
    05fbfc6995 vendor: github.com/docker/docker v27.2.1
    1fe06dd0e7 vendor: github.com/moby/sys/signal v0.7.1
    7ff3daa446 vendor: github.com/moby/sys/symlink v0.3.0
    4607c883c5 vendor: github.com/moby/sys/sequential v0.6.0
    f68936ef2e vendor: dario.cat/mergo v1.0.1
    d64740d347 vendor: golang.org/x/sys v0.24.0
    5dde3d8570 vendor: golang.org/x/sync v0.8.0
    090d1ff555 vendor: golang.org/x/time v0.6.0
    295b75e5ff vendor: golang.org/x/term v0.23.0
    49e33a03df vendor: golang.org/x/text v0.17.0
    fbb0cfd86a vendor: golang.org/x/crypto v0.26.0
    968341cc7d vendor: golang.org/x/net v0.28.0
    1a199b63da vendor: tags.cncf.io/container-device-interface v0.8.0
    2fc18b9874 vendor: google.golang.org/grpc v1.62.0
    74bebe2719 vendor: github.com/docker/docker bf60e5cced83 (v27.3.0-dev=
)
    b48720e65e command: check for wsl mount path on windows
    7811c442d6 man: update dockerd man-page to include --feature flag
    bc87ef962a man: fix duplicate word in --feature flag description
    db7a014d37 man: dockerd: value is optional for --feature flag
    245f79ff57 docs/reference: dockerd: add docs for --feature option
    7c72283b37 man: dockerd: add description for --log-format option
    84d4a5ef11 docs: dockerd: add documentation for --log-format option
    d896559894 vendor: github.com/docker/docker v27.3.0-rc.1
    6fdd11b012 Dockerfile: update buildx to v0.17.1
    b5c6541769 Dockerfile: update compose to v2.29.4
    81ca58bd20 docs: Fix --rm=3Dfalse flag in container_run.md
    e2eb069aed gha: update codeql workflow to go1.22.7
    4b5a196fee telemetry: pass otel errors to the otel handler for shutdo=
wn and force flush
    c6dde25470 command: change drive to lowercase for wsl path
    ca62759b0f vendor: github.com/docker/docker v27.3.0-rc2
    460f1becc5 telemetry: fix early meterprovider shutdown
    854695884a vendor: github.com/docker/docker v27.3.0
    a4149b0c3d Dockerfile: update compose to v2.29.7
    be9b9f3d70 Update `VERSION` file to `v27.3.1-dev`
    23cea90233 docs: use important callout for buildkit vs legacy builder
    fbd51c01c6 docs: fix anchor link to web-based login section
    6445ae2f02 docs/reference: stop, restart: add flag descriptions
    d2aec10148 docs: fix a typo in run.md
    19279c9e53 opts: cleanup ParseEnvFile tests
    6f5bfcb276 docs: fix inaccurate description of --restart=3Dunless-sto=
pped
    132ecbce8b ci: update to go1.22.8
    352ee0acd4 Images Tree: Change 'Used' to 'In Use'
    4694fc8e45 Do not underline image name
    25224ab615 opts: remove ErrBadKey as it's not used as a sentinel erro=
r
    40539963c2 opts: parseKeyValueFile: cleanup and remove redundant trim=
ming
    9ab3d3a983 move parsing key-value files to a separate package
    3a1e08d6de vendor: github.com/docker/docker v27.3.1
    ed7d30ef89 vendor: golang.org/x/sys v0.25.0
    e93d817980 vendor: golang.org/x/text v0.18.0
    ae9b655aa8 vendor: golang.org/x/term v0.24.0
    949859a39e vendor: golang.org/x/crypto v0.27.0
    c93b0f1a0e vendor: golang.org/x/net v0.29.0
    78be4c464f vendor: github.com/cespare/xxhash/v2 v2.3.0
    5cbb4ca191 vendor: google.golang.org/protobuf v1.34.1
    2668b11ce4 vendor: google.golang.org/grpc v1.66.2
    52ac568385 cli/container: use github.com/moby/sys/capability for comp=
letions
    e6c6658563 cli/command/container: add unit tests for completion helpe=
rs
    64e98fa375 cli/command/completion: add Platforms
    dd4b370d3c cli/command/container: add shell completion for --platform=
 flags
    099d4baeed cli/command/image: add shell completion for --platform fla=
gs
    b6e7eba447 completion: ContainerNames: don't panic on nil filter
    7d1fa132fb completion: add test for EnvVarNames
    954dba4482 completion: add test for FileNames
    62230c7ec2 completion: add test for FromList
    02da13fb18 completion: add test for NoComplete
    95e329d3e3 completion: add test for ContainerNames
    77d002ae25 completion: add test for ImageNames
    b68bf3afe4 completion: add test for NetworkNames
    e2831282ee completion: add test for VolumeNames
    b018e55ca4 Only complete removable containers if --force is not given
    16201b3eb2 vendor: github.com/moby/swarmkit/v2 v2.0.0-20241017191044-=
e8ecf83ee08e
    d3bf82db86 cli/command/plugins: use errors.Join instead of custom cli=
.Errors
    b3a55ecbba cli: deprecate Errors type
    a8a8f68268 cli/command: ConfigureAuth: fix deprecation comment
    dc36908ec5 Fix bash completion for `events --filter daemon=3D`
    254b966b0d cli/command/container: set empty args in tests and discard=
 output
    df7e6e5c5f cli/command/container: TestWaitExitOrRemoved use subtests
    365e7a5a4e cli/config/credentials: skip saving config-file if credent=
ials didn't change
    720da3c65a cil/config/credentials: remove newStore() test-utility
    6736be779a cli/config/credentials: add test for save being idempotent
    470ab05503 Buffer 'docker stats' text to avoid terminal flickering
    35c87e326c update to go1.22.9
    e15a979e3d docs: change link to desktop docs
    2521abdb1b vendor: golang.org/x/sys v0.26.0
    3f28d05292 vendor: google.golang.org/protobuf v1.35.1
    46844b4f1d vendor: github.com/klauspost/compress v1.17.11
    d23ab524c3 cli/command: PromptUserForCredentials: remove named output=
 variables
    05455f8505 cli/command: PromptUserForCredentials: inline isDefaultReg=
istry
    97c25b7574 cli/command: PromptUserForCredentials: move "post" check f=
or empty name
    78dbcca264 cli/command: PromptUserForCredentials: move trimming where=
 it's used
    1377310110 cli/command: PromptUserForCredentials: always trim passwor=
d
    da3a1c3027 cli/command: PromptUserForCredentials: print error on term=
inal restore fail
    ddeb7eb4ed cli/command: PromptUserForCredentials: use consts for all =
hints
    168a4bdc05 cli/command: PromptUserForCredentials: suppress unhandled =
errors
    0dd07f0bfd docs: Link supported Go duration strings
    9d5a2a6b66 docs: Correct `run` exit code 126 description
    2734299993 docs: update example redis tags from 3.0.x to 7.4.x
    7a906196ed golangci-lint: enable G204, add #nosec comments instead
    1890ea0762 golangci-lint: move gosec excludes to linters-settings
    35122a0692 golangci-lint: update comment, and disable "exclude-dirs-u=
se-default"
    df7113d7eb [27.x] cli: fix non-constant format string in call to erro=
rs.Errorf (govet)
    8fe93724a3 bump golangci-lint to v1.61.0
    0529d64f7f Dockerfile: update buildx to v0.18.0
    9128f7b2d5 Dockerfile: update compose to v2.30.3
    9e7d01bfb3 Add completion for `events --filter`
    8caf347188 Add tests for completions that call the API
    49b6551e97 [27.x] vendor: github.com/docker/docker 5765e9f35b00 (v27.=
4-dev)
    38e37778b0 Share the container completions
    f9ccc50304 Add completion for `--attach`
    7e35be13ea Add completion for `--ipc`
    6f439ea4a4 Add completion for `--link`
    83f79c3e86 Add completion for `--pid`
    6d087eb91b Add completion for `--storage-opt`
    99e60c4e39 Add completion for `--ulimit`
    e25548d1c6 Add completion for `--userns`
    83303411ee Add completion for `--detach-keys`
    25ff89519f Add completion for `--security-opt`
    d11291966d Add completion for --log-driver` and --log-opt`
    78544cd587 Add completion for `--uts`
    e20bcf3565 Add completion for `--cgroupns`
    ce77f4a545 Add completion for `--volume-driver`
    955e003345 Handle null completions with a default callback
    a4dc3d78e5 vendor: github.com/docker/docker v27.4.0-rc.1
    3df40364f6 update go:build tags to use go1.22
    cfe6090d5d cli/command/container: fix missing go:build tag
    877668c92a [27.x] vendor: google.golang.org/grpc v1.66.3
    39d73afbdd Optimise `docker stats` to not require clearing the whole =
screen
    6b9fb59d31 [27.x] vendor: github.com/docker/docker v27.4.0-rc.2
    47a4f70d8a update golangci-lint to v1.62.0
    5476e9e1dc cli-plugins: Fix searching inaccessible directories
    790d09e8dc cli-plugins: Simplify addPluginCandidatesFromDir
    26da5bf025 fix: ctx should cancel image pull on run
    530cf098de test: `run` does not have error status on 27.x branch
    f4fec76472 docs: fix janky rendering of toc on docs.docker.com
    9348385006 vendor: github.com/docker/docker v27.4.0-rc.3
    5a0508ccc8 cli/trust: GetNotaryRepository: remove uses of RepositoryI=
nfo.Class
    3284a80b05 update to go1.22.10
    dc8511cd60 vendor: github.com/docker/docker v27.4.0-rc.4
    6377f54f27 vendor: github.com/docker/docker v27.4.0
    f9783ec5c6 update xx to v1.6.1 for compatibility with alpine 3.21
    12d98b057f update go-md2man to v2.0.5
    70815c1aa9 cli/command/system: remove netfilter warnings from tests
    d3b59fbd93 cli/command/container: use local copy of pkg/system.IsAbs
    a08a120bae cli/command/system: remove BridgeNfIptables, BridgeNfIp6ta=
bles in tests
    d4dc4efef0 vendor: github.com/docker/docker v27.4.1
    ef6bc69c04 vendor: github.com/Azure/go-ansiterm v0.0.0-20230124172434=
-306776ec8161
    bcec6cb71a vendor: github.com/cenkalti/backoff/v4 v4.3.0
    e3d2562114 vendor: github.com/go-logr/logr v1.4.2
    d8f2d1b155 vendor: update prometheus dependencies
    2d3e97f32d vendor: github.com/grpc-ecosystem/grpc-gateway/v2 v2.20.0
    3e51dace7c [27.x] vendor: google.golang.org/genproto f6361c86f094
    f264af6124 vendor: go.opentelemetry.io/otel v1.28.0
    fd818019f5 vendor: go.opentelemetry.io/contrib/instrumentation/xxx v0=
.53.0
    f009ed2b34 vendor: github.com/docker/docker c23af2910987 (27.x / v27.=
5.0-dev)
    0e053a5cee vendor: github.com/docker/docker v27.5.0-rc.1
    8b340f4e5c TestRunCopyFromContainerToFilesystem: use Tar without opti=
ons
    074820d7bb Fix cp test to separate source and destination
    261d2241eb docs, man: remove confusing example for "--isolation"
    5d973da95b docs: dockerd: --oom-score-adj flag
    f068c14063 contrib/completion: remove --oom-score-adj daemon flag
    0ced103038 vendor: github.com/docker/docker 43fc912ef59a (v27.5.0-rc.=
2)
    919350df54 vendor: github.com/docker/docker v27.5.0-rc.2
    b277537cbe gha/build: Publish bin image for release branches
    e32d69e31c vendor: github.com/docker/docker 38b84dce32c4 (v27.5.0)
    397c2f87d5 vendor: github.com/docker/docker v27.5.0
    1ccfae7946 update to go1.22.11 (fix CVE-2024-45341, CVE-2024-45336)
    fa1ba052d6 gha: Adjust release branches
    777695f6d5 Dockerfile: update buildx to v0.20.0
    fbc0a73b35 Dockerfile: update compose to v2.32.4

Signed-off-by: Paolo Barbolini <paolo.barbolini@m4ss.net>
---
 recipes-containers/docker/docker-moby_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-conta=
iners/docker/docker-moby_git.bb
index 9f45f175..b3f5effe 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -44,8 +44,8 @@ DESCRIPTION =3D "Linux container runtime \
 # so we get that tag, and make it our SRCREVS:
 #
=20
-SRCREV_moby =3D "43fc912ef59a83054ea7f6706df4d53a7dea4d80"
-SRCREV_cli =3D "d41cb083c352853f94b292a87df4859c4a96dcc2"
+SRCREV_moby =3D "4c9b3b011ae4c30145a7b344c870bdda01b454e2"
+SRCREV_cli =3D "9f9e4058019a37304dc6572ffcbb409d529b59d8"
 SRCREV_FORMAT =3D "moby"
 SRC_URI =3D "\
 	git://github.com/moby/moby.git;nobranch=3D1;name=3Dmoby;protocol=3Dhttp=
s;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
@@ -64,7 +64,7 @@ require docker.inc
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D4859e97a9c7780e779=
72d989f0823f28"
=20
-DOCKER_VERSION =3D "27.5.0-rc.2"
+DOCKER_VERSION =3D "27.5.1"
 PV =3D "${DOCKER_VERSION}+git${SRCREV_moby}"
=20
 CVE_PRODUCT =3D "docker mobyproject:moby"
--=20
2.48.1


