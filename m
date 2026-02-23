Return-Path: <felix@piedallu.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C70EC1109
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 16:36:16 +0000 (UTC)
Received: from 4.mo579.mail-out.ovh.net (4.mo579.mail-out.ovh.net [46.105.32.218])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39341.1771864573430522508
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 08:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@piedallu.me header.s=mailkey header.b=iI5pHCML;
 spf=softfail (domain: piedallu.me, ip: 46.105.32.218, mailfrom: felix@piedallu.me)
Received: from mxplan8.mail.ovh.net (unknown [10.110.37.110])
	by mo579.mail-out.ovh.net (Postfix) with ESMTPS id 4fKRLg3Ckdz5wPg;
	Mon, 23 Feb 2026 16:36:11 +0000 (UTC)
Received: from piedallu.me (37.59.142.113) by mxplan8.mail.ovh.net
 (172.16.2.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 23 Feb
 2026 17:36:11 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-113S007d9d0b6dd-74f5-4084-9640-2d8ed3fa1a66,
                    2C24A2C219CBC5CDE540945932125BCC2609A321) smtp.auth=postmaster@piedallu.me
X-OVh-ClientIp: 82.66.229.222
Received: from [127.0.1.1] (92-184-100-178.mobile.fr.orangecustomers.net [92.184.100.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by piedallu.me (Postfix) with ESMTPSA id BF8BD16A0690;
	Mon, 23 Feb 2026 17:36:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=piedallu.me;
	s=mailkey; t=1771864568;
	bh=WflRB9NbGmH6aybycDRbULKQoK/4dmcHf/lmnPiYQrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iI5pHCMLHASPseKmU1MQP2u5Uo2zeJ+zYS3AlVSqCovNJG6BU6UpnfgYJXKPAIbyb
	 aHwYj3XSlfGLV10WmtTRvBSRlp+p6pbDzZoE7SOMl3DE9kGp5YJz4rnN60iRnJ39bE
	 rLyh1tKYPHrtqTN7uLaK4/QLwtxaxnanb+zjXQ5s=
From: felix@piedallu.me
Date: Mon, 23 Feb 2026 17:35:58 +0100
Subject: [PATCH v2 4/4] docker-moby: Update to v25.0.9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-ID: <20260223-upstream-update-docker-moby-v2-4-5bc0d679d988@non.se.com>
References: <20260223-upstream-update-docker-moby-v2-0-5bc0d679d988@non.se.com>
In-Reply-To: <20260223-upstream-update-docker-moby-v2-0-5bc0d679d988@non.se.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: =?utf-8?q?F=C3=A9lix_Pi=C3=A9dallu?= <felix.piedallu@non.se.com>, 
 pascal.eberhard@se.com
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771864566; l=32779;
 i=felix.piedallu@non.se.com; s=20250606; h=from:subject:message-id;
 bh=2E25uzDvCFuHYdYO5pDLPlogkK8vkTGrotgYLG9+OOY=;
 b=6Qh9r3h6Q8cKRlQLVNXgyDXQ9GTHKx2bew+II0qe/dzzzfzKrTviTdQh9cw/MsNWod2l1fexg
 3SK2GFwZhWHBbTDKWp2dZtb0nf3I33H3UgP6RMvRAvXtXnBIkLeVojK
X-Developer-Key: i=felix.piedallu@non.se.com; a=ed25519;
 pk=Xe1dw6DIV7hmFbzuJfvaioG+S30kGix0QpIi5qPg99w=
X-MailScanner-ID: BF8BD16A0690.A6C07
X-MailScanner: Found to be clean
X-MailScanner-From: felix@piedallu.me
X-Ovh-Tracer-GUID: 3e5b0ac1-f233-4351-a9a6-0145b9967973
X-Ovh-Tracer-Id: 9366079853408389341
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFjqUpUj/kar3QDM7cSz6T3lI6M/Qngedf4cd4Q2vt3M/aKvnm6WOsoB/BXW8Au2Q2/SKK6H7JLt4/fB5u6qy+5MdadXNg9w9w+bdRmO7x5wVKkKGTKeahnmY5CaGwvo5XBMUurD6hD91bsz3AbtkW0EIZv/mSjeXcet8wb7sQc1YpMfkLSjIV/TAgqZvI34fRrKfIBn3izs6PMJXx7I4fnt/1V6XcWup0+zsV5Y8SLT0dJHaPNxy2lU5OS306WEVoqMrLUDCstiQFaXeoo1ya7uAWVTejubduQAKGJ9yLJOU1qPg7x+Bi8vnaqHZeLWZhSNTDwXKPx7XHKsdngkVqEnLCxMhSn6n3ylsgekddBUQdNZsgUMuPhTqLgYrmJS3k00OwIXbvgDyESDjqYgPaPnVJsKqm+prZoy/uD4CUoAISmn3zqSR/+v8fI5dq3+xbysYlZKEgHpXUg3BnYR38dj4peYIjjxWH2ArIUZZlfVgt5cCVOpDTVTEMOk0XcUZtRXBZo3v6nhN8QUWXhfewoRfcjjR2jHgWywBaEBw3+PtFfIdNtbcgdR3lERDYbUmJCjmgUhvyYQFTiEYZAb1V7QTAZNMlh/Kb6t/Z/JCp3XWdXTXp2I+2d3VuGAlsfCPRAtS+uA8oGg3D80rnUK2Y+hTpr/Vo7A/U6I8nl6cdEog
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Feb 2026 16:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9609

From: F=C3=A9lix Pi=C3=A9dallu <felix.piedallu@non.se.com>

This is the latest point release of v25.0 that supports Go v1.22

Bumping moby to version v25.0.14, which comprises the following commits:

    89a48b65fc Dockerfile: update runc binary to v1.2.5
    aae4029600 update to go1.22.12
    a2802d0746 update to go1.22.11 (fix CVE-2024-45341, CVE-2024-45336)
    9281aea6ce ci: update base container to alpine20 for buildkit workflo=
w
    b1d6fd957d gha: set arm64 GO_VERSION to 1.22.10
    7540f88434 ci: switch from jenkins to gha for arm64 build and tests
    f8d9617c43 ci(bin-image): fix bake build
    bec5e8eed1 ci: update bake-action to v6
    fcb50183e4 Dockerfile: update runc binary to v1.2.4
    20af9f77a6 Dockerfile: update containerd to v1.7.25
    7d20eee4fd Dockerfile: update runc binary to v1.2.3
    eacc3610f9 libnetwork/drivers/bridge: setupIPChains: fix defer checki=
ng wrong err
    842024e721 update xx to v1.6.1 for compatibility with alpine 3.21
    96b8a34d2b Dockerfile: update xx to v1.5.0
    5ed63409a2 Dockerfile: update xx to v1.4.0
    03885ae2c0 update to go1.22.10
    ddc8a15eb5 Dockerd rootless: make {/etc,/var/run}/cdi available
    6648f3a10e c8d/tag: Don't log a warning if the source image is not da=
ngling
    6f497b2d51 Dockerfile: update to runc v1.2.2
    01c163d4ee Dockerfile: update containerd to v1.7.24
    708c8dc304 gha: shorter time limits for smoke, validate
    f6bcbab7a1 gha: use "ubuntu-24.04" instead of "ubuntu-latest"
    2de8143fa6 gha: dco: small tweaks to running the container
    e0857ef530 gha: dco: update ALPINE_VERSION to 3.20
    1b7b596513 gha: build (binary), build (dynbinary): limit to 20 minute=
s
    2e43cd5450 gha: dco: limit to 10 minutes
    bdb21cd779 integration: add wait
    911478fb28 Jenkinsfile: modprobe br_netfilter
    2278d180a7 daemon: use OwnCgroupPath in withCgroups
    a6d1d0693f vendor: github.com/golang-jwt/jwt/v4@v4.5.1
    0ed4861f9c update to go1.22.9
    2df019330c update runc binary to 1.1.14
    e6de0b8f3b update runc binary to v1.1.13
    cb56070132 volume: VolumesService.Create: fix log-level for debug log=
s
    480b01a532 volume/mounts: fix anonymous volume not being labeled
    f7b7ec14b8 volume/service: change some logs to use structured logs
    60eece38cd Fix: setup user chains even if there are running container=
s
    54ac8bbe37 cmd/dockerd: Add workaround for OTEL meter leak
    6e1af3d5d8 gha: remove stray double empty line
    0eae0850ac gha: restrict cross and bin-image to 20 minutes
    e6a2c9bebb gha: add guardrails timeouts on all jobs
    4b98bfd07d gha: buildkit: make sure expected Go version is installed
    ae548176dc update to go1.22.8
    122682205f Dockerfile: update containerd binary to v1.7.22
    9f102b3b5b Dockerfile: update containerd binary to v1.7.21 (static bi=
naries and CI only)
    75891766e4 man: dockerd: add description for --log-format option
    3ec9003a14 Update dlv in the dev-env
    caef5cc70c Explicitly disable nvidia device injection for --gpus=3D0
    34471d3259 seccomp: add riscv64 mapping to seccomp_linux.go
    bec84c9c31 update to go1.22.7
    d0315c9824 golangci-lint: temporarily disable G115: integer overflow =
conversion
    ff546aff14 update golangci-lint to v1.60.2
    15db81eeaa update to go1.22.6
    23af4b75e9 hack/make/.binary: set CGO_LDFLAGS=3D-latomic for arm/v5
    da8bfd963e hack/make/.binary: set CCGO_CFLAGS=3D-Wno-atomic-alignment=
 for arm/v5
    0ce4415ff2 daemon: fix non-constant format string in call (govet)
    14a48ac308 api/types: fix non-constant format string in call (govet)
    c50e7e6ca2 api/server/router: fix non-constant format string in call =
(govet)
    2a4ea4749d container/stream: fix non-constant format string in call (=
govet)
    b536253047 libnetwork/drivers/bridge: fix non-constant format string =
in call (govet)
    3216abd8db volume/testutils: fix non-constant format string in call (=
govet)
    dd5a6fdbac builder/dockerfile: parseChownFlag: fix non-constant forma=
t string in call (govet)
    0c5e131330 layer: ignore G602: slice index out of range (gosec)
    b50a85d0ed cmd/dockerd: fix non-constant format string in call (govet=
)
    8105391708 libnetwork: fix non-constant format string in call (govet)
    6209d5bd68 integration-cli: fix non-constant format string in call (g=
ovet)
    25cffb9dec integration-cli: DockerSwarmSuite: rm redundant Fprintf, h=
andle errors
    21279f652e integration-cli: DockerNetworkSuite: rm redundant Fprintf,=
 handle errors
    a27066d1ca integration-cli: use erors.New() instead of fmt.Errorf
    e88d4ea298 libnetwork: TestDNSOptions: remove redundant skip check
    613d955d38 integration-cli: remove redundant platform checks
    e962b3e06e update to go1.21.13
    33dbea3c37 vendor: github.com/Microsoft/go-winio v0.6.2
    5e46424b29 vendor: golang.org/x/tools v0.16.0
    5ca50f5c24 vendor: golang.org/x/mod v0.17.0
    a599caf7e9 update golangci-lint to v1.59.1
    89903672a7 pkg/archive: reformat code to make #nosec comment work aga=
in
    dbf6db9306 builder/remotecontext: reformat code to make #nosec commen=
t work again
    55a4cadaa5 man: create parent directories in install recipe
    042dad56d0 man: support bringing your own go-md2man
    553d915ef4 man: build dockerd man pages using make
    c70f626351 Removed all mentions of "please" from docs and messages
    5966382473 docs: add default-network-opt daemon option
    3edc25412a docs: remove devicemapper
    65906e44b0 man/dockerd.8: assorted formatting fixes
    a298720e8f man/dockerd.8: escape asterisks and underscores
    88a3e540c9 docs: update dockerd usage output for new proxy-options
    90fc11f69a Fix styling of arguments
    182df40d13 Fix the max-concurrent-downloads and max-concurrent-upload=
s configs documentation
    2544c68655 docs: remove documentation about deprecated cluster-store
    be77069539 Document `--validate` daemon option
    0299ca1d73 Update man-page source MarkDown to work with go-md2man v2
    aff4659c67 docs: update for cgroup v2 and rootless
    c47231e5cf docker run: specify cgroup namespace mode with --cgroupns
    962f331e76 daemon: document --max-download-attempts option
    71f9bfe47f Update document links and title.
    017213c2b0 Allow user to specify default address pools for docker net=
works This is separate commit for CLI files to address PR 36054
    210f03082b Update docs and completion-scripts for deprecated features
    2f78133a0a Added docs for dockerd
    675593bb4f fix a number of minor typos
    9c291b1745 Introduce/document new IPC modes
    a23ff1bb1a docs: add documentation for dm.libdm_log_level
    c78cecd77f Restore dockerd man page
    f14cf10618 gha: set permissions to read-only by default
    0cd951e4dd api: adjust health start interval on swarm update
    d151b0f87f vendor: OTEL v0.46.1 / v1.21.0
    30f8908102 github/ci: Check if backport is opened against the expecte=
d branch
    7454d6a2e6 ci: update workflow artifacts retention
    e8ecb9c76d update containerd binary to v1.7.20
    e6cae1f237 update containerd binary to v1.7.19
    8ec448db6b update containerd binary to v1.7.18
    274310807e integration/TestDiskUsage: Make 4096 also a 'empty' value
    886e726984 Dockerfile: update containerd binary to v1.7.17 (static bi=
naries and CI only)
    a0f0f7e77e update containerd binary to v1.7.15
    91903e81ca If url includes scheme, urlPath will drop hostname, which =
would not match the auth check
    ccfe0a41d4 Authz plugin security fixes for 0-length content and path =
validation Signed-off-by: Jameson Hyde <jameson.hyde@docker.com>
    d046451b34 update to go1.21.12 [part 2]
    e16a25e442 update to go1.21.12
    b1aac1b134 update to go1.21.11
    fffbe84ded Makefile: Pass PAGER/GIT_PAGER variable
    9f6600deed builder/mobyexporter: Add missing nil check
    70fe516b46 don't depend on containerd platform.Parse to return a type=
d error
    f7ce828e9e Fix issue where node promotion could fail
    98ddccbbfe apparmor: Allow confined runc to kill containers
    637205391b update to go1.21.10
    3d56d734db vendor: google.golang.org/protobuf v1.33.0, github.com/gol=
ang/protobuf v1.5.4
    0a2f5085ee vendor: cloud.google.com/go/logging v1.8.1
    3141ea5c8b vendor: golang.org/x/mod v0.13.0, golang.org/x/tools v0.13=
.0
    4f25076181 vendor: golang.org/x/sync v0.5.0
    d93cc7edc0 nil dereference fix on image history Created value
    ee5909c2d0 vendor: golang.org/x/net v0.23.0
    f37d6f5f48 vendor: golang.org/x/net v0.22.0, golang.org/x/crypto v0.2=
1.0
    fd828b6766 go.mod: golang.org/x/sys v0.18.0
    584a30c772 awslogs: Replace depreacted WithEndpointResolver usage
    60605eb1da vendor: bump github.com/aws/aws-sdk-go-v2/service/cloudwat=
chlogs to v1.32.0
    71b8e0339c vendor: bump github.com/aws/aws-sdk-go-v2 to v1.24.1
    08e8912d7c ci/validate-pr: Use `::error::` command to print errors
    e2e670299f Fix cases where we are wrapping a nil error
    935787c19c save: Remove platform from config descriptor
    bd19301d9e ci: Require changelog description
    50bd133ad3 update to go1.21.9
    a987bc5ad0 libnet: Don't forward to upstream resolvers on internal nw
    20c205fd3a Environment variable to override resolv.conf path.
    4be97233cc daemon: move getUnprivilegedMountFlags to internal package
    7ed7e6caf6 plugin: fix mounting /etc/hosts when running in UserNS
    81ad7062f0 rootless: fix `open /etc/docker/plugins: permission denied=
`
    02d4ee3f9a Makefile: generate-files: fix check for empty TMP_OUT
    478f6b097d volume: Don't decrement refcount below 0
    d250e13945 builder-next: fix missing lock in ensurelayer
    d0d85f6438 daemon: overlay2: remove world writable permission from th=
e lower file
    0451b287dc Don't create endpoint config for MAC addr config migration
    d27fe2558d dockerd-rootless-setuptool.sh: check RootlessKit functiona=
lity
    77de535364 Dockerfile: update RootlessKit to v2.0.2
    2d347024d1 update to go1.21.8
    f66b5f642e Test DNS on Windows 'nat' networks
    fa4ea308f0 c8d/windows: Temporarily skip two failing tests
    d66e0fb7b1 Set up DNS names for Windows default network
    7a4abb8c77 ci: set codecov token
    81a83f0544 Simplify macvlan/ipvlan integration test structure
    abcd6f8a46 Run the macvlan/ipvlan integration tests
    f7be6dcba6 integration: Reset `OTEL_EXPORTER_OTLP_ENDPOINT` for sub-d=
aemons
    10609544e5 update to go1.21.7
    be59afce2d c8d/pull: Output truncated id for `Pulling fs layer`
    97951c39fb c8d/pull: Don't emit `Downloading` with 0 progress
    2001813571 c8d/pull: Emit `Pulling fs layer`
    8e3bcf1974 pkg/streamformatter: Make `progressOutput` concurrency saf=
e
    27f36f42a4 builder/dockerfile: ADD with best-effort xattrs
    1ae019fca2 Don't enforce new validation rules for existing networks
    c761353e7c Make 'internal' bridge networks accessible from host
    10bc347b03 ci: Update `teststat` to v0.1.25
    94137f6df5 client: fix connection-errors being shadowed by API versio=
n mismatch errors
    dd5faa9d4f ci: Make `find` for test reports more specific
    012bfd33e5 client: doRequest: make sure we return a connection-error
    3ec1946ce1 client: NegotiateAPIVersion: do not ignore (connection) er=
rors from Ping
    200a2c3576 client: fix TestPingWithError
    70c05fe10c libcontainerd: change the digest used when restoring
    e85cef89fa api/pre-1.44: Default `ReadOnlyNonRecursive` to true
    a72294a668 mounts/validate: Don't check source exists with CreateMoun=
tpoint
    9ee331235a integration: Add container.Output utility
    5d9e13bc84 api: omit missing Created field from ImageInspect response
    bb66c3ca04 api/history: Mention empty `Created`
    fa3a64f2bc Set `Created` to `0001-01-01T00:00:00Z` on older API versi=
ons

Signed-off-by: F=C3=A9lix Pi=C3=A9dallu <felix.piedallu@non.se.com>
---
 recipes-containers/docker/docker-moby_git.bb       |   7 +-
 .../docker/files/CVE-2024-29018.patch              | 344 ---------------=
------
 .../docker/files/CVE-2024-36620.patch              |  39 ---
 .../docker/files/CVE-2024-36621.patch              |  82 -----
 4 files changed, 2 insertions(+), 470 deletions(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-conta=
iners/docker/docker-moby_git.bb
index dd6dac05..e66416db 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -44,7 +44,7 @@ DESCRIPTION =3D "Linux container runtime \
 # so we get that tag, and make it our SRCREVS:
 #
=20
-SRCREV_moby =3D "f417435e5f6216828dec57958c490c4f8bae4f98"
+SRCREV_moby =3D "a926bec8fc91332410133b24f3e9e3f5add13b48"
 SRCREV_libnetwork =3D "3797618f9a38372e8107d8c06f6ae199e1133ae8"
 SRCREV_cli =3D "43987fca488a535d810c429f75743d8c7b63bf4f"
 SRCREV_FORMAT =3D "moby_libnetwork"
@@ -56,9 +56,6 @@ SRC_URI =3D "\
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patc=
h \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=3Dsrc=
/import \
-        file://CVE-2024-36620.patch;patchdir=3Dsrc/import \
-        file://CVE-2024-36621.patch;patchdir=3Dsrc/import \
-        file://CVE-2024-29018.patch;patchdir=3Dsrc/import \
 	"
=20
 DOCKER_COMMIT =3D "${SRCREV_moby}"
@@ -69,7 +66,7 @@ require docker.inc
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D4859e97a9c7780e779=
72d989f0823f28"
=20
-DOCKER_VERSION =3D "25.0.3"
+DOCKER_VERSION =3D "25.0.9"
 PV =3D "${DOCKER_VERSION}+git${SRCREV_moby}"
=20
 CVE_PRODUCT =3D "docker mobyproject:moby"
diff --git a/recipes-containers/docker/files/CVE-2024-29018.patch b/recip=
es-containers/docker/files/CVE-2024-29018.patch
deleted file mode 100644
index f3c800ff..00000000
--- a/recipes-containers/docker/files/CVE-2024-29018.patch
+++ /dev/null
@@ -1,344 +0,0 @@
-From 20c205fd3a0081d005958eff690e2b34df1c5e5e Mon Sep 17 00:00:00 2001
-From: Rob Murray <rob.murray@docker.com>
-Date: Tue, 19 Mar 2024 11:19:30 +0000
-Subject: [PATCH 1/2] Environment variable to override resolv.conf path.
-
-If env var DOCKER_TEST_RESOLV_CONF_PATH is set, treat it as an override
-for the 'resolv.conf' path.
-
-Added as part of resolv.conf refactoring, but needed by back-ported test
-TestInternalNetworkDNS.
-
-Signed-off-by: Rob Murray <rob.murray@docker.com>
-
-CVE: CVE-2024-29018
-Upstream-Status: Backport [https://github.com/moby/moby/commit/e63daec86=
72d77ac0b2b5c262ef525c7cf17fd20]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- daemon/container_operations_unix.go       |  20 +--
- integration/networking/resolvconf_test.go | 142 ++++++++++++++++++++++
- libnetwork/endpoint.go                    |  12 +-
- libnetwork/resolver.go                    |  17 ++-
- libnetwork/sandbox_dns_unix.go            |   9 +-
- 5 files changed, 182 insertions(+), 18 deletions(-)
- create mode 100644 integration/networking/resolvconf_test.go
-
-diff --git a/daemon/container_operations_unix.go b/daemon/container_oper=
ations_unix.go
-index 6a23a4ca92..e9be1b4e72 100644
---- a/daemon/container_operations_unix.go
-+++ b/daemon/container_operations_unix.go
-@@ -380,6 +380,7 @@ func serviceDiscoveryOnDefaultNetwork() bool {
-=20
- func setupPathsAndSandboxOptions(container *container.Container, cfg *c=
onfig.Config, sboxOptions *[]libnetwork.SandboxOption) error {
- 	var err error
-+	var originResolvConfPath string
-=20
- 	// Set the correct paths for /etc/hosts and /etc/resolv.conf, based on=
 the
- 	// networking-mode of the container. Note that containers with "contai=
ner"
-@@ -393,8 +394,8 @@ func setupPathsAndSandboxOptions(container *containe=
r.Container, cfg *config.Con
- 		*sboxOptions =3D append(
- 			*sboxOptions,
- 			libnetwork.OptionOriginHostsPath("/etc/hosts"),
--			libnetwork.OptionOriginResolvConfPath("/etc/resolv.conf"),
- 		)
-+		originResolvConfPath =3D "/etc/resolv.conf"
- 	case container.HostConfig.NetworkMode.IsUserDefined():
- 		// The container uses a user-defined network. We use the embedded DNS
- 		// server for container name resolution and to act as a DNS forwarder
-@@ -407,10 +408,7 @@ func setupPathsAndSandboxOptions(container *contain=
er.Container, cfg *config.Con
- 		// If systemd-resolvd is used, the "upstream" DNS servers can be foun=
d in
- 		// /run/systemd/resolve/resolv.conf. We do not query those DNS server=
s
- 		// directly, as they can be dynamically reconfigured.
--		*sboxOptions =3D append(
--			*sboxOptions,
--			libnetwork.OptionOriginResolvConfPath("/etc/resolv.conf"),
--		)
-+		originResolvConfPath =3D "/etc/resolv.conf"
- 	default:
- 		// For other situations, such as the default bridge network, containe=
r
- 		// discovery / name resolution is handled through /etc/hosts, and no
-@@ -423,11 +421,15 @@ func setupPathsAndSandboxOptions(container *contai=
ner.Container, cfg *config.Con
- 		// DNS servers on the host can be dynamically updated.
- 		//
- 		// Copy the host's resolv.conf for the container (/run/systemd/resolv=
e/resolv.conf or /etc/resolv.conf)
--		*sboxOptions =3D append(
--			*sboxOptions,
--			libnetwork.OptionOriginResolvConfPath(cfg.GetResolvConf()),
--		)
-+		originResolvConfPath =3D cfg.GetResolvConf()
-+	}
-+
-+	// Allow tests to point at their own resolv.conf file.
-+	if envPath :=3D os.Getenv("DOCKER_TEST_RESOLV_CONF_PATH"); envPath !=3D=
 "" {
-+		log.G(context.TODO()).Infof("Using OriginResolvConfPath from env: %s"=
, envPath)
-+		originResolvConfPath =3D envPath
- 	}
-+	*sboxOptions =3D append(*sboxOptions, libnetwork.OptionOriginResolvCon=
fPath(originResolvConfPath))
-=20
- 	container.HostsPath, err =3D container.GetRootResourcePath("hosts")
- 	if err !=3D nil {
-diff --git a/integration/networking/resolvconf_test.go b/integration/net=
working/resolvconf_test.go
-new file mode 100644
-index 0000000000..60c8b1bc9a
---- /dev/null
-+++ b/integration/networking/resolvconf_test.go
-@@ -0,0 +1,142 @@
-+package networking
-+
-+import (
-+	"net"
-+	"os"
-+	"testing"
-+
-+	containertypes "github.com/docker/docker/api/types/container"
-+	"github.com/docker/docker/integration/internal/container"
-+	"github.com/docker/docker/integration/internal/network"
-+	"github.com/docker/docker/testutil/daemon"
-+	"github.com/miekg/dns"
-+	"gotest.tools/v3/assert"
-+	is "gotest.tools/v3/assert/cmp"
-+	"gotest.tools/v3/skip"
-+)
-+
-+// writeTempResolvConf writes a resolv.conf that only contains a single
-+// nameserver line, with address addr.
-+// It returns the name of the temp file.
-+func writeTempResolvConf(t *testing.T, addr string) string {
-+	t.Helper()
-+	// Not using t.TempDir() here because in rootless mode, while the temp=
orary
-+	// directory gets mode 0777, it's a subdir of an 0700 directory owned =
by root.
-+	// So, it's not accessible by the daemon.
-+	f, err :=3D os.CreateTemp("", "resolv.conf")
-+	assert.NilError(t, err)
-+	t.Cleanup(func() { os.Remove(f.Name()) })
-+	err =3D f.Chmod(0644)
-+	assert.NilError(t, err)
-+	f.Write([]byte("nameserver " + addr + "\n"))
-+	return f.Name()
-+}
-+
-+const dnsRespAddr =3D "10.11.12.13"
-+
-+// startDaftDNS starts and returns a really, really daft DNS server tha=
t only
-+// responds to type-A requests, and always with address dnsRespAddr.
-+func startDaftDNS(t *testing.T, addr string) *dns.Server {
-+	serveDNS :=3D func(w dns.ResponseWriter, query *dns.Msg) {
-+		if query.Question[0].Qtype =3D=3D dns.TypeA {
-+			resp :=3D &dns.Msg{}
-+			resp.SetReply(query)
-+			answer :=3D &dns.A{
-+				Hdr: dns.RR_Header{
-+					Name:   query.Question[0].Name,
-+					Rrtype: dns.TypeA,
-+					Class:  dns.ClassINET,
-+					Ttl:    600,
-+				},
-+			}
-+			answer.A =3D net.ParseIP(dnsRespAddr)
-+			resp.Answer =3D append(resp.Answer, answer)
-+			_ =3D w.WriteMsg(resp)
-+		}
-+	}
-+
-+	conn, err :=3D net.ListenUDP("udp", &net.UDPAddr{
-+		IP:   net.ParseIP(addr),
-+		Port: 53,
-+	})
-+	assert.NilError(t, err)
-+
-+	server :=3D &dns.Server{Handler: dns.HandlerFunc(serveDNS), PacketConn=
: conn}
-+	go func() {
-+		_ =3D server.ActivateAndServe()
-+	}()
-+
-+	return server
-+}
-+
-+// Check that when a container is connected to an internal network, DNS
-+// requests sent to daemon's internal DNS resolver are not forwarded to
-+// an upstream resolver listening on a localhost address.
-+// (Assumes the host does not already have a DNS server on 127.0.0.1.)
-+func TestInternalNetworkDNS(t *testing.T) {
-+	skip.If(t, testEnv.DaemonInfo.OSType =3D=3D "windows", "No resolv.conf=
 on Windows")
-+	skip.If(t, testEnv.IsRootless, "Can't use resolver on host in rootless=
 mode")
-+	ctx :=3D setupTest(t)
-+
-+	// Start a DNS server on the loopback interface.
-+	server :=3D startDaftDNS(t, "127.0.0.1")
-+	defer server.Shutdown()
-+
-+	// Set up a temp resolv.conf pointing at that DNS server, and a daemon=
 using it.
-+	tmpFileName :=3D writeTempResolvConf(t, "127.0.0.1")
-+	d :=3D daemon.New(t, daemon.WithEnvVars("DOCKER_TEST_RESOLV_CONF_PATH=3D=
"+tmpFileName))
-+	d.StartWithBusybox(ctx, t, "--experimental", "--ip6tables")
-+	defer d.Stop(t)
-+
-+	c :=3D d.NewClientT(t)
-+	defer c.Close()
-+
-+	intNetName :=3D "intnet"
-+	network.CreateNoError(ctx, t, c, intNetName,
-+		network.WithDriver("bridge"),
-+		network.WithInternal(),
-+	)
-+	defer network.RemoveNoError(ctx, t, c, intNetName)
-+
-+	extNetName :=3D "extnet"
-+	network.CreateNoError(ctx, t, c, extNetName,
-+		network.WithDriver("bridge"),
-+	)
-+	defer network.RemoveNoError(ctx, t, c, extNetName)
-+
-+	// Create a container, initially with external connectivity.
-+	// Expect the external DNS server to respond to a request from the con=
tainer.
-+	ctrId :=3D container.Run(ctx, t, c, container.WithNetworkMode(extNetNa=
me))
-+	defer c.ContainerRemove(ctx, ctrId, containertypes.RemoveOptions{Force=
: true})
-+	res, err :=3D container.Exec(ctx, c, ctrId, []string{"nslookup", "test=
.example"})
-+	assert.NilError(t, err)
-+	assert.Check(t, is.Equal(res.ExitCode, 0))
-+	assert.Check(t, is.Contains(res.Stdout(), dnsRespAddr))
-+
-+	// Connect the container to the internal network as well.
-+	// External DNS should still be used.
-+	err =3D c.NetworkConnect(ctx, intNetName, ctrId, nil)
-+	assert.NilError(t, err)
-+	res, err =3D container.Exec(ctx, c, ctrId, []string{"nslookup", "test.=
example"})
-+	assert.NilError(t, err)
-+	assert.Check(t, is.Equal(res.ExitCode, 0))
-+	assert.Check(t, is.Contains(res.Stdout(), dnsRespAddr))
-+
-+	// Disconnect from the external network.
-+	// Expect no access to the external DNS.
-+	err =3D c.NetworkDisconnect(ctx, extNetName, ctrId, true)
-+	assert.NilError(t, err)
-+	res, err =3D container.Exec(ctx, c, ctrId, []string{"nslookup", "test.=
example"})
-+	assert.NilError(t, err)
-+	assert.Check(t, is.Equal(res.ExitCode, 1))
-+	assert.Check(t, is.Contains(res.Stdout(), "SERVFAIL"))
-+
-+	// Reconnect the external network.
-+	// Check that the external DNS server is used again.
-+	err =3D c.NetworkConnect(ctx, extNetName, ctrId, nil)
-+	assert.NilError(t, err)
-+	res, err =3D container.Exec(ctx, c, ctrId, []string{"nslookup", "test.=
example"})
-+	assert.NilError(t, err)
-+	assert.Check(t, is.Equal(res.ExitCode, 0))
-+	assert.Check(t, is.Contains(res.Stdout(), dnsRespAddr))
-+}
-diff --git a/libnetwork/endpoint.go b/libnetwork/endpoint.go
-index d9c257dc68..3ca546a4ac 100644
---- a/libnetwork/endpoint.go
-+++ b/libnetwork/endpoint.go
-@@ -538,8 +538,13 @@ func (ep *Endpoint) sbJoin(sb *Sandbox, options ...=
EndpointOption) (err error) {
- 		return sb.setupDefaultGW()
- 	}
-=20
--	moveExtConn :=3D sb.getGatewayEndpoint() !=3D extEp
-+	currentExtEp :=3D sb.getGatewayEndpoint()
-+	// Enable upstream forwarding if the sandbox gained external connectiv=
ity.
-+	if sb.resolver !=3D nil {
-+		sb.resolver.SetForwardingPolicy(currentExtEp !=3D nil)
-+	}
-=20
-+	moveExtConn :=3D currentExtEp !=3D extEp
- 	if moveExtConn {
- 		if extEp !=3D nil {
- 			log.G(context.TODO()).Debugf("Revoking external connectivity on endp=
oint %s (%s)", extEp.Name(), extEp.ID())
-@@ -735,6 +740,11 @@ func (ep *Endpoint) sbLeave(sb *Sandbox, force bool=
, options ...EndpointOption)
-=20
- 	// New endpoint providing external connectivity for the sandbox
- 	extEp =3D sb.getGatewayEndpoint()
-+	// Disable upstream forwarding if the sandbox lost external connectivi=
ty.
-+	if sb.resolver !=3D nil {
-+		sb.resolver.SetForwardingPolicy(extEp !=3D nil)
-+	}
-+
- 	if moveExtConn && extEp !=3D nil {
- 		log.G(context.TODO()).Debugf("Programming external connectivity on en=
dpoint %s (%s)", extEp.Name(), extEp.ID())
- 		extN, err :=3D extEp.getNetworkFromStore()
-diff --git a/libnetwork/resolver.go b/libnetwork/resolver.go
-index 9df2154499..5d5686fc86 100644
---- a/libnetwork/resolver.go
-+++ b/libnetwork/resolver.go
-@@ -9,6 +9,7 @@ import (
- 	"strconv"
- 	"strings"
- 	"sync"
-+	"sync/atomic"
- 	"time"
-=20
- 	"github.com/containerd/log"
-@@ -75,7 +76,7 @@ type Resolver struct {
- 	tcpListen     *net.TCPListener
- 	err           error
- 	listenAddress string
--	proxyDNS      bool
-+	proxyDNS      atomic.Bool
- 	startCh       chan struct{}
- 	logger        *log.Entry
-=20
-@@ -85,15 +86,17 @@ type Resolver struct {
-=20
- // NewResolver creates a new instance of the Resolver
- func NewResolver(address string, proxyDNS bool, backend DNSBackend) *Re=
solver {
--	return &Resolver{
-+	r :=3D &Resolver{
- 		backend:       backend,
--		proxyDNS:      proxyDNS,
- 		listenAddress: address,
- 		err:           fmt.Errorf("setup not done yet"),
- 		startCh:       make(chan struct{}, 1),
- 		fwdSem:        semaphore.NewWeighted(maxConcurrent),
- 		logInverval:   rate.Sometimes{Interval: logInterval},
- 	}
-+	r.proxyDNS.Store(proxyDNS)
-+
-+	return r
- }
-=20
- func (r *Resolver) log(ctx context.Context) *log.Entry {
-@@ -194,6 +197,12 @@ func (r *Resolver) SetExtServers(extDNS []extDNSEnt=
ry) {
- 	}
- }
-=20
-+// SetForwardingPolicy re-configures the embedded DNS resolver to eithe=
r enable or disable forwarding DNS queries to
-+// external servers.
-+func (r *Resolver) SetForwardingPolicy(policy bool) {
-+	r.proxyDNS.Store(policy)
-+}
-+
- // NameServer returns the IP of the DNS resolver for the containers.
- func (r *Resolver) NameServer() string {
- 	return r.listenAddress
-@@ -421,7 +430,7 @@ func (r *Resolver) serveDNS(w dns.ResponseWriter, qu=
ery *dns.Msg) {
- 		return
- 	}
-=20
--	if r.proxyDNS {
-+	if r.proxyDNS.Load() {
- 		// If the user sets ndots > 0 explicitly and the query is
- 		// in the root domain don't forward it out. We will return
- 		// failure and let the client retry with the search domain
-diff --git a/libnetwork/sandbox_dns_unix.go b/libnetwork/sandbox_dns_uni=
x.go
-index e30f394057..9f7a1c4671 100644
---- a/libnetwork/sandbox_dns_unix.go
-+++ b/libnetwork/sandbox_dns_unix.go
-@@ -30,10 +30,11 @@ const (
- func (sb *Sandbox) startResolver(restore bool) {
- 	sb.resolverOnce.Do(func() {
- 		var err error
--		// The embedded resolver is always started with proxyDNS set as true,=
 even when the sandbox is only attached to
--		// an internal network. This way, it's the driver responsibility to m=
ake sure `connect` syscall fails fast when
--		// no external connectivity is available (eg. by not setting a defaul=
t gateway).
--		sb.resolver =3D NewResolver(resolverIPSandbox, true, sb)
-+		// The resolver is started with proxyDNS=3Dfalse if the sandbox does =
not currently
-+		// have a gateway. So, if the Sandbox is only connected to an 'intern=
al' network,
-+		// it will not forward DNS requests to external resolvers. The resolv=
er's
-+		// proxyDNS setting is then updated as network Endpoints are added/re=
moved.
-+		sb.resolver =3D NewResolver(resolverIPSandbox, sb.getGatewayEndpoint(=
) !=3D nil, sb)
- 		defer func() {
- 			if err !=3D nil {
- 				sb.resolver =3D nil
---=20
-2.50.1
-
diff --git a/recipes-containers/docker/files/CVE-2024-36620.patch b/recip=
es-containers/docker/files/CVE-2024-36620.patch
deleted file mode 100644
index 03628fb3..00000000
--- a/recipes-containers/docker/files/CVE-2024-36620.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ab570ab3d62038b3d26f96a9bb585d0b6095b9b4 Mon Sep 17 00:00:00 2001
-From: Christopher Petito <47751006+krissetto@users.noreply.github.com>
-Date: Fri, 19 Apr 2024 10:44:30 +0000
-Subject: [PATCH] nil dereference fix on image history Created value
-
-Issue was caused by the changes here https://github.com/moby/moby/pull/4=
5504
-First released in v25.0.0-beta.1
-
-CVE: CVE-2024-36620
-
-Upstream-Status: Backport [https://github.com/moby/moby/commit/ab570ab3d=
62038b3d26f96a9bb585d0b6095b9b4]
-
-Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
----
- daemon/images/image_history.go | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/daemon/images/image_history.go b/daemon/images/image_histor=
y.go
-index dcf7a906aa..e5adda8639 100644
---- a/daemon/images/image_history.go
-+++ b/daemon/images/image_history.go
-@@ -41,10 +41,14 @@ func (i *ImageService) ImageHistory(ctx context.Cont=
ext, name string) ([]*image.
-			layer.ReleaseAndLog(i.layerStore, l)
-			layerCounter++
-		}
-+		var created int64
-+		if h.Created !=3D nil {
-+			created =3D h.Created.Unix()
-+		}
-
-		history =3D append([]*image.HistoryResponseItem{{
-			ID:        "<missing>",
--			Created:   h.Created.Unix(),
-+			Created:   created,
-			CreatedBy: h.CreatedBy,
-			Comment:   h.Comment,
-			Size:      layerSize,
---
-2.40.0
diff --git a/recipes-containers/docker/files/CVE-2024-36621.patch b/recip=
es-containers/docker/files/CVE-2024-36621.patch
deleted file mode 100644
index 6560f46a..00000000
--- a/recipes-containers/docker/files/CVE-2024-36621.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 37545cc644344dcb576cba67eb7b6f51a463d31e Mon Sep 17 00:00:00 2001
-From: Tonis Tiigi <tonistiigi@gmail.com>
-Date: Wed, 6 Mar 2024 23:11:32 -0800
-Subject: [PATCH] builder-next: fix missing lock in ensurelayer
-
-When this was called concurrently from the moby image
-exporter there could be a data race where a layer was
-written to the refs map when it was already there.
-
-In that case the reference count got mixed up and on
-release only one of these layers was actually released.
-
-CVE: CVE-2024-36621
-
-Upstream-Status: Backport [https://github.com/moby/moby/commit/37545cc64=
4344dcb576cba67eb7b6f51a463d31e]
-
-Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
----
- .../builder-next/adapters/snapshot/layer.go   |  3 +++
- .../adapters/snapshot/snapshot.go             | 19 +++++++++++--------
- 2 files changed, 14 insertions(+), 8 deletions(-)
-
-diff --git a/builder/builder-next/adapters/snapshot/layer.go b/builder/b=
uilder-next/adapters/snapshot/layer.go
-index 73120ea70b..fc83058339 100644
---- a/builder/builder-next/adapters/snapshot/layer.go
-+++ b/builder/builder-next/adapters/snapshot/layer.go
-@@ -22,6 +22,9 @@ func (s *snapshotter) GetDiffIDs(ctx context.Context, =
key string) ([]layer.DiffI
- }
-
- func (s *snapshotter) EnsureLayer(ctx context.Context, key string) ([]l=
ayer.DiffID, error) {
-+	s.layerCreateLocker.Lock(key)
-+	defer s.layerCreateLocker.Unlock(key)
-+
-	diffIDs, err :=3D s.GetDiffIDs(ctx, key)
-	if err !=3D nil {
-		return nil, err
-diff --git a/builder/builder-next/adapters/snapshot/snapshot.go b/builde=
r/builder-next/adapters/snapshot/snapshot.go
-index a0d28ad984..510ffefb49 100644
---- a/builder/builder-next/adapters/snapshot/snapshot.go
-+++ b/builder/builder-next/adapters/snapshot/snapshot.go
-@@ -17,6 +17,7 @@ import (
-	"github.com/moby/buildkit/identity"
-	"github.com/moby/buildkit/snapshot"
-	"github.com/moby/buildkit/util/leaseutil"
-+	"github.com/moby/locker"
-	"github.com/opencontainers/go-digest"
-	"github.com/pkg/errors"
-	bolt "go.etcd.io/bbolt"
-@@ -51,10 +52,11 @@ type checksumCalculator interface {
- type snapshotter struct {
-	opt Opt
-
--	refs map[string]layer.Layer
--	db   *bolt.DB
--	mu   sync.Mutex
--	reg  graphIDRegistrar
-+	refs              map[string]layer.Layer
-+	db                *bolt.DB
-+	mu                sync.Mutex
-+	reg               graphIDRegistrar
-+	layerCreateLocker *locker.Locker
- }
-
- // NewSnapshotter creates a new snapshotter
-@@ -71,10 +73,11 @@ func NewSnapshotter(opt Opt, prevLM leases.Manager, =
ns string) (snapshot.Snapsho
-	}
-
-	s :=3D &snapshotter{
--		opt:  opt,
--		db:   db,
--		refs: map[string]layer.Layer{},
--		reg:  reg,
-+		opt:               opt,
-+		db:                db,
-+		refs:              map[string]layer.Layer{},
-+		reg:               reg,
-+		layerCreateLocker: locker.New(),
-	}
-
-	slm :=3D newLeaseManager(s, prevLM)
---
-2.40.0

--=20
2.52.0


