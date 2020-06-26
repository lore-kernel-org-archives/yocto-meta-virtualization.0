Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.11195.1593188099594242987
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 09:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HWWQgwlP;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id y13so5457695lfe.9
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jun 2020 09:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KY3l8+ROwIw8vqkg66yfBgEJiqOEMNb7553ukEIENEM=;
        b=HWWQgwlP7f3eu2FhOaGzRm89spvriN8gVqDXMewG7nsJAD54+8i2dt5suGSnce03Uu
         LwUJrI12AO/u7LBudBTsVVyQhlWwt8UvSmQRufA/xKpr80PkKu6RRmw0nOiyxZOqHCHT
         V94jB2PWRzwBhEtOjoWokeF2SSq2ryoXTbzo3F43MUt5XWAflmeRsfvq5pJRaBsWjdmv
         RdMXy2qPmwQyZLWBsv19vQ09uGoegnENtYbhVlB11tM0P1cFOj1oJJwJl716t/GGeYcW
         uIsP8sg29U9mZu/sORTHmrMldpvzEJHpmU9KE2p79IodmQJoRo9HP9iEsON0Gem8Xm3u
         57Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KY3l8+ROwIw8vqkg66yfBgEJiqOEMNb7553ukEIENEM=;
        b=uP5idh4Mv8a7le9eg8ulxY6lmCW/0y+VmQwjM3gUt0a8s94RifasHMt1txTvzHpM6Z
         vL7B4MBZQimfFvLRCltax1WYLyJqVB7CEA6jssSNoc16B+/4zeMoi5m0WDqTPLYRdIMz
         gKzyHoO39y+w3fcZfhWuqR9gcMnuWpbpDXomMwOf5L28hx1lX9Z3+pTSxChwjntxXTHG
         L+jee9suXtK9L+EnLZrt+w2asb/UryMkTBWPNMKg3Ryxy3xZt2UbCFIuO7bPTbW8g4OQ
         bE22MyFM84nTXHP0ty2fzRZtNJYWE0kh77ohddUmwbIRKGJDpcbFOgkpleauIwo7xLtJ
         NkOw==
X-Gm-Message-State: AOAM531fP8FyVZ3ANImwRnoPpxnrQjQdn8CPYGqyJI4bKqSsUxJCuEs0
	3laCqHca+jVYEj5IUpPZuEK272pz
X-Google-Smtp-Source: ABdhPJwzeSbTe5TZ5z1B4TtdClet4hTPW0QQxRNKMSZ1DLJH5unTqif6IZeHJCshz+JyZQ3jzEy7Xg==
X-Received: by 2002:a19:48d3:: with SMTP id v202mr2303093lfa.202.1593188097435;
        Fri, 26 Jun 2020 09:14:57 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id r11sm6898102lfc.29.2020.06.26.09.14.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 09:14:56 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [meta-virtualization][PATCH] podman: uprev 1.8.1 > 2.0.1
Date: Fri, 26 Jun 2020 18:16:31 +0200
Message-Id: <20200626161631.32481-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Updating to 2.0.1 to pickup bugfixes and security changes. The
following commits comprise this update:

a11c4ead1 Bump to v2.0.1
6a541f680 Merge pull request #6780 from mheon/even_more_201_backports
f7b16d017 Update release notes with further v2.0.1 changes
8bb986137 Fix inspect to display multiple label: changes
2ad9dcc07 Set syslog for exit commands on log-level=debug
723a9e308 Friendly amendment for pr 6751
68543bbec podman run/create: support all transports
c69ce171a systemd generate: allow manual restart of container units in pods
9de1581e9 Revert sending --remote flag to containers
dc22350be Print port mappings in `ps` for ctrs sharing network
48ce67fb5 Merge pull request #6776 from vrothberg/2.0-vendor-common
6eefff647 vendor github.com/containers/common@v0.14.3
0b9143df8 Merge pull request #6758 from mheon/v2.0.1_backports
915f8698f Update release notes for v2.0.1
8e428fa4e utils: drop default mapping when running uid!=0
eb9fd40d2 Set stop signal to 15 when not explicitly set
6594d5d65 podman untag: error if tag doesn't exist
639b809c8 Reformat inspect network settings
01bc6bdda APIv2: Return `StatusCreated` from volume creation
1cc603c1f APIv2:fix: Remove `/json` from compat network EPs
d26662484 Fix ssh-agent support
d94644d35 libpod: specify mappings to the storage
f425aede4 APIv2:doc: Fix swagger doc to refer to volumes
ddf78b2ba Add podman network to bash command completions
bfd303e16 Fix typo in manpage for `podman auto update`.
9a4517b37 Add JSON output field for ps
61bd64573 V2 podman system connection
f81ad0058 wip
cd0b18c24 image load: no args required
8fbfffc08 Re-add PODMAN_USERNS environment variable
0b4dcc7a3 Fix conflicts between privileged and other flags
7ea37dfe1 Bump required go version to 1.13
36d8b6979 Add explicit command to alpine container in test case.
03f952cfa Use POLL_DURATION for timer
07f535d8b Stop following logs using timers
dbce3468e "pod" was being truncated to "po" in the names of the generated systemd unit files.
5d9ec1ce7 rootless_linux: improve error message
37abb88aa Fix podman build handling of --http-proxy flag
27120bfba correct the absolute path of `rm` executable
4af208142 Merge pull request #6711 from lsm5/v2.0-custom-GO_BUILD-backport
0ac4061bd Makefile: allow customizable GO_BUILD
13924bac1 Merge pull request #6695 from cevich/update_v2.0
bade38c32 Merge pull request #6697 from mheon/bump_v2.0.0
c866e584d Update release notes to reflect we are now v2.0
f458c5968 Bump to v2.0.1-dev
eec482cae Bump to v2.0.0
64ba72363 Merge pull request #6694 from mheon/release_notes_2.0
5bda75cfd Update release notes for v2.0.0
89dbd1a91 Merge pull request #6674 from jwhonce/issues/6670
ed91524ae Merge pull request #6637 from jwhonce/issues/6574
ea8e61e4e Fixes #6670
bda4a6982 Correct logic for demux'ing channels
1a2eb3e61 Merge pull request #6677 from baude/pollOnEvents
33a602761 Merge pull request #6690 from vrothberg/fix-6687
f46664546 Poll on events for file reading
bba433ed9 podman images --format json: pretty print
5ec29f8d4 Merge pull request #6684 from vrothberg/fix-ci
334d3b1ef CI: force registry:2.6
a2661b1c2 Merge pull request #6673 from ashley-cui/master
4dc934080 Fix remote docs
e6b9b3ab2 Merge pull request #6656 from mheon/recursive_init
2e621aece Merge pull request #6662 from containers/dependabot/go_modules/k8s.io/apimachinery-0.18.4
1099ad6ac Merge pull request #6669 from vrothberg/unflake-rmi
b20619e5b Allow recursive dependency start with Init()
ec7822795 Bump k8s.io/apimachinery from 0.18.3 to 0.18.4
59cd8a0cf unflake rmi tests
3eb0ad04a Merge pull request #6663 from containers/dependabot/go_modules/k8s.io/api-0.18.4
ad33b2363 Merge pull request #6661 from containers/dependabot/go_modules/go.etcd.io/bbolt-1.3.5
b5f7afd04 Merge pull request #6658 from mheon/experimental_no_more
d0b3035c3 Merge pull request #6611 from lsm5/fix-Makefile-for-varlink
5d161c8ca Bump k8s.io/api from 0.18.3 to 0.18.4
16dbc160c Bump go.etcd.io/bbolt from 1.3.4 to 1.3.5
6472b44c3 Merge pull request #6654 from rhatdan/keepid
6e410ede7 Merge pull request #6647 from rhatdan/caps
43ead88e8 Podman system service is no longer experimental
fe69aa9ba Handle dropping capabilties correctly when running as non root user
7b00e49f6 Merge pull request #6560 from mheon/fix_exec_logdriver
daabbc1a1 Merge pull request #6657 from mheon/bump-2.0.0-rc7
c385e6d36 Don't ignore --user flag in rootless --userns keepid
4b08d9ea5 Bump to v2.0.0-dev
5460ea87d Bump to v2.0.0-rc7
7b5073b46 Merge pull request #6655 from TomSweeneyRedHat/dev/tsweeney/b1_15_0
30c0fc9f1 Makefile: install.varlink needs to create dirs
a76bf114d Merge pull request #6620 from jgallucci32/api-logs-separate
70f6cf7ff Merge pull request #6634 from baude/v2buildfixes
fde8040fa Bump Buildah to v1.15.0
fd184fa4a Merge pull request #6522 from mheon/unless-stopped
585b14a9f Move logs functionality to separate file for APIv2
5694104c2 Merge pull request #6644 from jgallucci32/revert-log-follow
d97b5b04a Merge pull request #6630 from ashley-cui/master
96b442172 Merge pull request #6641 from vrothberg/harden-units
6645e0d6f Merge pull request #6648 from vrothberg/vendor-image
e5c343294 generate systemd: `ExecStopPost` for all units
f29360648 Merge pull request #6631 from rhatdan/hooks
03e99c9b4 Revert #6591 to fix issue with failed tests
ac4f4b148 vendor github.com/containers/image/v5@v5.5.1
6f1440a3e Add support for the unless-stopped restart policy
0e171b7b3 Do not share container log driver for exec
1acd2adcc Merge pull request #6640 from edsantiago/fix_flaky_logs_test
78ad57ebd Merge pull request #6636 from mheon/add_warnings
200afe7a9 Merge pull request #6583 from mheon/inspect_ctr_before_img
65c3a5660 fix misc remote build issues
38391ed25 Merge pull request #6622 from goochjj/podman_fix_init
6d5a432c2 "streaming output" logs test: fix flake
0d2b5532c Merge pull request #5852 from baude/v1prune
241326a9a Podman V2 birth
88c6fd06c Merge pull request #5837 from vrothberg/ignore
57f389728 Merge pull request #5848 from jwhonce/wip/options
8b178f12c Merge pull request #5839 from rhatdan/troubleshoot
1d93d2125 V2 Enable rootless
5def21140 Merge pull request #5842 from baude/v2bloat2
a8a61d976 Add SELinux volume information to troubleshoot.md
8c4d4b58e Merge pull request #5597 from sujil02/systemd-updates
ba430bfe5 podman v2 remove bloat v2
c1bafb8b5 Merge pull request #5844 from baude/apiv2filteridfix
e154249b4 allow filters to work when listing containers
8857ba20a Merge pull request #5835 from containers/dependabot/go_modules/github.com/containers/common-0.9.1
a037d9cd4 Update podman-generate-systemd man page
155a7d661 Merge pull request #5826 from cevich/gate_pip
09e821a8e Merge pull request #5690 from rhatdan/selinux
04e83f63a .gitignore: ignore v2 remote
084cfb81d Merge pull request #5834 from rhatdan/version
897847ccc Bump github.com/containers/common from 0.9.0 to 0.9.1
62803f8d3 Add version to podman info command
d6b3bc18f Merge pull request #5752 from mheon/pod_inspect_structs
c7d17613e Merge pull request #5827 from baude/v2bloat
0f7162d79 Merge pull request #5817 from rhatdan/selinux1
82ce9703e Add basic structure of output for APIv2 pod inspect
30d2964ff v2 bloat pruning phase 2
3500a8bc3 Merge pull request #5830 from baude/v2runtime
c4ca3c71f Add support for selecting kvm and systemd labels
6e9622aa9 Merge pull request #5775 from sujil02/v2-container-prune
ac94a96a7 Fix up SELinux labeling
195cb1127 Merge pull request #5671 from edsantiago/swagger-check
693a8039c Merge pull request #5776 from vrothberg/au
bbc0c4a97 podmanv2 fix runtime assignment
97bded830 Merge pull request #5823 from mheon/update_readme_19
337e8d6d2 Merge pull request #5786 from containers/dependabot/go_modules/github.com/containers/common-0.9.0
e394ff407 Cirrus: Fix gate container build failure
2aca1b7f9 logformat: handle apiv2 results, add anchor links
ef297d466 Merge pull request #5767 from edsantiago/logformat_add_anchors_and_apiv2
9b78bf929 Merge pull request #5770 from baude/v2events
d522755b5 Update README to reflect that latest version is v1.9.0
cc9b78f07 Merge pull request #5820 from mheon/bump-1.9.0
ec4060aef Ability to prune container in api V2
4489440aa Bump to v2.0.0-dev
d98572350 Bump to v1.9.0
37ed662f3 Merge pull request #5814 from baude/v2specgenprunelibpod
165aef776 podmanv2 events
a756161e8 Merge pull request #5813 from baude/v2edtests2
ffcb99d83 Merge pull request #5818 from vrothberg/fix-nil-deref
123158e83 podmanV2: fix nil deref
d83213634 test case added for image prune cache image
1e8e4bb33 note for skipping cache image added.
9dc9f5cf4 image prune skips images with child images.
714718794 v2specgen prune libpod
60dde457f More system test fixes on regressions
f0b6cdede Merge pull request #5812 from jwhonce/wip/options
d51727642 Add support for the global flags and config files
ba26c763c swagger-check: new CI tool to cross-check swagger
0d01f09bf Merge pull request #5811 from mheon/bump-1.9.0-rc2
bf97e803d Bump to v1.9.0-dev
443aab15e Bump to v1.9.0-rc2
a6caae0b5 Merge pull request #5808 from baude/v2psformat2
01c5915a5 Merge pull request #5809 from mheon/release_notes_1.9.0_rc2
246ee9320 Merge pull request #5801 from baude/v2mount
548645e75 Update release notes for v1.9.0-RC2
1be617891 Merge pull request #5445 from sujil02/podFilter-new
d1c26af14 apiv2 add bindings for logs|events
e87fe4dbb Merge pull request #5550 from giuseppe/rootless-hidepid
fea5f913e Don't include SUBDIR in windows.zip
1091440e5 rootless: fix usage with hidepid=1
68a5a85cc Bump github.com/containers/common from 0.5.0 to 0.6.1
fbe743501 V2 podman command
bd9386dda Merge pull request #5542 from rhatdan/vendor
464a1cd48 Merge pull request #5540 from jwhonce/issues/5531
d66d54282 Merge pull request #5544 from baude/apiv2serveswagger
c9c95a7e0 Merge pull request #5543 from edsantiago/swagger_fixes
52c835053 serve swagger when present
f557cf91d swagger: more consistency fixes
67d0d1e50 Vendor in containers/buildah v1.14.3
45e7cbfef Merge pull request #5480 from vrothberg/auto-updates
651ddd356 Reduce CPU usage when --timeout=0
81005f463 New test: man page cross-ref against --help
e89c6382a Add inspect for exec sessions
118e78c5d Add structure for new exec session tracking to DB
f138405b4 Populate ExecSession with all required fields
d9eb078e2 Merge pull request #5532 from baude/filetimeoutflake
de43a00b5 Merge pull request #5533 from mheon/bump-1.8.2-rc1
f08b992f3 Merge pull request #5536 from giuseppe/avoid-conmon-zombie
a6f5b6a48 podman: avoid conmon zombie on exec
15326f051 Filter pods through pod list api
e9846b962 Bump to v1.8.2-dev
c617484c1 Bump to v1.8.2-rc1
f3a28de32 Merge pull request #5528 from mheon/fix_master_vendor
d47dc63cf Fix vendoring on master
14186ca28 fix timeout file flake
bcdcfeb3e Merge pull request #5529 from mheon/release_notes_182_rc1
7c5ffe377 Update release notes for v1.8.2-rc1
83d2686f4 Fix vendoring on master
8f1ce4bdd Merge pull request #5524 from rhatdan/vendor
f4e873c4e auto updates
68ef7aa4f Fix path of tmp_dir
9ef5d2875 Merge pull request #5449 from baude/manifests
c4a62733a Merge pull request #5520 from giuseppe/make-warning-clearer
8081d9c74 Update containers/storage to v1.16.5
a255d7986 pkg/systemd: add dbus support
cc57b88f7 config: make warning clearer
2b2996d09 Merge pull request #5515 from edsantiago/ci_sundry_small_fixes
da17fbaad Merge pull request #5490 from containers/dependabot/go_modules/k8s.io/api-0.17.4
83c037c58 Merge pull request #5489 from containers/dependabot/go_modules/github.com/containers/common-0.5.0
300338478 Four small CI fixes:
67a985ddb Merge pull request #5514 from vrothberg/fix-ci
bfa1ba588 fix systemd generate tests
abbbeacd6 apiv2 addition of manifests
412a114d3 Merge pull request #5439 from ttys3/fixup-systemdgen-with-new-param
5288d112b Merge pull request #5252 from QiWang19/not-reset-tempdir
759ffb0a2 Merge pull request #5505 from tonybenoy/tony_typo
4e13ef58c Merge pull request #5476 from edsantiago/run_rmi_test_fix
af1ac85da Merge pull request #5508 from baude/buildaddarchos
9ca4b6c6f add os|arch attributes when building
9128ef85c Missing double quotes in troubleshooting guide.
194723f31 force run container detached if container CreateCommand missing the detach param
8b07ad113 Merge pull request #5496 from baude/preemptive
16536af11 Merge pull request #5491 from containers/dependabot/go_modules/github.com/fsnotify/fsnotify-1.4.9
4f497991b Merge pull request #5327 from baude/apiv2hc
c4a62733a Merge pull request #5520 from giuseppe/make-warning-clearer
8081d9c74 Update containers/storage to v1.16.5
a255d7986 pkg/systemd: add dbus support
cc57b88f7 config: make warning clearer
2b2996d09 Merge pull request #5515 from edsantiago/ci_sundry_small_fixes
da17fbaad Merge pull request #5490 from containers/dependabot/go_modules/k8s.io/api-0.17.4
83c037c58 Merge pull request #5489 from containers/dependabot/go_modules/github.com/containers/common-0.5.0
300338478 Four small CI fixes:
67a985ddb Merge pull request #5514 from vrothberg/fix-ci
bfa1ba588 fix systemd generate tests
abbbeacd6 apiv2 addition of manifests
412a114d3 Merge pull request #5439 from ttys3/fixup-systemdgen-with-new-param
5288d112b Merge pull request #5252 from QiWang19/not-reset-tempdir
759ffb0a2 Merge pull request #5505 from tonybenoy/tony_typo
4e13ef58c Merge pull request #5476 from edsantiago/run_rmi_test_fix
af1ac85da Merge pull request #5508 from baude/buildaddarchos
9ca4b6c6f add os|arch attributes when building
9128ef85c Missing double quotes in troubleshooting guide.
194723f31 force run container detached if container CreateCommand missing the detach param
8b07ad113 Merge pull request #5496 from baude/preemptive
16536af11 Merge pull request #5491 from containers/dependabot/go_modules/github.com/fsnotify/fsnotify-1.4.9
4f497991b Merge pull request #5327 from baude/apiv2hc
a95e9e5b4 Bump github.com/containers/common from 0.4.2 to 0.5.0
40ac4779e Bump k8s.io/api from 0.17.3 to 0.17.4
e7e5d125f Bump github.com/fsnotify/fsnotify from 1.4.7 to 1.4.9
e6fba1e44 eat signal 23 in signal proxy
2099643aa add apiv2 healthcheck code
c9f148fb1 Merge pull request #5470 from containers/dependabot/go_modules/github.com/containers/storage-1.16.3
d586e16ad Merge pull request #5484 from baude/bindingsnocolor
ac6c8fb68 Merge pull request #5482 from baude/removeimagefilter
9215eb033 Cirrus: Disable non-docs release processing
194759b96 turn off color-mode for bindings
3aa58ccd0 remove imagefilter for varlink remote client
925da7411 Bump github.com/containers/storage from 1.16.2 to 1.16.3
9c7481dbd Merge pull request #5474 from giuseppe/detect-containers-rootlessport-child-exit
235f36786 Merge pull request #5469 from giuseppe/no-size-create-container
358578087 run --rmi test: make it work
19f5d557b Merge pull request #5468 from Akasurde/5244_follow_up
647dc33e1 rootlessport: detect rootless-child exit
8741eb8a9 create: do not calculate image size
eb2d0a228 Follow up changes from #5244
78e090092 Merge pull request #5458 from baude/apiv2eventslibpod
9cfcf5692 Merge pull request #5460 from edsantiago/man_page_xref
9bc27118b Merge pull request #5372 from sujil02/podstatus
dbb3de990 Merge pull request #5459 from mheon/bump_readme_181
3d1bff6db man page cross-reference fixes: part 2
29c071d4f Update version in README to v1.8.1
da9d21635 Merge pull request #5457 from mheon/bump-1.8.1
216a6091d [CI:DOCS]Add libpod event endpoint
8877fed86 Bump to v1.8.2-dev

Testing has been performed across x86-64/arm/arm64 via cli and
podman-compose.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 recipes-containers/podman/podman_git.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index aa6b25b..af94f0c 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -24,9 +24,9 @@ python __anonymous() {
         raise bb.parse.SkipRecipe(msg)
 }
 
-SRCREV = "444a19cdd2e6108c75f6c1aadc1a2a9138a8bd73"
+SRCREV = "a11c4ead10177a66ef2810a0a92ea8ce2299da07"
 SRC_URI = " \
-    git://github.com/containers/libpod.git;branch=master \
+    git://github.com/containers/libpod.git;branch=v2.0 \
 "
 
 LICENSE = "Apache-2.0"
@@ -36,7 +36,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-PV = "1.8.1+git${SRCREV}"
+PV = "2.0.1+git${SRCPV}"
 
 PACKAGES =+ "${PN}-contrib"
 
@@ -78,7 +78,7 @@ do_compile() {
 
 	cd ${S}/src/.gopath/src/"${PODMAN_PKG}"
 
-	oe_runmake cmd/podman/varlink/iopodman.go GO=go
+	oe_runmake pkg/varlink/iopodman.go GO=go
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
@@ -93,6 +93,10 @@ do_compile() {
 do_install() {
 	cd ${S}/src/.gopath/src/"${PODMAN_PKG}"
 
+	export GOARCH="${BUILD_GOARCH}"
+	export GOPATH="${S}/src/.gopath"
+	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
+
 	oe_runmake install DESTDIR="${D}"
 	if ${@bb.utils.contains('PACKAGECONFIG', 'docker', 'true', 'false', d)}; then
 		oe_runmake install.docker DESTDIR="${D}"
-- 
2.27.0

