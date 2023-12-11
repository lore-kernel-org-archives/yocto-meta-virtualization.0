Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F72C46CA3
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 12:13:53 +0000 (UTC)
Received: from mr85p00im-ztdg06021801.me.com (mr85p00im-ztdg06021801.me.com [17.58.23.195])
 by mx.groups.io with SMTP id smtpd.web11.6895.1702296824289160103
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 04:13:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=aJkymjfa;
 spf=pass (domain: subset.ch, ip: 17.58.23.195, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1702296824; bh=qcmMFT2kC9OlxoOBGwm1jUax58VjPGdYjF1grNWTpWQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aJkymjfatYfCcx+pzDf9GsI3CGqpPD/ohNrJSY5uJFle3yuuYcvLmIW4RibzBHVOT
	 +H7c3BqqdPOB8kVb7/dPhN1M9qof+ipiK9rZmyVqgzyiEhlANNjtW7Tf1M0OOipXb3
	 +pgO4E4KlcduM6onpdb09wxxr/MWn9n2jwoGlM79lhhWRM4WvxklOK+8YWEzwa2j6u
	 DnTV2YILP7TDxU/MkVokW6/rW42D8eZWr+Q7PcLzSmAUfC8sqdSK7Ju19Jz3ErntaE
	 T2t/+DTqHtFvQP9MZpndDQPa6yl+qUT5zmi8CKTlpvxrazajzDIKT+waOR55XXA/FJ
	 RiEVrE7RyHx4Q==
Received: from desk.home (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06021801.me.com (Postfix) with ESMTPSA id 28FA3D000A3;
	Mon, 11 Dec 2023 12:13:42 +0000 (UTC)
From: patrick.wicki@subset.ch
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-virtualization][PATCH 3/3] podman: update from 4.7.1 to 4.8.1
Date: Mon, 11 Dec 2023 13:13:23 +0100
Message-ID: <d96445af820f3c44419444edb5bc1f6ad33ad20a.1702296438.git.patrick.wicki@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <30f8f1c4ce0c3c6a0d51162f046340ac6c5e385d.1702296438.git.patrick.wicki@siemens.com>
References: <30f8f1c4ce0c3c6a0d51162f046340ac6c5e385d.1702296438.git.patrick.wicki@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-ORIG-GUID: 15R6GiXHHbM9FmVnno4zjcSgEQzkRKrn
X-Proofpoint-GUID: 15R6GiXHHbM9FmVnno4zjcSgEQzkRKrn
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2312110098
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 12:13:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8500

From: Patrick Wicki <patrick.wicki@siemens.com>

Update consists of the following commits:

    1864ea94f Fix user-mode net init flag on first time install
    3c0d66d83 bump c/common to v0.57.1
    b0e2ffc51 bump version to v4.8.2-dev
    ef6e5ac40 v4.8.1
    0b72d1bf2 Update RELEASE_NOTES.md for v4.8.1
    2d20d2e5c Handle symlinks when checking DB vs runtime configs
    6bbbfaa05 libpod: Detect whether we have a private UTS namespace on F=
reeBSD
    a8b8dc570 pkg/bindings: add new APIVersionError error type
    86bb91001 fix podman-remote exec regression with v4.8
    9c9d2fcaf sqlite: fix issue in ValidateDBConfig()
    1e5a1336f sqlite: fix missing Commit() in RemovePodContainers()
    429080f02 sqlite: set busy timeout to 100s
    a72c39a53 Fix locking error in WSL machine rm -f
    a7c522dfe Gating test fixes
    a62b81d90 If API calls for kube play --replace, then replace pod
    70ba64f4c Fix wsl.conf generation when user-mode-networking is disabl=
ed
    e627de1b4 Bump to v4.8.1-dev
    c4dfcf148 Bump to v4.8.0
    0efc6ea30 Update release notes for 4.8.0
    4b95c6c30 Add notes on upcoming deprecations to release notes
    1c1477ddf [v4.8] Bump to Buildah v1.33.2
    f02155142 [CI:DOCS] Update release notes
    697e66c78 machine applehv: create better error on start failure
    53f176732 Bump to v4.8.0-dev
    ac1d54e68 Bump to v4.8.0-rc1
    66cba2794 Create release notes for v4.8.0
    ac290f446 Update release notes from v4.7 branch
    883ce7704 Cirrus: Update operating branch
    9ea390191 rootless_tutorial: modernize
    ee1654622 Bump Buildah to v1.33.1
    3d86a9658 Bump Buildah to v1.33.0
    60d9f9b80 Update to libhvee 0.5.0
    d32f61d91 vmtypes names cannot be used as machine names
    d0b32255e Add support for --compat-auth-file in login/logout
    a3d5814e0 Update tests for a c/common error message change
    ced07a55f Update c/image and c/common to latest, c/buildah to main
    a10b88cb2 CI: test overlay and vfs
    da899b92d [CI:DOCS] Add link to podman py docs
    d2a4ec867 Test fixes for debian
    23ead49de pasta tests: remove some skips
    d711c3f46 VM images: bump to 2023-11-16
    5f3f8a3ca fix(deps): update module k8s.io/kubernetes to v1.28.4 [secu=
rity]
    3d88f614f [CI:DOCS] Machine test timeout env var
    e35fc92c0 Quadlet - add support for UID and GID Mapping
    dc709e4d7 Quadlet - Allow using symlink on the base search paths
    7b826b230 [skip-ci] Update dessant/lock-threads action to v5
    ea89eaa1c Avoid empty SSH keys on applehv
    33ddd79e2 qemu,parseUSB: minor refactor
    669829447 fix(deps): update module github.com/gorilla/handlers to v1.=
5.2
    49b152f49 docs: fix relabeling command
    5dc807487 Pass secrets from the host down to internal podman containe=
rs
    047da19b5 (Temporary) Emergency CI fix: quay search is broken
    e1f3ae0d8 Update podman-stats.1.md.in
    6fa4a975c [CI:BUILD] packit: handle builds for RC releases
    bd375058c Quadlet test - add case for multi =3D sign in mount
    5e0471ba7 set RLIMIT_NOFILE soft limit to match the hard limit on mac
    d636ce8d7 rootless: use functionalities from c/storage
    6b5b39912 CI: e2e: fix a smattering of test bugs that slipped in
    d07263f34 fix(deps): update module github.com/onsi/ginkgo/v2 to v2.13=
.1
    fbd1ba68f vendor: update c/storage
    956c0d6ec Improve the documentation of quadlet
    39d647a2f Fix socket mapping socket mapping nits
    5388836c1 fix(deps): update module golang.org/x/tools to v0.15.0
    60f67eec7 fix(deps): update github.com/containers/libhvee digest to 9=
651e31
    9cd975d59 [skip-ci] Update github/issue-labeler action to v3.3
    b8d59030c Document --userns=3Dauto behaviour for rootless users
    c23963d7a machine: qemu: add usb host passthrough
    4a75a2b3c fix(deps): update module golang.org/x/net to v0.18.0
    1c5bc7e09 fix(deps): update module github.com/onsi/gomega to v1.30.0
    b2c56365b Refactor Ignition configuration for virt providers
    81dc3f183 [CI:BUILD] rpm: disable GOPROXY
    78798cab0 Automatic code cleanups - JetBrains
    a45ba06d0 Refactor key machine objects
    1c969219d systests: add [NNN] prefix in logs, NNN =3D filename
    92cd7b25f systests: add a last-minute check for db backend
    d44f71c13 applehv: allow virtiofs to mount to /
    c2de6d34c Run codespell on podman
    8f5c46c9e update completion scripts for cobra v1.8.0
    28f3e9fe3 Fix man page display of podman-kube-generate
    8effb7825 Try to fix the broken formatting of man podman=E2=80=90kube=
=E2=80=90apply(1).
    3eb2d5ceb fix(deps): update module golang.org/x/text to v0.14.0
    108d2bc43 docs: make CNI removal explicit
    c1fe1f9d3 fix(deps): update module github.com/gorilla/mux to v1.8.1
    e78288344 fix(deps): update module github.com/spf13/cobra to v1.8.0
    0824e45c8 fix(deps): update module golang.org/x/sync to v0.5.0
    da897bd04 fix(deps): update module github.com/mattn/go-sqlite3 to v1.=
14.18
    420316ef6 Podman push --help should reveal default compression
    942bcf34b Update container-device-interface (CDI) to v0.6.2
    375b0cc13 fix: adjust helper string in machine_common
    9e05fb14a fix: adjust helper string in machine_common
    607aff55f remote,test: remove .dockerignore which is a symlink
    6b7d7f6fb [CI:DOCS] Update dependency golangci/golangci-lint to v1.55=
.2
    b5f854458 fix: adjust helper string in machine_common
    ce334ed9d vendor: update github.com/coreos/go-systemd/v22 to latest m=
ain
    2a17baa29 CI: default to sqlite
    33753db47 vendor: update c/common
    613f50c7a check system connections before machine init
    ea4775ec9 Consume OCI images for machine image
    d2a37222b freebsd: drop dead code
    06a07c98e libpod: make removePodCgroup linux specific
    e4f1c87ea containers: drop special handling for ErrCgroupV1Rootless
    0b6abfe1e compose: fix compose provider debug message
    aefa9abf4 image: replace GetStoreImage with ResolveReference
    03419d6da vendor: bump c/image to 373c52a9466f
    ce9c1b9b8 Refactor machine socket mapping
    f6ec210f3 AppleHV: Fix machine rm error message
    af0ef47f0 Add status messages to podman --remote commit
    3241b3259 End-of-Life policy for github issues
    390e9ddc9 fix(deps): update module github.com/shirou/gopsutil/v3 to v=
3.23.10
    18d6bb40d Support passing of Ulimits as -1 to mean max
    78765b14d fix(deps): update github.com/docker/go-connections digest t=
o 0b8c1f4
    ffb96ad8b fix(deps): update github.com/crc-org/vfkit digest to f3c783=
d
    7153124f9 Log gvproxy and server9 to file on log-level=3Ddebug
    d9c388e2f Change to using gopsutil for cross-OS process ops
    642fa9897 Initial addition of 9p code to Podman
    b332ca7a0 libpod: fix /etc/hostname with --uts=3Dhost
    89d7b2735 systests: stty test: retry once on flake
    6b94c8fd3 systests: pasta: avoid hangs
    4c67a6aed Fix secrets scanning GHA Workflow
    2193bb8fc [skip-ci] Update dawidd6/action-send-mail action to v3.9.0
    e9dd41183 docs: clarify systemd cgroup mount
    a1577ec7b podman build --remote URI Dockerfile shoud not be treated a=
s file
    95a5ad258 Small fixes for wacko CI environments
    c6d410cc3 Do not add powercap mask if no paths are masked
    3743955d6 compose: try all possible providers before throwing an erro=
r
    91df369ae podman kube play --replace should force removal of pods and=
 containers
    3ce62d3cc Sort kube options alphabetically
    e966c86d9 container.conf: support attributed string slices
    91ccd7cd2 CI: podman farm tests cleanup
    be7dd128e Mask /sys/devices/virtual/powercap
    05a607f14 Update module github.com/google/uuid to v1.4.0
    6a0b2c680 fix(deps): update module github.com/docker/docker to v24.0.=
7+incompatible
    6badb659c fix(deps): update module go.etcd.io/bbolt to v1.3.8
    9e3363c5e CI: systest: safer random_rfc1918_subnet
    c841fa9e9 CI: e2e: safer GetPort()
    fd5140d87 Fix broken code block markup in Introduction.rst
    d0ce60c63 chore(deps): update module google.golang.org/grpc to v1.57.=
1 [security]
    15969a60b chore: remove npipe const and use vmtype const for checking
    2158e1540 Update module github.com/onsi/gomega to v1.29.0
    c0fb8fe59 CI: try to fix more networking flakes
    c21f28813 fix: check wsl npipe when executing podman compose
    9ea1ed6d4 [CI:DOCS] Update dependency golangci/golangci-lint to v1.55=
.1
    76cca08f8 Quadlet - explicit support for read-only-tmpfs
    c13b8e3c9 compat API: fix image-prune --all
    0e15861c5 Makefile - allow more control over Ginkgo parameters
    ebe01ca29 Add e2e tests for farm build
    989afd910 vendor c/{buildah,common}: appendable containers.conf strin=
gs, Part 1
    dd8f57a3b Add podman farm build command
    2e88d580a Add emulation package
    06b726497 Use buildah default isolation when working with podman play=
 kube
    0a2aae119 docs(API): Fix compat network (dis-)connect
    1b466ccbd test/e2e: do not import buildah
    8a0968baa pkg/specgen: remove config_unsupported.go
    cb9dfeb8e pkg/parallel/ctr: add !remote tag
    d4a67cf45 pkg/domain/filters: add !remote tag
    9cecae8c2 pkg/ps: add !remote tag
    1d1630990 pkg/systemd/generate: add !remote tag
    bad25da92 libpod: add !remote tag
    abb5c86b6 pkg/autoupdate: add !remote tag
    01a750699 vendor latest c/common
    3615af903 libpod: remove build support non linux/freebsd
    1850670f1 Fix typo
    2e57746ff test/apiv2: adapt apiv2 test on cgroups v1 environment
    c3ba0221e ginkgo setup: retry cache pulls
    ee6070888 Support size option when creating tmpfs volumes
    8876380af not mounted layers should be reported as info not error
    85cc4092f CI: stop using registry.k8s.io
    a8e1a5ed1 fix(deps): update module github.com/vbatts/git-validation t=
o v1.2.1
    6d99cb5cd test fixes for c/common tag chnages
    dfdd93323 vendor latest c/common
    d6f44d956 hyperV: Update lastUp time
    1ac110835 [CI:DOCS] Update dependency golangci/golangci-lint to v1.55=
.0
    9e648a1f5 lint: disable testifylint
    29273cda1 lint: fix warnings found by perfsprint
    64f43fed4 lint: fix warnings found by inamedparam
    c21f42a4e lint: fix warnings found by protogetter
    03947ab03 libpod: skip DBUS_SESSION_BUS_ADDRESS in conmon
    936e30f68 Use node hostname in kube play when hostNetwork=3Dtrue
    bd953fdc7 cirrus setup: special-case perl unicode
    ca9efb0cd network: document ports and macvlan interaction
    f2bc63894 quadlet: document cgroupv2 requirement
    e8183e836 [skip-ci] Update actions/checkout digest to b4ffde6
    1d2589c3f Revert "Emergency workaround for CI breakage"
    f48a706ab remote: exec: do not leak session IDs on errors
    ad1ab71b8 fix(deps): update github.com/containers/storage digest to 7=
9aa304
    d1086281b fix(deps): update module k8s.io/kubernetes to v1.28.3
    657029da7 System tests: fix broken silence127
    b72bb1162 Add TERM iff TERM not defined in container when podman exec=
 -t
    44ed415b2 Emergency workaround for CI breakage
    d4d76479c Kill gvproxy when machine rm -f
    cad4d0ee9 Fix path for omvf vars on Darwin/arm64
    285718915 Allow systemd specifiers in User and Group Quadlet keys
    caef657c5 libpod: rename confusing import name
    efe5e98d0 use FindInitBinary() for init binary
    1d3ec78e0 vendor latest c/common
    fa19e1baa exec: do not leak session IDs on errors
    1efcd1ecf systests: cp test: lots of cleanup
    2d65e57ae Define better error message for container name conflicts wi=
th external storage.
    9b8e01efd Quadlet - support ImageName for .image files
    64171043a test/system: ignore 127 if it is the expected rc
    c65d1c02b test/apiv2/20-containers.at: fix NanoCPUs tests on cgroups =
v1
    831844b59 image history: fix walking layers
    ad5319025 fix(api): Ensure compatibality for network connect
    e0561301c [CI:DOCS] Add cross-build target info.
    dc705d370 machine set: document --rootful better
    bbd6281ec libpod: restart+userns cleanup netns correctly
    3b6a4ac37 Minor log and doc fixes
    f875ae317 Quadlet man page - discuss volume removal explicitly
    5d5facbd7 Quadlet - add support for KubeDownForce
    6ba67ba96 System Test - Quadlet kube oneshot
    9637fed2f Fix output of podman --remote top
    dcb421bc5 buildah-bud: test relative TMPDIR
    c8604081e Fix handling of --read-only-tmpfs flag
    1b0be2f34 Vendor common and buildah main
    5db3b753a remote,build: wire unsetlabels
    331e47acb test: build with TMPDIR as relative
    6cf3dd493 docs: add unsetlabel
    64ff14932 vendor: bump buildah to v1.32.1-0.20231012130144-244170240d=
85
    74ed1d6e7 fix(deps): update module github.com/vbauerster/mpb/v8 to v8=
.6.2
    b9f2c4d17 fix: pull error response docker rest api compatibility
    29f5c563e Show client info even if remote connection fails
    52112fc5c fix(deps): update github.com/containers/libhvee digest to e=
51be96
    cb53bcf23 Run codespell
    987dc2b8b SetLock for all virt providers
    61e0b64b9 Machine: Teardown on init failure
    99a14332e healthcheck: make sure to always show health_status events
    7b84b55da Apply suggestions from code review
    ca518888e [CI:DOCS]rtd: implement v2 build file
    702f15528 Quadlet - support oneshot .kube files
    3cc9db862 libpod: fix deadlock while parallel container create
    2301320f6 fix(deps): update module golang.org/x/net to v0.17.0
    8b46e852e api: add `compatMode` paramenter to libpod's pull endpoint
    76fec1227 api: break out compat image pull
    40f897653 fix(deps): update module github.com/cpuguy83/go-md2man/v2 t=
o v2.0.3
    29ae51600 use sqlite as default database
    8a52e638e vendor latest c/common
    acd0a93c3 fix(deps): update module github.com/nxadm/tail to v1.4.11
    d18369ee8 Check for image with /libpod/containers/create
    8ac2aa793 container: always check if mountpoint is mounted
    787b1b25c fix(deps): update module github.com/onsi/ginkgo/v2 to v2.13=
.0
    9beb3a972 vendor: update c/storage
    36bf90518 api: drop debug statement
    d321d427d Quadlet - add support for global arguments
    732cec794 Add system test
    10aa39068 fix(deps): update module golang.org/x/tools to v0.14.0
    3fdb6ee2d Don't ignore containerfiles outside of build context
    b3209dc5d fix(deps): update github.com/containers/libhvee digest to f=
cf1cc2
    eda275820 fix(deps): update module golang.org/x/term to v0.13.0
    da6c86dfc Update module golang.org/x/sys to v0.13.0
    1c0780097 [CI:DOCS] Add updating version on podman.io to release proc=
ess
    362eca669 containers.conf: add `privileged` field to containers table
    6cb10425d Implement secrets/credential scanning
    106abd13b Cirrus: Execute Windows podman-machine e2e tests
    338e4f590 vendor: bump c/storage
    8807243cc Update module golang.org/x/sync to v0.4.0
    2168f0745 [CI:DOCS] update swagger version on docs.podman.io
    0414f88b3 Create Qemu command wrapper
    df6a00026 Adjust to path name change for resolved unit
    2a38f30b6 Revert "Fix WSL systemd detection"
    f622a2a54 [CI:BUILD] rpm/copr: gvforwarder recommends for RHEL
    27f58803d [CI:DOCS] update kube play delete endpoint docs
    3fc7c42e1 [CI:DOCS] Remove dead link from README
    1b3cedbf3 test/system: --env-file test fixes
    617af9bea Revert "feat(env): support multiline in env-file"
    5f340487e Revert "docs(env-file): improve document description"
    9599589f1 Revert "fix(env): parsing --env incorrect in cli"
    7e6e26732 Filter health_check and exec events for logging in console
    0443c5166 inspect: ignore ENOENT during device lookup
    b576b7932 test, manifest: test push retry
    cbca39529 Fix locale issues with WSL version detection
    b988eadaf vendor: update module github.com/docker/distribution to v2.=
8.3+incompatible
    1ebd22303 vendor: bump c/common to v0.56.1-0.20231002091908-745eaa498=
509
    8b647cdb5 Update github.com/containers/libhvee digest to e9b1811
    cc946daff windows: Use prebuilt gvproxy/win-sshproxy binaries
    979c77f10 Volume create - fast exit when ignore is set and volume exi=
sts
    874e4466a Update golang.org/x/exp digest to 9212866
    22a1d015c Update github.com/opencontainers/runtime-spec digest to c0e=
9043
    229734c10 remove selinux tag as not needed anymore
    049a5fb92 [skip-ci] Improve podmansh(1)
    85ed9edde Build applehv for Intel Macs
    7ef8519f4 Revert "GHA Workflow: Faster discussion-locking"
    59e0919bc update vfkit vendored code
    17cebb3ff Add DefaultMode to kube play
    ba788c1bb Fix broken podman images filters
    9b3964111 Remove `c.ExtraFiles` line in machine
    f21c1d238 podman: run --replace prints only the new container id
    bcfd9f340 New machines should show Never as LastUp
    94818f594 podman machine: disable zincati update service
    b284128d7 Revert "cirrus setup: install en_US.UTF-8 locale"
    b28188de2 Cirrus: CI VM images w/ newer automation-library
    2b9c0555f CI VMs: bump to f39 + f38
    ecd7b3802 [CI:DOCS] Update podman load doc
    58b5ae22e Update mac installer to latest gvproxy release
    5b990c383 Fix WSL systemd detection
    be823b388 Add documentation for the vrf option on netavark
    fda028ca0 fix(deps): update github.com/containers/common digest to 93=
42cdd
    6306e8985 fix: typos in links, path and code example
    ccb7da52c e2e: ExitCleanly(): manual special cases
    611db19b3 e2e: ExitCleanly(): the final fron^Wcommit
    149d3f7ad [CI:DOCS] Add win-sshproxy target to winmake
    0d4526e61 wsl: enable machine init tests
    455d16549 Update docs/source/markdown/options/rdt-class.md
    bfbd0c896 move IntelRdtClosID to HostConfig
    4853320ce use default when user does not provide rdt-class
    77336de8f Add documentation for Intel RDT support
    24b2f829b Add test for Intel RDT support
    40d3c3b9b Add Intel RDT support
    295439265 [CI:DOCS] Fix podman form update --help examples
    f0eb45667 Quadlet container mount - support non key=3Dval options
    0b5ea1e6e test/e2e: default to netavark
    4ed9dc1ad [skip-ci] Update dawidd6/action-send-mail action to v3.9.0
    48ea4b9ec fix(deps): update module github.com/containers/gvisor-tap-v=
sock to v0.7.1
    90eb73629 fix(deps): update github.com/containers/common digest to 46=
19314
    172494423 applehv: enable machine tests for start
    2ff43429f applehv: machine tests for stop and rm
    127ebe2b2 Update machine tests README
    995a6a8ac Add podman socket info to machine inspect
    80952db0b Fix podman machine info test for hyperV
    7ade97210 libpod: pass entire environment to conmon
    e4b7455b7 e2e: ExitCleanly(): manual fixes to get tests working
    dbd946a93 e2e: ExitCleanly(): a few more
    59ffea80d FCOS+podman-next: correct GHA conditional syntax
    8bad842a4 pkg/machine/e2e: wsl stop
    217c4d546 wsl: machine tests for inspect
    e4bfcfc25 wsl: machine tests for ssh
    5636d0219 fix(deps): update github.com/containers/common digest to e1=
8cda8
    a112ee895 wsl: machine start test
    d3d5011dc wsl machine tests: set
    cc4917d81 wsl: machine tests
    ec68a7489 Skip proxy test for hyperV
    33a92aa00 Enable machine e2e test for applehv
    65ce03486 hyperV: Respect rootful option on machine init
    52ba1bfff [CI:BUILD] FCOS image: enable nightly build
    ffd67cf75 e2e: use safe fedora-minimal image
    41e51f473 hyperv: machine e2e tests for set command
    59e295f2a podman build: correct default pull policy
    6293ec2e2 fix handling of static/volume dir
    26b5b1dd3 unbreak CI: useradd not found
    08936db35 hyperv: set more realistic starting state
    2bef573f3 hyperv: use StopWithForce with remove
    f52b02f40 Fix all ports exposed by kube play
    cd4f61181 Fix setting timezone on HyperV
    172369b54 fix(deps): update github.com/containers/gvisor-tap-vsock di=
gest to 97028a6
    e0b44bcf3 Fix farm update to check for connections
    d8e305716 Adjust machine CPU tests
    8188a6fcf Bump version on main
    e65874903 [CI:BUILD] Packit: show SHORT_SHA in `podman --version` for=
 COPR builds
    96142c2f7 Vendor c/common
    af2665c28 pod rm: do not log error if anonymous volume is still used
    4916f7d77 e2e: ExitCleanly(): manual fixes to get tests passing
    8e743fa1d e2e: ExitCleanly(): a few more
    c66aa3b7b fixes for pkg/machine/e2e on hyperv
    83b6975d1 test: fix rootless propagation test
    6c2493f78 [CI:BUILD] packit: tag @containers/packit-build team on cop=
r build failures
    92f4dcb09 Enable disk resizing for applehv
    5b3801776 Various updates for hyperv and machine e2e tests
    682ca6b2e test: update fedoraMinimal version
    8d3010d06 specgen, rootless: fix mount of cgroup without a netns
    39ba5ff24 Automatically remove anonymous volumes when removing a cont=
ainer
    24d3347ed Use ActiveServiceDestination in ssh remoteConnectionUsernam=
e
    b6ea49f5a fix(deps): update github.com/containers/gvisor-tap-vsock di=
gest to 9298405
    c69873d67 e2e: ExitCleanly(): generate_kube_test.go
    841cfa802 e2e: generate kube -> kube generate
    d1f86d524 e2e: ExitCleanly(): generate_kube_test.go
    f3e9a6369 windows cannot "do" extra files
    62e13bec7 e2e: ExitCleanly(): Fixes for breaking tests
    09c3ac48f play kube -> kube play
    e83ced8a0 e2e: ExitCleanly(): play_kube_test.go
    eb9283c6f introduce pkg/strongunits
    6d8b3047d Makefile equiv Powershell script
    4652a2623 pass --syslog to the cleanup process
    73dc72f80 vendor of containers/common
    1cbe692de fix --authfile auto-update test
    8e5adde0b compat API: speed up network list
    8c95aa402 Change priority for cli-flags for remotely operating Podman
    befdb4199 libpod: remove unused ContainerState() fucntion
    0ec63abca [CI:BUILD] Packit: Enable failure notifications for cockpit=
 tests
    0ac98176b e2e: ExitCleanly(): more low-hanging fruit
    a50fb7e06 e2e: ExitCleanly(): more low-hanging fruit
    1908663f1 fix(deps): update module github.com/onsi/ginkgo/v2 to v2.12=
.1
    38f5ead33 Enable machine e2e tests for WSL
    ff07abea4 systests: tighter checks for unwanted warnings
    618f846ed GHA Workflow: Faster discussion-locking
    289be0c01 [CI:BUILD] FCOS + podman-next image: pull in wasm
    649539519 [CI:BUILD] rpm: remove gvproxy subpackage
    b0f7072ac [CI:DOCS] Tweak podman to Podman in a few farm man pages
    8afffa1aa Docs on sig-proxy are wrong, we support TTY
    4fca726f7 e2e: ExitCleanly(): low-hanging fruit, part 2
    64c46c429 e2e: ExitCleanly(): low-hanging fruit, part 1
    113b41b6f Buildtag out unix commands for common OS files
    aec58f515 systests: clean up after tests; fix missing path in logs
    fa7150451 [CI:BUILD] followup PR for fcos with podman-next
    289e59ee1 Implement gvproxy networking using cmdline wrapper
    e68e37136 fix, test: rmi should work with images w/o layers
    e9b98510d vendor: bump c/common to v0.56.1-0.20230919073449-d1d9d38d8=
282
    50a685bd1 Quadlet Image test - rearrange test function
    e6cf09b68 e2e: continuing ExitCleanly() work: manual tweaks
    d78221545 e2e: continuing ExitCleanly() work
    47160da7a [CI:DOCS] Improve podman-tag man page
    ef553fb0d [CI:DOCS] Improve podman-build man page
    93dc30e1e [CI:DOCS] Include precheck to release process
    a80a908df [CI:DOCS] consistentize filter options in man pages
    55ca571e5 Quadlet - add support for .image units
    41beb5374 --env-host: use default from containers.conf
    0b7142f4a error when --module is specified on the command level
    deba3b80a man page crossrefs: add --filter autocompletes
    03dd5f256 Fix specification of unix:///run
    98e6dda69 Add label! filter and tests to containers and pods
    6f4f94137 Add test for legacy address without two slashes
    336055fe3 Use url with scheme and path for the unix address

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 recipes-containers/podman/podman_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
index 7634ac85..1c182cb7 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -17,9 +17,9 @@ DEPENDS =3D " \
     gettext-native \
 "
=20
-SRCREV =3D "85b5f572348eeb60613bd0b24780269a760125f5"
+SRCREV =3D "da52ed937f2924c4236e183145eb83ab89cd579a"
 SRC_URI =3D " \
-    git://github.com/containers/libpod.git;branch=3Dv4.7;protocol=3Dhttp=
s \
+    git://github.com/containers/libpod.git;branch=3Dv4.8;protocol=3Dhttp=
s \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-=
rootless.conf', '', d)} \
     file://run-ptest \
 "
@@ -31,7 +31,7 @@ GO_IMPORT =3D "import"
=20
 S =3D "${WORKDIR}/git"
=20
-PV =3D "4.7.1+git"
+PV =3D "4.8.1+git"
=20
 CVE_STATUS[CVE-2022-2989] =3D "fixed-version: fixed since v4.3.0"
 CVE_STATUS[CVE-2023-0778] =3D "fixed-version: fixed since v4.5.0"
--=20
2.43.0


