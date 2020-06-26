Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.91.1593192154840985790
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 10:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=naWOVBXZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id dr13so10122342ejc.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jun 2020 10:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sdhwnFSWTLpR02+B/XcOvGmwcuWgGky9fZckx/khDJk=;
        b=naWOVBXZij04ykmHEC9iCngnWyWQaq5AYao/qiuTtEnyd7ksBeQt0iIe8XeZ8UarWI
         usDzJ8Czki/iZpXtGR05rDKGTx4H1scUNJ7ivoNBYgjXPeoYmHXbXYRVCAZl0wL83fph
         FgwHAYijdoy79Co3ATV0qukAhTVFgJuFx5sRtqViwwelj3EyO4Ikyap5FXtesCjd50FC
         aavtLWQFjKilWJKTX/o5qi0KzaOvHEj1/1EvUuOeaybcx7ba/BNbOpfB5tv6OFFU38UI
         DwyYjIIhbt0xYFtY4kSavKpfEuaUIajOZBGxE8RUjg3D9yQeFpqoHdZ8fM5h2yhgNm70
         ga6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sdhwnFSWTLpR02+B/XcOvGmwcuWgGky9fZckx/khDJk=;
        b=UqFSQTdY8KCK5VPrENzLEZzI+jkW6hjH4ZM5++yq5V54e4ULUi9fhe+sjm0EMcXlO/
         kOT+JJEr/fndcMqmqJcGX2qL0j5kTyAJFb4CH8ggal9c+1Gr/ZOIamP2JjmmX3bhQ9zY
         zaHSCgS4s055/5y3df8U6cda/ijyR/e9FA5VZ79FmkhKVEsaLa+ljKLCKEixVB0T8/HV
         fnvSzmtakpX+cvntB/B0HbHmZqqidX1O6NI3XoBeuprJ7ZgytDiT2NVnZM1JplUuKpKw
         uBQysSfNwjw2RJ5fy/A/Gk0sSFTniBFukkcjLedReZYQUnHSTFHclVtt9WN60QSLbkEj
         Mz2w==
X-Gm-Message-State: AOAM533ew6LifcjHDxcxcTcHXzeq7rb4NJApqcLwDZ4ojSKJC3B1L1wT
	k9aNPklHX441ozb3jcdTVqs5uhkjKHwi9B7DIng=
X-Google-Smtp-Source: ABdhPJyhjOoYhkczaIavTDLBN0sBSwEQeijqu1JtF0UdP4iiktFyBdiPI8yDB5HR+NTlW0g5ckGIoxfO6CpD6A2RX+A=
X-Received: by 2002:a17:906:940f:: with SMTP id q15mr3627053ejx.470.1593192153267;
 Fri, 26 Jun 2020 10:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200626161705.32600-1-liu.ming50@gmail.com>
In-Reply-To: <20200626161705.32600-1-liu.ming50@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 26 Jun 2020 19:22:21 +0200
Message-ID: <CA+chaQei6WPUNkN0OOkk+MxEsWmnPSkTBAnrUq9KLbXmx87y1g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-moby: update to v19.03.12
To: Ming Liu <liu.ming50@gmail.com>, ross.burton@arm.com
Cc: meta-virtualization@lists.yoctoproject.org, 
	Stefan Agner <stefan.agner@toradex.com>, Ming Liu <ming.liu@toradex.com>
Content-Type: multipart/alternative; boundary="0000000000005ac2bb05a8fff4e4"

--0000000000005ac2bb05a8fff4e4
Content-Type: text/plain; charset="UTF-8"

Hi,

docker-moby now fails to build because of go-native changes from Ross (
https://git.openembedded.org/openembedded-core/commit/?id=c23f9e80492e4b1d47c0ada8eae3decf736253c7
)

---> Making bundle: dynbinary (in bundles/dynbinary)
Building: bundles/dynbinary-daemon/dockerd-19.03.8
GOOS="linux" GOARCH="arm" GOARM="7"
# net
In file included from
docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs.h:23,
                 from
docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/features.h:489,
                 from
docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/netdb.h:25,
                 from
../../../recipe-sysroot-native/usr/lib/go/src/net/cgo_linux.go:10:
docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs-32.h:7:11:
fatal error: gnu/stubs-soft.h: No such file or directory
    7 | # include <gnu/stubs-soft.h>
      |           ^~~~~~~~~~~~~~~~~~
compilation terminated.
# os/user
In file included from
docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs.h:23,
                 from
docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/features.h:489,
                 from
docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/unistd.h:25,
                 from
../../../recipe-sysroot-native/usr/lib/go/src/os/user/cgo_lookup_unix.go:20:
docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/stubs-32.h:7:11:
fatal error: gnu/stubs-soft.h: No such file or directory
    7 | # include <gnu/stubs-soft.h>
      |           ^~~~~~~~~~~~~~~~~~
compilation terminated.
WARNING: exit code 2 from a shell command.

ERROR: Logfile of failure stored in:
docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/temp/log.do_compile.30189

This was shown in raspberrypi4 world build - I'm not using docker built
with OE, but maybe it's something which should be fixed either in go-native
or in docker recipes.

I've tried a build with this docker upgrade applied and it doesn't help,
reverting
https://git.openembedded.org/openembedded-core/commit/?id=c23f9e80492e4b1d47c0ada8eae3decf736253c7
still
fixes the build.

Regards,

On Fri, Jun 26, 2020 at 6:15 PM Ming Liu <liu.ming50@gmail.com> wrote:

> From: Ming Liu <ming.liu@toradex.com>
>
> Updating to 19.03.12 to pickup bugfixes and security changes. The
> following commits comprise this update:
>
> moby:
>
> 9dc6525e61 Merge pull request #41124 from thaJeztah/19.03_bump_libnetwork
> abb5beffff Merge pull request #41088 from
> thaJeztah/19.03_backport_invalid_cpu_shares_fix
> b4ca19a992 vendor: docker/libnetwork
> 026aabaa659832804b01754aaadd2c0f420c68b6 (bump_19.03 branch)
> d5a82971a4 Merge pull request #41082 from
> thaJeztah/19.03_backport_bump_golang_1.13.12
> 5fce12cf25 int-cli/TestRunInvalidCPUShares: fix for newer runc
> 058ea43c5c Bump Golang 1.13.12
> 77e06fda0c vendor libnetwork to 153d0769a1181bf591a9637fd487a541ec7db1e6
> b47e742558 Merge pull request #41027 from thaJeztah/19.03_bump_criu
> b85d75e29a Merge pull request #41009 from
> tiborvass/19.03-fix-dns-fallback-regression
> c104a50de4 integration: Add TestDaemonDNSFallback
> 9482566a5c vendor libnetwork to 71d4d82a5ce50453b1121d95544f0a2ae95bef9b
> d4e12315cd hack: add more debugging to understand exit codepath
> 4c24512241 Dockerfile: bump CRIU 3.14
> ad0f0b3970 Merge pull request #40978 from
> thaJeztah/19.03_backport_bump_golang_1.13.11
> 29796375c9 Bump Golang 1.13.11
> c1cc6ec81a Merge pull request #40988 from
> thaJeztah/19.03_backport_fix_gotestsum_install
> 8f1ab4e612 Fix bug in gotestsum installer causing dependencies to not be
> downloaded
> 811a247d06 Merge pull request #40970 from AkihiroSuda/archive-40939-1903
> 4d1885fb94 Merge pull request #40964 from
> AkihiroSuda/rootless-requires-slirp4netns-040-1903
> 0a3b2bda34 pkg/archive: escape ":" symbol in overlay lowerdir
> 9057ddf37c dockerd-rootless.sh: bump up slirp4netns requirement to v0.4.0
> ab567a4327 Merge pull request #40955 from tonistiigi/19.03-buildkit-update
> ee3f3ece72 Merge pull request #40951 from AkihiroSuda/rootlesskit-095-1903
> a76633684b vendor: update buildkit to a7d7b7f1
> 0803200be9 Merge pull request #40946 from
> thaJeztah/19.03_backport_fix_selinux_enotsup
> 706008a1da bump up rootlesskit to v0.9.5
> 57f6c9a0ef SELinux: fix ENOTSUP errors not being detected when relabeling
> c4c6cf6b6a Merge pull request #40921 from
> cpuguy83/19.03_log_rotate_error_handling
> 7d4dd91a52 logfile: Check if log is closed on close error during rotate
> edf2c49410 vendor: pkg/errors v0.9.1
> 1adcc64f40 Merge pull request #40877 from thaJeztah/19.03_update_buildkit
> e7349349fd Merge pull request #40850 from
> thaJeztah/19.03_backport_criu_3.13
> 3677003554 Merge pull request #40782 from
> thaJeztah/19.03_backport_switch_to_s390x_ubuntu_1804
> 63841af153 [19.03] vendor: buildkit v0.6.4-5-g59e305aa
> 2fbb374ab7 Merge pull request #40863 from AkihiroSuda/rootlesskit-094-1903
> 946d0ff67e bump up rootlesskit to v0.9.4
> 70e7d6fe4a Update CRIU to v3.13 "Silicon Willet"
> f432f71595 Merge pull request #40563 from
> thaJeztah/19.03_backport_fix_windows_file_handles
> 47a6d9b54f Merge pull request #40565 from
> thaJeztah/19.03_backport_fix_bip_subnet_config
> 6a0995e0d8 Merge pull request #40831 from thaJeztah/19.03_bump_swarmkit
> e4f239d68e [19.03] vendor: swarmkit
> 0b8364e7d08aa0e972241eb59ae981a67a587a0e
> 25b82fa9b8 Merge pull request #40801 from
> thaJeztah/19.03_backport_update_go_events
> e149ff62fe vendor: update go-events to fix alignment for 32bit systems
> 90a31c4829 Merge pull request #40809 from thaJeztah/19.03_update_libnetwork
> aa98b4f5d6 Merge pull request #40803 from
> thaJeztah/19.03_backport_bump_golang_1.13.10
> 860e7e273d Merge pull request #40800 from
> thaJeztah/19.03_backport_api_docs_fix_link
> a58b52b037 Merge pull request #40799 from
> thaJeztah/19.03_backport_fix_test_filter
> a6beb24dc5 [19.03] update libnetwork
> b9bcf0c3fba9ef8897c9676c5b70ba0345b84b17
> 282567a58d Bump Golang 1.13.10
> b66813eb45 api docs: fix broken link on GitHub
> edbb1d9e95 Merge pull request #40784 from thaJeztah/19.03_update_buildkit
> 9d8eccec8e Fix TEST_FILTER to work for both "integration" and
> "integration-cli"
> 4275aec641 Merge pull request #40592 from
> thaJeztah/19.03_backport_bump_golang_1.13
> 4b040147cf Merge pull request #40417 from
> thaJeztah/19.03_backport_test_fixes
> 08a2fe0d56 [19.03] vendor buildkit b26cff2413cc6a466f8739262efa13bd126f8fc7
> 1e1caccb13 Merge pull request #40780 from thaJeztah/19.03_backport_map_sync
> 5ba2bf37a8 Bump Golang 1.13.9
> f432a04243 Update Golang 1.13.8
> 81458b3144 Update Golang 1.13.7 (CVE-2020-0601, CVE-2020-7919)
> 4275aec641 Merge pull request #40592 from
> thaJeztah/19.03_backport_bump_golang_1.13
> 4b040147cf Merge pull request #40417 from
> thaJeztah/19.03_backport_test_fixes
> 08a2fe0d56 [19.03] vendor buildkit b26cff2413cc6a466f8739262efa13bd126f8fc7
> 1e1caccb13 Merge pull request #40780 from thaJeztah/19.03_backport_map_sync
> 5ba2bf37a8 Bump Golang 1.13.9
> f432a04243 Update Golang 1.13.8
> 81458b3144 Update Golang 1.13.7 (CVE-2020-0601, CVE-2020-7919)
> 6e1d159680 Update Golang 1.13.6
> 4241093b63 Update Golang 1.13.5
> 162fd8b856 Bump Golang 1.13.4
> 05a1ebd0fd Bump Golang 1.13.3 (CVE-2019-17596)
> f8d4276a89 bump golang 1.13.1 (CVE-2019-16276)
> 7df2d881f3 Bump Golang version 1.13.0
> fed832e224 Update to using alpine 3.10
> 4581499848 Switch to s390x Ubuntu 18.04
> f34a5b5af0 builder: fix concurrent map write
> 0df114a8f8 Merge pull request #40779 from
> thaJeztah/19.03_backport_unify_apis
> 9f5a5da4cb docs: add API versions v1.30 - v1.37
> 037d5a9e9a Merge pull request #40769 from
> thaJeztah/19.03_backport_seccomp_time64
> 5ed8f9a203 Merge pull request #40681 from
> thaJeztah/19.03_backport_schema2v1_dep_notice_on_error_only
> 284bbde996 seccomp: add 64-bit time_t syscalls
> 43b0a73273 Merge pull request #40758 from
> thaJeztah/19.03_backport_arm_matching
> 89f296a534 Merge pull request #40562 from
> thaJeztah/19.03_backport_39353_subgid_subuid
> d12b6d24d1 Merge pull request #40628 from
> cpuguy83/19.03_backport_39360_swarm_log_fill_rate
> 359edd8cbf [19.03] vendor: containerd
> 481103c8793316c118d9f795cde18060847c370e
> 1454987253 Merge pull request #40617 from SamWhited/19.03
> 021258661b Update libnetwork and DNS library
> 1db5199ddc Merge pull request #40564 from
> thaJeztah/19.03_backport_apparmor_fixes
> 6ed0f6ab78 Merge pull request #40652 from
> thaJeztah/19.03_backport_fix_backingfs
> 100d240d86 Move schema1 deprecation notice
> 4a4b3ed37f Merge pull request #40558 from
> thaJeztah/19.03_backport_buster_or_bust
> 57d5105759 bump windows-container-utility
> aa1ba87e99b68e0113bd27ec26c60b88f9d4ccd9
> 68db0c1739 Dockerfile: switch to iptables-legacy to match the host
> 4aaf3ead97 Dockerfile: switch golang image to "buster" variant, and update
> btrfs packages
> a070874828 hack/make: ignore failure to stop apparmor
> 237843a059 Dockerfile: align consecutive COPY lines
> 400b2850ff Dockerfile: order COPY lines by change frequency
> ddfeaf32ff Dockerfile: sort packages alphabetically
> cb813faebf Dockerfile: use build-arg for vpnkit
> 0499db23d1 Dockerfile: use spaces for indentation
> c77e7cb3d0 [19.03] Dockerfile: move CRIU_VERSION lower
> c6511ee4db bump vndr v0.1.1
> 0fa8a0c575 bump vndr v0.1.0 to support versioned import paths
> f3009e2f51 Use build args to override binary commits in dockerfile
> 92ca652fc9 Revert "dockerfile: update vndr to 85886e1a"
> fdad16840c go-swagger: fix panic
> 075e057de5 Dockerfile: set GO111MODULE=off
>
> bnetwork:
>
> 026aaba Merge pull request #2567 from thaJeztah/19.03_backport_no_error
> 8565f0b log error instead if disabling IPv6 router advertisement failed
> 86d159c Merge pull request #2565 from
> s0j/s0j_bump_19.03_fix-network-not-found
> bcb6dd6 Fix 'failed to get network during CreateEndpoint'
> 153d076 bridge: disable IPv6 router advertisements
> 71d4d82 Merge pull request #2552 from
> thaJeztah/19.03_backport_fix_error_handline
> fdaaa02 Resolver: fix error handling if we didn't receive a response
> 7cf227c Merge pull request #2517 from
> thaJeztah/19.03_backport_bump_golang_1.13
> b9bcf0c Merge pull request #2545 from
> thaJeztah/19.03_backport_fix_npe_ep_iface
> b09f24d Fix NPE due to null value returned by ep.Iface()
> 0941c3f Merge pull request #2541 from
> SamWhited/19.03_resolver_panic_backport
> 8068671 Fixes a panic in the DNS resolver
> 536ae72 Dockerfile: update to Go 1.13.8
> dcd9528 Fix gofmt in preparation of Go 1.13 update
> f0b038e regenerate protobufs with debian buster
> 34c8de5 Dockerfile: switch to debian "buster"
> 9660011 Dockerfile: update to Golang 1.12.17
> 026aaba Merge pull request #2567 from thaJeztah/19.03_backport_no_error
> 8565f0b log error instead if disabling IPv6 router advertisement failed
> 86d159c Merge pull request #2565 from
> s0j/s0j_bump_19.03_fix-network-not-found
> bcb6dd6 Fix 'failed to get network during CreateEndpoint'
> 153d076 bridge: disable IPv6 router advertisements
> 71d4d82 Merge pull request #2552 from
> thaJeztah/19.03_backport_fix_error_handline
> fdaaa02 Resolver: fix error handling if we didn't receive a response
> 7cf227c Merge pull request #2517 from
> thaJeztah/19.03_backport_bump_golang_1.13
> b9bcf0c Merge pull request #2545 from
> thaJeztah/19.03_backport_fix_npe_ep_iface
> b09f24d Fix NPE due to null value returned by ep.Iface()
> 0941c3f Merge pull request #2541 from
> SamWhited/19.03_resolver_panic_backport
> 8068671 Fixes a panic in the DNS resolver
> 536ae72 Dockerfile: update to Go 1.13.8
> dcd9528 Fix gofmt in preparation of Go 1.13 update
> f0b038e regenerate protobufs with debian buster
> 34c8de5 Dockerfile: switch to debian "buster"
> 9660011 Dockerfile: update to Golang 1.12.17
>
> cli:
>
> 0ed913b88 Merge pull request #2592 from
> thaJeztah/19.03_backport_logout_config_out_of_sync2
> ab45dc8fd Merge pull request #2591 from
> thaJeztah/19.03_backport_docs_fixes2
> 0ed913b88 Merge pull request #2592 from
> thaJeztah/19.03_backport_logout_config_out_of_sync2
> ab45dc8fd Merge pull request #2591 from
> thaJeztah/19.03_backport_docs_fixes2
> 5a12f90b4 Don't filter out registries to logout from with config file
> contents
> 0ed913b88 Merge pull request #2592 from
> thaJeztah/19.03_backport_logout_config_out_of_sync2
> ab45dc8fd Merge pull request #2591 from
> thaJeztah/19.03_backport_docs_fixes2
> 5a12f90b4 Don't filter out registries to logout from with config file
> contents
> 521a636a8 Add MOBY_DISABLE_PIGZ to dockerd environment variable docs
> 8b8ec04cd Split up environment variable documentation between cli and
> dockerd
> 4e7c875e3 Fix broken link
> 2e6ff15da Merge pull request #2557 from
> thaJeztah/19.03_backport_fix_plugin_api_link
> f56d1b364 Merge pull request #2575 from
> thaJeztah/19.03_backport_bump_golang_1.13.12
> 8e7ff60ee Merge pull request #2589 from
> thaJeztah/19.03_backport_bump_x_text
> 6cb678f16 vendor: golang.org/x/text v0.3.3
> 4515c5187 vendor: golang.org/x/text v0.3.2
> 43a4e09bb Merge pull request #2586 from
> thaJeztah/19.03_backport_context_dont_loose_additional_fields
> cfa1fd9ac Don't loose additional metadata fields
> 6051b36db Merge pull request #2570 from
> thaJeztah/19.03_backport_hardcode_name_in_errors
> 31d338dd3 Bump Golang 1.13.12
> 9cc05b9ce Merge pull request #2548 from
> thaJeztah/19.03_backport_fix_dockerd_api_link
> 936d328da Use consistent name for errors
> dd360c7c0 Merge pull request #2558 from tiborvass/19.03-expenv-panic
> 92b54c256 Merge pull request #2560 from tiborvass/19.03-sshfix
> 2ee798198 ssh: avoid setting flags through hostname
> e90b6bcb6 Fix bug with panic when DOCKER_CLI_EXPERIMENTAL environment
> variable is incorrect
> 97afb7295 docs/extend: fix broken link and some markdown touch-ups
> c280cdfd6 docs: fix broken link in dockerd.md
> fd7874f16 Merge pull request #2532 from
> thaJeztah/19.03_backport_bump_golang_1.13.11
> a945f0e7e Merge pull request #2538 from
> silvin-lubecki/fix-version-old-engine-19-03
> 0f59532a1 Run e2e tests with different engine version on Jenkins Rewrite
> Jenkinsfile to new declarative syntax without parallel as the e2e framework
> is not tailored for than (container name clash, port clash,...)
> 95df3499b Add a new Makefile variable to override DockerInDocker engine
> version we use to run e2e tests
> 2d1476c6f Partially revert cf663b526a34f3e7911e6e60138138c2023aa844 as it
> breaks the version negotiation with an older docker engine.
> 936e9717e Bump Golang 1.13.11
> ab108430b Merge pull request #2520 from
> thaJeztah/19.03_backport_markup_touch_ups
> 489c7e9cd docs: more Markdown touch-ups
> 1705e47cd Merge pull request #2508 from
> thaJeztah/19.03_backport_config_dont_init
> a9a83d2e7 Merge pull request #2516 from thaJeztah/19.03_backport_bump_klog
> ae2012cce Merge pull request #2518 from
> thaJeztah/19.03_backport_bump_pkg_errors
> 052a71c4d Merge pull request #2509 from thaJeztah/19.03_backport_docs_fixes
> 9a57ea886 Update some uses of errors.Cause() to errors.Is()
> 345b0e79e vendor: pkg/errors v0.9.1
> 62a9babca vendor: k8s.io/klog v1.0.0-2-g4ad0115
> dbc73eafc docs: fix, and touch-up "docker context" docs
> e06fc01c1 Update dead link and add missing info on COPY
> 8434242c7 config: don't call homedir on init()
> bef0d567a Merge pull request #2493 from
> thaJeztah/19.03_backport_update_dockerd_usage
> 65c37227a docs: update usage output for dockerd (19.03)
> 55a5ab0f0 docs: fix order of flags in usage, and fix missing quote
> a2d8a8a4c Merge pull request #2484 from
> thaJeztah/19.03_backport_fix_builder_link
> c150ba2b8 builder: fix broken link
> 392993336 Merge pull request #2457 from
> thaJeztah/19.03_backport_lazy_feature_detection
> 62baa3ce5 Merge pull request #2471 from
> thaJeztah/19.03_backport_fix_bind_panic
> 7a2de8165 Merge pull request #2470 from thaJeztah/19.03_backport_bump_yaml
> 0ea509c77 Merge pull request #2481 from
> thaJeztah/19.03_backport_fix_run_reference_links
> 81909d70f docs: fix links, and minor markdown touch-ups
> cf663b526 cli: perform feature detection lazily
> c44c18e08 docker build: check experimental --platform on pre-run
> 25f04876d app-214 Load Client info in getter function
> e470eef36 Merge pull request #2469 from thaJeztah/19.03_backport_docs
> 4ad65fc35 fix panic on single-character volumes
> 83d4cb900 vendor: bump gopkg.in/yaml.v2 v2.2.8
> 0cfe29431 service update: fix service create example
> 62baa3ce5 Merge pull request #2471 from
> thaJeztah/19.03_backport_fix_bind_panic
> 7a2de8165 Merge pull request #2470 from thaJeztah/19.03_backport_bump_yaml
> 0ea509c77 Merge pull request #2481 from
> thaJeztah/19.03_backport_fix_run_reference_links
> 81909d70f docs: fix links, and minor markdown touch-ups
> cf663b526 cli: perform feature detection lazily
> c44c18e08 docker build: check experimental --platform on pre-run
> 25f04876d app-214 Load Client info in getter function
> e470eef36 Merge pull request #2469 from thaJeztah/19.03_backport_docs
> 4ad65fc35 fix panic on single-character volumes
> 83d4cb900 vendor: bump gopkg.in/yaml.v2 v2.2.8
> 0cfe29431 service update: fix service create example
> 2dc593f67 Add container_iface_prefix option to documentation
> d25e65734 Merge pull request #2445 from
> thaJeztah/19.03_backport_network_prune_improve_message
> 8986e3120 Merge pull request #2456 from thaJeztah/19.03_backport_gotest_v3
> 4fe6b837b bump gotest.tools v3.0.1 for compatibility with Go 1.14
> a8454a4d9 update vndr v0.1.1
> 950dcedd9 bump vndr v0.1.0 to support versioned import paths
> 05ad944d1 Merge pull request #2453 from
> thaJeztah/19.03_backport_fixup_markdown_and_links
> 0d26cbf5b yamldocs: add description to base command
> d4e4fa3b4 experimental/vlan-networks: markdown touch-ups
> de12dbfb1 docs/reference: explain "colon"
> 7ae77e51f docs/extend: reformat notes
> 733ae82da docs/builder: touch up markdown, and some minor rephrasing
> 9a1ba7d39 docs/reference/run.md: touch-up markdown
> 6ba9a3e4c reference docs: reformat notes
> 96eb0888f reference docs: fix broken links and markdown touch-ups
> 2676c603f Adding missing title in builder.md
> 365bae4f8 Add clarification when using USER UID:GI
> 04533bd52 Merge pull request #2442 from
> thaJeztah/19.03_backport_update_go_events
> c38b26007 improve "network prune" output to mention custom networks only
> ba0a2ffe2 Merge pull request #2444 from
> thaJeztah/19.03_backport_host_gateway_validation
> fd9eedce3 Add "host-gateway" to tests for extra_hosts / --add-host
> 365118982 Skip IPAddr validation for "host-gateway" string
> a0f0ed1f5 vendor: update go-events to fix alignment for 32bit systems
> 173c85ad7 Merge pull request #2431 from
> thaJeztah/19.03_backport_bump_golang_1.13.10
> de6a5fa44 Bump Golang 1.13.10
> 1a4749b8e Merge pull request #2435 from
> thaJeztah/19.03_backport_bump_certificates
> 19ccd4f5d CI: update notary test certificates
> d7f5f70c3 Merge pull request #2419 from
> thaJeztah/19.03_backport_bump_golang_1.13.9
> f8fc68f17 Bump Golang 1.13.9
> 7d4850005 Merge pull request #2403 from
> thaJeztah/19.03_backport_update_deprecation_policy
> 22cbf9161 Update deprecation policy to 1 stable release
> 0b0ea3f0f Merge pull request #2401 from
> thaJeztah/19.03_backport_deprecation_policy
> 288cdec29 Include deprecation policy on deprecated features page
> a4d902af5 Merge pull request #2399 from
> thaJeztah/19.03_backport_remove_comments
> ffffc1ed4 remove unneeded comment from reference files
> bf1f5fcfb Merge pull request #2393 from
> thaJeztah/19.03_backport_codehints_compatibility
> c35400655 Merge pull request #2391 from
> thaJeztah/19.03_backport_fix_yamldocs
> 9fd323afd Fix whitespace that caused short-format in generated YAML
> c936ea969 Fix yamldocs generator to accomodate nested subcommands
> d484456c2 Fix naming of reference docs files
> 6a02465f4 docs: update code-hints for compatibility with "rouge"
> f53663a95 Merge pull request #2364 from
> thaJeztah/19.03_backport_bump_golang_1.13
>
> Testing has been performed across x86-64/arm via cli and docker-compose.
>
> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> ---
>  recipes-containers/docker/docker-moby.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-moby.bb
> b/recipes-containers/docker/docker-moby.bb
> index 074ef08..634e5c0 100644
> --- a/recipes-containers/docker/docker-moby.bb
> +++ b/recipes-containers/docker/docker-moby.bb
> @@ -35,9 +35,9 @@ DESCRIPTION = "Linux container runtime \
>  #     to a docker.inc recipe
>
>  # moby commit matches the docker-engine bump on the 19.03 branch'
> -SRCREV_moby = "aa6a9891b09cce3d9004121294301a30d45d998d"
> -SRCREV_libnetwork = "c7bae399e46fd620b8a006174b7327e4e6e647fd"
> -SRCREV_cli = "eb310fca49568dccd87c6136f774ef6fff2a1b51"
> +SRCREV_moby = "9dc6525e6118a25fab2be322d1914740ea842495"
> +SRCREV_libnetwork = "026aabaa659832804b01754aaadd2c0f420c68b6"
> +SRCREV_cli = "0ed913b885c8919944a2e4c8d0b80a318a8dd48b"
>  SRC_URI = "\
>         git://github.com/moby/moby.git;branch=19.03;name=moby \
>         git://
> github.com/docker/libnetwork.git;branch=bump_19.03;name=libnetwork;destsuffix=git/libnetwork
> \
> @@ -57,7 +57,7 @@ GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> -DOCKER_VERSION = "19.03.8"
> +DOCKER_VERSION = "19.03.12"
>  PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
>
>  PACKAGES =+ "${PN}-contrib"
> --
> 2.27.0
>
> 
>

--0000000000005ac2bb05a8fff4e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>docker-moby now fails to build beca=
use of go-native changes from Ross (<a href=3D"https://git.openembedded.org=
/openembedded-core/commit/?id=3Dc23f9e80492e4b1d47c0ada8eae3decf736253c7">h=
ttps://git.openembedded.org/openembedded-core/commit/?id=3Dc23f9e80492e4b1d=
47c0ada8eae3decf736253c7</a>)</div><div><br></div><div>---&gt; Making bundl=
e: dynbinary (in bundles/dynbinary)<br>Building: bundles/dynbinary-daemon/d=
ockerd-19.03.8<br>GOOS=3D&quot;linux&quot; GOARCH=3D&quot;arm&quot; GOARM=
=3D&quot;7&quot;<br># net<br>In file included from docker-moby/19.03.8+git=
aa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/gnu/=
stubs.h:23,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0=
/recipe-sysroot/usr/include/features.h:489,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from docker-moby/19.03.8+gitaa6a9891b09c=
ce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/netdb.h:25,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../../.=
./recipe-sysroot-native/usr/lib/go/src/net/cgo_linux.go:10:<br>docker-moby/=
19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/i=
nclude/gnu/stubs-32.h:7:11: fatal error: gnu/stubs-soft.h: No such file or =
directory<br>=C2=A0 =C2=A0 7 | # include &lt;gnu/stubs-soft.h&gt;<br>=C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~<br>c=
ompilation terminated.<br># os/user<br>In file included from docker-moby/19=
.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/inc=
lude/gnu/stubs.h:23,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0from docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d=
45d998d-r0/recipe-sysroot/usr/include/features.h:489,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from docker-moby/19.03.8+gita=
a6a9891b09cce3d9004121294301a30d45d998d-r0/recipe-sysroot/usr/include/unist=
d.h:25,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fr=
om ../../../recipe-sysroot-native/usr/lib/go/src/os/user/cgo_lookup_unix.go=
:20:<br>docker-moby/19.03.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/=
recipe-sysroot/usr/include/gnu/stubs-32.h:7:11: fatal error: gnu/stubs-soft=
.h: No such file or directory<br>=C2=A0 =C2=A0 7 | # include &lt;gnu/stubs-=
soft.h&gt;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~=
~~~~~~~~~~~~~~~<br>compilation terminated.<br>WARNING: exit code 2 from a s=
hell command.<br><br>ERROR: Logfile of failure stored in: docker-moby/19.03=
.8+gitaa6a9891b09cce3d9004121294301a30d45d998d-r0/temp/log.do_compile.30189=
<br></div><div><br></div><div>This was shown in raspberrypi4 world build - =
I&#39;m not using docker built with OE, but maybe it&#39;s something which =
should be fixed either in go-native or in docker recipes.</div><div><br></d=
iv><div>I&#39;ve tried a build with this docker upgrade applied and it does=
n&#39;t help, reverting=C2=A0<a href=3D"https://git.openembedded.org/openem=
bedded-core/commit/?id=3Dc23f9e80492e4b1d47c0ada8eae3decf736253c7">https://=
git.openembedded.org/openembedded-core/commit/?id=3Dc23f9e80492e4b1d47c0ada=
8eae3decf736253c7</a>=C2=A0still fixes the build.</div><div><br></div><div>=
Regards,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jun 26, 2020 at 6:15 PM Ming Liu &lt;<a href=3D"ma=
ilto:liu.ming50@gmail.com">liu.ming50@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">From: Ming Liu &lt;<a href=
=3D"mailto:ming.liu@toradex.com" target=3D"_blank">ming.liu@toradex.com</a=
>&gt;<br>
<br>
Updating to 19.03.12 to pickup bugfixes and security changes. The<br>
following commits comprise this update:<br>
<br>
moby:<br>
<br>
9dc6525e61 Merge pull request #41124 from thaJeztah/19.03_bump_libnetwork<=
br>
abb5beffff Merge pull request #41088 from thaJeztah/19.03_backport_invalid=
_cpu_shares_fix<br>
b4ca19a992 vendor: docker/libnetwork 026aabaa659832804b01754aaadd2c0f420c6=
8b6 (bump_19.03 branch)<br>
d5a82971a4 Merge pull request #41082 from thaJeztah/19.03_backport_bump_go=
lang_1.13.12<br>
5fce12cf25 int-cli/TestRunInvalidCPUShares: fix for newer runc<br>
058ea43c5c Bump Golang 1.13.12<br>
77e06fda0c vendor libnetwork to 153d0769a1181bf591a9637fd487a541ec7db1e6<b=
r>
b47e742558 Merge pull request #41027 from thaJeztah/19.03_bump_criu<br>
b85d75e29a Merge pull request #41009 from tiborvass/19.03-fix-dns-fallback=
-regression<br>
c104a50de4 integration: Add TestDaemonDNSFallback<br>
9482566a5c vendor libnetwork to 71d4d82a5ce50453b1121d95544f0a2ae95bef9b<b=
r>
d4e12315cd hack: add more debugging to understand exit codepath<br>
4c24512241 Dockerfile: bump CRIU 3.14<br>
ad0f0b3970 Merge pull request #40978 from thaJeztah/19.03_backport_bump_go=
lang_1.13.11<br>
29796375c9 Bump Golang 1.13.11<br>
c1cc6ec81a Merge pull request #40988 from thaJeztah/19.03_backport_fix_got=
estsum_install<br>
8f1ab4e612 Fix bug in gotestsum installer causing dependencies to not be d=
ownloaded<br>
811a247d06 Merge pull request #40970 from AkihiroSuda/archive-40939-1903<b=
r>
4d1885fb94 Merge pull request #40964 from AkihiroSuda/rootless-requires-sl=
irp4netns-040-1903<br>
0a3b2bda34 pkg/archive: escape &quot;:&quot; symbol in overlay lowerdir<br=
>
9057ddf37c dockerd-rootless.sh: bump up slirp4netns requirement to v0.4.0<=
br>
ab567a4327 Merge pull request #40955 from tonistiigi/19.03-buildkit-update=
<br>
ee3f3ece72 Merge pull request #40951 from AkihiroSuda/rootlesskit-095-1903=
<br>
a76633684b vendor: update buildkit to a7d7b7f1<br>
0803200be9 Merge pull request #40946 from thaJeztah/19.03_backport_fix_sel=
inux_enotsup<br>
706008a1da bump up rootlesskit to v0.9.5<br>
57f6c9a0ef SELinux: fix ENOTSUP errors not being detected when relabeling<=
br>
c4c6cf6b6a Merge pull request #40921 from cpuguy83/19.03_log_rotate_error_=
handling<br>
7d4dd91a52 logfile: Check if log is closed on close error during rotate<br=
>
edf2c49410 vendor: pkg/errors v0.9.1<br>
1adcc64f40 Merge pull request #40877 from thaJeztah/19.03_update_buildkit<=
br>
e7349349fd Merge pull request #40850 from thaJeztah/19.03_backport_criu_3.=
13<br>
3677003554 Merge pull request #40782 from thaJeztah/19.03_backport_switch_=
to_s390x_ubuntu_1804<br>
63841af153 [19.03] vendor: buildkit v0.6.4-5-g59e305aa<br>
2fbb374ab7 Merge pull request #40863 from AkihiroSuda/rootlesskit-094-1903=
<br>
946d0ff67e bump up rootlesskit to v0.9.4<br>
70e7d6fe4a Update CRIU to v3.13 &quot;Silicon Willet&quot;<br>
f432f71595 Merge pull request #40563 from thaJeztah/19.03_backport_fix_win=
dows_file_handles<br>
47a6d9b54f Merge pull request #40565 from thaJeztah/19.03_backport_fix_bip=
_subnet_config<br>
6a0995e0d8 Merge pull request #40831 from thaJeztah/19.03_bump_swarmkit<br=
>
e4f239d68e [19.03] vendor: swarmkit 0b8364e7d08aa0e972241eb59ae981a67a587a=
0e<br>
25b82fa9b8 Merge pull request #40801 from thaJeztah/19.03_backport_update_=
go_events<br>
e149ff62fe vendor: update go-events to fix alignment for 32bit systems<br>
90a31c4829 Merge pull request #40809 from thaJeztah/19.03_update_libnetwor=
k<br>
aa98b4f5d6 Merge pull request #40803 from thaJeztah/19.03_backport_bump_go=
lang_1.13.10<br>
860e7e273d Merge pull request #40800 from thaJeztah/19.03_backport_api_doc=
s_fix_link<br>
a58b52b037 Merge pull request #40799 from thaJeztah/19.03_backport_fix_tes=
t_filter<br>
a6beb24dc5 [19.03] update libnetwork b9bcf0c3fba9ef8897c9676c5b70ba0345b84=
b17<br>
282567a58d Bump Golang 1.13.10<br>
b66813eb45 api docs: fix broken link on GitHub<br>
edbb1d9e95 Merge pull request #40784 from thaJeztah/19.03_update_buildkit<=
br>
9d8eccec8e Fix TEST_FILTER to work for both &quot;integration&quot; and &q=
uot;integration-cli&quot;<br>
4275aec641 Merge pull request #40592 from thaJeztah/19.03_backport_bump_go=
lang_1.13<br>
4b040147cf Merge pull request #40417 from thaJeztah/19.03_backport_test_fi=
xes<br>
08a2fe0d56 [19.03] vendor buildkit b26cff2413cc6a466f8739262efa13bd126f8fc=
7<br>
1e1caccb13 Merge pull request #40780 from thaJeztah/19.03_backport_map_syn=
c<br>
5ba2bf37a8 Bump Golang 1.13.9<br>
f432a04243 Update Golang 1.13.8<br>
81458b3144 Update Golang 1.13.7 (CVE-2020-0601, CVE-2020-7919)<br>
4275aec641 Merge pull request #40592 from thaJeztah/19.03_backport_bump_go=
lang_1.13<br>
4b040147cf Merge pull request #40417 from thaJeztah/19.03_backport_test_fi=
xes<br>
08a2fe0d56 [19.03] vendor buildkit b26cff2413cc6a466f8739262efa13bd126f8fc=
7<br>
1e1caccb13 Merge pull request #40780 from thaJeztah/19.03_backport_map_syn=
c<br>
5ba2bf37a8 Bump Golang 1.13.9<br>
f432a04243 Update Golang 1.13.8<br>
81458b3144 Update Golang 1.13.7 (CVE-2020-0601, CVE-2020-7919)<br>
6e1d159680 Update Golang 1.13.6<br>
4241093b63 Update Golang 1.13.5<br>
162fd8b856 Bump Golang 1.13.4<br>
05a1ebd0fd Bump Golang 1.13.3 (CVE-2019-17596)<br>
f8d4276a89 bump golang 1.13.1 (CVE-2019-16276)<br>
7df2d881f3 Bump Golang version 1.13.0<br>
fed832e224 Update to using alpine 3.10<br>
4581499848 Switch to s390x Ubuntu 18.04<br>
f34a5b5af0 builder: fix concurrent map write<br>
0df114a8f8 Merge pull request #40779 from thaJeztah/19.03_backport_unify_a=
pis<br>
9f5a5da4cb docs: add API versions v1.30 - v1.37<br>
037d5a9e9a Merge pull request #40769 from thaJeztah/19.03_backport_seccomp=
_time64<br>
5ed8f9a203 Merge pull request #40681 from thaJeztah/19.03_backport_schema2=
v1_dep_notice_on_error_only<br>
284bbde996 seccomp: add 64-bit time_t syscalls<br>
43b0a73273 Merge pull request #40758 from thaJeztah/19.03_backport_arm_mat=
ching<br>
89f296a534 Merge pull request #40562 from thaJeztah/19.03_backport_39353_s=
ubgid_subuid<br>
d12b6d24d1 Merge pull request #40628 from cpuguy83/19.03_backport_39360_sw=
arm_log_fill_rate<br>
359edd8cbf [19.03] vendor: containerd 481103c8793316c118d9f795cde18060847c=
370e<br>
1454987253 Merge pull request #40617 from SamWhited/19.03<br>
021258661b Update libnetwork and DNS library<br>
1db5199ddc Merge pull request #40564 from thaJeztah/19.03_backport_apparmo=
r_fixes<br>
6ed0f6ab78 Merge pull request #40652 from thaJeztah/19.03_backport_fix_bac=
kingfs<br>
100d240d86 Move schema1 deprecation notice<br>
4a4b3ed37f Merge pull request #40558 from thaJeztah/19.03_backport_buster_=
or_bust<br>
57d5105759 bump windows-container-utility aa1ba87e99b68e0113bd27ec26c60b88=
f9d4ccd9<br>
68db0c1739 Dockerfile: switch to iptables-legacy to match the host<br>
4aaf3ead97 Dockerfile: switch golang image to &quot;buster&quot; variant, =
and update btrfs packages<br>
a070874828 hack/make: ignore failure to stop apparmor<br>
237843a059 Dockerfile: align consecutive COPY lines<br>
400b2850ff Dockerfile: order COPY lines by change frequency<br>
ddfeaf32ff Dockerfile: sort packages alphabetically<br>
cb813faebf Dockerfile: use build-arg for vpnkit<br>
0499db23d1 Dockerfile: use spaces for indentation<br>
c77e7cb3d0 [19.03] Dockerfile: move CRIU_VERSION lower<br>
c6511ee4db bump vndr v0.1.1<br>
0fa8a0c575 bump vndr v0.1.0 to support versioned import paths<br>
f3009e2f51 Use build args to override binary commits in dockerfile<br>
92ca652fc9 Revert &quot;dockerfile: update vndr to 85886e1a&quot;<br>
fdad16840c go-swagger: fix panic<br>
075e057de5 Dockerfile: set GO111MODULE=3Doff<br>
<br>
bnetwork:<br>
<br>
026aaba Merge pull request #2567 from thaJeztah/19.03_backport_no_error<br=
>
8565f0b log error instead if disabling IPv6 router advertisement failed<br=
>
86d159c Merge pull request #2565 from s0j/s0j_bump_19.03_fix-network-not-f=
ound<br>
bcb6dd6 Fix &#39;failed to get network during CreateEndpoint&#39;<br>
153d076 bridge: disable IPv6 router advertisements<br>
71d4d82 Merge pull request #2552 from thaJeztah/19.03_backport_fix_error_h=
andline<br>
fdaaa02 Resolver: fix error handling if we didn&#39;t receive a response<b=
r>
7cf227c Merge pull request #2517 from thaJeztah/19.03_backport_bump_golang=
_1.13<br>
b9bcf0c Merge pull request #2545 from thaJeztah/19.03_backport_fix_npe_ep_=
iface<br>
b09f24d Fix NPE due to null value returned by ep.Iface()<br>
0941c3f Merge pull request #2541 from SamWhited/19.03_resolver_panic_backp=
ort<br>
8068671 Fixes a panic in the DNS resolver<br>
536ae72 Dockerfile: update to Go 1.13.8<br>
dcd9528 Fix gofmt in preparation of Go 1.13 update<br>
f0b038e regenerate protobufs with debian buster<br>
34c8de5 Dockerfile: switch to debian &quot;buster&quot;<br>
9660011 Dockerfile: update to Golang 1.12.17<br>
026aaba Merge pull request #2567 from thaJeztah/19.03_backport_no_error<br=
>
8565f0b log error instead if disabling IPv6 router advertisement failed<br=
>
86d159c Merge pull request #2565 from s0j/s0j_bump_19.03_fix-network-not-f=
ound<br>
bcb6dd6 Fix &#39;failed to get network during CreateEndpoint&#39;<br>
153d076 bridge: disable IPv6 router advertisements<br>
71d4d82 Merge pull request #2552 from thaJeztah/19.03_backport_fix_error_h=
andline<br>
fdaaa02 Resolver: fix error handling if we didn&#39;t receive a response<b=
r>
7cf227c Merge pull request #2517 from thaJeztah/19.03_backport_bump_golang=
_1.13<br>
b9bcf0c Merge pull request #2545 from thaJeztah/19.03_backport_fix_npe_ep_=
iface<br>
b09f24d Fix NPE due to null value returned by ep.Iface()<br>
0941c3f Merge pull request #2541 from SamWhited/19.03_resolver_panic_backp=
ort<br>
8068671 Fixes a panic in the DNS resolver<br>
536ae72 Dockerfile: update to Go 1.13.8<br>
dcd9528 Fix gofmt in preparation of Go 1.13 update<br>
f0b038e regenerate protobufs with debian buster<br>
34c8de5 Dockerfile: switch to debian &quot;buster&quot;<br>
9660011 Dockerfile: update to Golang 1.12.17<br>
<br>
cli:<br>
<br>
0ed913b88 Merge pull request #2592 from thaJeztah/19.03_backport_logout_co=
nfig_out_of_sync2<br>
ab45dc8fd Merge pull request #2591 from thaJeztah/19.03_backport_docs_fixe=
s2<br>
0ed913b88 Merge pull request #2592 from thaJeztah/19.03_backport_logout_co=
nfig_out_of_sync2<br>
ab45dc8fd Merge pull request #2591 from thaJeztah/19.03_backport_docs_fixe=
s2<br>
5a12f90b4 Don&#39;t filter out registries to logout from with config file =
contents<br>
0ed913b88 Merge pull request #2592 from thaJeztah/19.03_backport_logout_co=
nfig_out_of_sync2<br>
ab45dc8fd Merge pull request #2591 from thaJeztah/19.03_backport_docs_fixe=
s2<br>
5a12f90b4 Don&#39;t filter out registries to logout from with config file =
contents<br>
521a636a8 Add MOBY_DISABLE_PIGZ to dockerd environment variable docs<br>
8b8ec04cd Split up environment variable documentation between cli and dock=
erd<br>
4e7c875e3 Fix broken link<br>
2e6ff15da Merge pull request #2557 from thaJeztah/19.03_backport_fix_plugi=
n_api_link<br>
f56d1b364 Merge pull request #2575 from thaJeztah/19.03_backport_bump_gola=
ng_1.13.12<br>
8e7ff60ee Merge pull request #2589 from thaJeztah/19.03_backport_bump_x_te=
xt<br>
6cb678f16 vendor: <a href=3D"http://golang.org/x/text" rel=3D"noreferrer" =
target=3D"_blank">golang.org/x/text</a> v0.3.3<br>
4515c5187 vendor: <a href=3D"http://golang.org/x/text" rel=3D"noreferrer" =
target=3D"_blank">golang.org/x/text</a> v0.3.2<br>
43a4e09bb Merge pull request #2586 from thaJeztah/19.03_backport_context_d=
ont_loose_additional_fields<br>
cfa1fd9ac Don&#39;t loose additional metadata fields<br>
6051b36db Merge pull request #2570 from thaJeztah/19.03_backport_hardcode_=
name_in_errors<br>
31d338dd3 Bump Golang 1.13.12<br>
9cc05b9ce Merge pull request #2548 from thaJeztah/19.03_backport_fix_docke=
rd_api_link<br>
936d328da Use consistent name for errors<br>
dd360c7c0 Merge pull request #2558 from tiborvass/19.03-expenv-panic<br>
92b54c256 Merge pull request #2560 from tiborvass/19.03-sshfix<br>
2ee798198 ssh: avoid setting flags through hostname<br>
e90b6bcb6 Fix bug with panic when DOCKER_CLI_EXPERIMENTAL environment vari=
able is incorrect<br>
97afb7295 docs/extend: fix broken link and some markdown touch-ups<br>
c280cdfd6 docs: fix broken link in dockerd.md<br>
fd7874f16 Merge pull request #2532 from thaJeztah/19.03_backport_bump_gola=
ng_1.13.11<br>
a945f0e7e Merge pull request #2538 from silvin-lubecki/fix-version-old-eng=
ine-19-03<br>
0f59532a1 Run e2e tests with different engine version on Jenkins Rewrite J=
enkinsfile to new declarative syntax without parallel as the e2e framework =
is not tailored for than (container name clash, port clash,...)<br>
95df3499b Add a new Makefile variable to override DockerInDocker engine ve=
rsion we use to run e2e tests<br>
2d1476c6f Partially revert cf663b526a34f3e7911e6e60138138c2023aa844 as it =
breaks the version negotiation with an older docker engine.<br>
936e9717e Bump Golang 1.13.11<br>
ab108430b Merge pull request #2520 from thaJeztah/19.03_backport_markup_to=
uch_ups<br>
489c7e9cd docs: more Markdown touch-ups<br>
1705e47cd Merge pull request #2508 from thaJeztah/19.03_backport_config_do=
nt_init<br>
a9a83d2e7 Merge pull request #2516 from thaJeztah/19.03_backport_bump_klog=
<br>
ae2012cce Merge pull request #2518 from thaJeztah/19.03_backport_bump_pkg_=
errors<br>
052a71c4d Merge pull request #2509 from thaJeztah/19.03_backport_docs_fixe=
s<br>
9a57ea886 Update some uses of errors.Cause() to errors.Is()<br>
345b0e79e vendor: pkg/errors v0.9.1<br>
62a9babca vendor: <a href=3D"http://k8s.io/klog" rel=3D"noreferrer" target=
=
=3D"_blank">k8s.io/klog</a> v1.0.0-2-g4ad0115<br>
dbc73eafc docs: fix, and touch-up &quot;docker context&quot; docs<br>
e06fc01c1 Update dead link and add missing info on COPY<br>
8434242c7 config: don&#39;t call homedir on init()<br>
bef0d567a Merge pull request #2493 from thaJeztah/19.03_backport_update_do=
ckerd_usage<br>
65c37227a docs: update usage output for dockerd (19.03)<br>
55a5ab0f0 docs: fix order of flags in usage, and fix missing quote<br>
a2d8a8a4c Merge pull request #2484 from thaJeztah/19.03_backport_fix_build=
er_link<br>
c150ba2b8 builder: fix broken link<br>
392993336 Merge pull request #2457 from thaJeztah/19.03_backport_lazy_feat=
ure_detection<br>
62baa3ce5 Merge pull request #2471 from thaJeztah/19.03_backport_fix_bind_=
panic<br>
7a2de8165 Merge pull request #2470 from thaJeztah/19.03_backport_bump_yaml=
<br>
0ea509c77 Merge pull request #2481 from thaJeztah/19.03_backport_fix_run_r=
eference_links<br>
81909d70f docs: fix links, and minor markdown touch-ups<br>
cf663b526 cli: perform feature detection lazily<br>
c44c18e08 docker build: check experimental --platform on pre-run<br>
25f04876d app-214 Load Client info in getter function<br>
e470eef36 Merge pull request #2469 from thaJeztah/19.03_backport_docs<br>
4ad65fc35 fix panic on single-character volumes<br>
83d4cb900 vendor: bump <a href=3D"http://gopkg.in/yaml.v2" rel=3D"noreferr=
er" target=3D"_blank">gopkg.in/yaml.v2</a> v2.2.8<br>
0cfe29431 service update: fix service create example<br>
62baa3ce5 Merge pull request #2471 from thaJeztah/19.03_backport_fix_bind_=
panic<br>
7a2de8165 Merge pull request #2470 from thaJeztah/19.03_backport_bump_yaml=
<br>
0ea509c77 Merge pull request #2481 from thaJeztah/19.03_backport_fix_run_r=
eference_links<br>
81909d70f docs: fix links, and minor markdown touch-ups<br>
cf663b526 cli: perform feature detection lazily<br>
c44c18e08 docker build: check experimental --platform on pre-run<br>
25f04876d app-214 Load Client info in getter function<br>
e470eef36 Merge pull request #2469 from thaJeztah/19.03_backport_docs<br>
4ad65fc35 fix panic on single-character volumes<br>
83d4cb900 vendor: bump <a href=3D"http://gopkg.in/yaml.v2" rel=3D"noreferr=
er" target=3D"_blank">gopkg.in/yaml.v2</a> v2.2.8<br>
0cfe29431 service update: fix service create example<br>
2dc593f67 Add container_iface_prefix option to documentation<br>
d25e65734 Merge pull request #2445 from thaJeztah/19.03_backport_network_p=
rune_improve_message<br>
8986e3120 Merge pull request #2456 from thaJeztah/19.03_backport_gotest_v3=
<br>
4fe6b837b bump gotest.tools v3.0.1 for compatibility with Go 1.14<br>
a8454a4d9 update vndr v0.1.1<br>
950dcedd9 bump vndr v0.1.0 to support versioned import paths<br>
05ad944d1 Merge pull request #2453 from thaJeztah/19.03_backport_fixup_mar=
kdown_and_links<br>
0d26cbf5b yamldocs: add description to base command<br>
d4e4fa3b4 experimental/vlan-networks: markdown touch-ups<br>
de12dbfb1 docs/reference: explain &quot;colon&quot;<br>
7ae77e51f docs/extend: reformat notes<br>
733ae82da docs/builder: touch up markdown, and some minor rephrasing<br>
9a1ba7d39 docs/reference/run.md: touch-up markdown<br>
6ba9a3e4c reference docs: reformat notes<br>
96eb0888f reference docs: fix broken links and markdown touch-ups<br>
2676c603f Adding missing title in builder.md<br>
365bae4f8 Add clarification when using USER UID:GI<br>
04533bd52 Merge pull request #2442 from thaJeztah/19.03_backport_update_go=
_events<br>
c38b26007 improve &quot;network prune&quot; output to mention custom netwo=
rks only<br>
ba0a2ffe2 Merge pull request #2444 from thaJeztah/19.03_backport_host_gate=
way_validation<br>
fd9eedce3 Add &quot;host-gateway&quot; to tests for extra_hosts / --add-ho=
st<br>
365118982 Skip IPAddr validation for &quot;host-gateway&quot; string<br>
a0f0ed1f5 vendor: update go-events to fix alignment for 32bit systems<br>
173c85ad7 Merge pull request #2431 from thaJeztah/19.03_backport_bump_gola=
ng_1.13.10<br>
de6a5fa44 Bump Golang 1.13.10<br>
1a4749b8e Merge pull request #2435 from thaJeztah/19.03_backport_bump_cert=
ificates<br>
19ccd4f5d CI: update notary test certificates<br>
d7f5f70c3 Merge pull request #2419 from thaJeztah/19.03_backport_bump_gola=
ng_1.13.9<br>
f8fc68f17 Bump Golang 1.13.9<br>
7d4850005 Merge pull request #2403 from thaJeztah/19.03_backport_update_de=
precation_policy<br>
22cbf9161 Update deprecation policy to 1 stable release<br>
0b0ea3f0f Merge pull request #2401 from thaJeztah/19.03_backport_deprecati=
on_policy<br>
288cdec29 Include deprecation policy on deprecated features page<br>
a4d902af5 Merge pull request #2399 from thaJeztah/19.03_backport_remove_co=
mments<br>
ffffc1ed4 remove unneeded comment from reference files<br>
bf1f5fcfb Merge pull request #2393 from thaJeztah/19.03_backport_codehints=
_compatibility<br>
c35400655 Merge pull request #2391 from thaJeztah/19.03_backport_fix_yamld=
ocs<br>
9fd323afd Fix whitespace that caused short-format in generated YAML<br>
c936ea969 Fix yamldocs generator to accomodate nested subcommands<br>
d484456c2 Fix naming of reference docs files<br>
6a02465f4 docs: update code-hints for compatibility with &quot;rouge&quot;=
<br>
f53663a95 Merge pull request #2364 from thaJeztah/19.03_backport_bump_gola=
ng_1.13<br>
<br>
Testing has been performed across x86-64/arm via cli and docker-compose.<b=
r>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:ming.liu@toradex.com" target=
=
=3D"_blank">ming.liu@toradex.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker-moby.bb" rel=3D"n=
oreferrer" target=3D"_blank">docker-moby.bb</a> | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker-moby.bb" r=
el=3D"noreferrer" target=3D"_blank">docker-moby.bb</a> b/recipes-containers=
/docker/<a href=3D"http://docker-moby.bb" rel=3D"noreferrer" target=3D"_bla=
nk">docker-moby.bb</a><br>
index 074ef08..634e5c0 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker-moby.bb" rel=3D"n=
oreferrer" target=3D"_blank">docker-moby.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker-moby.bb" rel=3D"n=
oreferrer" target=3D"_blank">docker-moby.bb</a><br>
@@ -35,9 +35,9 @@ DESCRIPTION =3D &quot;Linux container runtime \<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0to a docker.inc recipe<br>
<br>
=C2=A0# moby commit matches the docker-engine bump on the 19.03 branch&#39=
;<br>
-SRCREV_moby =3D &quot;aa6a9891b09cce3d9004121294301a30d45d998d&quot;<br>
-SRCREV_libnetwork =3D &quot;c7bae399e46fd620b8a006174b7327e4e6e647fd&quot=
;<br>
-SRCREV_cli =3D &quot;eb310fca49568dccd87c6136f774ef6fff2a1b51&quot;<br>
+SRCREV_moby =3D &quot;9dc6525e6118a25fab2be322d1914740ea842495&quot;<br>
+SRCREV_libnetwork =3D &quot;026aabaa659832804b01754aaadd2c0f420c68b6&quot=
;<br>
+SRCREV_cli =3D &quot;0ed913b885c8919944a2e4c8d0b80a318a8dd48b&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/moby/moby.g=
it;branch=3D19.03;name=3Dmoby" rel=3D"noreferrer" target=3D"_blank">github.=
com/moby/moby.git;branch=3D19.03;name=3Dmoby</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/docker/libn=
etwork.git;branch=3Dbump_19.03;name=3Dlibnetwork;destsuffix=3Dgit/libnetwor=
k" rel=3D"noreferrer" target=3D"_blank">github.com/docker/libnetwork.git;br=
anch=3Dbump_19.03;name=3Dlibnetwork;destsuffix=3Dgit/libnetwork</a> \<br>
@@ -57,7 +57,7 @@ GO_IMPORT =3D &quot;import&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-DOCKER_VERSION =3D &quot;19.03.8&quot;<br>
+DOCKER_VERSION =3D &quot;19.03.12&quot;<br>
=C2=A0PV =3D &quot;${DOCKER_VERSION}+git${SRCREV_moby}&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-contrib&quot;<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div>

--0000000000005ac2bb05a8fff4e4--
