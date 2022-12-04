Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8D6C4708D
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 21:38:48 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.139154.1670189924400097036
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Dec 2022 13:38:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gEu4eRpl;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id vv4so23526546ejc.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Dec 2022 13:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvrHXc3PdwBouJBzeVcTZRVKp4Qd3VSwr3orTNZZyJA=;
        b=gEu4eRpl/kWjPMEu0tpGz8jEQGdeybo0iPanHIKSIoaZ9+OEQX3I5tQ+HPwdwLvIks
         jo+78m95HwMHFW6rrp8pKLkNEQj7wUi7n4QnlYaqmlpsqnP7It8hK5+zLB5heueSe+NV
         np+5I5x7EaVtc3aMjJ8b+AJ1xjY6AoXjss5pp30l4e9qE1c7WiXhMV1/CsKLKcYpLc9U
         MZ2Avg8yaOlZAtytPmgQNg3l0Z02ravmT+U1mCk7A24dP7nwrscITmOkdUFigWBZPt0G
         zHQKB6fWr6PTRYhhpyhV7UjFeouQYGzjQvz+f+m1F5mWIqXABCiEdaiRTsT1nokFAwcr
         TamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvrHXc3PdwBouJBzeVcTZRVKp4Qd3VSwr3orTNZZyJA=;
        b=mTQelTW9i1jtw1GGnDwUdzEJb6hbO+B8y6Uy+kKWZ0OupMataUQoKIhoNqixUplKzm
         vEGC3ZQRoY6IdwnAK4ECncMHOAdlgQjMxOGMhFIoA4G3eCTN6TGLaAUM1ZPZbfDN6q1V
         9N6EQ0hTJ73FEX3m08rd9d6VKeN9A8eiSLsvLa81R3JQv+16vf0uRYaBQpHV+FicvP7/
         Y3ndbnhjdlijmPElX3p31PlOfgd+XxKU5P8UFUXDzqlanxmwrNeWnn7+oeu+cCQ0VRed
         i3BYZzc5gnJoUzKn68RzAE+1wKB1KV3HAYkKywwa9DqwpKUKzBbPi9lo7IxjHg/72upy
         zomQ==
X-Gm-Message-State: ANoB5pnuoiBbiR+DmdEldzb6YP/xzOmn2YtVMHcwJ43EAgDZZaoq/sha
	4R16/6Qw7M55iCoZQ34wLFJi1UxBCnA=
X-Google-Smtp-Source: AA0mqf7jKAPlk7VJUsTZZbCwRP/vuwrJFz6Y838HD1S93061E9ddFxE/uTf8JYwfHpkb+btjk2W5gw==
X-Received: by 2002:a17:906:2854:b0:7ae:3684:84b0 with SMTP id s20-20020a170906285400b007ae368484b0mr58692080ejc.622.1670189920594;
        Sun, 04 Dec 2022 13:38:40 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id dt13-20020a170906b78d00b0078d3f96d293sm5544179ejb.30.2022.12.04.13.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 13:38:40 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][kirkstone][PATCH 3/3] docker: update from 20.10.12 to 20.10.21
Date: Sun,  4 Dec 2022 22:38:09 +0100
Message-Id: <20221204213809.483131-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204213809.483131-1-adrian.freihofer@siemens.com>
References: <20221204213809.483131-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Dec 2022 21:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7736

* Add mobyproject:moby to CVE_PRODUCT
* Define SRCREV_moby variable for docker-ce as well

Release notest: https://docs.docker.com/engine/release-notes

3056208812 (tag: v20.10.21) Merge pull request #44358 from thaJeztah/20.10_backport_busybox_w32_img
f99cb8297b integration: download busybox-w32 from GitHub Release
24aa4c9c43 Merge pull request #44353 from thaJeztah/20.10_backport_update_containerd_binary
3f9dc25f5c update containerd binary to v1.6.9
753cd92a31 Merge pull request #44326 from thaJeztah/20.10_bump_term_ansiterm
82f583c8af Merge pull request #44339 from crazy-max/20.10_update_buildkit
87ccd38cea vendor: moby/term, Azure/go-ansiterm for golang.org/x/sys/windows compatibility
e83e465ae2 [20.10] vendor: github.com/moby/buildkit eeb7b65ab7d651770a5ec52a06ea7c96eb97a249 (v0.8 branch)
e3fef9aea9 Merge pull request #44340 from thaJeztah/20.10_backport_skip_tests
9c84417c1b skip TestImagePullStoredfDigestForOtherRepo() on Windows and rootless
93c2c3bc60 Merge pull request #44332 from corhere/backport-20.10/fix-git-windows-environ
5b5b5c6f13 builder: add missing doc comment
05e25f7892 builder: fix running git commands on Windows
2b7f97a974 Merge pull request #44313 from tianon/20.10-distributable
03df974ae9 (tag: v20.10.20) Merge pull request #6 from moby/ghsa-ambiguous-pull-by-digest
3adff51f85 Merge pull request #9 from moby/update_buildkit
d7c33ad827 Merge pull request #8 from moby/20.10_fix_git_file_leak
2f3bf18014 [20.10] vendor moby/buildkit v0.8.3-31-gc0149372
6699afa549 registry: allow "allow-nondistributable-artifacts" for Docker Hub
4b9902bad4 Validate digest in repo for pull by digest
c0d1188c14 builder: make git config isolation opt-in
9f5f3abcee builder: isolate git from local system
10db4c2db7 builder: explicitly set CWD for all git commands
8816c3c2aa builder: modernize TestCheckoutGit
c964641a0d (tag: v20.10.19) Merge pull request #44122 from thaJeztah/20.10_bump_buildkit
3bb99735b6 Merge pull request #44127 from thaJeztah/20.10_backport_image_spec_no_literal
435c40ce15 Merge pull request #44247 from thaJeztah/20.10_bump_go_1.18.7
11bdbf40b9 [20.10] Update to go 1.18.7 to address CVE-2022-2879, CVE-2022-2880, CVE-2022-41715
35eaf7ecc4 Merge pull request #44238 from cpuguy83/20.10_fix_restore_volumerefs
66ddb7f91c Fix live-restore w/ restart policies + volume refs
f219cb5ded Merge pull request #44218 from thaJeztah/20.10_backport_more_robust_rootless
c003392582 contrib: make dockerd-rootless-setuptool.sh more robust
53313be0f3 docker-rootless-setuptools.sh: use context after install
4163c55082 Merge pull request #44202 from crazy-max/20.10_backport_api-fix-logo
9c486bd267 swagger: update links to logo
956161115f Merge pull request #44167 from thaJeztah/20.10_backport_update_containerd_console
668ab11a67 Merge pull request #44145 from neersighted/bump_memberlist_20.10
fa17fab895 vendor: github.com/containerd/console v1.0.2
481bee51b5 vendor: github.com/armon/go-metrics v0.4.1
39ba2873e8 vendor: github.com/google/btree v1.1.2
c2755f40cd vendor: github.com/hasicorp/memberlist v0.4.0
cc3aa33f54 Merge pull request #44123 from linux-on-ibm-z/20.10-CI
5ba3208ec7 Dockerfile: Update Dockerfile syntax, switch to bullseye, add missing libseccomp-dev, remove build pack
6d6a236286 [20.10] Update uses of Image platform fields in OCI image-spec
2570784169 [20.10] vendor: github.com/moby/buildkit 3a1eeca59a9263613d996ead67d53a4b7d45723d (v0.8 branch)
e42327a6d3 (tag: v20.10.18) Merge pull request #44120 from thaJeztah/20.10_backport_update_tests
fcd4df906b Update some tests for supplementary group permissions
bb0197c829 Merge pull request from GHSA-rc4r-wh2q-q6c4
d348775bd5 Merge pull request #44109 from rumpl/20.10-fix-local-context
6a0186b357 Wrap local calls to the content and lease service
b73e9c2c8a Merge pull request #44098 from thaJeztah/20.10_backport_swagger_updates
4855c28780 Merge pull request #44101 from thaJeztah/20.10_backport_bump_golang_1.18.6
3d4616f943 Update to go 1.18.6 to address CVE-2022-27664, CVE-2022-32190
d56101e0d2 Merge pull request #44093 from thaJeztah/20.10_backport_remove_tereshkova
23c7d84b84 docs: api: adjust ContainerWaitResponse error as optional
3e9e79d134 docs: api: document ImageSummary fields (api v1.39-v1.41)
fdd438ae03 api: docs: improve documentation of ContainerConfig type (API v1.30-v1.41)
97014a8db5 namesgenerator: remove Valentina Tereshkova
e44d7f735e AdditionalGids must include effective group ID
b0d57e0ed4 Merge pull request #44067 from thaJeztah/20.10_update_containerd_vendor
9e7662e4a7 [20.10] vendor: update containerd to latest of docker-20.10 branch
f7f1f960ea Merge pull request #44081 from thaJeztah/20.10_backport_tarsplit
7dac25a3a9 vendor: update tar-split to v0.11.2
d346080204 Merge pull request #44041 from thaJeztah/20.10_backport_ontainerd_binary_1.6.8
1c7b0dabc5 Merge pull request #44038 from thaJeztah/20.10_backport_update_runc_1.1.4
8bd86a0699 update containerd binary to v1.6.8
6c8dd6a6f2 update runc to v1.1.4
0bd91f300e Merge pull request #44018 from thaJeztah/20.10_backport_healthcheck_timeout
418c141e64 [20.10 backport] daemon: kill exec process on ctx cancel
62fd7187d0 Merge pull request #43991 from thaJeztah/20.10_seccomp_updates
7d4cc78c02 Merge pull request #43976 from thaJeztah/20.10_backport_bump_golang_1.18
d127287d92 Allow different syscalls from kernels 5.12 -> 5.16
57db169641 seccomp: add support for Landlock syscalls in default policy
reverted: 7ba8ca042c Update golang to 1.18.5
reverted: f2a3c3bcef update golang to 1.18.4
reverted: a99c9cd852 update golang to 1.18.3
reverted: 82939f536b update golang to 1.18.2
reverted: ecd1aa081f update golang to 1.18.1
7ba67d05a8 [20.10] vendor: update archive/tar for go 1.18
0bc432241e update golang to 1.18.0
bb95d09f9a staticcheck: ignore "SA1019: strings.Title is deprecated"
32debe0986 Merge pull request #43975 from thaJeztah/20.10_backport_update_golangci_lint
a7299ae72c Dockerfile: update golangci-lint v1.44.0
d97fd533cf integration-cli: SA5011: possible nil pointer dereference (staticcheck)
e6aee04a88 client.NewClientWithOpts(): remove redundant type assertion (gosimple)
0523323c28 daemon/logger/awslogs: suppress false positive on hardcoded creds (gosec)
adeb29c64c client/request.go:157:8: SA1019: err.Temporary is deprecated (staticcheck)
50361d91a6 registry: trimV1Address(): simplify trimming trailing slash
ae3a9337dd golangci.yml: do not limit max reported issues
9820255a1c golangci.yml: skip some tests
d223f37300 golangci.yml: update regex for ignoring SA1019
ec3bfba89d graphdriver: temporarily ignore unsafeptr: possible misuse of reflect.SliceHeader
f2f387b131 daemon: var-declaration: should omit type bool (revive)
2fb7c9fea7 daemon/config: error strings should not be capitalized
fa6954cb98 reformat "nolint" comments
45fa675a35 if-return: redundant if ...; err != nil check (revive)
9e88f8435a daemon/splunk: ignore G402: TLS MinVersion too low for now
2de90ebbe4 pkg/archive: RebaseArchiveEntries(): ignore G110
14b475d091 daemon/stats: fix notRunningErr / notFoundErr detected as unused (false positive)
db7b3f4737 unused: ignore false positives
b6de0ca7c5 G601: Implicit memory aliasing in for loop
e8b838e99f gosec: G601: Implicit memory aliasing in for loop
2ddf6e598a gosimple: S1039: unnecessary use of fmt.Sprintf
fadf8bbdff staticcheck: SA4001: &*x will be simplified to x. It will not copy x
7573e32577 client: S1031: unnecessary nil check around range (gosimple)
e738a57a6d daemon/logger/journald: fix linting errors
34f6b94255 gosec: G404: Use of weak random number generator
a77093b4fe Merge pull request #43911 from thaJeztah/20.10_backport_buildkit_api_docs
5e6d42aa9d Merge pull request #43918 from thaJeztah/20.10_backport_bump_containerd_1.6.7_binary
a345492301 Merge pull request #43859 from olljanat/20.10_backport_restore-custom-nat-networks
a6d7b61c8b update containerd binary to v1.6.7
b4ba1ee22f update runc binary to v1.1.3
195761c1fa Merge pull request #43889 from thaJeztah/20.10_backport_api_fix_missing_platform
da8828c4b3 api: swagger: fix invalid example value (API v1.39-v1.41)
1c0ca366dd Merge pull request #43905 from thaJeztah/20.10_bump_golang_1.17.13
9501d91e19 api: swagger: document BuildCache fields (API v1.39-v1.41)
61fdea902b api: swagger: document BuildCache fields.
c77432c889 [20.10] Update golang to 1.17.13
2833aa1e4b docs: api: add missing "platform" query-arg on create (v1.41)
a8c28260ad api: swagger: add missing "platform" query-arg on create
a70ae13d3b Merge pull request #43876 from thaJeztah/20.10_backport_42655_vfs_storage_driver
cfdc075b1c Fix file capabilities droping in Dockerfile
2daa6bb6b3 Windows: Re-create custom NAT networks after restart if missing from HNS
21b91d3fd5 Merge pull request #43824 from AkihiroSuda/libnetwork-20220716
903cd53ce4 vendor: libnetwork 0dde5c895075df6e3630e76f750a447cf63f4789
55cbb2fc57 Merge pull request #43803 from thaJeztah/20.10_update_golang_1.17.12
eccaf6d368 [20.10] update golang to 1.17.12
3949ff121e Merge pull request #43770 from xinfengliu/20.10_backport_update_continuity
ff7feeac37 vendor: github.com/containerd/continuity v0.3.0
a89b84221c (tag: v20.10.17) Merge pull request #43701 from thaJeztah/20.10_backport_update_containerd_1.6.6
6f3f2b6d08 update containerd binary to v1.6.6
3fba09221e Merge pull request #43692 from thaJeztah/20.0_backport_bump_containerd_binary_1.6.5
678cc00583 Merge pull request #43589 from thaJeztah/20.10_backport_bump_runc
b3bcb15da8 update containerd binary to v1.6.5
59d0ff35f8 Merge pull request #43686 from dfr/backport-freebsd-mknod
434eecd2cc Merge pull request #43683 from neersighted/update-libnetwork
f55b030fa0 system: unbreak build for darwin
63ab12cd3a Port pkg/system/mknod.go to FreeBSD
081e538fbd vendor: libnetwork f6ccccb1c082a432c2a5814aaedaca56af33d9ea
4159fa6860 Merge pull request #43677 from thaJeztah/20.10_update_golang_1.17.11
8e9d647c01 [20.10] update golang to 1.17.11
90033ab093 Merge pull request #43644 from ameyag/20.10-win-port-conflict
87ead7fd2a vendor: hcsshim a11a2c44e8a4aa9d66314b1d759ef582df5ab5e8
27f8322324 vendor: libnetwork 2dab5620d4462865c6151e573b3e7fa5d3b8458b
506d28dca8 Merge pull request #43612 from thaJeztah/20.10_backport_websocket_streams_docs_touch_ups
829951ec19 docs: api: /containers/{id}/attach/ws: remove unsupported query-args < v1.42
7307a0d583 Merge pull request #43606 from rumpl/20.10_backport_rename-reservation
6cbe73bfc0 Rename Reservation to Reservations in the open API
d9ed3d7e28 update runc binary to v1.1.2
f756502055 (tag: v20.10.16) Merge pull request #43582 from thaJeztah/20.10_bump_golang_1.17.10
a15acb4bd6 [20.10] vendor: golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
5f2e0b79ad [20.10] update golang to 1.17.10
462cd7de50 Merge pull request #43567 from 42wim/fixstats
be7855fdbe vendor: update github.com/containerd/cgroups and github.com/cilium/ebpf
4433bf67ba (tag: v20.10.15) Merge pull request #43561 from thaJeztah/20.10_backport_bump_containerd_binary_1.6.4
414a9e24a7 update containerd binary to v1.6.4
0809f5fafb Merge pull request #43433 from thaJeztah/20.10_backport_update_containerd_runc
47b6a924b6 update containerd binary to v1.6.3
6d7c2b2d26 update containerd binary to v1.6.2
91708bf704 update containerd binary to v1.6.1
53ae17008e Revert "[20.10] update containerd binary to 1.5.11"
961b9a78d5 update runc binary to v1.1.1
97972dac5f update runc binary to v1.1.0
2929771a53 Merge pull request #43499 from thaJeztah/20.10_bump_golang_1.17.9
033a819714 [20.10] update golang to 1.17.9
ecf2eee0f6 Merge pull request #43486 from thaJeztah/20.10_backport_fix_dco_check
a80884126b Jenkinsfile: add workaround for CVE-2022-24765
086a3fa036 Merge pull request #43468 from thaJeztah/20.10_backport_update_go_1.17
09d6fcdfec update to go 1.17.8 to address CVE-2022-24921
5957684b2c Update Go to 1.17.7
55b72c70ba Update Go to 1.17.6
fdf3020bd5 Update Go to 1.17.5
36e164ba80 Update Go to 1.17.4
ecfba8f588 Update Go to 1.17.3
4e14dcc125 Update Go to 1.17.2
c32b5ece31 Update Go to 1.17.1
7096508811 vendor: update archive/tar to match Go 1.17.0
a1150245cc Update to Go 1.17.0, and gofmt with Go 1.17
95cc7115fb hack/vendor.sh: allow go version to be specified with .0
949c33b1c5 vendor: golang.org/x/sys  63515b42dcdf9544f4e6a02fd7632793fde2f72d (for Go 1.17)
8392285876 vendor: golang.org/x/sys d19ff857e887eacb631721f188c7d365c2331456
9ee5abed9c Merge pull request #43470 from thaJeztah/20.10_backport_bump_buildx_0.8.2
4e81bcf380 Makefile: update buildx to v0.8.2
74e699c8d3 Makefile: update buildx version to v0.6.0
bc3cc2e7ac Makefile: install buildx from binary release, instead of building
811795ccd7 Merge pull request #43454 from thaJeztah/20.10_update_distribution
ae7f230408 Merge pull request #43460 from thaJeztah/20.10_backport_docs_fixes
492fac20af api: docs: fix indentation of HostConfig.SecurityOpt (v1.39-v1.41)
3cba2682d8 api: docs: move ContainerWaitResponse to definitions (v1.39-v1.41)
55e71450ae api: docs: move VolumeCreateOptions to definitions (v1.39-v1.41)
c54362cd64 api: docs: move Volume examples inline (v1.39-v1.41)
c60ff9b296 doc: server API Correct ImagesCreate - platform parameter added in 1.32
7a45f7a8cc docs: cleanup swagger API with multiple examples (v1.25-v1.41)
29bb9204bf api: docs: add IPAMConfig on IPAM (v1.41)
77f6564369 api: docs: document MountPoint fields (v1.25-v1.41)
51ea235ab8 api: docs: remove deprecated RootFS.BaseLayer (API v1.25-v1.41)
3d6b4ae572 Correct type of Mounts in ContainerSummary in docs (v1.25-v1.40)
6e8b9809b7 Correct type of Mounts in ContainerSummary in docs
621a98dac0 api: docs: fix warning about comment indentation (API v1.40-v1.41)
bb9ef98060 api: docs: update docs for /images/{name}/json (API v1.39-v1.41)
88ca5cec4e daemon: fix error-message for minimum allowed kernel-memory limit
3ea996abd7 docs: add missing KernelMemoryTCP to api v1.40 and v1.41
b475bc95cd docs/api: add missing 400 response for POST /containers/{id}/wait
ae07b3cc96 docs/api: update /containers/{id}/wait "condition" parameter (v1.30-v1.41)
19555fa92d [20.10] vendor: github.com/docker/distribution v2.8.1
4e188b8a49 Merge pull request #43426 from thaJeztah/20.10_backport_info_counters_rwmutex
339d7bdd7d Merge pull request #43406 from dims/cherry-pick-thaJeztah-errdefs_reduce_client_deps_alternative
32fe0bbb91 daemon: use RWMutex for stateCounter
1881be2de5 Merge pull request #43360 from Nossnevs/backport-21.x-linux-routeoverlaps-link-only-42598
af05807928 Merge pull request #43356 from awmirantis/20.10-bump-swarmkit-increase-config-size
ed8fb00b65 errdefs: move GetHTTPErrorStatusCode to api/server/httpstatus
3bd611d7a5 log error message when receiving an unexpected type error
66a96760b2 Merge pull request #43407 from dims/cherry-pick-remove_containerd_from_client
87a90dc786 (tag: v20.10.14) Merge pull request #43417 from thaJeztah/20.10_update_containerd_binary_1.5.11
7dfe7a1752 [20.10] update containerd binary to 1.5.11
7f375bcff4 Merge pull request from GHSA-2mm7-x5h6-5pvq
cf0abad081 Merge pull request #43416 from thaJeztah/20.10_update_containerd2
af953d2f38 [20.10] vendor: containerd 7cfa023d95d37076d5ab035003d4839f4b6ba791
5f9753ae73 client: remove containerd "platform" dependency
4df345e65d client: remove unused Platform field from configWrapper
dd38613d0c oci: inheritable capability set should be empty
2825bf7123 Only check if route overlaps routes with scope: LINK
f5c56eaca8 [20.10] bump swarmkit for config size increase
906f57ff5b (tag: v20.10.13) Merge pull request #43333 from pete-woods/20.10-backport-43291-schema-download-retry
ce3b6d1ae9 distribution: retry downloading schema config on retryable error
c3dec607c3 Merge pull request #43329 from thaJeztah/20.10_backport_update_containerd_binary_1.5.10
3056208812 (tag: v20.10.21) Merge pull request #44358 from thaJeztah/20.10_backport_busybox_w32_img
f99cb8297b integration: download busybox-w32 from GitHub Release
24aa4c9c43 Merge pull request #44353 from thaJeztah/20.10_backport_update_containerd_binary
3f9dc25f5c update containerd binary to v1.6.9
753cd92a31 Merge pull request #44326 from thaJeztah/20.10_bump_term_ansiterm
82f583c8af Merge pull request #44339 from crazy-max/20.10_update_buildkit
87ccd38cea vendor: moby/term, Azure/go-ansiterm for golang.org/x/sys/windows compatibility
e83e465ae2 [20.10] vendor: github.com/moby/buildkit eeb7b65ab7d651770a5ec52a06ea7c96eb97a249 (v0.8 branch)
e3fef9aea9 Merge pull request #44340 from thaJeztah/20.10_backport_skip_tests
9c84417c1b skip TestImagePullStoredfDigestForOtherRepo() on Windows and rootless
93c2c3bc60 Merge pull request #44332 from corhere/backport-20.10/fix-git-windows-environ
5b5b5c6f13 builder: add missing doc comment
05e25f7892 builder: fix running git commands on Windows
2b7f97a974 Merge pull request #44313 from tianon/20.10-distributable
03df974ae9 (tag: v20.10.20) Merge pull request #6 from moby/ghsa-ambiguous-pull-by-digest
3adff51f85 Merge pull request #9 from moby/update_buildkit
d7c33ad827 Merge pull request #8 from moby/20.10_fix_git_file_leak
2f3bf18014 [20.10] vendor moby/buildkit v0.8.3-31-gc0149372
6699afa549 registry: allow "allow-nondistributable-artifacts" for Docker Hub
4b9902bad4 Validate digest in repo for pull by digest
c0d1188c14 builder: make git config isolation opt-in
9f5f3abcee builder: isolate git from local system
10db4c2db7 builder: explicitly set CWD for all git commands
8816c3c2aa builder: modernize TestCheckoutGit
c964641a0d (tag: v20.10.19) Merge pull request #44122 from thaJeztah/20.10_bump_buildkit
3bb99735b6 Merge pull request #44127 from thaJeztah/20.10_backport_image_spec_no_literal
435c40ce15 Merge pull request #44247 from thaJeztah/20.10_bump_go_1.18.7
11bdbf40b9 [20.10] Update to go 1.18.7 to address CVE-2022-2879, CVE-2022-2880, CVE-2022-41715
35eaf7ecc4 Merge pull request #44238 from cpuguy83/20.10_fix_restore_volumerefs
66ddb7f91c Fix live-restore w/ restart policies + volume refs
f219cb5ded Merge pull request #44218 from thaJeztah/20.10_backport_more_robust_rootless
c003392582 contrib: make dockerd-rootless-setuptool.sh more robust
53313be0f3 docker-rootless-setuptools.sh: use context after install
4163c55082 Merge pull request #44202 from crazy-max/20.10_backport_api-fix-logo
9c486bd267 swagger: update links to logo
956161115f Merge pull request #44167 from thaJeztah/20.10_backport_update_containerd_console
668ab11a67 Merge pull request #44145 from neersighted/bump_memberlist_20.10
fa17fab895 vendor: github.com/containerd/console v1.0.2
481bee51b5 vendor: github.com/armon/go-metrics v0.4.1
39ba2873e8 vendor: github.com/google/btree v1.1.2
c2755f40cd vendor: github.com/hasicorp/memberlist v0.4.0
cc3aa33f54 Merge pull request #44123 from linux-on-ibm-z/20.10-CI
5ba3208ec7 Dockerfile: Update Dockerfile syntax, switch to bullseye, add missing libseccomp-dev, remove build pack
6d6a236286 [20.10] Update uses of Image platform fields in OCI image-spec
2570784169 [20.10] vendor: github.com/moby/buildkit 3a1eeca59a9263613d996ead67d53a4b7d45723d (v0.8 branch)
e42327a6d3 (tag: v20.10.18) Merge pull request #44120 from thaJeztah/20.10_backport_update_tests
fcd4df906b Update some tests for supplementary group permissions
bb0197c829 Merge pull request from GHSA-rc4r-wh2q-q6c4
d348775bd5 Merge pull request #44109 from rumpl/20.10-fix-local-context
6a0186b357 Wrap local calls to the content and lease service
b73e9c2c8a Merge pull request #44098 from thaJeztah/20.10_backport_swagger_updates
4855c28780 Merge pull request #44101 from thaJeztah/20.10_backport_bump_golang_1.18.6
3d4616f943 Update to go 1.18.6 to address CVE-2022-27664, CVE-2022-32190
d56101e0d2 Merge pull request #44093 from thaJeztah/20.10_backport_remove_tereshkova
23c7d84b84 docs: api: adjust ContainerWaitResponse error as optional
3e9e79d134 docs: api: document ImageSummary fields (api v1.39-v1.41)
fdd438ae03 api: docs: improve documentation of ContainerConfig type (API v1.30-v1.41)
97014a8db5 namesgenerator: remove Valentina Tereshkova
e44d7f735e AdditionalGids must include effective group ID
b0d57e0ed4 Merge pull request #44067 from thaJeztah/20.10_update_containerd_vendor
9e7662e4a7 [20.10] vendor: update containerd to latest of docker-20.10 branch
f7f1f960ea Merge pull request #44081 from thaJeztah/20.10_backport_tarsplit
7dac25a3a9 vendor: update tar-split to v0.11.2
d346080204 Merge pull request #44041 from thaJeztah/20.10_backport_ontainerd_binary_1.6.8
1c7b0dabc5 Merge pull request #44038 from thaJeztah/20.10_backport_update_runc_1.1.4
8bd86a0699 update containerd binary to v1.6.8
6c8dd6a6f2 update runc to v1.1.4
0bd91f300e Merge pull request #44018 from thaJeztah/20.10_backport_healthcheck_timeout
418c141e64 [20.10 backport] daemon: kill exec process on ctx cancel
62fd7187d0 Merge pull request #43991 from thaJeztah/20.10_seccomp_updates
7d4cc78c02 Merge pull request #43976 from thaJeztah/20.10_backport_bump_golang_1.18
d127287d92 Allow different syscalls from kernels 5.12 -> 5.16
57db169641 seccomp: add support for Landlock syscalls in default policy
7ba8ca042c Update golang to 1.18.5
f2a3c3bcef update golang to 1.18.4
a99c9cd852 update golang to 1.18.3
82939f536b update golang to 1.18.2
ecd1aa081f update golang to 1.18.1
7ba67d05a8 [20.10] vendor: update archive/tar for go 1.18
0bc432241e update golang to 1.18.0
bb95d09f9a staticcheck: ignore "SA1019: strings.Title is deprecated"
32debe0986 Merge pull request #43975 from thaJeztah/20.10_backport_update_golangci_lint
a7299ae72c Dockerfile: update golangci-lint v1.44.0
d97fd533cf integration-cli: SA5011: possible nil pointer dereference (staticcheck)
e6aee04a88 client.NewClientWithOpts(): remove redundant type assertion (gosimple)
0523323c28 daemon/logger/awslogs: suppress false positive on hardcoded creds (gosec)
adeb29c64c client/request.go:157:8: SA1019: err.Temporary is deprecated (staticcheck)
50361d91a6 registry: trimV1Address(): simplify trimming trailing slash
ae3a9337dd golangci.yml: do not limit max reported issues
9820255a1c golangci.yml: skip some tests
d223f37300 golangci.yml: update regex for ignoring SA1019
ec3bfba89d graphdriver: temporarily ignore unsafeptr: possible misuse of reflect.SliceHeader
f2f387b131 daemon: var-declaration: should omit type bool (revive)
2fb7c9fea7 daemon/config: error strings should not be capitalized
fa6954cb98 reformat "nolint" comments
45fa675a35 if-return: redundant if ...; err != nil check (revive)
9e88f8435a daemon/splunk: ignore G402: TLS MinVersion too low for now
2de90ebbe4 pkg/archive: RebaseArchiveEntries(): ignore G110
14b475d091 daemon/stats: fix notRunningErr / notFoundErr detected as unused (false positive)
db7b3f4737 unused: ignore false positives
b6de0ca7c5 G601: Implicit memory aliasing in for loop
e8b838e99f gosec: G601: Implicit memory aliasing in for loop
2ddf6e598a gosimple: S1039: unnecessary use of fmt.Sprintf
fadf8bbdff staticcheck: SA4001: &*x will be simplified to x. It will not copy x
7573e32577 client: S1031: unnecessary nil check around range (gosimple)
e738a57a6d daemon/logger/journald: fix linting errors
34f6b94255 gosec: G404: Use of weak random number generator
a77093b4fe Merge pull request #43911 from thaJeztah/20.10_backport_buildkit_api_docs
5e6d42aa9d Merge pull request #43918 from thaJeztah/20.10_backport_bump_containerd_1.6.7_binary
a345492301 Merge pull request #43859 from olljanat/20.10_backport_restore-custom-nat-networks
a6d7b61c8b update containerd binary to v1.6.7
b4ba1ee22f update runc binary to v1.1.3
195761c1fa Merge pull request #43889 from thaJeztah/20.10_backport_api_fix_missing_platform
da8828c4b3 api: swagger: fix invalid example value (API v1.39-v1.41)
1c0ca366dd Merge pull request #43905 from thaJeztah/20.10_bump_golang_1.17.13
9501d91e19 api: swagger: document BuildCache fields (API v1.39-v1.41)
61fdea902b api: swagger: document BuildCache fields.
c77432c889 [20.10] Update golang to 1.17.13
2833aa1e4b docs: api: add missing "platform" query-arg on create (v1.41)
a8c28260ad api: swagger: add missing "platform" query-arg on create
a70ae13d3b Merge pull request #43876 from thaJeztah/20.10_backport_42655_vfs_storage_driver
cfdc075b1c Fix file capabilities droping in Dockerfile
2daa6bb6b3 Windows: Re-create custom NAT networks after restart if missing from HNS
21b91d3fd5 Merge pull request #43824 from AkihiroSuda/libnetwork-20220716
903cd53ce4 vendor: libnetwork 0dde5c895075df6e3630e76f750a447cf63f4789
55cbb2fc57 Merge pull request #43803 from thaJeztah/20.10_update_golang_1.17.12
eccaf6d368 [20.10] update golang to 1.17.12
3949ff121e Merge pull request #43770 from xinfengliu/20.10_backport_update_continuity
ff7feeac37 vendor: github.com/containerd/continuity v0.3.0
a89b84221c (tag: v20.10.17) Merge pull request #43701 from thaJeztah/20.10_backport_update_containerd_1.6.6
6f3f2b6d08 update containerd binary to v1.6.6
3fba09221e Merge pull request #43692 from thaJeztah/20.0_backport_bump_containerd_binary_1.6.5
678cc00583 Merge pull request #43589 from thaJeztah/20.10_backport_bump_runc
b3bcb15da8 update containerd binary to v1.6.5
59d0ff35f8 Merge pull request #43686 from dfr/backport-freebsd-mknod
434eecd2cc Merge pull request #43683 from neersighted/update-libnetwork
f55b030fa0 system: unbreak build for darwin
63ab12cd3a Port pkg/system/mknod.go to FreeBSD
081e538fbd vendor: libnetwork f6ccccb1c082a432c2a5814aaedaca56af33d9ea
4159fa6860 Merge pull request #43677 from thaJeztah/20.10_update_golang_1.17.11
8e9d647c01 [20.10] update golang to 1.17.11
90033ab093 Merge pull request #43644 from ameyag/20.10-win-port-conflict
87ead7fd2a vendor: hcsshim a11a2c44e8a4aa9d66314b1d759ef582df5ab5e8
27f8322324 vendor: libnetwork 2dab5620d4462865c6151e573b3e7fa5d3b8458b
506d28dca8 Merge pull request #43612 from thaJeztah/20.10_backport_websocket_streams_docs_touch_ups
829951ec19 docs: api: /containers/{id}/attach/ws: remove unsupported query-args < v1.42
7307a0d583 Merge pull request #43606 from rumpl/20.10_backport_rename-reservation
6cbe73bfc0 Rename Reservation to Reservations in the open API
d9ed3d7e28 update runc binary to v1.1.2
f756502055 (tag: v20.10.16) Merge pull request #43582 from thaJeztah/20.10_bump_golang_1.17.10
a15acb4bd6 [20.10] vendor: golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
5f2e0b79ad [20.10] update golang to 1.17.10
462cd7de50 Merge pull request #43567 from 42wim/fixstats
be7855fdbe vendor: update github.com/containerd/cgroups and github.com/cilium/ebpf
4433bf67ba (tag: v20.10.15) Merge pull request #43561 from thaJeztah/20.10_backport_bump_containerd_binary_1.6.4
414a9e24a7 update containerd binary to v1.6.4
0809f5fafb Merge pull request #43433 from thaJeztah/20.10_backport_update_containerd_runc
47b6a924b6 update containerd binary to v1.6.3
6d7c2b2d26 update containerd binary to v1.6.2
91708bf704 update containerd binary to v1.6.1
53ae17008e Revert "[20.10] update containerd binary to 1.5.11"
961b9a78d5 update runc binary to v1.1.1
97972dac5f update runc binary to v1.1.0
2929771a53 Merge pull request #43499 from thaJeztah/20.10_bump_golang_1.17.9
033a819714 [20.10] update golang to 1.17.9
ecf2eee0f6 Merge pull request #43486 from thaJeztah/20.10_backport_fix_dco_check
a80884126b Jenkinsfile: add workaround for CVE-2022-24765
086a3fa036 Merge pull request #43468 from thaJeztah/20.10_backport_update_go_1.17
09d6fcdfec update to go 1.17.8 to address CVE-2022-24921
5957684b2c Update Go to 1.17.7
55b72c70ba Update Go to 1.17.6
fdf3020bd5 Update Go to 1.17.5
36e164ba80 Update Go to 1.17.4
ecfba8f588 Update Go to 1.17.3
4e14dcc125 Update Go to 1.17.2
c32b5ece31 Update Go to 1.17.1
7096508811 vendor: update archive/tar to match Go 1.17.0
a1150245cc Update to Go 1.17.0, and gofmt with Go 1.17
95cc7115fb hack/vendor.sh: allow go version to be specified with .0
949c33b1c5 vendor: golang.org/x/sys  63515b42dcdf9544f4e6a02fd7632793fde2f72d (for Go 1.17)
8392285876 vendor: golang.org/x/sys d19ff857e887eacb631721f188c7d365c2331456
9ee5abed9c Merge pull request #43470 from thaJeztah/20.10_backport_bump_buildx_0.8.2
4e81bcf380 Makefile: update buildx to v0.8.2
74e699c8d3 Makefile: update buildx version to v0.6.0
bc3cc2e7ac Makefile: install buildx from binary release, instead of building
811795ccd7 Merge pull request #43454 from thaJeztah/20.10_update_distribution
ae7f230408 Merge pull request #43460 from thaJeztah/20.10_backport_docs_fixes
492fac20af api: docs: fix indentation of HostConfig.SecurityOpt (v1.39-v1.41)
3cba2682d8 api: docs: move ContainerWaitResponse to definitions (v1.39-v1.41)
55e71450ae api: docs: move VolumeCreateOptions to definitions (v1.39-v1.41)
c54362cd64 api: docs: move Volume examples inline (v1.39-v1.41)
c60ff9b296 doc: server API Correct ImagesCreate - platform parameter added in 1.32
7a45f7a8cc docs: cleanup swagger API with multiple examples (v1.25-v1.41)
29bb9204bf api: docs: add IPAMConfig on IPAM (v1.41)
77f6564369 api: docs: document MountPoint fields (v1.25-v1.41)
51ea235ab8 api: docs: remove deprecated RootFS.BaseLayer (API v1.25-v1.41)
3d6b4ae572 Correct type of Mounts in ContainerSummary in docs (v1.25-v1.40)
6e8b9809b7 Correct type of Mounts in ContainerSummary in docs
621a98dac0 api: docs: fix warning about comment indentation (API v1.40-v1.41)
bb9ef98060 api: docs: update docs for /images/{name}/json (API v1.39-v1.41)
88ca5cec4e daemon: fix error-message for minimum allowed kernel-memory limit
3ea996abd7 docs: add missing KernelMemoryTCP to api v1.40 and v1.41
b475bc95cd docs/api: add missing 400 response for POST /containers/{id}/wait
ae07b3cc96 docs/api: update /containers/{id}/wait "condition" parameter (v1.30-v1.41)
19555fa92d [20.10] vendor: github.com/docker/distribution v2.8.1
4e188b8a49 Merge pull request #43426 from thaJeztah/20.10_backport_info_counters_rwmutex
339d7bdd7d Merge pull request #43406 from dims/cherry-pick-thaJeztah-errdefs_reduce_client_deps_alternative
32fe0bbb91 daemon: use RWMutex for stateCounter
1881be2de5 Merge pull request #43360 from Nossnevs/backport-21.x-linux-routeoverlaps-link-only-42598
af05807928 Merge pull request #43356 from awmirantis/20.10-bump-swarmkit-increase-config-size
ed8fb00b65 errdefs: move GetHTTPErrorStatusCode to api/server/httpstatus
3bd611d7a5 log error message when receiving an unexpected type error
66a96760b2 Merge pull request #43407 from dims/cherry-pick-remove_containerd_from_client
87a90dc786 (tag: v20.10.14) Merge pull request #43417 from thaJeztah/20.10_update_containerd_binary_1.5.11
7dfe7a1752 [20.10] update containerd binary to 1.5.11
7f375bcff4 Merge pull request from GHSA-2mm7-x5h6-5pvq
cf0abad081 Merge pull request #43416 from thaJeztah/20.10_update_containerd2
af953d2f38 [20.10] vendor: containerd 7cfa023d95d37076d5ab035003d4839f4b6ba791
5f9753ae73 client: remove containerd "platform" dependency
4df345e65d client: remove unused Platform field from configWrapper
dd38613d0c oci: inheritable capability set should be empty
2825bf7123 Only check if route overlaps routes with scope: LINK
f5c56eaca8 [20.10] bump swarmkit for config size increase
906f57ff5b (tag: v20.10.13) Merge pull request #43333 from pete-woods/20.10-backport-43291-schema-download-retry
ce3b6d1ae9 distribution: retry downloading schema config on retryable error
c3dec607c3 Merge pull request #43329 from thaJeztah/20.10_backport_update_containerd_binary_1.5.10
180f3b9cc7 update containerd binary to v1.5.10
409d7ac7f2 Merge pull request #43326 from thaJeztah/20.10_bump_go_1.16.15
0fa0d70489 [20.10] update to go 1.16.15 to address CVE-2022-24921
c4f6167be1 Merge pull request #43259 from thaJeztah/20.10_backport_fix_lock
9a57c5c4c9 Merge pull request #43260 from thaJeztah/20.10_backport_docs_fixes
4679ffd01c docs: remove HostConfig.LxcConf field from API docs
fbbe1fcfd8 api: remove HostConfig.LxcConf field
a5a697143d docs: fixing /exec/{id}/resize response code in API documentation
42b13c09a6 Added error codes for exec resize in API docs
aa69e8ed3f Fixed exec resize success code in API docs
ca5ba4890e Fix typo on the v1.41 changelog
db214206e5 vendor: bump etcd v3.3.27
df6a536193 vendor: github.com/coreos/etcd v3.3.25
3d5fb9425e Merge pull request #43167 from thaJeztah/20.10_backport_jenkinsfile_remove_rs1
1eef444005 Merge pull request #43171 from thaJeztah/20.10_backport_api_docs_fixes
7f44d606f9 Merge pull request #43166 from thaJeztah/20.10_backport_fix_update_sync
c9e1608dd4 Merge pull request #43243 from thaJeztah/20.10_update_go_1.16.14
9502dec32f [20.10] Update Go to 1.16.14
879dd468dc Merge pull request #43215 from thaJeztah/20.10_backport_fix_overlay_fuse_permissions
9edb93886a Merge pull request #43151 from thaJeztah/20.10_backport_containerd_15
878b9de935 daemon/graphdriver/fuse-overlayfs: Init(): fix directory permissions (staticcheck)
606c29418a Merge pull request #43177 from thaJeztah/20.10_update_distribution
d1b3497bfa [20.10] vendor: github.com/docker/distribution v2.8.0
dd61d8dc4b Merge pull request #43165 from thaJeztah/20.10_backport_logs_fixes
f9344b45fe api/swagger: move DistributionInspect to definitions
13cb9d9723 api/swagger: rename PluginPrivilegeItem to PluginPrivilege
7f9760e10c api/swagger: fix up event-types and move to definitions
e6739a2884 api/swagger: move DistributionInspect to definitions
d445d24804 api/swagger: rename PluginPrivilegeItem to PluginPrivilege
5e38ae84b2 api/swagger: fix up event-types and move to definitions
012fdff916 Fix swagger docs to match the opencontainers image-spec
13cbf7fbb7 Extract PluginPrivilegeItem as explicit type definition
8fbcf0611b Use explicit object names for improved swagger based code generation
b8bee972c4 Fix ContainerSummary swagger docs
7092a6091c Add "changes" query parameter for /image/create to swagger docs
adf1e470a1 Add RestartPolicy "no" to swagger docs
b4b469eac2 Fix swagger docs to match the opencontainers image-spec
2c38a2a635 Extract PluginPrivilegeItem as explicit type definition
621bfddd6e Use explicit object names for improved swagger based code generation
8a5240a8aa Fix ContainerSummary swagger docs
751cf68e36 Add "changes" query parameter for /image/create to swagger docs
a961b76aef Add RestartPolicy "no" to swagger docs
ad21bcd94e Jenkinsfile: remove Windows RS1 as it reached end of support
b2684c1857 Fix for lack of syncromization in daemon/update.go
8268f70ebb daemon/logger: replace flaky TestFollowLogsHandleDecodeErr
78d0b936b8 daemon/logger: refactor followLogs to write more unit tests
39519221c2 daemon/logger: test followLogs' handleDecodeErr case
ada1b01de1 daemon/logger: read the length header correctly
829f071228 update containerd binary to v1.5.9
3e5eea4192 update runc binary to v1.0.3
bd42e17284 update containerd binary to v1.5.8
3fd0b8d6eb Update containerd binary to v1.5.7
3700adb70a Update containerd binary to v1.5.6
0f37f2989b Dockerfile: update gotestsum to v1.7.0
2716336abd Dockerfile: use "go install" to install utilities
b35a1707e3 Dockerfile: use version for some utilities instead of commit-sha
2a18825cdf Dockerfile: remove GOPROXY override (was for go < 1.14)
0f925d5d3d remove deprecated "nokmem" build-tag for runc
fb45fe614d info: remove "expected" check for tini version
fd32c70031 update containerd binary to v1.5.5
302114634c update containerd binary v1.4.8
1cd13dcb6c Update containerd binary to v1.5.3
5f09d5c76a update containerd binary to v1.5.2
23f23c99ed update containerd binary to v1.5.1
f036a34c5b update containerd binary to v1.5.0
1dd37750a6 Revert "[20.10] update containerd binary to v1.4.5"
b097d29705 Revert "[20.10] update containerd binary to v1.4.6"
de656f9da4 Revert "[20.10] update containerd binary to v1.4.7"
9e36f77577 Revert "[20.10] update containerd binary v1.4.8"
eb2acf2fb3 Revert "[20.10] update containerd binary to v1.4.9"
4e838e50ea Revert "[20.10] update containerd binary to v1.4.10"
79fd9c1541 Revert "[20.10] update containerd binary to v1.4.11"
13de46fd4b Revert "[20.10] update containerd binary to v1.4.12"
22ff2ed34b Merge pull request #43147 from PettitWesley/backport-fluentd-fix
b106f7dfd0 Merge pull request #43153 from thaJeztah/20.10_bump_go_1.16.13
aa92e697cb [20.10] update Go to 1.16.13
f9df098e76 fluentd: Turn ForceStopAsyncSend true when async connect is used
81fc02b7e1 vendor: github.com/fluent/fluent-logger-golang v1.8.0
d6f3add5c6 vendor: github.com/fluent/fluent-logger-golang 1.6.1
b1fc0c84de Merge pull request #43084 from AkihiroSuda/cherrypick-42736
660b9962e4 daemon.WithCommonOptions() fix detection of user-namespaces

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 recipes-containers/docker/docker-ce_git.bb    |   30 +-
 recipes-containers/docker/docker-moby_git.bb  |   27 +-
 recipes-containers/docker/docker.inc          |    5 +-
 .../files/0001-revert-go-1.8-update.patch     | 1218 +++++++++++++++++
 4 files changed, 1253 insertions(+), 27 deletions(-)
 create mode 100644 recipes-containers/docker/files/0001-revert-go-1.8-update.patch

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 12bc73c..1bc7ce6 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -31,19 +31,23 @@ DESCRIPTION = "Linux container runtime \
 # so we get that tag, and make it our SRCREVS:
 #
 
-SRCREV_docker = "906f57ff5b7100013dfef066ea8fe367706468df"
-SRCREV_libnetwork = "64b7a4574d1426139437d20e81c0b6d391130ec8"
-SRCREV_cli = "62eae52c2a76f4c1dcf79dfc7b5ea3bf5eebab8b"
+SRCREV_docker = "3056208812eb5e792fa99736c9167d1e10f4ab49"
+SRCREV_libnetwork = "dcdf8f176d1e13ad719e913e796fb698d846de98"
+SRCREV_cli = "b40c2f6b5deeb11ac6c485c940865ee40664f0f0"
 SRCREV_FORMAT = "docker_libnetwork"
 SRC_URI = "\
-	git://github.com/docker/docker.git;branch=20.10;name=docker;protocol=https \
-	git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork;protocol=https \
-	git://github.com/docker/cli;branch=20.10;name=cli;destsuffix=git/cli;protocol=https \
-	file://0001-libnetwork-use-GO-instead-of-go.patch \
-	file://docker.init \
-        file://0001-dynbinary-use-go-cross-compiler.patch \
-        file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
-	"
+    git://github.com/docker/docker.git;branch=20.10;name=docker;protocol=https \
+    git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork;protocol=https \
+    git://github.com/docker/cli;branch=20.10;name=cli;destsuffix=git/cli;protocol=https \
+    file://0001-libnetwork-use-GO-instead-of-go.patch \
+    file://docker.init \
+    file://0001-dynbinary-use-go-cross-compiler.patch \
+    file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
+    file://0001-revert-go-1.8-update.patch;patchdir=src/import \
+    "
+
+# docker git repo is a link to moby repo on github. do_compile referres to SRCREV_moby.
+SRCREV_moby = "${SRCREV_docker}"
 
 require docker.inc
 
@@ -51,7 +55,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "20.10.12-ce"
+DOCKER_VERSION = "20.10.21-ce"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
-CVE_PRODUCT = "docker"
+CVE_PRODUCT = "docker mobyproject:moby"
diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 0a0ffd6..377bf07 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -34,19 +34,20 @@ DESCRIPTION = "Linux container runtime \
 #   - The common components of this recipe and docker-ce do need to be moved
 #     to a docker.inc recipe
 
-SRCREV_moby = "906f57ff5b7100013dfef066ea8fe367706468df"
-SRCREV_libnetwork = "64b7a4574d1426139437d20e81c0b6d391130ec8"
-SRCREV_cli = "a224086349269551becacce16e5842ceeb2a98d6"
+SRCREV_moby = "3056208812eb5e792fa99736c9167d1e10f4ab49"
+SRCREV_libnetwork = "dcdf8f176d1e13ad719e913e796fb698d846de98"
+SRCREV_cli = "b40c2f6b5deeb11ac6c485c940865ee40664f0f0"
 SRCREV_FORMAT = "moby_libnetwork"
 SRC_URI = "\
-	git://github.com/moby/moby.git;branch=20.10;name=moby;protocol=https \
-	git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork;protocol=https \
-	git://github.com/docker/cli;branch=20.10;name=cli;destsuffix=git/cli;protocol=https \
-	file://docker.init \
-	file://0001-libnetwork-use-GO-instead-of-go.patch \
-        file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
-        file://0001-dynbinary-use-go-cross-compiler.patch \
-	"
+    git://github.com/moby/moby.git;branch=20.10;name=moby;protocol=https \
+    git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork;protocol=https \
+    git://github.com/docker/cli;branch=20.10;name=cli;destsuffix=git/cli;protocol=https \
+    file://docker.init \
+    file://0001-libnetwork-use-GO-instead-of-go.patch \
+    file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
+    file://0001-dynbinary-use-go-cross-compiler.patch \
+    file://0001-revert-go-1.8-update.patch;patchdir=src/import \
+    "
 
 require docker.inc
 
@@ -54,7 +55,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "20.10.12"
+DOCKER_VERSION = "20.10.21"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
-CVE_PRODUCT = "docker"
+CVE_PRODUCT = "docker mobyproject:moby"
diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 40a3642..0439467 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -41,7 +41,10 @@ RPROVIDES:${PN}-dev += "docker-dev"
 RPROVIDES:${PN}-contrip += "docker-dev"
 
 inherit pkgconfig
-PACKAGECONFIG ??= "docker-init"
+PACKAGECONFIG ??= "\
+    docker-init \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)} \
+"
 PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
 PACKAGECONFIG[docker-init] = ",,,docker-init"
 PACKAGECONFIG[transient-config] = "transient-config"
diff --git a/recipes-containers/docker/files/0001-revert-go-1.8-update.patch b/recipes-containers/docker/files/0001-revert-go-1.8-update.patch
new file mode 100644
index 0000000..0298c31
--- /dev/null
+++ b/recipes-containers/docker/files/0001-revert-go-1.8-update.patch
@@ -0,0 +1,1218 @@
+From 575302e9c6567b8547b308b2b0c6a07b27e3be3b Mon Sep 17 00:00:00 2001
+From: Adrian Freihofer <adrian.freihofer@siemens.com>
+Date: Sun, 4 Dec 2022 18:02:54 +0100
+Subject: [PATCH] Revert "Merge pull request #43976 from
+ thaJeztah/20.10_backport_bump_golang_1.18"
+
+Upstream-Status: Inapropriate
+
+Updating this patch:
+  git revert -m 1 7d4cc78c0289edbb4727e3d50d4b130ce0f9c47e
+
+This reverts commit 7d4cc78c0289edbb4727e3d50d4b130ce0f9c47e, reversing
+changes made to 32debe0986f4516bfe17bf9122447f0c735e61b4.
+---
+ Dockerfile                            |   2 +-
+ Dockerfile.e2e                        |   2 +-
+ Dockerfile.simple                     |   2 +-
+ Dockerfile.windows                    |   2 +-
+ daemon/logger/templates/templates.go  |   2 +-
+ pkg/plugins/pluginrpc-gen/template.go |   2 +-
+ vendor/archive/tar/common.go          |  40 ++++----
+ vendor/archive/tar/format.go          | 138 +++++++++++++-------------
+ vendor/archive/tar/fuzz_test.go       |  80 ---------------
+ vendor/archive/tar/reader.go          | 102 ++++++++++---------
+ vendor/archive/tar/reader_test.go     |  30 +++---
+ vendor/archive/tar/stat_actime1.go    |   1 +
+ vendor/archive/tar/stat_actime2.go    |   1 +
+ vendor/archive/tar/stat_unix.go       |   1 +
+ vendor/archive/tar/strconv.go         |  43 +++++---
+ vendor/archive/tar/tar_test.go        |   2 +-
+ vendor/archive/tar/writer.go          |  89 ++++++++---------
+ vendor/archive/tar/writer_test.go     |  24 +++--
+ 18 files changed, 251 insertions(+), 312 deletions(-)
+ delete mode 100644 vendor/archive/tar/fuzz_test.go
+
+diff --git a/Dockerfile b/Dockerfile
+index 9472c512a6..f3f7956414 100644
+--- a/Dockerfile
++++ b/Dockerfile
+@@ -3,7 +3,7 @@
+ ARG CROSS="false"
+ ARG SYSTEMD="false"
+ # IMPORTANT: When updating this please note that stdlib archive/tar pkg is vendored
+-ARG GO_VERSION=1.18.7
++ARG GO_VERSION=1.17.13
+ ARG DEBIAN_FRONTEND=noninteractive
+ ARG VPNKIT_VERSION=0.5.0
+ ARG DOCKER_BUILDTAGS="apparmor seccomp"
+diff --git a/Dockerfile.e2e b/Dockerfile.e2e
+index f92bec85b0..d0f0b08acd 100644
+--- a/Dockerfile.e2e
++++ b/Dockerfile.e2e
+@@ -1,4 +1,4 @@
+-ARG GO_VERSION=1.18.7
++ARG GO_VERSION=1.17.13
+ 
+ FROM golang:${GO_VERSION}-alpine AS base
+ ENV GO111MODULE=off
+diff --git a/Dockerfile.simple b/Dockerfile.simple
+index 8aa6d7ff94..1db20c1e35 100644
+--- a/Dockerfile.simple
++++ b/Dockerfile.simple
+@@ -5,7 +5,7 @@
+ 
+ # This represents the bare minimum required to build and test Docker.
+ 
+-ARG GO_VERSION=1.18.7
++ARG GO_VERSION=1.17.13
+ 
+ FROM golang:${GO_VERSION}-buster
+ ENV GO111MODULE=off
+diff --git a/Dockerfile.windows b/Dockerfile.windows
+index 6f8242decc..b0ee068aab 100644
+--- a/Dockerfile.windows
++++ b/Dockerfile.windows
+@@ -165,7 +165,7 @@ FROM microsoft/windowsservercore
+ # Use PowerShell as the default shell
+ SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
+ 
+-ARG GO_VERSION=1.18.7
++ARG GO_VERSION=1.17.13
+ ARG GOTESTSUM_VERSION=v1.7.0
+ 
+ # Environment variable notes:
+diff --git a/daemon/logger/templates/templates.go b/daemon/logger/templates/templates.go
+index d8b4ce5d85..ab76d0f1c2 100644
+--- a/daemon/logger/templates/templates.go
++++ b/daemon/logger/templates/templates.go
+@@ -20,7 +20,7 @@ var basicFunctions = template.FuncMap{
+ 	},
+ 	"split":    strings.Split,
+ 	"join":     strings.Join,
+-	"title":    strings.Title, //nolint:staticcheck // SA1019: strings.Title is deprecated: The rule Title uses for word boundaries does not handle Unicode punctuation properly. Use golang.org/x/text/cases instead.
++	"title":    strings.Title,
+ 	"lower":    strings.ToLower,
+ 	"upper":    strings.ToUpper,
+ 	"pad":      padWithSpace,
+diff --git a/pkg/plugins/pluginrpc-gen/template.go b/pkg/plugins/pluginrpc-gen/template.go
+index c34a5add11..50ed9293c1 100644
+--- a/pkg/plugins/pluginrpc-gen/template.go
++++ b/pkg/plugins/pluginrpc-gen/template.go
+@@ -64,7 +64,7 @@ func title(s string) string {
+ 	if strings.ToLower(s) == "id" {
+ 		return "ID"
+ 	}
+-	return strings.Title(s) //nolint:staticcheck // SA1019: strings.Title is deprecated: The rule Title uses for word boundaries does not handle Unicode punctuation properly. Use golang.org/x/text/cases instead.
++	return strings.Title(s)
+ }
+ 
+ var generatedTempl = template.Must(template.New("rpc_cient").Funcs(templFuncs).Parse(`
+diff --git a/vendor/archive/tar/common.go b/vendor/archive/tar/common.go
+index c99b5c1920..c667cfc872 100644
+--- a/vendor/archive/tar/common.go
++++ b/vendor/archive/tar/common.go
+@@ -316,10 +316,10 @@ func invertSparseEntries(src []sparseEntry, size int64) []sparseEntry {
+ // fileState tracks the number of logical (includes sparse holes) and physical
+ // (actual in tar archive) bytes remaining for the current file.
+ //
+-// Invariant: logicalRemaining >= physicalRemaining
++// Invariant: LogicalRemaining >= PhysicalRemaining
+ type fileState interface {
+-	logicalRemaining() int64
+-	physicalRemaining() int64
++	LogicalRemaining() int64
++	PhysicalRemaining() int64
+ }
+ 
+ // allowedFormats determines which formats can be used.
+@@ -413,22 +413,22 @@ func (h Header) allowedFormats() (format Format, paxHdrs map[string]string, err
+ 
+ 	// Check basic fields.
+ 	var blk block
+-	v7 := blk.toV7()
+-	ustar := blk.toUSTAR()
+-	gnu := blk.toGNU()
+-	verifyString(h.Name, len(v7.name()), "Name", paxPath)
+-	verifyString(h.Linkname, len(v7.linkName()), "Linkname", paxLinkpath)
+-	verifyString(h.Uname, len(ustar.userName()), "Uname", paxUname)
+-	verifyString(h.Gname, len(ustar.groupName()), "Gname", paxGname)
+-	verifyNumeric(h.Mode, len(v7.mode()), "Mode", paxNone)
+-	verifyNumeric(int64(h.Uid), len(v7.uid()), "Uid", paxUid)
+-	verifyNumeric(int64(h.Gid), len(v7.gid()), "Gid", paxGid)
+-	verifyNumeric(h.Size, len(v7.size()), "Size", paxSize)
+-	verifyNumeric(h.Devmajor, len(ustar.devMajor()), "Devmajor", paxNone)
+-	verifyNumeric(h.Devminor, len(ustar.devMinor()), "Devminor", paxNone)
+-	verifyTime(h.ModTime, len(v7.modTime()), "ModTime", paxMtime)
+-	verifyTime(h.AccessTime, len(gnu.accessTime()), "AccessTime", paxAtime)
+-	verifyTime(h.ChangeTime, len(gnu.changeTime()), "ChangeTime", paxCtime)
++	v7 := blk.V7()
++	ustar := blk.USTAR()
++	gnu := blk.GNU()
++	verifyString(h.Name, len(v7.Name()), "Name", paxPath)
++	verifyString(h.Linkname, len(v7.LinkName()), "Linkname", paxLinkpath)
++	verifyString(h.Uname, len(ustar.UserName()), "Uname", paxUname)
++	verifyString(h.Gname, len(ustar.GroupName()), "Gname", paxGname)
++	verifyNumeric(h.Mode, len(v7.Mode()), "Mode", paxNone)
++	verifyNumeric(int64(h.Uid), len(v7.UID()), "Uid", paxUid)
++	verifyNumeric(int64(h.Gid), len(v7.GID()), "Gid", paxGid)
++	verifyNumeric(h.Size, len(v7.Size()), "Size", paxSize)
++	verifyNumeric(h.Devmajor, len(ustar.DevMajor()), "Devmajor", paxNone)
++	verifyNumeric(h.Devminor, len(ustar.DevMinor()), "Devminor", paxNone)
++	verifyTime(h.ModTime, len(v7.ModTime()), "ModTime", paxMtime)
++	verifyTime(h.AccessTime, len(gnu.AccessTime()), "AccessTime", paxAtime)
++	verifyTime(h.ChangeTime, len(gnu.ChangeTime()), "ChangeTime", paxCtime)
+ 
+ 	// Check for header-only types.
+ 	var whyOnlyPAX, whyOnlyGNU string
+@@ -538,7 +538,7 @@ type headerFileInfo struct {
+ func (fi headerFileInfo) Size() int64        { return fi.h.Size }
+ func (fi headerFileInfo) IsDir() bool        { return fi.Mode().IsDir() }
+ func (fi headerFileInfo) ModTime() time.Time { return fi.h.ModTime }
+-func (fi headerFileInfo) Sys() any           { return fi.h }
++func (fi headerFileInfo) Sys() interface{}   { return fi.h }
+ 
+ // Name returns the base name of the file.
+ func (fi headerFileInfo) Name() string {
+diff --git a/vendor/archive/tar/format.go b/vendor/archive/tar/format.go
+index 8898c438b5..6642364de1 100644
+--- a/vendor/archive/tar/format.go
++++ b/vendor/archive/tar/format.go
+@@ -160,28 +160,28 @@ var zeroBlock block
+ type block [blockSize]byte
+ 
+ // Convert block to any number of formats.
+-func (b *block) toV7() *headerV7       { return (*headerV7)(b) }
+-func (b *block) toGNU() *headerGNU     { return (*headerGNU)(b) }
+-func (b *block) toSTAR() *headerSTAR   { return (*headerSTAR)(b) }
+-func (b *block) toUSTAR() *headerUSTAR { return (*headerUSTAR)(b) }
+-func (b *block) toSparse() sparseArray { return sparseArray(b[:]) }
++func (b *block) V7() *headerV7       { return (*headerV7)(b) }
++func (b *block) GNU() *headerGNU     { return (*headerGNU)(b) }
++func (b *block) STAR() *headerSTAR   { return (*headerSTAR)(b) }
++func (b *block) USTAR() *headerUSTAR { return (*headerUSTAR)(b) }
++func (b *block) Sparse() sparseArray { return sparseArray(b[:]) }
+ 
+ // GetFormat checks that the block is a valid tar header based on the checksum.
+ // It then attempts to guess the specific format based on magic values.
+ // If the checksum fails, then FormatUnknown is returned.
+-func (b *block) getFormat() Format {
++func (b *block) GetFormat() Format {
+ 	// Verify checksum.
+ 	var p parser
+-	value := p.parseOctal(b.toV7().chksum())
+-	chksum1, chksum2 := b.computeChecksum()
++	value := p.parseOctal(b.V7().Chksum())
++	chksum1, chksum2 := b.ComputeChecksum()
+ 	if p.err != nil || (value != chksum1 && value != chksum2) {
+ 		return FormatUnknown
+ 	}
+ 
+ 	// Guess the magic values.
+-	magic := string(b.toUSTAR().magic())
+-	version := string(b.toUSTAR().version())
+-	trailer := string(b.toSTAR().trailer())
++	magic := string(b.USTAR().Magic())
++	version := string(b.USTAR().Version())
++	trailer := string(b.STAR().Trailer())
+ 	switch {
+ 	case magic == magicUSTAR && trailer == trailerSTAR:
+ 		return formatSTAR
+@@ -194,23 +194,23 @@ func (b *block) getFormat() Format {
+ 	}
+ }
+ 
+-// setFormat writes the magic values necessary for specified format
++// SetFormat writes the magic values necessary for specified format
+ // and then updates the checksum accordingly.
+-func (b *block) setFormat(format Format) {
++func (b *block) SetFormat(format Format) {
+ 	// Set the magic values.
+ 	switch {
+ 	case format.has(formatV7):
+ 		// Do nothing.
+ 	case format.has(FormatGNU):
+-		copy(b.toGNU().magic(), magicGNU)
+-		copy(b.toGNU().version(), versionGNU)
++		copy(b.GNU().Magic(), magicGNU)
++		copy(b.GNU().Version(), versionGNU)
+ 	case format.has(formatSTAR):
+-		copy(b.toSTAR().magic(), magicUSTAR)
+-		copy(b.toSTAR().version(), versionUSTAR)
+-		copy(b.toSTAR().trailer(), trailerSTAR)
++		copy(b.STAR().Magic(), magicUSTAR)
++		copy(b.STAR().Version(), versionUSTAR)
++		copy(b.STAR().Trailer(), trailerSTAR)
+ 	case format.has(FormatUSTAR | FormatPAX):
+-		copy(b.toUSTAR().magic(), magicUSTAR)
+-		copy(b.toUSTAR().version(), versionUSTAR)
++		copy(b.USTAR().Magic(), magicUSTAR)
++		copy(b.USTAR().Version(), versionUSTAR)
+ 	default:
+ 		panic("invalid format")
+ 	}
+@@ -218,17 +218,17 @@ func (b *block) setFormat(format Format) {
+ 	// Update checksum.
+ 	// This field is special in that it is terminated by a NULL then space.
+ 	var f formatter
+-	field := b.toV7().chksum()
+-	chksum, _ := b.computeChecksum() // Possible values are 256..128776
++	field := b.V7().Chksum()
++	chksum, _ := b.ComputeChecksum() // Possible values are 256..128776
+ 	f.formatOctal(field[:7], chksum) // Never fails since 128776 < 262143
+ 	field[7] = ' '
+ }
+ 
+-// computeChecksum computes the checksum for the header block.
++// ComputeChecksum computes the checksum for the header block.
+ // POSIX specifies a sum of the unsigned byte values, but the Sun tar used
+ // signed byte values.
+ // We compute and return both.
+-func (b *block) computeChecksum() (unsigned, signed int64) {
++func (b *block) ComputeChecksum() (unsigned, signed int64) {
+ 	for i, c := range b {
+ 		if 148 <= i && i < 156 {
+ 			c = ' ' // Treat the checksum field itself as all spaces.
+@@ -240,68 +240,68 @@ func (b *block) computeChecksum() (unsigned, signed int64) {
+ }
+ 
+ // Reset clears the block with all zeros.
+-func (b *block) reset() {
++func (b *block) Reset() {
+ 	*b = block{}
+ }
+ 
+ type headerV7 [blockSize]byte
+ 
+-func (h *headerV7) name() []byte     { return h[000:][:100] }
+-func (h *headerV7) mode() []byte     { return h[100:][:8] }
+-func (h *headerV7) uid() []byte      { return h[108:][:8] }
+-func (h *headerV7) gid() []byte      { return h[116:][:8] }
+-func (h *headerV7) size() []byte     { return h[124:][:12] }
+-func (h *headerV7) modTime() []byte  { return h[136:][:12] }
+-func (h *headerV7) chksum() []byte   { return h[148:][:8] }
+-func (h *headerV7) typeFlag() []byte { return h[156:][:1] }
+-func (h *headerV7) linkName() []byte { return h[157:][:100] }
++func (h *headerV7) Name() []byte     { return h[000:][:100] }
++func (h *headerV7) Mode() []byte     { return h[100:][:8] }
++func (h *headerV7) UID() []byte      { return h[108:][:8] }
++func (h *headerV7) GID() []byte      { return h[116:][:8] }
++func (h *headerV7) Size() []byte     { return h[124:][:12] }
++func (h *headerV7) ModTime() []byte  { return h[136:][:12] }
++func (h *headerV7) Chksum() []byte   { return h[148:][:8] }
++func (h *headerV7) TypeFlag() []byte { return h[156:][:1] }
++func (h *headerV7) LinkName() []byte { return h[157:][:100] }
+ 
+ type headerGNU [blockSize]byte
+ 
+-func (h *headerGNU) v7() *headerV7       { return (*headerV7)(h) }
+-func (h *headerGNU) magic() []byte       { return h[257:][:6] }
+-func (h *headerGNU) version() []byte     { return h[263:][:2] }
+-func (h *headerGNU) userName() []byte    { return h[265:][:32] }
+-func (h *headerGNU) groupName() []byte   { return h[297:][:32] }
+-func (h *headerGNU) devMajor() []byte    { return h[329:][:8] }
+-func (h *headerGNU) devMinor() []byte    { return h[337:][:8] }
+-func (h *headerGNU) accessTime() []byte  { return h[345:][:12] }
+-func (h *headerGNU) changeTime() []byte  { return h[357:][:12] }
+-func (h *headerGNU) sparse() sparseArray { return sparseArray(h[386:][:24*4+1]) }
+-func (h *headerGNU) realSize() []byte    { return h[483:][:12] }
++func (h *headerGNU) V7() *headerV7       { return (*headerV7)(h) }
++func (h *headerGNU) Magic() []byte       { return h[257:][:6] }
++func (h *headerGNU) Version() []byte     { return h[263:][:2] }
++func (h *headerGNU) UserName() []byte    { return h[265:][:32] }
++func (h *headerGNU) GroupName() []byte   { return h[297:][:32] }
++func (h *headerGNU) DevMajor() []byte    { return h[329:][:8] }
++func (h *headerGNU) DevMinor() []byte    { return h[337:][:8] }
++func (h *headerGNU) AccessTime() []byte  { return h[345:][:12] }
++func (h *headerGNU) ChangeTime() []byte  { return h[357:][:12] }
++func (h *headerGNU) Sparse() sparseArray { return sparseArray(h[386:][:24*4+1]) }
++func (h *headerGNU) RealSize() []byte    { return h[483:][:12] }
+ 
+ type headerSTAR [blockSize]byte
+ 
+-func (h *headerSTAR) v7() *headerV7      { return (*headerV7)(h) }
+-func (h *headerSTAR) magic() []byte      { return h[257:][:6] }
+-func (h *headerSTAR) version() []byte    { return h[263:][:2] }
+-func (h *headerSTAR) userName() []byte   { return h[265:][:32] }
+-func (h *headerSTAR) groupName() []byte  { return h[297:][:32] }
+-func (h *headerSTAR) devMajor() []byte   { return h[329:][:8] }
+-func (h *headerSTAR) devMinor() []byte   { return h[337:][:8] }
+-func (h *headerSTAR) prefix() []byte     { return h[345:][:131] }
+-func (h *headerSTAR) accessTime() []byte { return h[476:][:12] }
+-func (h *headerSTAR) changeTime() []byte { return h[488:][:12] }
+-func (h *headerSTAR) trailer() []byte    { return h[508:][:4] }
++func (h *headerSTAR) V7() *headerV7      { return (*headerV7)(h) }
++func (h *headerSTAR) Magic() []byte      { return h[257:][:6] }
++func (h *headerSTAR) Version() []byte    { return h[263:][:2] }
++func (h *headerSTAR) UserName() []byte   { return h[265:][:32] }
++func (h *headerSTAR) GroupName() []byte  { return h[297:][:32] }
++func (h *headerSTAR) DevMajor() []byte   { return h[329:][:8] }
++func (h *headerSTAR) DevMinor() []byte   { return h[337:][:8] }
++func (h *headerSTAR) Prefix() []byte     { return h[345:][:131] }
++func (h *headerSTAR) AccessTime() []byte { return h[476:][:12] }
++func (h *headerSTAR) ChangeTime() []byte { return h[488:][:12] }
++func (h *headerSTAR) Trailer() []byte    { return h[508:][:4] }
+ 
+ type headerUSTAR [blockSize]byte
+ 
+-func (h *headerUSTAR) v7() *headerV7     { return (*headerV7)(h) }
+-func (h *headerUSTAR) magic() []byte     { return h[257:][:6] }
+-func (h *headerUSTAR) version() []byte   { return h[263:][:2] }
+-func (h *headerUSTAR) userName() []byte  { return h[265:][:32] }
+-func (h *headerUSTAR) groupName() []byte { return h[297:][:32] }
+-func (h *headerUSTAR) devMajor() []byte  { return h[329:][:8] }
+-func (h *headerUSTAR) devMinor() []byte  { return h[337:][:8] }
+-func (h *headerUSTAR) prefix() []byte    { return h[345:][:155] }
++func (h *headerUSTAR) V7() *headerV7     { return (*headerV7)(h) }
++func (h *headerUSTAR) Magic() []byte     { return h[257:][:6] }
++func (h *headerUSTAR) Version() []byte   { return h[263:][:2] }
++func (h *headerUSTAR) UserName() []byte  { return h[265:][:32] }
++func (h *headerUSTAR) GroupName() []byte { return h[297:][:32] }
++func (h *headerUSTAR) DevMajor() []byte  { return h[329:][:8] }
++func (h *headerUSTAR) DevMinor() []byte  { return h[337:][:8] }
++func (h *headerUSTAR) Prefix() []byte    { return h[345:][:155] }
+ 
+ type sparseArray []byte
+ 
+-func (s sparseArray) entry(i int) sparseElem { return sparseElem(s[i*24:]) }
+-func (s sparseArray) isExtended() []byte     { return s[24*s.maxEntries():][:1] }
+-func (s sparseArray) maxEntries() int        { return len(s) / 24 }
++func (s sparseArray) Entry(i int) sparseElem { return sparseElem(s[i*24:]) }
++func (s sparseArray) IsExtended() []byte     { return s[24*s.MaxEntries():][:1] }
++func (s sparseArray) MaxEntries() int        { return len(s) / 24 }
+ 
+ type sparseElem []byte
+ 
+-func (s sparseElem) offset() []byte { return s[00:][:12] }
+-func (s sparseElem) length() []byte { return s[12:][:12] }
++func (s sparseElem) Offset() []byte { return s[00:][:12] }
++func (s sparseElem) Length() []byte { return s[12:][:12] }
+diff --git a/vendor/archive/tar/fuzz_test.go b/vendor/archive/tar/fuzz_test.go
+deleted file mode 100644
+index e73e0d2609..0000000000
+--- a/vendor/archive/tar/fuzz_test.go
++++ /dev/null
+@@ -1,80 +0,0 @@
+-// Copyright 2021 The Go Authors. All rights reserved.
+-// Use of this source code is governed by a BSD-style
+-// license that can be found in the LICENSE file.
+-
+-package tar
+-
+-import (
+-	"bytes"
+-	"io"
+-	"testing"
+-)
+-
+-func FuzzReader(f *testing.F) {
+-	b := bytes.NewBuffer(nil)
+-	w := NewWriter(b)
+-	inp := []byte("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
+-	err := w.WriteHeader(&Header{
+-		Name: "lorem.txt",
+-		Mode: 0600,
+-		Size: int64(len(inp)),
+-	})
+-	if err != nil {
+-		f.Fatalf("failed to create writer: %s", err)
+-	}
+-	_, err = w.Write(inp)
+-	if err != nil {
+-		f.Fatalf("failed to write file to archive: %s", err)
+-	}
+-	if err := w.Close(); err != nil {
+-		f.Fatalf("failed to write archive: %s", err)
+-	}
+-	f.Add(b.Bytes())
+-
+-	f.Fuzz(func(t *testing.T, b []byte) {
+-		r := NewReader(bytes.NewReader(b))
+-		type file struct {
+-			header  *Header
+-			content []byte
+-		}
+-		files := []file{}
+-		for {
+-			hdr, err := r.Next()
+-			if err == io.EOF {
+-				break
+-			}
+-			if err != nil {
+-				return
+-			}
+-			buf := bytes.NewBuffer(nil)
+-			if _, err := io.Copy(buf, r); err != nil {
+-				continue
+-			}
+-			files = append(files, file{header: hdr, content: buf.Bytes()})
+-		}
+-
+-		// If we were unable to read anything out of the archive don't
+-		// bother trying to roundtrip it.
+-		if len(files) == 0 {
+-			return
+-		}
+-
+-		out := bytes.NewBuffer(nil)
+-		w := NewWriter(out)
+-		for _, f := range files {
+-			if err := w.WriteHeader(f.header); err != nil {
+-				t.Fatalf("unable to write previously parsed header: %s", err)
+-			}
+-			if _, err := w.Write(f.content); err != nil {
+-				t.Fatalf("unable to write previously parsed content: %s", err)
+-			}
+-		}
+-		if err := w.Close(); err != nil {
+-			t.Fatalf("Unable to write archive: %s", err)
+-		}
+-
+-		// TODO: We may want to check if the archive roundtrips. This would require
+-		// taking into account addition of the two zero trailer blocks that Writer.Close
+-		// appends.
+-	})
+-}
+diff --git a/vendor/archive/tar/reader.go b/vendor/archive/tar/reader.go
+index e609c15f27..f645af8016 100644
+--- a/vendor/archive/tar/reader.go
++++ b/vendor/archive/tar/reader.go
+@@ -65,7 +65,7 @@ func (tr *Reader) next() (*Header, error) {
+ 	format := FormatUSTAR | FormatPAX | FormatGNU
+ 	for {
+ 		// Discard the remainder of the file and any padding.
+-		if err := discard(tr.r, tr.curr.physicalRemaining()); err != nil {
++		if err := discard(tr.r, tr.curr.PhysicalRemaining()); err != nil {
+ 			return nil, err
+ 		}
+ 		if _, err := tryReadFull(tr.r, tr.blk[:tr.pad]); err != nil {
+@@ -355,7 +355,7 @@ func (tr *Reader) readHeader() (*Header, *block, error) {
+ 	}
+ 
+ 	// Verify the header matches a known format.
+-	format := tr.blk.getFormat()
++	format := tr.blk.GetFormat()
+ 	if format == FormatUnknown {
+ 		return nil, nil, ErrHeader
+ 	}
+@@ -364,30 +364,30 @@ func (tr *Reader) readHeader() (*Header, *block, error) {
+ 	hdr := new(Header)
+ 
+ 	// Unpack the V7 header.
+-	v7 := tr.blk.toV7()
+-	hdr.Typeflag = v7.typeFlag()[0]
+-	hdr.Name = p.parseString(v7.name())
+-	hdr.Linkname = p.parseString(v7.linkName())
+-	hdr.Size = p.parseNumeric(v7.size())
+-	hdr.Mode = p.parseNumeric(v7.mode())
+-	hdr.Uid = int(p.parseNumeric(v7.uid()))
+-	hdr.Gid = int(p.parseNumeric(v7.gid()))
+-	hdr.ModTime = time.Unix(p.parseNumeric(v7.modTime()), 0)
++	v7 := tr.blk.V7()
++	hdr.Typeflag = v7.TypeFlag()[0]
++	hdr.Name = p.parseString(v7.Name())
++	hdr.Linkname = p.parseString(v7.LinkName())
++	hdr.Size = p.parseNumeric(v7.Size())
++	hdr.Mode = p.parseNumeric(v7.Mode())
++	hdr.Uid = int(p.parseNumeric(v7.UID()))
++	hdr.Gid = int(p.parseNumeric(v7.GID()))
++	hdr.ModTime = time.Unix(p.parseNumeric(v7.ModTime()), 0)
+ 
+ 	// Unpack format specific fields.
+ 	if format > formatV7 {
+-		ustar := tr.blk.toUSTAR()
+-		hdr.Uname = p.parseString(ustar.userName())
+-		hdr.Gname = p.parseString(ustar.groupName())
+-		hdr.Devmajor = p.parseNumeric(ustar.devMajor())
+-		hdr.Devminor = p.parseNumeric(ustar.devMinor())
++		ustar := tr.blk.USTAR()
++		hdr.Uname = p.parseString(ustar.UserName())
++		hdr.Gname = p.parseString(ustar.GroupName())
++		hdr.Devmajor = p.parseNumeric(ustar.DevMajor())
++		hdr.Devminor = p.parseNumeric(ustar.DevMinor())
+ 
+ 		var prefix string
+ 		switch {
+ 		case format.has(FormatUSTAR | FormatPAX):
+ 			hdr.Format = format
+-			ustar := tr.blk.toUSTAR()
+-			prefix = p.parseString(ustar.prefix())
++			ustar := tr.blk.USTAR()
++			prefix = p.parseString(ustar.Prefix())
+ 
+ 			// For Format detection, check if block is properly formatted since
+ 			// the parser is more liberal than what USTAR actually permits.
+@@ -396,23 +396,23 @@ func (tr *Reader) readHeader() (*Header, *block, error) {
+ 				hdr.Format = FormatUnknown // Non-ASCII characters in block.
+ 			}
+ 			nul := func(b []byte) bool { return int(b[len(b)-1]) == 0 }
+-			if !(nul(v7.size()) && nul(v7.mode()) && nul(v7.uid()) && nul(v7.gid()) &&
+-				nul(v7.modTime()) && nul(ustar.devMajor()) && nul(ustar.devMinor())) {
++			if !(nul(v7.Size()) && nul(v7.Mode()) && nul(v7.UID()) && nul(v7.GID()) &&
++				nul(v7.ModTime()) && nul(ustar.DevMajor()) && nul(ustar.DevMinor())) {
+ 				hdr.Format = FormatUnknown // Numeric fields must end in NUL
+ 			}
+ 		case format.has(formatSTAR):
+-			star := tr.blk.toSTAR()
+-			prefix = p.parseString(star.prefix())
+-			hdr.AccessTime = time.Unix(p.parseNumeric(star.accessTime()), 0)
+-			hdr.ChangeTime = time.Unix(p.parseNumeric(star.changeTime()), 0)
++			star := tr.blk.STAR()
++			prefix = p.parseString(star.Prefix())
++			hdr.AccessTime = time.Unix(p.parseNumeric(star.AccessTime()), 0)
++			hdr.ChangeTime = time.Unix(p.parseNumeric(star.ChangeTime()), 0)
+ 		case format.has(FormatGNU):
+ 			hdr.Format = format
+ 			var p2 parser
+-			gnu := tr.blk.toGNU()
+-			if b := gnu.accessTime(); b[0] != 0 {
++			gnu := tr.blk.GNU()
++			if b := gnu.AccessTime(); b[0] != 0 {
+ 				hdr.AccessTime = time.Unix(p2.parseNumeric(b), 0)
+ 			}
+-			if b := gnu.changeTime(); b[0] != 0 {
++			if b := gnu.ChangeTime(); b[0] != 0 {
+ 				hdr.ChangeTime = time.Unix(p2.parseNumeric(b), 0)
+ 			}
+ 
+@@ -439,8 +439,8 @@ func (tr *Reader) readHeader() (*Header, *block, error) {
+ 			// See https://golang.org/issues/21005
+ 			if p2.err != nil {
+ 				hdr.AccessTime, hdr.ChangeTime = time.Time{}, time.Time{}
+-				ustar := tr.blk.toUSTAR()
+-				if s := p.parseString(ustar.prefix()); isASCII(s) {
++				ustar := tr.blk.USTAR()
++				if s := p.parseString(ustar.Prefix()); isASCII(s) {
+ 					prefix = s
+ 				}
+ 				hdr.Format = FormatUnknown // Buggy file is not GNU
+@@ -465,38 +465,38 @@ func (tr *Reader) readOldGNUSparseMap(hdr *Header, blk *block) (sparseDatas, err
+ 	// Make sure that the input format is GNU.
+ 	// Unfortunately, the STAR format also has a sparse header format that uses
+ 	// the same type flag but has a completely different layout.
+-	if blk.getFormat() != FormatGNU {
++	if blk.GetFormat() != FormatGNU {
+ 		return nil, ErrHeader
+ 	}
+ 	hdr.Format.mayOnlyBe(FormatGNU)
+ 
+ 	var p parser
+-	hdr.Size = p.parseNumeric(blk.toGNU().realSize())
++	hdr.Size = p.parseNumeric(blk.GNU().RealSize())
+ 	if p.err != nil {
+ 		return nil, p.err
+ 	}
+-	s := blk.toGNU().sparse()
+-	spd := make(sparseDatas, 0, s.maxEntries())
++	s := blk.GNU().Sparse()
++	spd := make(sparseDatas, 0, s.MaxEntries())
+ 	for {
+-		for i := 0; i < s.maxEntries(); i++ {
++		for i := 0; i < s.MaxEntries(); i++ {
+ 			// This termination condition is identical to GNU and BSD tar.
+-			if s.entry(i).offset()[0] == 0x00 {
++			if s.Entry(i).Offset()[0] == 0x00 {
+ 				break // Don't return, need to process extended headers (even if empty)
+ 			}
+-			offset := p.parseNumeric(s.entry(i).offset())
+-			length := p.parseNumeric(s.entry(i).length())
++			offset := p.parseNumeric(s.Entry(i).Offset())
++			length := p.parseNumeric(s.Entry(i).Length())
+ 			if p.err != nil {
+ 				return nil, p.err
+ 			}
+ 			spd = append(spd, sparseEntry{Offset: offset, Length: length})
+ 		}
+ 
+-		if s.isExtended()[0] > 0 {
++		if s.IsExtended()[0] > 0 {
+ 			// There are more entries. Read an extension header and parse its entries.
+ 			if _, err := mustReadFull(tr.r, blk[:]); err != nil {
+ 				return nil, err
+ 			}
+-			s = blk.toSparse()
++			s = blk.Sparse()
+ 			continue
+ 		}
+ 		return spd, nil // Done
+@@ -678,13 +678,11 @@ func (fr *regFileReader) WriteTo(w io.Writer) (int64, error) {
+ 	return io.Copy(w, struct{ io.Reader }{fr})
+ }
+ 
+-// logicalRemaining implements fileState.logicalRemaining.
+-func (fr regFileReader) logicalRemaining() int64 {
++func (fr regFileReader) LogicalRemaining() int64 {
+ 	return fr.nb
+ }
+ 
+-// logicalRemaining implements fileState.physicalRemaining.
+-func (fr regFileReader) physicalRemaining() int64 {
++func (fr regFileReader) PhysicalRemaining() int64 {
+ 	return fr.nb
+ }
+ 
+@@ -696,9 +694,9 @@ type sparseFileReader struct {
+ }
+ 
+ func (sr *sparseFileReader) Read(b []byte) (n int, err error) {
+-	finished := int64(len(b)) >= sr.logicalRemaining()
++	finished := int64(len(b)) >= sr.LogicalRemaining()
+ 	if finished {
+-		b = b[:sr.logicalRemaining()]
++		b = b[:sr.LogicalRemaining()]
+ 	}
+ 
+ 	b0 := b
+@@ -726,7 +724,7 @@ func (sr *sparseFileReader) Read(b []byte) (n int, err error) {
+ 		return n, errMissData // Less data in dense file than sparse file
+ 	case err != nil:
+ 		return n, err
+-	case sr.logicalRemaining() == 0 && sr.physicalRemaining() > 0:
++	case sr.LogicalRemaining() == 0 && sr.PhysicalRemaining() > 0:
+ 		return n, errUnrefData // More data in dense file than sparse file
+ 	case finished:
+ 		return n, io.EOF
+@@ -748,7 +746,7 @@ func (sr *sparseFileReader) WriteTo(w io.Writer) (n int64, err error) {
+ 
+ 	var writeLastByte bool
+ 	pos0 := sr.pos
+-	for sr.logicalRemaining() > 0 && !writeLastByte && err == nil {
++	for sr.LogicalRemaining() > 0 && !writeLastByte && err == nil {
+ 		var nf int64 // Size of fragment
+ 		holeStart, holeEnd := sr.sp[0].Offset, sr.sp[0].endOffset()
+ 		if sr.pos < holeStart { // In a data fragment
+@@ -756,7 +754,7 @@ func (sr *sparseFileReader) WriteTo(w io.Writer) (n int64, err error) {
+ 			nf, err = io.CopyN(ws, sr.fr, nf)
+ 		} else { // In a hole fragment
+ 			nf = holeEnd - sr.pos
+-			if sr.physicalRemaining() == 0 {
++			if sr.PhysicalRemaining() == 0 {
+ 				writeLastByte = true
+ 				nf--
+ 			}
+@@ -781,18 +779,18 @@ func (sr *sparseFileReader) WriteTo(w io.Writer) (n int64, err error) {
+ 		return n, errMissData // Less data in dense file than sparse file
+ 	case err != nil:
+ 		return n, err
+-	case sr.logicalRemaining() == 0 && sr.physicalRemaining() > 0:
++	case sr.LogicalRemaining() == 0 && sr.PhysicalRemaining() > 0:
+ 		return n, errUnrefData // More data in dense file than sparse file
+ 	default:
+ 		return n, nil
+ 	}
+ }
+ 
+-func (sr sparseFileReader) logicalRemaining() int64 {
++func (sr sparseFileReader) LogicalRemaining() int64 {
+ 	return sr.sp[len(sr.sp)-1].endOffset() - sr.pos
+ }
+-func (sr sparseFileReader) physicalRemaining() int64 {
+-	return sr.fr.physicalRemaining()
++func (sr sparseFileReader) PhysicalRemaining() int64 {
++	return sr.fr.PhysicalRemaining()
+ }
+ 
+ type zeroReader struct{}
+diff --git a/vendor/archive/tar/reader_test.go b/vendor/archive/tar/reader_test.go
+index 140c736429..5a644a43a4 100644
+--- a/vendor/archive/tar/reader_test.go
++++ b/vendor/archive/tar/reader_test.go
+@@ -1030,12 +1030,12 @@ func TestParsePAX(t *testing.T) {
+ 
+ func TestReadOldGNUSparseMap(t *testing.T) {
+ 	populateSparseMap := func(sa sparseArray, sps []string) []string {
+-		for i := 0; len(sps) > 0 && i < sa.maxEntries(); i++ {
+-			copy(sa.entry(i), sps[0])
++		for i := 0; len(sps) > 0 && i < sa.MaxEntries(); i++ {
++			copy(sa.Entry(i), sps[0])
+ 			sps = sps[1:]
+ 		}
+ 		if len(sps) > 0 {
+-			copy(sa.isExtended(), "\x80")
++			copy(sa.IsExtended(), "\x80")
+ 		}
+ 		return sps
+ 	}
+@@ -1043,19 +1043,19 @@ func TestReadOldGNUSparseMap(t *testing.T) {
+ 	makeInput := func(format Format, size string, sps ...string) (out []byte) {
+ 		// Write the initial GNU header.
+ 		var blk block
+-		gnu := blk.toGNU()
+-		sparse := gnu.sparse()
+-		copy(gnu.realSize(), size)
++		gnu := blk.GNU()
++		sparse := gnu.Sparse()
++		copy(gnu.RealSize(), size)
+ 		sps = populateSparseMap(sparse, sps)
+ 		if format != FormatUnknown {
+-			blk.setFormat(format)
++			blk.SetFormat(format)
+ 		}
+ 		out = append(out, blk[:]...)
+ 
+ 		// Write extended sparse blocks.
+ 		for len(sps) > 0 {
+ 			var blk block
+-			sps = populateSparseMap(blk.toSparse(), sps)
++			sps = populateSparseMap(blk.Sparse(), sps)
+ 			out = append(out, blk[:]...)
+ 		}
+ 		return out
+@@ -1368,11 +1368,11 @@ func TestFileReader(t *testing.T) {
+ 			wantCnt int64
+ 			wantErr error
+ 		}
+-		testRemaining struct { // logicalRemaining() == wantLCnt, physicalRemaining() == wantPCnt
++		testRemaining struct { // LogicalRemaining() == wantLCnt, PhysicalRemaining() == wantPCnt
+ 			wantLCnt int64
+ 			wantPCnt int64
+ 		}
+-		testFnc any // testRead | testWriteTo | testRemaining
++		testFnc interface{} // testRead | testWriteTo | testRemaining
+ 	)
+ 
+ 	type (
+@@ -1385,7 +1385,7 @@ func TestFileReader(t *testing.T) {
+ 			spd     sparseDatas
+ 			size    int64
+ 		}
+-		fileMaker any // makeReg | makeSparse
++		fileMaker interface{} // makeReg | makeSparse
+ 	)
+ 
+ 	vectors := []struct {
+@@ -1605,11 +1605,11 @@ func TestFileReader(t *testing.T) {
+ 					t.Errorf("test %d.%d, expected %d more operations", i, j, len(f.ops))
+ 				}
+ 			case testRemaining:
+-				if got := fr.logicalRemaining(); got != tf.wantLCnt {
+-					t.Errorf("test %d.%d, logicalRemaining() = %d, want %d", i, j, got, tf.wantLCnt)
++				if got := fr.LogicalRemaining(); got != tf.wantLCnt {
++					t.Errorf("test %d.%d, LogicalRemaining() = %d, want %d", i, j, got, tf.wantLCnt)
+ 				}
+-				if got := fr.physicalRemaining(); got != tf.wantPCnt {
+-					t.Errorf("test %d.%d, physicalRemaining() = %d, want %d", i, j, got, tf.wantPCnt)
++				if got := fr.PhysicalRemaining(); got != tf.wantPCnt {
++					t.Errorf("test %d.%d, PhysicalRemaining() = %d, want %d", i, j, got, tf.wantPCnt)
+ 				}
+ 			default:
+ 				t.Fatalf("test %d.%d, unknown test operation: %T", i, j, tf)
+diff --git a/vendor/archive/tar/stat_actime1.go b/vendor/archive/tar/stat_actime1.go
+index c4c2480fee..4fdf2a04b3 100644
+--- a/vendor/archive/tar/stat_actime1.go
++++ b/vendor/archive/tar/stat_actime1.go
+@@ -3,6 +3,7 @@
+ // license that can be found in the LICENSE file.
+ 
+ //go:build aix || linux || dragonfly || openbsd || solaris
++// +build aix linux dragonfly openbsd solaris
+ 
+ package tar
+ 
+diff --git a/vendor/archive/tar/stat_actime2.go b/vendor/archive/tar/stat_actime2.go
+index f76d6be220..5a9a35cbb4 100644
+--- a/vendor/archive/tar/stat_actime2.go
++++ b/vendor/archive/tar/stat_actime2.go
+@@ -3,6 +3,7 @@
+ // license that can be found in the LICENSE file.
+ 
+ //go:build darwin || freebsd || netbsd
++// +build darwin freebsd netbsd
+ 
+ package tar
+ 
+diff --git a/vendor/archive/tar/stat_unix.go b/vendor/archive/tar/stat_unix.go
+index b743c76b8c..4a5bca0312 100644
+--- a/vendor/archive/tar/stat_unix.go
++++ b/vendor/archive/tar/stat_unix.go
+@@ -3,6 +3,7 @@
+ // license that can be found in the LICENSE file.
+ 
+ //go:build aix || linux || darwin || dragonfly || freebsd || openbsd || netbsd || solaris
++// +build aix linux darwin dragonfly freebsd openbsd netbsd solaris
+ 
+ package tar
+ 
+diff --git a/vendor/archive/tar/strconv.go b/vendor/archive/tar/strconv.go
+index 275db6f026..f0b61e6dba 100644
+--- a/vendor/archive/tar/strconv.go
++++ b/vendor/archive/tar/strconv.go
+@@ -14,7 +14,7 @@ import (
+ 
+ // hasNUL reports whether the NUL character exists within s.
+ func hasNUL(s string) bool {
+-	return strings.Contains(s, "\x00")
++	return strings.IndexByte(s, 0) >= 0
+ }
+ 
+ // isASCII reports whether the input is an ASCII C-style string.
+@@ -201,7 +201,10 @@ func parsePAXTime(s string) (time.Time, error) {
+ 	const maxNanoSecondDigits = 9
+ 
+ 	// Split string into seconds and sub-seconds parts.
+-	ss, sn, _ := strings.Cut(s, ".")
++	ss, sn := s, ""
++	if pos := strings.IndexByte(s, '.'); pos >= 0 {
++		ss, sn = s[:pos], s[pos+1:]
++	}
+ 
+ 	// Parse the seconds.
+ 	secs, err := strconv.ParseInt(ss, 10, 64)
+@@ -251,32 +254,48 @@ func formatPAXTime(ts time.Time) (s string) {
+ // return the remainder as r.
+ func parsePAXRecord(s string) (k, v, r string, err error) {
+ 	// The size field ends at the first space.
+-	nStr, rest, ok := strings.Cut(s, " ")
+-	if !ok {
++	sp := strings.IndexByte(s, ' ')
++	if sp == -1 {
+ 		return "", "", s, ErrHeader
+ 	}
+ 
+ 	// Parse the first token as a decimal integer.
+-	n, perr := strconv.ParseInt(nStr, 10, 0) // Intentionally parse as native int
+-	if perr != nil || n < 5 || n > int64(len(s)) {
++	n, perr := strconv.ParseInt(s[:sp], 10, 0) // Intentionally parse as native int
++	if perr != nil || n < 5 || int64(len(s)) < n {
+ 		return "", "", s, ErrHeader
+ 	}
+-	n -= int64(len(nStr) + 1) // convert from index in s to index in rest
+-	if n <= 0 {
++
++	afterSpace := int64(sp + 1)
++	beforeLastNewLine := n - 1
++	// In some cases, "length" was perhaps padded/malformed, and
++	// trying to index past where the space supposedly is goes past
++	// the end of the actual record.
++	// For example:
++	//    "0000000000000000000000000000000030 mtime=1432668921.098285006\n30 ctime=2147483649.15163319"
++	//                                  ^     ^
++	//                                  |     |
++	//                                  |  afterSpace=35
++	//                                  |
++	//                          beforeLastNewLine=29
++	// yet indexOf(firstSpace) MUST BE before endOfRecord.
++	//
++	// See https://golang.org/issues/40196.
++	if afterSpace >= beforeLastNewLine {
+ 		return "", "", s, ErrHeader
+ 	}
+ 
+ 	// Extract everything between the space and the final newline.
+-	rec, nl, rem := rest[:n-1], rest[n-1:n], rest[n:]
++	rec, nl, rem := s[afterSpace:beforeLastNewLine], s[beforeLastNewLine:n], s[n:]
+ 	if nl != "\n" {
+ 		return "", "", s, ErrHeader
+ 	}
+ 
+ 	// The first equals separates the key from the value.
+-	k, v, ok = strings.Cut(rec, "=")
+-	if !ok {
++	eq := strings.IndexByte(rec, '=')
++	if eq == -1 {
+ 		return "", "", s, ErrHeader
+ 	}
++	k, v = rec[:eq], rec[eq+1:]
+ 
+ 	if !validPAXRecord(k, v) {
+ 		return "", "", s, ErrHeader
+@@ -314,7 +333,7 @@ func formatPAXRecord(k, v string) (string, error) {
+ // for the PAX version of the USTAR string fields.
+ // The key must not contain an '=' character.
+ func validPAXRecord(k, v string) bool {
+-	if k == "" || strings.Contains(k, "=") {
++	if k == "" || strings.IndexByte(k, '=') >= 0 {
+ 		return false
+ 	}
+ 	switch k {
+diff --git a/vendor/archive/tar/tar_test.go b/vendor/archive/tar/tar_test.go
+index a476f5eb01..e9fafc7cc7 100644
+--- a/vendor/archive/tar/tar_test.go
++++ b/vendor/archive/tar/tar_test.go
+@@ -23,7 +23,7 @@ import (
+ 
+ type testError struct{ error }
+ 
+-type fileOps []any // []T where T is (string | int64)
++type fileOps []interface{} // []T where T is (string | int64)
+ 
+ // testFile is an io.ReadWriteSeeker where the IO operations performed
+ // on it must match the list of operations in ops.
+diff --git a/vendor/archive/tar/writer.go b/vendor/archive/tar/writer.go
+index 9b2e3e25d4..893eac00ae 100644
+--- a/vendor/archive/tar/writer.go
++++ b/vendor/archive/tar/writer.go
+@@ -50,7 +50,7 @@ func (tw *Writer) Flush() error {
+ 	if tw.err != nil {
+ 		return tw.err
+ 	}
+-	if nb := tw.curr.logicalRemaining(); nb > 0 {
++	if nb := tw.curr.LogicalRemaining(); nb > 0 {
+ 		return fmt.Errorf("archive/tar: missed writing %d bytes", nb)
+ 	}
+ 	if _, tw.err = tw.w.Write(zeroBlock[:tw.pad]); tw.err != nil {
+@@ -117,8 +117,8 @@ func (tw *Writer) writeUSTARHeader(hdr *Header) error {
+ 	// Pack the main header.
+ 	var f formatter
+ 	blk := tw.templateV7Plus(hdr, f.formatString, f.formatOctal)
+-	f.formatString(blk.toUSTAR().prefix(), namePrefix)
+-	blk.setFormat(FormatUSTAR)
++	f.formatString(blk.USTAR().Prefix(), namePrefix)
++	blk.SetFormat(FormatUSTAR)
+ 	if f.err != nil {
+ 		return f.err // Should never happen since header is validated
+ 	}
+@@ -211,7 +211,7 @@ func (tw *Writer) writePAXHeader(hdr *Header, paxHdrs map[string]string) error {
+ 	var f formatter // Ignore errors since they are expected
+ 	fmtStr := func(b []byte, s string) { f.formatString(b, toASCII(s)) }
+ 	blk := tw.templateV7Plus(hdr, fmtStr, f.formatOctal)
+-	blk.setFormat(FormatPAX)
++	blk.SetFormat(FormatPAX)
+ 	if err := tw.writeRawHeader(blk, hdr.Size, hdr.Typeflag); err != nil {
+ 		return err
+ 	}
+@@ -253,10 +253,10 @@ func (tw *Writer) writeGNUHeader(hdr *Header) error {
+ 	var spb []byte
+ 	blk := tw.templateV7Plus(hdr, f.formatString, f.formatNumeric)
+ 	if !hdr.AccessTime.IsZero() {
+-		f.formatNumeric(blk.toGNU().accessTime(), hdr.AccessTime.Unix())
++		f.formatNumeric(blk.GNU().AccessTime(), hdr.AccessTime.Unix())
+ 	}
+ 	if !hdr.ChangeTime.IsZero() {
+-		f.formatNumeric(blk.toGNU().changeTime(), hdr.ChangeTime.Unix())
++		f.formatNumeric(blk.GNU().ChangeTime(), hdr.ChangeTime.Unix())
+ 	}
+ 	// TODO(dsnet): Re-enable this when adding sparse support.
+ 	// See https://golang.org/issue/22735
+@@ -296,7 +296,7 @@ func (tw *Writer) writeGNUHeader(hdr *Header) error {
+ 			f.formatNumeric(blk.GNU().RealSize(), realSize)
+ 		}
+ 	*/
+-	blk.setFormat(FormatGNU)
++	blk.SetFormat(FormatGNU)
+ 	if err := tw.writeRawHeader(blk, hdr.Size, hdr.Typeflag); err != nil {
+ 		return err
+ 	}
+@@ -324,28 +324,28 @@ type (
+ // The block returned is only valid until the next call to
+ // templateV7Plus or writeRawFile.
+ func (tw *Writer) templateV7Plus(hdr *Header, fmtStr stringFormatter, fmtNum numberFormatter) *block {
+-	tw.blk.reset()
++	tw.blk.Reset()
+ 
+ 	modTime := hdr.ModTime
+ 	if modTime.IsZero() {
+ 		modTime = time.Unix(0, 0)
+ 	}
+ 
+-	v7 := tw.blk.toV7()
+-	v7.typeFlag()[0] = hdr.Typeflag
+-	fmtStr(v7.name(), hdr.Name)
+-	fmtStr(v7.linkName(), hdr.Linkname)
+-	fmtNum(v7.mode(), hdr.Mode)
+-	fmtNum(v7.uid(), int64(hdr.Uid))
+-	fmtNum(v7.gid(), int64(hdr.Gid))
+-	fmtNum(v7.size(), hdr.Size)
+-	fmtNum(v7.modTime(), modTime.Unix())
++	v7 := tw.blk.V7()
++	v7.TypeFlag()[0] = hdr.Typeflag
++	fmtStr(v7.Name(), hdr.Name)
++	fmtStr(v7.LinkName(), hdr.Linkname)
++	fmtNum(v7.Mode(), hdr.Mode)
++	fmtNum(v7.UID(), int64(hdr.Uid))
++	fmtNum(v7.GID(), int64(hdr.Gid))
++	fmtNum(v7.Size(), hdr.Size)
++	fmtNum(v7.ModTime(), modTime.Unix())
+ 
+-	ustar := tw.blk.toUSTAR()
+-	fmtStr(ustar.userName(), hdr.Uname)
+-	fmtStr(ustar.groupName(), hdr.Gname)
+-	fmtNum(ustar.devMajor(), hdr.Devmajor)
+-	fmtNum(ustar.devMinor(), hdr.Devminor)
++	ustar := tw.blk.USTAR()
++	fmtStr(ustar.UserName(), hdr.Uname)
++	fmtStr(ustar.GroupName(), hdr.Gname)
++	fmtNum(ustar.DevMajor(), hdr.Devmajor)
++	fmtNum(ustar.DevMinor(), hdr.Devminor)
+ 
+ 	return &tw.blk
+ }
+@@ -354,7 +354,7 @@ func (tw *Writer) templateV7Plus(hdr *Header, fmtStr stringFormatter, fmtNum num
+ // It uses format to encode the header format and will write data as the body.
+ // It uses default values for all of the other fields (as BSD and GNU tar does).
+ func (tw *Writer) writeRawFile(name, data string, flag byte, format Format) error {
+-	tw.blk.reset()
++	tw.blk.Reset()
+ 
+ 	// Best effort for the filename.
+ 	name = toASCII(name)
+@@ -364,15 +364,15 @@ func (tw *Writer) writeRawFile(name, data string, flag byte, format Format) erro
+ 	name = strings.TrimRight(name, "/")
+ 
+ 	var f formatter
+-	v7 := tw.blk.toV7()
+-	v7.typeFlag()[0] = flag
+-	f.formatString(v7.name(), name)
+-	f.formatOctal(v7.mode(), 0)
+-	f.formatOctal(v7.uid(), 0)
+-	f.formatOctal(v7.gid(), 0)
+-	f.formatOctal(v7.size(), int64(len(data))) // Must be < 8GiB
+-	f.formatOctal(v7.modTime(), 0)
+-	tw.blk.setFormat(format)
++	v7 := tw.blk.V7()
++	v7.TypeFlag()[0] = flag
++	f.formatString(v7.Name(), name)
++	f.formatOctal(v7.Mode(), 0)
++	f.formatOctal(v7.UID(), 0)
++	f.formatOctal(v7.GID(), 0)
++	f.formatOctal(v7.Size(), int64(len(data))) // Must be < 8GiB
++	f.formatOctal(v7.ModTime(), 0)
++	tw.blk.SetFormat(format)
+ 	if f.err != nil {
+ 		return f.err // Only occurs if size condition is violated
+ 	}
+@@ -514,13 +514,10 @@ func (fw *regFileWriter) ReadFrom(r io.Reader) (int64, error) {
+ 	return io.Copy(struct{ io.Writer }{fw}, r)
+ }
+ 
+-// logicalRemaining implements fileState.logicalRemaining.
+-func (fw regFileWriter) logicalRemaining() int64 {
++func (fw regFileWriter) LogicalRemaining() int64 {
+ 	return fw.nb
+ }
+-
+-// logicalRemaining implements fileState.physicalRemaining.
+-func (fw regFileWriter) physicalRemaining() int64 {
++func (fw regFileWriter) PhysicalRemaining() int64 {
+ 	return fw.nb
+ }
+ 
+@@ -532,9 +529,9 @@ type sparseFileWriter struct {
+ }
+ 
+ func (sw *sparseFileWriter) Write(b []byte) (n int, err error) {
+-	overwrite := int64(len(b)) > sw.logicalRemaining()
++	overwrite := int64(len(b)) > sw.LogicalRemaining()
+ 	if overwrite {
+-		b = b[:sw.logicalRemaining()]
++		b = b[:sw.LogicalRemaining()]
+ 	}
+ 
+ 	b0 := b
+@@ -562,7 +559,7 @@ func (sw *sparseFileWriter) Write(b []byte) (n int, err error) {
+ 		return n, errMissData // Not possible; implies bug in validation logic
+ 	case err != nil:
+ 		return n, err
+-	case sw.logicalRemaining() == 0 && sw.physicalRemaining() > 0:
++	case sw.LogicalRemaining() == 0 && sw.PhysicalRemaining() > 0:
+ 		return n, errUnrefData // Not possible; implies bug in validation logic
+ 	case overwrite:
+ 		return n, ErrWriteTooLong
+@@ -584,12 +581,12 @@ func (sw *sparseFileWriter) ReadFrom(r io.Reader) (n int64, err error) {
+ 
+ 	var readLastByte bool
+ 	pos0 := sw.pos
+-	for sw.logicalRemaining() > 0 && !readLastByte && err == nil {
++	for sw.LogicalRemaining() > 0 && !readLastByte && err == nil {
+ 		var nf int64 // Size of fragment
+ 		dataStart, dataEnd := sw.sp[0].Offset, sw.sp[0].endOffset()
+ 		if sw.pos < dataStart { // In a hole fragment
+ 			nf = dataStart - sw.pos
+-			if sw.physicalRemaining() == 0 {
++			if sw.PhysicalRemaining() == 0 {
+ 				readLastByte = true
+ 				nf--
+ 			}
+@@ -619,18 +616,18 @@ func (sw *sparseFileWriter) ReadFrom(r io.Reader) (n int64, err error) {
+ 		return n, errMissData // Not possible; implies bug in validation logic
+ 	case err != nil:
+ 		return n, err
+-	case sw.logicalRemaining() == 0 && sw.physicalRemaining() > 0:
++	case sw.LogicalRemaining() == 0 && sw.PhysicalRemaining() > 0:
+ 		return n, errUnrefData // Not possible; implies bug in validation logic
+ 	default:
+ 		return n, ensureEOF(rs)
+ 	}
+ }
+ 
+-func (sw sparseFileWriter) logicalRemaining() int64 {
++func (sw sparseFileWriter) LogicalRemaining() int64 {
+ 	return sw.sp[len(sw.sp)-1].endOffset() - sw.pos
+ }
+-func (sw sparseFileWriter) physicalRemaining() int64 {
+-	return sw.fw.physicalRemaining()
++func (sw sparseFileWriter) PhysicalRemaining() int64 {
++	return sw.fw.PhysicalRemaining()
+ }
+ 
+ // zeroWriter may only be written with NULs, otherwise it returns errWriteHole.
+diff --git a/vendor/archive/tar/writer_test.go b/vendor/archive/tar/writer_test.go
+index 640264984a..4e709e5cac 100644
+--- a/vendor/archive/tar/writer_test.go
++++ b/vendor/archive/tar/writer_test.go
+@@ -67,7 +67,7 @@ func TestWriter(t *testing.T) {
+ 		testClose struct { // Close() == wantErr
+ 			wantErr error
+ 		}
+-		testFnc any // testHeader | testWrite | testReadFrom | testClose
++		testFnc interface{} // testHeader | testWrite | testReadFrom | testClose
+ 	)
+ 
+ 	vectors := []struct {
+@@ -987,9 +987,11 @@ func TestIssue12594(t *testing.T) {
+ 		// The prefix field should never appear in the GNU format.
+ 		var blk block
+ 		copy(blk[:], b.Bytes())
+-		prefix := string(blk.toUSTAR().prefix())
+-		prefix, _, _ = strings.Cut(prefix, "\x00") // Truncate at the NUL terminator
+-		if blk.getFormat() == FormatGNU && len(prefix) > 0 && strings.HasPrefix(name, prefix) {
++		prefix := string(blk.USTAR().Prefix())
++		if i := strings.IndexByte(prefix, 0); i >= 0 {
++			prefix = prefix[:i] // Truncate at the NUL terminator
++		}
++		if blk.GetFormat() == FormatGNU && len(prefix) > 0 && strings.HasPrefix(name, prefix) {
+ 			t.Errorf("test %d, found prefix in GNU format: %s", i, prefix)
+ 		}
+ 
+@@ -1054,11 +1056,11 @@ func TestFileWriter(t *testing.T) {
+ 			wantCnt int64
+ 			wantErr error
+ 		}
+-		testRemaining struct { // logicalRemaining() == wantLCnt, physicalRemaining() == wantPCnt
++		testRemaining struct { // LogicalRemaining() == wantLCnt, PhysicalRemaining() == wantPCnt
+ 			wantLCnt int64
+ 			wantPCnt int64
+ 		}
+-		testFnc any // testWrite | testReadFrom | testRemaining
++		testFnc interface{} // testWrite | testReadFrom | testRemaining
+ 	)
+ 
+ 	type (
+@@ -1071,7 +1073,7 @@ func TestFileWriter(t *testing.T) {
+ 			sph     sparseHoles
+ 			size    int64
+ 		}
+-		fileMaker any // makeReg | makeSparse
++		fileMaker interface{} // makeReg | makeSparse
+ 	)
+ 
+ 	vectors := []struct {
+@@ -1317,11 +1319,11 @@ func TestFileWriter(t *testing.T) {
+ 					t.Errorf("test %d.%d, expected %d more operations", i, j, len(f.ops))
+ 				}
+ 			case testRemaining:
+-				if got := fw.logicalRemaining(); got != tf.wantLCnt {
+-					t.Errorf("test %d.%d, logicalRemaining() = %d, want %d", i, j, got, tf.wantLCnt)
++				if got := fw.LogicalRemaining(); got != tf.wantLCnt {
++					t.Errorf("test %d.%d, LogicalRemaining() = %d, want %d", i, j, got, tf.wantLCnt)
+ 				}
+-				if got := fw.physicalRemaining(); got != tf.wantPCnt {
+-					t.Errorf("test %d.%d, physicalRemaining() = %d, want %d", i, j, got, tf.wantPCnt)
++				if got := fw.PhysicalRemaining(); got != tf.wantPCnt {
++					t.Errorf("test %d.%d, PhysicalRemaining() = %d, want %d", i, j, got, tf.wantPCnt)
+ 				}
+ 			default:
+ 				t.Fatalf("test %d.%d, unknown test operation: %T", i, j, tf)
+-- 
+2.38.1
+
-- 
2.38.1


