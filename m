Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.11570.1593188117409536923
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 09:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EvQDjaID;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id q19so10947543lji.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jun 2020 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=03vUbclWmvcMKOz//4bsZE4OcS5dejfK6SuZT1zS/WE=;
        b=EvQDjaID4J0tUnEG5UXNlT2Ch10mA4OI+oBFpkSKVdFHNXksRo7prsWuCMer/k8pyG
         eB7mD4RdZURsmGxSZ1JJAlZ4xHVtNxLcaTVQKsBLlrf+KEhX47HR9cAiV1DfZmRmXSTJ
         9MKasGP4O3X11iMzppUKu8KqfRkbkUt844e8I0fbSMkXCY0zDnvNSQL+y2x8CroeTrvT
         dREk9yr0gw5uy1EhPjwlkFGao3AUeXpsahbBEaINjG4ZxXqgl9T1ehWpKpEVyfBibtp0
         nhe5vDTofq/uS5LVx5D/EFH8etGix/LSiRUQTqMIzQlBj2PKWF5zgKIfM1OvxZBQKWCI
         XrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=03vUbclWmvcMKOz//4bsZE4OcS5dejfK6SuZT1zS/WE=;
        b=TZlh88yC6Ge7CqLDiucEeRZTujLNbTpwyOSHDPkDlr8iJWJTGGEAeZ09pheF7Mu3s/
         CYs9c+2GcvAn8wO7grzEyuUXFOMckAfAoT92wbV8lFS+Oc0gU6rmXs9Sp13cADOuOeUZ
         bWpBmfumLE5geK0yU/hDz249rU58aI+prb4vEYWWxKTIxRlr99mCaiTHYRnVNY0BeI8L
         FRC73Iz2VSGPXoLnuWYZywpjzWHfc4HrOEaOSr8l76q5r1o3Pl8QmP3PIEajT1Jg4qbe
         2r7+0AV5039fI+myNEBTqiEt5pxbozRCeh8cRjIIFKZ2xXSH6JnzlWX1KZLdRn7fb1ji
         8nag==
X-Gm-Message-State: AOAM533pxu7yQAptMl7thRA6jjHvZSXKIPUFLjagen+IF4eo8cKo3eYt
	MU3K73Ee0KXWOY4S9I87+yUw6W7t
X-Google-Smtp-Source: ABdhPJxXzBIQj67rBF24EIHiuW4VCcXFSlaKoJ+Bgdjsp7asdPBM/yI4fujcTECOuvCEKJNh6md2IQ==
X-Received: by 2002:a05:651c:10cc:: with SMTP id l12mr1963291ljn.221.1593188115246;
        Fri, 26 Jun 2020 09:15:15 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id a15sm5567313ljn.105.2020.06.26.09.15.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 09:15:14 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [meta-virtualization][PATCH] docker-ce: update to v19.03.12
Date: Fri, 26 Jun 2020 18:16:49 +0200
Message-Id: <20200626161649.32538-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Updating to 19.03.12 to pickup bugfixes and security changes. The
following commits comprise this update:

docker:

48a66213fe Merge pull request #649 from tiborvass/bump_19.03.12
62af9260f7 Bump version to 19.03.12
9c297bdc9f Merge component 'engine' from git@github.com:docker/engine 19.03
7055857651 Merge pull request #41124 from thaJeztah/19.03_bump_libnetwork
669e4b131c Merge component 'engine' from git@github.com:docker/engine 19.03
e9a7e02114 Merge component 'cli' from git@github.com:docker/cli 19.03
1506a66209 Merge pull request #41088 from thaJeztah/19.03_backport_invalid_cpu_shares_fix
d301d82485 Merge pull request #2592 from thaJeztah/19.03_backport_logout_config_out_of_sync2
d8b5846dfa Merge component 'cli' from git@github.com:docker/cli 19.03
051459ca64 Merge pull request #2591 from thaJeztah/19.03_backport_docs_fixes2
936779c56d Don't filter out registries to logout from with config file contents
c5052816e1 Add MOBY_DISABLE_PIGZ to dockerd environment variable docs
fcb50896d6 Split up environment variable documentation between cli and dockerd
a8985be19b Fix broken link
2fbdc0273a Merge pull request #2557 from thaJeztah/19.03_backport_fix_plugin_api_link
a000ffbecb Merge pull request #2575 from thaJeztah/19.03_backport_bump_golang_1.13.12
4818c65ebe Merge pull request #2589 from thaJeztah/19.03_backport_bump_x_text
efc8054c3e vendor: docker/libnetwork 026aabaa659832804b01754aaadd2c0f420c68b6 (bump_19.03 branch)
c71fa5457d Merge component 'cli' from git@github.com:docker/cli 19.03
a01cfb62a8 vendor: golang.org/x/text v0.3.3
b6c18bda19 vendor: golang.org/x/text v0.3.2
7d0ae6eeec Merge pull request #2586 from thaJeztah/19.03_backport_context_dont_loose_additional_fields
5ff139ae19 Don't loose additional metadata fields
a9b3c5a589 Merge component 'cli' from git@github.com:docker/cli 19.03
fd679d6533 Merge pull request #2570 from thaJeztah/19.03_backport_hardcode_name_in_errors
182eb0110b Merge component 'engine' from git@github.com:docker/engine 19.03
cb97c81c10 Merge pull request #41082 from thaJeztah/19.03_backport_bump_golang_1.13.12
98cbd831dc Merge component 'cli' from git@github.com:docker/cli 19.03
c7821b2eff Bump Golang 1.13.12
b882b20f3e Merge pull request #2548 from thaJeztah/19.03_backport_fix_dockerd_api_link
80212697cc int-cli/TestRunInvalidCPUShares: fix for newer runc
6812565155 Use consistent name for errors
7df914b706 Bump Golang 1.13.12
42e35e61f3 Bump version to 19.03.11
d7f325fe39 Merge component 'engine' from git@github.com:docker/engine 19.03
f1aa3eed9f vendor libnetwork to 153d0769a1181bf591a9637fd487a541ec7db1e6
9424aeaee9 Merge pull request #647 from tiborvass/bump_19.03.10
490f845e3b Merge branch '19.03' of github.com:docker/docker-ce into 19.03
0f1d2f2330 Merge component 'engine' from git@github.com:docker/engine 19.03
411bf397cb Bump version to 19.03.10
06a50c463c Merge component 'engine' from git@github.com:docker/engine 19.03
9a1177fb23 Merge component 'cli' from git@github.com:docker/cli 19.03
ba746d2393 Merge component 'cli' from git@github.com:docker/cli 19.03
962e636a6c Merge pull request #2558 from tiborvass/19.03-expenv-panic
9c610e07a9 Merge pull request #2560 from tiborvass/19.03-sshfix
8c9977e182 ssh: avoid setting flags through hostname
e002ed9b22 Fix bug with panic when DOCKER_CLI_EXPERIMENTAL environment variable is incorrect
d728333789 Merge pull request #41027 from thaJeztah/19.03_bump_criu
cbb893acc9 Merge pull request #41009 from tiborvass/19.03-fix-dns-fallback-regression
e0305a0d5d integration: Add TestDaemonDNSFallback
0b5e7e9157 vendor libnetwork to 71d4d82a5ce50453b1121d95544f0a2ae95bef9b
e18049ede6 hack: add more debugging to understand exit codepath
9b224f2a82 Dockerfile: bump CRIU 3.14
56856a442e Merge component 'engine' from git@github.com:docker/engine 19.03
bca3c9aa95 Merge pull request #40978 from thaJeztah/19.03_backport_bump_golang_1.13.11
61abe2d536 Merge component 'cli' from git@github.com:docker/cli 19.03
1721a7ccf1 Merge pull request #2532 from thaJeztah/19.03_backport_bump_golang_1.13.11
9d58e0ccd3 Merge pull request #2538 from silvin-lubecki/fix-version-old-engine-19-03
bf5af5d807 Run e2e tests with different engine version on Jenkins Rewrite Jenkinsfile to new declarative syntax without parallel as the e2e framework is not tailored for than (container name clash, port clash,...)
9ff792b4b1 Add a new Makefile variable to override DockerInDocker engine version we use to run e2e tests
ddc55e5dae Partially revert cf663b526a34f3e7911e6e60138138c2023aa844 as it breaks the version negotiation with an older docker engine.
2cd36b188e Merge component 'engine' from git@github.com:docker/engine 19.03
830231a085 Bump Golang 1.13.11
5ef024ecd5 Merge pull request #40988 from thaJeztah/19.03_backport_fix_gotestsum_install
09dc8edc28 Bump Golang 1.13.11
90e25f2053 Fix bug in gotestsum installer causing dependencies to not be downloaded
9d988398e7 Merge component 'engine' from git@github.com:docker/engine 19.03
23743ee6b3 Merge pull request #40970 from AkihiroSuda/archive-40939-1903
765a1b5144 Merge pull request #40964 from AkihiroSuda/rootless-requires-slirp4netns-040-1903
a36b2dcf99 pkg/archive: escape ":" symbol in overlay lowerdir
4588637baa Merge pull request #646 from tiborvass/19.03-changelog
eef871ea69 Add 19.03.9 Changelog
08289ce2b7 dockerd-rootless.sh: bump up slirp4netns requirement to v0.4.0
5c07450314 Merge component 'engine' from git@github.com:docker/engine 19.03
ea22ceaace Merge pull request #40955 from tonistiigi/19.03-buildkit-update
c5c09ec870 Merge pull request #40951 from AkihiroSuda/rootlesskit-095-1903
e86a81ae52 vendor: update buildkit to a7d7b7f1
2494513d7e Merge component 'cli' from git@github.com:docker/cli 19.03
5a38408dd6 Merge component 'engine' from git@github.com:docker/engine 19.03
de971df048 Merge pull request #2520 from thaJeztah/19.03_backport_markup_touch_ups
370527baea Merge component 'cli' from git@github.com:docker/cli 19.03
d64ef9e79f docs: more Markdown touch-ups
6e7916b7c6 Merge pull request #40946 from thaJeztah/19.03_backport_fix_selinux_enotsup
7a62f198f7 bump up rootlesskit to v0.9.5
4911428acb Merge pull request #2508 from thaJeztah/19.03_backport_config_dont_init
1e211790d2 Merge pull request #2516 from thaJeztah/19.03_backport_bump_klog
435e76267c Merge pull request #2518 from thaJeztah/19.03_backport_bump_pkg_errors
4d8b592102 Merge component 'cli' from git@github.com:docker/cli 19.03
38cd6181e7 Merge pull request #2509 from thaJeztah/19.03_backport_docs_fixes
085915af4b Update some uses of errors.Cause() to errors.Is()
6a461fe7db vendor: pkg/errors v0.9.1
d444120281 Include deprecation policy on deprecated features page
d6323fe65b Merge component 'cli' from git@github.com:docker/cli 19.03
7780c96139 Merge pull request #2399 from thaJeztah/19.03_backport_remove_comments
9ea6bbb5fe remove unneeded comment from reference files
5b1b6a526c Merge pull request #40564 from thaJeztah/19.03_backport_apparmor_fixes
08a154d002 Merge component 'cli' from git@github.com:docker/cli 19.03
8d2ae66bcb Merge pull request #2393 from thaJeztah/19.03_backport_codehints_compatibility
92f6f6fada Merge pull request #2391 from thaJeztah/19.03_backport_fix_yamldocs
a1c631a95d Fix whitespace that caused short-format in generated YAML
ee8847c1ae Fix yamldocs generator to accomodate nested subcommands
240eda98bf Fix naming of reference docs files
c2de31670c docs: update code-hints for compatibility with "rouge"
cb1673c606 Merge component 'cli' from git@github.com:docker/cli 19.03
44a8a4efda Merge pull request #40652 from thaJeztah/19.03_backport_fix_backingfs
3fe5e22b5d Move schema1 deprecation notice
0caa03aa9e Merge pull request #40558 from thaJeztah/19.03_backport_buster_or_bust
d071a64684 bump windows-container-utility aa1ba87e99b68e0113bd27ec26c60b88f9d4ccd9
773359a601 Dockerfile: switch to iptables-legacy to match the host
3b64f62c34 Dockerfile: switch golang image to "buster" variant, and update btrfs packages
0c599907a5 hack/make: ignore failure to stop apparmor
14461409c2 Dockerfile: align consecutive COPY lines
f422d243fe Dockerfile: order COPY lines by change frequency
60af9b2b9c Dockerfile: sort packages alphabetically
edc3150b30 Dockerfile: use build-arg for vpnkit
c3939550e0 Dockerfile: use spaces for indentation
bf61271ddc [19.03] Dockerfile: move CRIU_VERSION lower
30c60fc2a3 bump vndr v0.1.1
9ac5b25cb5 bump vndr v0.1.0 to support versioned import paths
21e7bfd059 Use build args to override binary commits in dockerfile
c37bec6230 Revert "dockerfile: update vndr to 85886e1a"
c7b33768a6 go-swagger: fix panic
d69a049009 Dockerfile: set GO111MODULE=off
5b8293556a Merge pull request #2364 from thaJeztah/19.03_backport_bump_golang_1.13

libnetwork:

026aaba Merge pull request #2567 from thaJeztah/19.03_backport_no_error
8565f0b log error instead if disabling IPv6 router advertisement failed
86d159c Merge pull request #2565 from s0j/s0j_bump_19.03_fix-network-not-found
bcb6dd6 Fix 'failed to get network during CreateEndpoint'
153d076 bridge: disable IPv6 router advertisements
71d4d82 Merge pull request #2552 from thaJeztah/19.03_backport_fix_error_handline
fdaaa02 Resolver: fix error handling if we didn't receive a response
7cf227c Merge pull request #2517 from thaJeztah/19.03_backport_bump_golang_1.13
b9bcf0c Merge pull request #2545 from thaJeztah/19.03_backport_fix_npe_ep_iface
b09f24d Fix NPE due to null value returned by ep.Iface()
0941c3f Merge pull request #2541 from SamWhited/19.03_resolver_panic_backport
8068671 Fixes a panic in the DNS resolver
536ae72 Dockerfile: update to Go 1.13.8
dcd9528 Fix gofmt in preparation of Go 1.13 update
f0b038e regenerate protobufs with debian buster
34c8de5 Dockerfile: switch to debian "buster"
9660011 Dockerfile: update to Golang 1.12.17
026aaba Merge pull request #2567 from thaJeztah/19.03_backport_no_error
8565f0b log error instead if disabling IPv6 router advertisement failed
86d159c Merge pull request #2565 from s0j/s0j_bump_19.03_fix-network-not-found
bcb6dd6 Fix 'failed to get network during CreateEndpoint'
153d076 bridge: disable IPv6 router advertisements
71d4d82 Merge pull request #2552 from thaJeztah/19.03_backport_fix_error_handline
fdaaa02 Resolver: fix error handling if we didn't receive a response
7cf227c Merge pull request #2517 from thaJeztah/19.03_backport_bump_golang_1.13
b9bcf0c Merge pull request #2545 from thaJeztah/19.03_backport_fix_npe_ep_iface
b09f24d Fix NPE due to null value returned by ep.Iface()
0941c3f Merge pull request #2541 from SamWhited/19.03_resolver_panic_backport
8068671 Fixes a panic in the DNS resolver
536ae72 Dockerfile: update to Go 1.13.8
dcd9528 Fix gofmt in preparation of Go 1.13 update
f0b038e regenerate protobufs with debian buster
34c8de5 Dockerfile: switch to debian "buster"
9660011 Dockerfile: update to Golang 1.12.17

Testing has been performed across x86-64/arm via cli and docker-compose.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 recipes-containers/docker/docker-ce_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 14182d1..9147e7b 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -18,8 +18,8 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-SRCREV_docker = "afacb8b7f0d8d4f9d2a8e8736e9c993e672b41f3"
-SRCREV_libnetwork = "c7bae399e46fd620b8a006174b7327e4e6e647fd"
+SRCREV_docker = "48a66213fe1747e8873f849862ff3fb981899fc6"
+SRCREV_libnetwork = "026aabaa659832804b01754aaadd2c0f420c68b6"
 SRC_URI = "\
 	git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
 	git://github.com/docker/libnetwork.git;branch=bump_19.03;name=libnetwork;destsuffix=git/libnetwork \
@@ -38,7 +38,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-DOCKER_VERSION = "19.03.8-ce"
+DOCKER_VERSION = "19.03.12-ce"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
 PACKAGES =+ "${PN}-contrib"
-- 
2.27.0

