Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.6599.1619578073494091394
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 19:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gLvgrytu;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id j28so8336714edy.9
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Apr 2021 19:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uGf5uhXDyCM42TJLmY8tA8NazDtAHC4R3KfAiBsGX4Y=;
        b=gLvgrytu5X38wQNP6wucti1v6iUnP3hzAv4c64vDRRr/UnSBaOh/W5QjlMaVCVZ9mO
         LB7tUvvEDy0H9JNQi0nvPlaKNy6HhxY69PSGA2L56hbIpst2PPLmsY9V1yg4xF+hRbqr
         0q5get1youHWBKkuasCGa2CMhyQeqYrexnx4TCiH+UMObpw244B7dw5PJ2FlywTZcsUf
         VNaRJycAMrgTJAuAwFzMRplXYltF+o141bps90RvNRXOGn3HOwY1UckpI3wrh+GtAiSz
         gCzXBKUnHdPz9DEaqbR9EUS0znY5Dm2+dj+5glzAzVItDsFsvGoyi+VlAcEBWP/rPBDM
         SxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uGf5uhXDyCM42TJLmY8tA8NazDtAHC4R3KfAiBsGX4Y=;
        b=JR9VjX/CVtFZ3LupD7MNx3+oUCdJdXJE4ALrTQv9cTrbdncSG6Wcd+BeNdWGoLZVMK
         ot4t4PHWudU+nqzdOIsCtCThYN2ufpZxr1lQ7J9RuCaiAUxJy4cGlYuaFDgid26nIkzY
         y0hGy/65OSnpOJ+VoqV5bPgVPkyVk99IvDCcJrhaHaRsgYfofw9pcW0W5xLSCzeqnZlW
         48nMTcNolKui0cAHUQpA32stQSGt1PIOSJqvNVBQKTT7BulPe2mPAy8O7fL3vidGYOV3
         iFGUGU7ONq9VDo445wNbTmobdA7Pdxb82hRlfc2Xf4YGegsFtYijgQa9fx4TJF7TWLf9
         WwJA==
X-Gm-Message-State: AOAM532erjK9StNNs/osX603wiW6BwtQ93W6OQRZyZleqckhPHLyDmRa
	D+ypB6berB3/OdkF9Y7U7tPSifhQ9eJAGvU7A+Y=
X-Google-Smtp-Source: ABdhPJzcjl8HjRphDyBc9UWp4c+ICc9R7OnloqIx64qJhc/56XW5uVx6drGkRBQzIvWvfG8ADeI0f2a+BUxHMrPwKI8=
X-Received: by 2002:a50:bb27:: with SMTP id y36mr8100439ede.365.1619578071901;
 Tue, 27 Apr 2021 19:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210426175936.28139-1-ralph.siemsen@linaro.org>
In-Reply-To: <20210426175936.28139-1-ralph.siemsen@linaro.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 27 Apr 2021 22:47:41 -0400
Message-ID: <CADkTA4MpcUNCwko+7fugBinDrU9qyCO5T6ReUH5Q0Qi6RSHU_g@mail.gmail.com>
Subject: Re: [meta-virtualization] [dunfell][PATCH] docker-moby: update to v19.03.15
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged to dunfell.

I also ported this to gatesgarth, since that keeps it in policy of not
having newer versions on older branches.

master is ok, since it has moved to 20.x

Cheers,

Bruce

On Mon, Apr 26, 2021 at 2:00 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> Bumping to 19.03.15 to pickup bugfixes and security changes. The
> following commits comprise the change:
>
> 420b1d3625 pull: Validate layer digest format
> 5472f39022 buildkit: Apply apparmor profile
> b96fb8837b vendor buildkit 396bfe20b590914cd77945ef0d70d976a0ed093c
> 67de83e70b Use real root with 0701 perms
> 5eff67a2c2 Do not set DOCKER_TMP to be owned by remapped root
> 1342c51d5e Ensure MkdirAllAndChown also sets perms
> 7d75c1d40d Merge pull request #41731 from thaJeztah/19.03_container_1.3.9
> d3c5506330 update containerd binary to v1.3.9 (address CVE-2020-15257)
> 1babdf81e7 update containerd binary to v1.3.8
> 35968c420d Merge pull request #41685 from ameyag/19.03-bmp-libnetwork-nil-deference
> f80f6304e2 Bump libnetwork
> 837baebb74 Merge pull request #41635 from AkihiroSuda/rootlesskit-0.11.0-1903
> 4b181db52b bump up rootlesskit to v0.11.0
> 619f1b54c6 Merge pull request #41596 from thaJeztah/19.03_backport_swagger_fix
> 7487dca8a5 docs: fix builder-version swagger
> bb69504a4a Merge pull request #41557 from AkihiroSuda/cherrypick-41156-1903
> c7253a0e1a dockerd-rootless.sh: support containerd v1.4 shim socket path convention
> b27122246a Merge pull request #41542 from thaJeztah/19.03_backport_fix_41517
> 88eec2e811 Also trim "~..." from AppArmor versions
> ecd3baca25 pkg/aaparser: support parsing version like "3.0.0-beta1"
> 233a6379e5 Merge pull request #41522 from thaJeztah/19.03_backport_gcp_leak
> 74c0c5b7f1 Fix gcplogs memory/connection leak
> 88623e101c Merge pull request #41293 from thaJeztah/19.03_backport_fix_getexecuser
> 705762f23c Merge pull request #41494 from thaJeztah/19.03_backport_aws_sdk_go
> 5f32bd9ced awslogs: Update aws-sdk-go to support IMDSv2
> bd33bbf049 Merge pull request #41314 from thaJeztah/19.03_backport_fix_racey_logger_test
> 426396f438 Merge pull request #41451 from thaJeztah/19.03_update_buildkit
> 406dba269c Merge pull request #41446 from thaJeztah/19.03_backport_swagger_fixes
> 50b33bd3cd Merge pull request #41312 from thaJeztah/19.03_backport_pass_network_error
> 519462f3df Merge pull request #41334 from thaJeztah/19.03_backport_bump_golang_1.13.15
> 64fffefffa Merge pull request #40408 from thaJeztah/19.03_backport_update_containerd_1.3
> 8cf9d50fc0 [19.03] vendor: buildkit v0.6.4-32-gdf89d4dc
> a4e96a486f swagger: fix MemTotal units in SystemInfo endpoint
> 9fe291827a Bump Golang 1.13.15
> a15a770e1b update containerd to v1.3.7
> 9380ec7397 update containerd to v1.3.6
> 80cef48453 update containerd to v1.3.5
> fc8f88dc14 update containerd to v1.3.4
> 89a4208757 update containerd binary to v1.3.3
> 490c45b756 Update containerd to v1.3.2
> 56d897347d Update containerd to v1.3.1
> d4c63720e9 update containerd binary v1.3.0
> ec14dc44d1 Fix log file rotation test.
> a958fc3e65 Fix flakey test for log file rotate.
> 89da709cb7 Check for context error that is wrapped in url.Error
> 88820a4793 Merge pull request #41287 from thaJeztah/19.03_backport_bump_netns
> 83baeafc3c oci: correctly use user.GetExecUser interface
> dae08c333e vendor: vishvananda/netns db3c7e526aae966c4ccfa6c8189b693d6ac5d202
> 93cb737687 [19.03] vendor: vishvananda/netns 0a2b9b5464df8343199164a0321edf3313202f7e
> 7d597ee2c9 Merge pull request #41273 from thaJeztah/19.03_backport_swagger_fixes
> 22c458b67c Merge pull request #41274 from thaJeztah/19.03_backport_Double_RLock
> 8b97280f11 Merge pull request #41279 from thaJeztah/19.03_bump_buildkit
> eda52d433e [19.03] vendor: moby/buildkit v0.6.4-28-gda1f4bf1
> 168254fcfa Merge pull request #41277 from AkihiroSuda/rootlesskit-0.10.0-1903
> 9dc455dffb bump up rootlesskit to v0.10.0
> c200868fa2 Merge pull request #41271 from thaJeztah/19.03_backport_remove_dockerproject_from_tests
> 9eade7d03c docs: API v1.39: move system version response to definitions
> 4685e9ef72 docs: API v1.40: move system version response to definitions
> d8f22d0307 swagger: move system version response to definitions
> 32366de5f9 plugin: fix a double RLock bug
> ad0278f002 docs: API v1.39: fix type for BuildCache CreatedAt and LastUsedAt
> cb8b7a282d docs: API v1.40: fix type for BuildCache CreatedAt and LastUsedAt
> e1ae07b7a0 swagger: fix type for BuildCache CreatedAt and LastUsedAt
> d49278cc17 Merge pull request #41269 from thaJeztah/19.03_update_buildkit
> 892c228219 Remove apt.dockerproject.org from test
> a7e309944b Merge pull request #41248 from thaJeztah/19.03_backport_swagger_updates
> 765245d54b [19.03] vendor: moby/buildkit v0.6.4-26-ga1e4f48e
> 2d4bfdc789 Merge pull request #41081 from thaJeztah/19.03_backport_fix_sandbox_cleanup
> b990b6c2b0 Merge pull request #41235 from thaJeztah/19.03_backport_bump_golang_1.13.14
> 4d9397c268 swagger: sync updates to v1.39
> 51bd95dc95 swagger: sync updates to v1.40
> d5ba93575c docs: sync API v1.40 swagger formatting with current version
> 12b7746a84 docs: sync API v1.39 swagger formatting with current version
> 0c6bdf5974 docs: add example calculations to container stats API
> 630185b4ae swagger: add DeviceRequests to container create, inspect example
> d7423180e7 swagger: move NetworkingConfig to definitions
> c30ff6885e swagger: reformat, and wrap to ~80-chars
> 7005841048 swagger: clarify the meaning of Image field in ContainerInspect endpoint
> 1608292c09 Bump Golang 1.13.14
> 1763b4e88b Bump Go 1.13.13
> 5e8ab898c7 Merge pull request #41222 from thaJeztah/19.03_bump_buildkit
> 23d47bd12e [19.03] vendor: moby/buildkit v0.6.4-20-g4cb720ef
> 789bd1c67b Merge pull request #41192 from ameyag/19.03-hcsshim-vndr
> 0eaa22b95d Merge pull request #41185 from thaJeztah/19.03_bump_buildkit
> 9d6053eda2 Revendor hcsshim to fix image import bug
> 589b07262c vendor: Microsoft/hcsshim v0.8.9
> e7c2b106ec [19.03] vendor: buildkit dc6afa0f755f6cbb7e85f0df4ff4b87ec280cb32 (v0.6.4-15-gdc6afa0f)
> a40b877fbb Merge pull request #41133 from roidelapluie/bsd2
> 7dd9fdcfbe Enable client on netbsd and dragonfly
> 9dc6525e61 Merge pull request #41124 from thaJeztah/19.03_bump_libnetwork
> abb5beffff Merge pull request #41088 from thaJeztah/19.03_backport_invalid_cpu_shares_fix
> b4ca19a992 vendor: docker/libnetwork 026aabaa659832804b01754aaadd2c0f420c68b6 (bump_19.03 branch)
> d5a82971a4 Merge pull request #41082 from thaJeztah/19.03_backport_bump_golang_1.13.12
> 5fce12cf25 int-cli/TestRunInvalidCPUShares: fix for newer runc
> 058ea43c5c Bump Golang 1.13.12
> ae158b371c allocateNetwork: fix network sandbox not cleaned up on failure
> 77e06fda0c vendor libnetwork to 153d0769a1181bf591a9637fd487a541ec7db1e6
> b47e742558 Merge pull request #41027 from thaJeztah/19.03_bump_criu
> b85d75e29a Merge pull request #41009 from tiborvass/19.03-fix-dns-fallback-regression
> c104a50de4 integration: Add TestDaemonDNSFallback
> 9482566a5c vendor libnetwork to 71d4d82a5ce50453b1121d95544f0a2ae95bef9b
> d4e12315cd hack: add more debugging to understand exit codepath
> 4c24512241 Dockerfile: bump CRIU 3.14
> ad0f0b3970 Merge pull request #40978 from thaJeztah/19.03_backport_bump_golang_1.13.11
> 29796375c9 Bump Golang 1.13.11
> c1cc6ec81a Merge pull request #40988 from thaJeztah/19.03_backport_fix_gotestsum_install
> 8f1ab4e612 Fix bug in gotestsum installer causing dependencies to not be downloaded
> 811a247d06 Merge pull request #40970 from AkihiroSuda/archive-40939-1903
> 4d1885fb94 Merge pull request #40964 from AkihiroSuda/rootless-requires-slirp4netns-040-1903
> 0a3b2bda34 pkg/archive: escape ":" symbol in overlay lowerdir
> 9057ddf37c dockerd-rootless.sh: bump up slirp4netns requirement to v0.4.0
> ab567a4327 Merge pull request #40955 from tonistiigi/19.03-buildkit-update
> ee3f3ece72 Merge pull request #40951 from AkihiroSuda/rootlesskit-095-1903
> a76633684b vendor: update buildkit to a7d7b7f1
> 0803200be9 Merge pull request #40946 from thaJeztah/19.03_backport_fix_selinux_enotsup
> 706008a1da bump up rootlesskit to v0.9.5
> 57f6c9a0ef SELinux: fix ENOTSUP errors not being detected when relabeling
> c4c6cf6b6a Merge pull request #40921 from cpuguy83/19.03_log_rotate_error_handling
> 7d4dd91a52 logfile: Check if log is closed on close error during rotate
> edf2c49410 vendor: pkg/errors v0.9.1
> 1adcc64f40 Merge pull request #40877 from thaJeztah/19.03_update_buildkit
> e7349349fd Merge pull request #40850 from thaJeztah/19.03_backport_criu_3.13
> 3677003554 Merge pull request #40782 from thaJeztah/19.03_backport_switch_to_s390x_ubuntu_1804
> 63841af153 [19.03] vendor: buildkit v0.6.4-5-g59e305aa
> 2fbb374ab7 Merge pull request #40863 from AkihiroSuda/rootlesskit-094-1903
> 946d0ff67e bump up rootlesskit to v0.9.4
> 70e7d6fe4a Update CRIU to v3.13 "Silicon Willet"
> f432f71595 Merge pull request #40563 from thaJeztah/19.03_backport_fix_windows_file_handles
> 47a6d9b54f Merge pull request #40565 from thaJeztah/19.03_backport_fix_bip_subnet_config
> 6a0995e0d8 Merge pull request #40831 from thaJeztah/19.03_bump_swarmkit
> e4f239d68e [19.03] vendor: swarmkit 0b8364e7d08aa0e972241eb59ae981a67a587a0e
> 25b82fa9b8 Merge pull request #40801 from thaJeztah/19.03_backport_update_go_events
> e149ff62fe vendor: update go-events to fix alignment for 32bit systems
> 90a31c4829 Merge pull request #40809 from thaJeztah/19.03_update_libnetwork
> aa98b4f5d6 Merge pull request #40803 from thaJeztah/19.03_backport_bump_golang_1.13.10
> 860e7e273d Merge pull request #40800 from thaJeztah/19.03_backport_api_docs_fix_link
> a58b52b037 Merge pull request #40799 from thaJeztah/19.03_backport_fix_test_filter
> a6beb24dc5 [19.03] update libnetwork b9bcf0c3fba9ef8897c9676c5b70ba0345b84b17
> 282567a58d Bump Golang 1.13.10
> b66813eb45 api docs: fix broken link on GitHub
> edbb1d9e95 Merge pull request #40784 from thaJeztah/19.03_update_buildkit
> 9d8eccec8e Fix TEST_FILTER to work for both "integration" and "integration-cli"
> 4275aec641 Merge pull request #40592 from thaJeztah/19.03_backport_bump_golang_1.13
> 4b040147cf Merge pull request #40417 from thaJeztah/19.03_backport_test_fixes
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
> 0df114a8f8 Merge pull request #40779 from thaJeztah/19.03_backport_unify_apis
> 9f5a5da4cb docs: add API versions v1.30 - v1.37
> 037d5a9e9a Merge pull request #40769 from thaJeztah/19.03_backport_seccomp_time64
> 5ed8f9a203 Merge pull request #40681 from thaJeztah/19.03_backport_schema2v1_dep_notice_on_error_only
> 284bbde996 seccomp: add 64-bit time_t syscalls
> 43b0a73273 Merge pull request #40758 from thaJeztah/19.03_backport_arm_matching
> 89f296a534 Merge pull request #40562 from thaJeztah/19.03_backport_39353_subgid_subuid
> d12b6d24d1 Merge pull request #40628 from cpuguy83/19.03_backport_39360_swarm_log_fill_rate
> 359edd8cbf [19.03] vendor: containerd 481103c8793316c118d9f795cde18060847c370e
> 1454987253 Merge pull request #40617 from SamWhited/19.03
> 021258661b Update libnetwork and DNS library
> 1db5199ddc Merge pull request #40564 from thaJeztah/19.03_backport_apparmor_fixes
> 6ed0f6ab78 Merge pull request #40652 from thaJeztah/19.03_backport_fix_backingfs
> 100d240d86 Move schema1 deprecation notice
> 4a4b3ed37f Merge pull request #40558 from thaJeztah/19.03_backport_buster_or_bust
> 57d5105759 bump windows-container-utility aa1ba87e99b68e0113bd27ec26c60b88f9d4ccd9
> 68db0c1739 Dockerfile: switch to iptables-legacy to match the host
> 4aaf3ead97 Dockerfile: switch golang image to "buster" variant, and update btrfs packages
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
> fe2a25a785 fix backingFs assignment
> e6c9e2736f Fix rate limiting for logger, increase refill rate
> 911ecc3376 Set the bip network value as the subnet
> 08420b1c95 AppArmor: add missing rules for running in userns
> fbb08f525f AppArmor: remove rules for linkgraph.db SQLite database
> 1a830501b7 Use FILE_SHARE_DELETE for log files on Windows.
> dcae74c44a Fix docker crash when creating namespaces with UID in /etc/subuid and /etc/subgid
> 4076c57b50 Fix more signal handling issues in tests.
> 68e1150357 DaemonCli: Move check into startMetricsServer
> b813c398bb Add `FromClient` to test env execution
>
> No change to libnetwork or cli.
>
> Tested on arm32 via cli.
>
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
>  recipes-containers/docker/docker-moby.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-moby.bb b/recipes-containers/docker/docker-moby.bb
> index 074ef08..762a785 100644
> --- a/recipes-containers/docker/docker-moby.bb
> +++ b/recipes-containers/docker/docker-moby.bb
> @@ -35,7 +35,7 @@ DESCRIPTION = "Linux container runtime \
>  #     to a docker.inc recipe
>
>  # moby commit matches the docker-engine bump on the 19.03 branch'
> -SRCREV_moby = "aa6a9891b09cce3d9004121294301a30d45d998d"
> +SRCREV_moby = "420b1d36250f9cfdc561f086f25a213ecb669b6f"
>  SRCREV_libnetwork = "c7bae399e46fd620b8a006174b7327e4e6e647fd"
>  SRCREV_cli = "eb310fca49568dccd87c6136f774ef6fff2a1b51"
>  SRC_URI = "\
> @@ -57,7 +57,7 @@ GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> -DOCKER_VERSION = "19.03.8"
> +DOCKER_VERSION = "19.03.15"
>  PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
>
>  PACKAGES =+ "${PN}-contrib"
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
