Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB593C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 18:47:07 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web11.4790.1709146024771625836
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 10:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FiNjDPri;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7d5cbc4a585so15339241.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Feb 2024 10:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709146024; x=1709750824; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zRCdyo/yvCNK0FS4mnikKj0I8IKFM9kYL17jiopOBBM=;
        b=FiNjDPriBQBD3sU9ZfPQFFvF3ipT4S2LucBuZBSPeOZ6+9cOvdGtaNW54LFKrbYcdy
         OhOTeiL4WcDDspcIM9/D5cIg0KlPKE0AZctEYWGMc9Q9CimBSd0lIIaJW2kZjHMCqU5j
         4+7zXRg+8vwUPKOW7LzxU0D6wpfHMEjkCxQp4FgQN1Lp9iPVAP6EFzlqL0zPRkq8PAgm
         M8dRaUsOkqmLXz7WnCvnuZae8FDEZLzuNgt+UQVoNht6iEETxyLB5Zqt+CIhJ3hZguA2
         yC2H+5pNug+Ks0hgg/LnNGE6veQpzpa4r3L/3X62F1KVh8uGzNJdlx1ZXEH3zkGsdx4E
         do3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709146024; x=1709750824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRCdyo/yvCNK0FS4mnikKj0I8IKFM9kYL17jiopOBBM=;
        b=iXMe3qqHBYXb2RlDl9TMXwGtrxQ5yots8FCHxggnNFimAdEN/QI0PUOPC7JOPLI7sJ
         Dx+coq/vcNWMacbvEcZpcHDKq+h2rLdCW7Zv3QDrUygamAX+Lgj4WZDk1r+ZQGl/JeuS
         KjWBqyzRDWj1Jv0pONkDtPwXfTGK2NAJtr846MkOMTFYKPrm8kjE+mFB6uJ1m4DeQ+8+
         aJdUKKnM6XUttirKs2IRGdkAunbw/pBTcS0c0j3kVsbDaAoIkDIPJWPI1gKCeGzc2WW5
         lAWA2OuI+5nhNtQDv/yUTx1Bm1z1kot57jLO7l6MNmd1/tq29P7C51fy0/ux1bBAogWR
         gVCg==
X-Gm-Message-State: AOJu0Yzm5eygTc0t4kLHu7cOCK8BuINDOOSfeZFUsmqw7rp76r/rnDtO
	exd/MuWkxhOLHkb/d6m2RxMCSckvyzW+rRSD7lt3E/qPpJ4yOUVAndG0pirJVD8EqdLRLsb/uZ6
	Odg3s2K0IQuaWzHG028wcZy+jpBg=
X-Google-Smtp-Source: AGHT+IHwPF/o/Zjk8iBtZ4dzbXzDLTWamS+D0uuTBD190do3rK5QB21uNnwzXDJQ7rluvDSxepIL/S26q+5BuFZ5F4U=
X-Received: by 2002:a05:6102:3709:b0:472:53e0:6549 with SMTP id
 s9-20020a056102370900b0047253e06549mr568287vst.14.1709146023249; Wed, 28 Feb
 2024 10:47:03 -0800 (PST)
MIME-Version: 1.0
References: <17B81B224EDE23E7.18468@lists.yoctoproject.org>
In-Reply-To: <17B81B224EDE23E7.18468@lists.yoctoproject.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 28 Feb 2024 18:46:51 +0000
Message-ID: <CANPvuRnSVmphHUtVub0=Q3cMAVX2cpyK-Mc7OvYyXFOuu1-8zg@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC meta-virtualization][PATCH]
 docker-compose: v2.21.0 -> v2.23.3
To: quaresma.jose@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000095cf51061275912f"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Feb 2024 18:47:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8596

--00000000000095cf51061275912f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The recipe on meta-virt main-next fails to build with go-1.21 and I have
updated it with:
./meta-virtualization/scripts/oe-go-mod-autogen.py --repo
https://github.com/docker/compose --rev v2.23.3

Jose

Jose Quaresma via lists.yoctoproject.org <quaresma.jose=3D
gmail.com@lists.yoctoproject.org> escreveu (quarta, 28/02/2024 =C3=A0(s) 18=
:44):

> - c665c53c bump buildx to v0.12.0 and adapt code to changes
> - a1aceba6 Merge pull request #11215 from docker/dependabot/go_modules/
> github.com/compose-spec/compose-go-1.20.2
> - a39cf75e build(deps): bump github.com/compose-spec/compose-go
> - 5b0dcc5a Merge pull request #11214 from docker/dependabot/go_modules/
> github.com/spf13/cobra-1.8.0
> - 46ba9c99 build(deps): bump github.com/spf13/cobra from 1.7.0 to 1.8.0
> - 1148b676 Merge pull request #11142 from docker/dependabot/go_modules/
> github.com/docker/cli-24.0.7incompatible
> - 5c5d30c6 build(deps): bump github.com/docker/cli
> - 2068ecee Merge pull request #11143 from docker/dependabot/go_modules/
> github.com/docker/docker-24.0.7incompatible
> - 36fa8d4e build(deps): bump github.com/docker/docker
> - 69985b8b Merge pull request #11112 from docker/dependabot/go_modules/
> github.com/moby/buildkit-0.12.3
> - 2384635e build(deps): bump github.com/moby/buildkit from 0.12.2 to
> 0.12.3
> - 587dba11 Merge pull request #11213 from
> glours/watch-force-build-at-startup
> - 2ba5e4c1 in watch mode force pull policy to build for services with bot=
h
> build and develop attributes This default behaviour will force a rebuild =
of
> the service images at watch process startup and be sure containers will b=
e
> in sync with the local source code
> - b1a26dac Assume /src/pkg/compose/testdata absolute workingdir to make
> tests reproducible
> - 0ab21a20 Merge pull request #11211 from ndeloof/Services
> - 5e77ae92 avoir use of []types.ServiceConfig
> - f5572201 identify services to build and don't display 'building' if non=
e
> - 8e1b3236 fix --remove-orphans not to consider disabled services as
> orphaned
> - a1b7bee0 Merge pull request #11206 from ndeloof/check_runtime
> - 7cb1f8ba introduce RuntimeVersion for code to check container runtime
> supports required features
> - cb01186c push also consider build.tags
> - efea084d Merge pull request #11192 from
> ulyssessouza/exclude-tests-context
> - 9c4efbdd Strip project prefix from docker-compose up output
> - 8ea7c9e0 Make it context aware and add test skipping options
> - c1694360 render quiet after filtering applied
> - 254a94b0 bump golang to version 1.21.4
> - cf608fa9 bump compose-go to v1.20.1
> - 426377a4 reject compose file using `secrets|configs.driver or
> template_driver`
> - 43c3f545 Merge pull request #11180 from ulyssessouza/skip-flaky-tests
> - 493f6c80 skips flaky e2e tests on watch and attach
> - c1a9ffa0 Merge pull request #11171 from szampardi/main
> - 646a8fc0 fix docker/compose#11170 add newline in cmd/compose/build.go
> fmt.Fprint
> - 2945532f fix --pull documentation
> - e5cd265a improve watch configuration logging Add action associated to
> each managed path
> - d646d757 lint
> - 71237ef6 do not resolve cache dir until remote resource is in use
> - 0d905a89 add a copyright notice with original author
> - b847c7f5 implement runtime file selection
> - 5e3d8f67 re-implement cache folder detection
> - 67279088 introduce --resolve-image-digests for publish to seal service
> images by digest
> - 5661fd1b Merge pull request #11149 from aevesdocker/ENGDOCS-1764
> - 4cd61957 fix build
> - 0d4cbbdb fix
> - 9631a49d ENGDOCS-1764
> - 328ca3f2 add docs upstream validation workflow
> - e1bbfc63 build(deps): bump go.uber.org/goleak from 1.2.1 to 1.3.0
> - 616bba0a linter errors fixed
> - ee6e3c2a NetworkList to NetworkInspect for ID search
> - c7e31a3c Squashing feature branch commits in order to add signoff
> message.
> - 704a9fd3 Use project.ServiceNames() if no service specified in hash
> - d9e0e42d Add branch configuration for pull_request trigger
> - c48e3c4a Initial codeql.yml commit
> - dd0803db fix SIGTERM support to stop/kill stack
> - 39008c53 align with OCI artifact best practices
> - 6ab41d62 Merge pull request #11060 from
> Juneezee/refactor/redundant-len-check
> - 6c345b37 refactor(cmd/compose/run): remove redundant `len` check
> - b8773ad1 Merge pull request #11110 from ndeloof/wait_missing
> - 1ffa194e fail start if depependency is missing
> - b9298101 check that the pull policy provided is a valid one or is not
> missing when --pull is used
> - af87f106 Merge pull request #11108 from ndeloof/down-services
> - 5e1d3f2b Merge pull request #11051 from ndeloof/warn_remote_disabled
> - 3d0207eb remove uncessary return value of pullComposeFiles function
> - 16a7c209 enable profile when down is ran with explicit service names
> - 818bc3c3 add sync+restart action to watch attribute
> - cf3e686d Merge pull request #11078 from docker/dependabot/go_modules/
> github.com/containerd/containerd-1.7.7
> - 38bc6d5d build(deps): bump github.com/containerd/containerd from 1.7.6
> to 1.7.7
> - 4a2d4c44 Merge pull request #11083 from docker/dependabot/go_modules/
> github.com/google/go-cmp-0.6.0
> - 0b6ce6ee build(deps): bump github.com/google/go-cmp from 0.5.9 to 0.6.0
> - 034458da Merge pull request #11105 from docker/dependabot/go_modules/
> google.golang.org/grpc-1.59.0
> - ae16bbbf build(deps): bump google.golang.org/grpc from 1.58.2 to 1.59.0
> - eb5f01ba Merge pull request #11068 from docker/dependabot/go_modules/
> golang.org/x/sync-0.4.0
> - d13ad1f9 build(deps): bump golang.org/x/sync from 0.3.0 to 0.4.0
> - 9b4d577c remove refrecence docs generation
> - b30978fb Merge pull request #11076 from glours/remove-cucumber
> - 14b43c1a remove cucumber tests as we haven't added new ones for a while
> - 9dd081b9 add support of COMPOSE_ENV_FILES env variable to pass a list o=
f
> env files
> - 2c0b0232 add dry-run support for publish command
> - 599e4b24 extract method to reduce cyclomatic complexity
> - fe8c2780 warn user remote resource is disabled
> - a345515f Don't delete dependent services
> - 8967df7a Apply platform before hashing
> - 4f694919 deps: remove deprecated github.com/pkg/errors
> - 6ecab957 Include image name in error message
> - 12e0ac89 pkg/compose/publish: use empty config descriptor mediaType
> - a6b7d785 pkg/remote/oci: check artifactType instead of config.mediaType
> - 991901f2 pkg/remote/oci: refer to the manifest as manifest
> - bd74a926 Merge pull request #11047 from
> glours/update-watch-warning-section
> - 2d971fc9 update the watch warning message when no services with a
> develop section
> - 78f33619 ci: enable verbose output for e2e tests (#11045)
> - 44d21280 truncate command by default, introduce --no-trunc flag to get
> the full command
> - cd743d17 Merge pull request #11036 from docker/dependabot/go_modules/
> google.golang.org/grpc-1.58.2
> - ff2ff18c build(deps): bump google.golang.org/grpc from 1.58.1 to 1.58.2
> - bd32ed14 Merge pull request #11025 from ndeloof/SkipResolveEnvironment
> - ab81db5b config --xx don't need `env_file` being parsed
> - 52a641bf Merge pull request #11021 from glours/move-watch-to-main-cmd
> - 75f5c07d Merge pull request #11023 from glours/fix-watch-e2e-test-clean=
up
> - 61c8be11 remove --timeout=3D0 flag to cleanup function of watch e2e tes=
t
> compose down command need the watch process to be killed to succeed
> - 6be5f300 move watch from alpha to main command
> - 421a6b05 Merge pull request #11031 from ndeloof/TestWatch
> - c34c306c TestWatch to use new  `develop` section
> - 5ca35c88 implement publish
> - 805541be watch: use official `develop` section (#11026)
> - d322ad91 Merge pull request #11027 from docker/dependabot/go_modules/
> github.com/opencontainers/image-spec-1.1.0-rc5
> - 8f489d6d build(deps): bump github.com/opencontainers/image-spec
> - a214a715 Merge pull request #11017 from docker/dependabot/go_modules/
> github.com/moby/buildkit-0.12.2
> - 9ea8fbc6 build(deps): bump github.com/moby/buildkit from 0.12.1 to
> 0.12.2
> - 062fa755 Merge pull request #11020 from
> docker/dependabot/go_modules/gotest.tools/v3-3.5.1
> - 76f150e4 build(deps): bump gotest.tools/v3 from 3.5.0 to 3.5.1
> - d45d943e Merge pull request #11019 from docker/dependabot/go_modules/
> google.golang.org/grpc-1.58.1
> - f447c809 build(deps): bump google.golang.org/grpc from 1.58.0 to 1.58.1
> - 722796ca Merge pull request #11016 from docker/dependabot/go_modules/
> github.com/containerd/containerd-1.7.6
> - 4587d4ba build(deps): bump github.com/containerd/containerd from 1.7.3
> to 1.7.6
> - a697a069 introduce pull --missing flag to only pull images not present
> in cache
> - 8af49ff3 resolve service reference into container based on observed sta=
te
> - f6e31dbc don't rely on depends_on to resolve volume_from, better use
> observed state
> - e19232e8 Merge pull request #11000 from thaJeztah/update_golang_1.21.1
> - 6d5eb6fd update to go1.21.1
> - 9d7e0ad6 correct scale error messages formatting
> - 1a98a70b add scale command
> - 19bbb12f ci: tweak restricted imports in linter (#10992)
> - 7a134578 deps: upgrade Moby to v24.0.6 and gRPC to v1.58.0 (#10991)
> - 13115468 cli: fix `--build` flag for `create` (#10982)
> - e1aa4f77 otel: add args & flags to cli traces (#10974)
> - d7b0b2bd watch: build & launch the project at start (#10957)
> - e0f39ebb pull OCI remote resource
> - c9d54f09 introduce publish (alpha) command
> - aeb835a5 Merge pull request #10966 from kumarlokesh/patch-1
> - 52e54ef9 doc: updated README.md to remove broken link
> - 203bce88 Merge pull request #10954 from thaJeztah/swap_reference
> - f4f2e934 migrate to github.com/distribution/reference
> - 32c3d0a3 Enable service explicitly requested to be restarted
> - 1fdbcb62 build: pass BuildOptions around explicitly & fix multi-platfor=
m
> issues
> - 407a0d5b up: fix various race/deadlock conditions on exit (#10934)
> - d0dfb848 Merge pull request #10953 from thaJeztah/drop_uuid
> - 8caa6f1f pkg/api: replace uuid for basic random id
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  .../docker-compose/docker-compose_git.bb      |   4 +-
>  .../docker-compose/files/modules.txt          | 119 +++---
>  .../docker-compose/relocation.inc             |  38 +-
>  recipes-containers/docker-compose/src_uri.inc | 348 +++++++-----------
>  4 files changed, 182 insertions(+), 327 deletions(-)
>
> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb
> b/recipes-containers/docker-compose/docker-compose_git.bb
> index b7745f2..8154cc5 100644
> --- a/recipes-containers/docker-compose/docker-compose_git.bb
> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> @@ -9,7 +9,7 @@ DEPENDS =3D " \
>
>  # Specify the first two important SRCREVs as the format
>  SRCREV_FORMAT=3D"compose_survey"
> -SRCREV_compose =3D "d6f842b042d2f2926901305336527b3eaadf067a"
> +SRCREV_compose =3D "c665c53cc1eb633a819fcaa9b47d77597b55d0eb"
>
>  SRC_URI =3D "git://
> github.com/docker/compose;name=3Dcompose;branch=3Dmain;protocol=3Dhttps"
>
> @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D
> "file://src/import/LICENSE;md5=3D175792518e4ac015ab6696d16c4f60
>
>  GO_IMPORT =3D "import"
>
> -PV =3D "v2.21.0"
> +PV =3D "v2.23.3"
>
>  COMPOSE_PKG =3D "github.com/docker/compose/v2"
>
> diff --git a/recipes-containers/docker-compose/files/modules.txt
> b/recipes-containers/docker-compose/files/modules.txt
> index d287d12..c8219da 100644
> --- a/recipes-containers/docker-compose/files/modules.txt
> +++ b/recipes-containers/docker-compose/files/modules.txt
> @@ -2,27 +2,25 @@
>  ## explicit
>  # github.com/Microsoft/go-winio v0.6.1
>  ## explicit
> -# github.com/adrg/xdg v0.4.0
> -## explicit
>  # github.com/buger/goterm v1.0.4
>  ## explicit
> -# github.com/compose-spec/compose-go v1.18.3
> +# github.com/compose-spec/compose-go v1.20.2
>  ## explicit
>  # github.com/containerd/console v1.0.3
>  ## explicit
> -# github.com/containerd/containerd v1.7.3
> +# github.com/containerd/containerd v1.7.7
>  ## explicit
> -# github.com/cucumber/godog v0.0.0-00010101000000-000000000000
> +# github.com/davecgh/go-spew v1.1.1
>  ## explicit
> -# github.com/distribution/distribution/v3
> v3.0.0-20230601133803-97b1d649c493
> +# github.com/distribution/reference v0.5.0
>  ## explicit
> -# github.com/docker/buildx v0.11.2
> +# github.com/docker/buildx v0.12.0
>  ## explicit
> -# github.com/docker/cli v24.0.5+incompatible
> +# github.com/docker/cli v24.0.7+incompatible
>  ## explicit
>  # github.com/docker/cli-docs-tool v0.6.0
>  ## explicit
> -# github.com/docker/docker v24.0.5+incompatible
> +# github.com/docker/docker v24.0.7+incompatible
>  ## explicit
>  # github.com/docker/go-connections v0.4.0
>  ## explicit
> @@ -32,6 +30,8 @@
>  ## explicit
>  # github.com/golang/mock v1.6.0
>  ## explicit
> +# github.com/google/go-cmp v0.6.0
> +## explicit
>  # github.com/hashicorp/go-multierror v1.1.1
>  ## explicit
>  # github.com/hashicorp/go-version v1.6.0
> @@ -42,7 +42,7 @@
>  ## explicit
>  # github.com/mitchellh/mapstructure v1.5.0
>  ## explicit
> -# github.com/moby/buildkit v0.12.1
> +# github.com/moby/buildkit v0.13.0-beta1.0.20231023114302-d5c1d785b042
>  ## explicit
>  # github.com/moby/patternmatcher v0.6.0
>  ## explicit
> @@ -52,13 +52,13 @@
>  ## explicit
>  # github.com/opencontainers/go-digest v1.0.0
>  ## explicit
> -# github.com/opencontainers/image-spec v1.1.0-rc4
> +# github.com/opencontainers/image-spec v1.1.0-rc5
>  ## explicit
> -# github.com/pkg/errors v0.9.1
> +# github.com/otiai10/copy v1.14.0
>  ## explicit
>  # github.com/sirupsen/logrus v1.9.3
>  ## explicit
> -# github.com/spf13/cobra v1.7.0
> +# github.com/spf13/cobra v1.8.0
>  ## explicit
>  # github.com/spf13/pflag v1.0.5
>  ## explicit
> @@ -78,22 +78,26 @@
>  ## explicit
>  # go.opentelemetry.io/otel/trace v1.14.0
>  ## explicit
> -# go.uber.org/goleak v1.2.1
> +# go.uber.org/goleak v1.3.0
>  ## explicit
> -# golang.org/x/sync v0.3.0
> +# golang.org/x/exp v0.0.0-20230713183714-613f0c0eb8a1
>  ## explicit
> -# google.golang.org/grpc v1.57.0
> +# golang.org/x/sync v0.5.0
>  ## explicit
> -# gopkg.in/yaml.v2 v2.4.0
> +# golang.org/x/sys v0.14.0
>  ## explicit
> -# gotest.tools/v3 v3.5.0
> +# google.golang.org/grpc v1.59.0
>  ## explicit
> -# github.com/AdaLogics/go-fuzz-headers v0.0.0-20230106234847-43070de90fa=
1
> +# gotest.tools/v3 v3.5.1
> +## explicit
> +# github.com/AdaLogics/go-fuzz-headers v0.0.0-20230811130428-ced1acdcaa2=
4
>  ## explicit
>  # github.com/Azure/go-ansiterm v0.0.0-20210617225240-d185dfc1b5a1
>  ## explicit
>  # github.com/Masterminds/semver/v3 v3.2.1
>  ## explicit
> +# github.com/Microsoft/hcsshim v0.11.1
> +## explicit
>  # github.com/aws/aws-sdk-go-v2 v1.17.6
>  ## explicit
>  # github.com/aws/aws-sdk-go-v2/config v1.18.16
> @@ -120,26 +124,16 @@
>  ## explicit
>  # github.com/beorn7/perks v1.0.1
>  ## explicit
> -# github.com/bugsnag/bugsnag-go v1.5.0
> -## explicit
>  # github.com/cenkalti/backoff/v4 v4.2.0
>  ## explicit
>  # github.com/cespare/xxhash/v2 v2.2.0
>  ## explicit
> -# github.com/cloudflare/cfssl v1.6.4
> +# github.com/containerd/continuity v0.4.2
>  ## explicit
> -# github.com/containerd/continuity v0.4.1
> +# github.com/containerd/log v0.1.0
>  ## explicit
>  # github.com/containerd/typeurl/v2 v2.1.1
>  ## explicit
> -# github.com/cucumber/gherkin-go/v19 v19.0.3
> -## explicit
> -# github.com/cucumber/messages-go/v16 v16.0.1
> -## explicit
> -# github.com/cyphar/filepath-securejoin v0.2.3
> -## explicit
> -# github.com/davecgh/go-spew v1.1.1
> -## explicit
>  # github.com/docker/distribution v2.8.2+incompatible
>  ## explicit
>  # github.com/docker/docker-credential-helpers v0.7.0
> @@ -166,8 +160,6 @@
>  ## explicit
>  # github.com/gofrs/flock v0.8.1
>  ## explicit
> -# github.com/gofrs/uuid v4.2.0+incompatible
> -## explicit
>  # github.com/gogo/googleapis v1.4.1
>  ## explicit
>  # github.com/gogo/protobuf v1.3.2
> @@ -176,8 +168,6 @@
>  ## explicit
>  # github.com/google/gnostic v0.5.7-v3refs
>  ## explicit
> -# github.com/google/go-cmp v0.5.9
> -## explicit
>  # github.com/google/gofuzz v1.2.0
>  ## explicit
>  # github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
> @@ -190,13 +180,7 @@
>  ## explicit
>  # github.com/hashicorp/errwrap v1.1.0
>  ## explicit
> -# github.com/hashicorp/go-immutable-radix v1.3.1
> -## explicit
> -# github.com/hashicorp/go-memdb v1.3.2
> -## explicit
> -# github.com/hashicorp/golang-lru v0.5.4
> -## explicit
> -# github.com/hashicorp/hcl v1.0.0
> +# github.com/hashicorp/go-cleanhttp v0.5.2
>  ## explicit
>  # github.com/imdario/mergo v0.3.16
>  ## explicit
> @@ -204,8 +188,6 @@
>  ## explicit
>  # github.com/inconshreveable/mousetrap v1.1.0
>  ## explicit
> -# github.com/jinzhu/gorm v1.9.11
> -## explicit
>  # github.com/josharian/intern v1.0.0
>  ## explicit
>  # github.com/json-iterator/go v1.1.12
> @@ -214,10 +196,6 @@
>  ## explicit
>  # github.com/klauspost/compress v1.16.5
>  ## explicit
> -# github.com/kr/pretty v0.3.0
> -## explicit
> -# github.com/magiconair/properties v1.8.6
> -## explicit
>  # github.com/mailru/easyjson v0.7.6
>  ## explicit
>  # github.com/mattn/go-colorable v0.1.13
> @@ -250,11 +228,11 @@
>  ## explicit
>  # github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822
>  ## explicit
> -# github.com/opencontainers/runc v1.1.7
> +# github.com/opencontainers/runc v1.1.9
>  ## explicit
>  # github.com/pelletier/go-toml v1.9.5
>  ## explicit
> -# github.com/pelletier/go-toml/v2 v2.0.5
> +# github.com/pkg/errors v0.9.1
>  ## explicit
>  # github.com/pmezard/go-difflib v1.0.0
>  ## explicit
> @@ -274,14 +252,6 @@
>  ## explicit
>  # github.com/shibumi/go-pathspec v1.3.0
>  ## explicit
> -# github.com/spf13/afero v1.9.2
> -## explicit
> -# github.com/spf13/cast v1.5.0
> -## explicit
> -# github.com/spf13/jwalterweatherman v1.1.0
> -## explicit
> -# github.com/subosito/gotenv v1.4.1
> -## explicit
>  # github.com/tonistiigi/fsutil v0.0.0-20230629203738-36ef4d8c0dbb
>  ## explicit
>  # github.com/tonistiigi/units v0.0.0-20180711220420-6950e57a87ea
> @@ -294,8 +264,6 @@
>  ## explicit
>  # github.com/xeipuuv/gojsonschema v1.2.0
>  ## explicit
> -# github.com/zmap/zcrypto v0.0.0-20220605182715-4dfcec6e9a8c
> -## explicit
>  #
> go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgr=
pc
> v0.40.0
>  ## explicit
>  #
> go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptr=
ace
> v0.40.0
> @@ -310,21 +278,17 @@
>  ## explicit
>  # go.opentelemetry.io/proto/otlp v0.19.0
>  ## explicit
> -# golang.org/x/crypto v0.7.0
> -## explicit
> -# golang.org/x/exp v0.0.0-20230713183714-613f0c0eb8a1
> +# golang.org/x/crypto v0.14.0
>  ## explicit
>  # golang.org/x/mod v0.11.0
>  ## explicit
> -# golang.org/x/net v0.9.0
> +# golang.org/x/net v0.17.0
>  ## explicit
> -# golang.org/x/oauth2 v0.7.0
> +# golang.org/x/oauth2 v0.11.0
>  ## explicit
> -# golang.org/x/sys v0.7.0
> +# golang.org/x/term v0.13.0
>  ## explicit
> -# golang.org/x/term v0.7.0
> -## explicit
> -# golang.org/x/text v0.9.0
> +# golang.org/x/text v0.13.0
>  ## explicit
>  # golang.org/x/time v0.3.0
>  ## explicit
> @@ -332,25 +296,25 @@
>  ## explicit
>  # google.golang.org/appengine v1.6.7
>  ## explicit
> -# google.golang.org/genproto v0.0.0-20230526161137-0005af68ea54
> +# google.golang.org/genproto v0.0.0-20230822172742-b8732ec3820d
>  ## explicit
> -# google.golang.org/genproto/googleapis/api
> v0.0.0-20230525234035-dd9d682886f9
> +# google.golang.org/genproto/googleapis/api
> v0.0.0-20230822172742-b8732ec3820d
>  ## explicit
> -# google.golang.org/genproto/googleapis/rpc
> v0.0.0-20230525234030-28d5490b6b19
> +# google.golang.org/genproto/googleapis/rpc
> v0.0.0-20230822172742-b8732ec3820d
>  ## explicit
> -# google.golang.org/protobuf v1.30.0
> +# google.golang.org/protobuf v1.31.0
>  ## explicit
>  # gopkg.in/inf.v0 v0.9.1
>  ## explicit
> -# gopkg.in/ini.v1 v1.67.0
> +# gopkg.in/yaml.v2 v2.4.0
>  ## explicit
>  # gopkg.in/yaml.v3 v3.0.1
>  ## explicit
> -# k8s.io/api v0.26.2
> +# k8s.io/api v0.26.7
>  ## explicit
> -# k8s.io/apimachinery v0.26.2
> +# k8s.io/apimachinery v0.26.7
>  ## explicit
> -# k8s.io/client-go v0.26.2
> +# k8s.io/client-go v0.26.7
>  ## explicit
>  # k8s.io/klog/v2 v2.90.1
>  ## explicit
> @@ -364,4 +328,3 @@
>  ## explicit
>  # sigs.k8s.io/yaml v1.3.0
>  ## explicit
> -# github.com/cucumber/godog =3D> github.com/laurazard/godog
> v0.0.0-20220922095256-4c4b17abdae7
> diff --git a/recipes-containers/docker-compose/relocation.inc
> b/recipes-containers/docker-compose/relocation.inc
> index 9e6eacf..daa5be2 100644
> --- a/recipes-containers/docker-compose/relocation.inc
> +++ b/recipes-containers/docker-compose/relocation.inc
> @@ -3,12 +3,11 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>             k8s.io/klog/v2:k8s.io/klog/v2:force \
>             gotest.tools/v3:gotest.tools/v3:force \
>             gopkg.in/inf.v0:gopkg.in/inf.v0:force \
> -           gopkg.in/ini.v1:gopkg.in/ini.v1:force \
> -           gopkg.in/yaml.v2:gopkg.in/yaml.v2:force \
>             golang.org/x/exp:golang.org/x/exp:force \
> +           golang.org/x/sys:golang.org/x/sys:force \
>             golang.org/x/mod:golang.org/x/mod:force \
>             golang.org/x/net:golang.org/x/net:force \
> -           golang.org/x/sys:golang.org/x/sys:force \
> +           gopkg.in/yaml.v2:gopkg.in/yaml.v2:force \
>             gopkg.in/yaml.v3:gopkg.in/yaml.v3:force \
>             k8s.io/client-go:k8s.io/client-go:force \
>             sigs.k8s.io/json:sigs.k8s.io/json:force \
> @@ -19,63 +18,54 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>             golang.org/x/time:golang.org/x/time:force \
>             go.uber.org/goleak:go.uber.org/goleak:force \
>             golang.org/x/tools:golang.org/x/tools:force \
> -           github.com/adrg/xdg:github.com/adrg/xdg:force \
>             golang.org/x/crypto:golang.org/x/crypto:force \
>             golang.org/x/oauth2:golang.org/x/oauth2:force \
>             k8s.io/apimachinery:k8s.io/apimachinery:force \
>             k8s.io/kube-openapi:k8s.io/kube-openapi:force \
>             github.com/moby/term:github.com/moby/term:force \
>             github.com/docker/go:github.com/docker/go:force \
> -           github.com/kr/pretty:github.com/kr/pretty:force \
>             github.com/docker/cli:github.com/docker/cli:force \
> -           github.com/pkg/errors:github.com/pkg/errors:force \
> -           github.com/gofrs/uuid:github.com/gofrs/uuid:force \
>             github.com/mgutz/ansi:github.com/mgutz/ansi:force \
> -           github.com/spf13/cast:github.com/spf13/cast:force \
> +           github.com/pkg/errors:github.com/pkg/errors:force \
>             github.com/golang/mock:github.com/golang/mock:force \
>             github.com/spf13/cobra:github.com/spf13/cobra:force \
>             github.com/spf13/pflag:github.com/spf13/pflag:force \
>             google.golang.org/grpc:google.golang.org/grpc:force \
>             github.com/gofrs/flock:github.com/gofrs/flock:force \
>             github.com/gorilla/mux:github.com/gorilla/mux:force \
> -           github.com/jinzhu/gorm:github.com/jinzhu/gorm:force \
>             github.com/moby/locker:github.com/moby/locker:force \
>             github.com/rivo/uniseg:github.com/rivo/uniseg:force \
> -           github.com/spf13/afero:github.com/spf13/afero:force \
>             github.com/buger/goterm:github.com/buger/goterm:force \
>             github.com/morikuni/aec:github.com/morikuni/aec:force \
> +           github.com/otiai10/copy:github.com/otiai10/copy:force \
>             github.com/beorn7/perks:github.com/beorn7/perks:force \
>             github.com/go-logr/logr:github.com/go-logr/logr:force \
>             github.com/go-logr/stdr:github.com/go-logr/stdr:force \
>             github.com/google/shlex:github.com/google/shlex:force \
>             github.com/miekg/pkcs11:github.com/miekg/pkcs11:force \
> -           github.com/zmap/zcrypto:github.com/zmap/zcrypto:force \
>             github.com/docker/buildx:github.com/docker/buildx:force \
>             github.com/docker/docker:github.com/docker/docker:force \
> +           github.com/google/go-cmp:github.com/google/go-cmp:force \
>             github.com/moby/buildkit:github.com/moby/buildkit:force \
>             go.opentelemetry.io/otel:go.opentelemetry.io/otel:force \
>             github.com/aws/smithy-go:github.com/aws/smithy-go:force \
>             github.com/gogo/protobuf:github.com/gogo/protobuf:force \
> -           github.com/google/go-cmp:github.com/google/go-cmp:force \
>             github.com/google/gofuzz:github.com/google/gofuzz:force \
> -           github.com/hashicorp/hcl:github.com/hashicorp/hcl:force \
>             github.com/imdario/mergo:github.com/imdario/mergo:force \
> +           github.com/containerd/log:github.com/containerd/log:force \
>             github.com/google/gnostic:github.com/google/gnostic:force \
> -           github.com/cucumber/godog:github.com/laurazard/godog:force \
> +           github.com/davecgh/go-spew:github.com/davecgh/go-spew:force \
>             github.com/docker/go-units:github.com/docker/go-units:force \
>             github.com/sirupsen/logrus:github.com/sirupsen/logrus:force \
> -           github.com/davecgh/go-spew:github.com/davecgh/go-spew:force \
>             github.com/go-openapi/swag:github.com/go-openapi/swag:force \
>             github.com/gogo/googleapis:github.com/gogo/googleapis:force \
>             github.com/golang/protobuf:github.com/golang/protobuf:force \
>             github.com/mailru/easyjson:github.com/mailru/easyjson:force \
>             github.com/mattn/go-isatty:github.com/mattn/go-isatty:force \
>             github.com/moby/spdystream:github.com/moby/spdystream:force \
> -           github.com/subosito/gotenv:github.com/subosito/gotenv:force \
>             google.golang.org/genproto:google.golang.org/genproto:force \
>             google.golang.org/protobuf:google.golang.org/protobuf:force \
>             github.com/stretchr/testify:github.com/stretchr/testify:force
> \
> -           github.com/cloudflare/cfssl:github.com/cloudflare/cfssl:force
> \
>             github.com/josharian/intern:github.com/josharian/intern:force
> \
>             github.com/json-iterator/go:github.com/json-iterator/go:force
> \
>             github.com/serialx/hashring:github.com/serialx/hashring:force
> \
> @@ -85,6 +75,7 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>
> github.com/fsnotify/fsevents:github.com/fsnotify/fsevents:force \
>
> github.com/tilt-dev/fsnotify:github.com/tilt-dev/fsnotify:force \
>
> github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm:force \
> +
> github.com/Microsoft/hcsshim:github.com/Microsoft/hcsshim:force \
>
> github.com/aws/aws-sdk-go-v2:github.com/aws/aws-sdk-go-v2:force \
>
> github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2:force \
>
> github.com/docker/go-metrics:github.com/docker/go-metrics:force \
> @@ -97,9 +88,7 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>
> github.com/tonistiigi/fsutil:github.com/tonistiigi/fsutil:force \
>
> github.com/Microsoft/go-winio:github.com/Microsoft/go-winio:force \
>
> github.com/containerd/console:github.com/containerd/console:force \
> -
> github.com/bugsnag/bugsnag-go:github.com/bugsnag/bugsnag-go:force \
>
> github.com/fvbommel/sortorder:github.com/fvbommel/sortorder:force \
> -
> github.com/hashicorp/go-memdb:github.com/hashicorp/go-memdb:force \
>
> github.com/klauspost/compress:github.com/klauspost/compress:force \
>
> github.com/mattn/go-colorable:github.com/mattn/go-colorable:force \
>
> github.com/mattn/go-runewidth:github.com/mattn/go-runewidth:force \
> @@ -116,10 +105,8 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>
> github.com/shibumi/go-pathspec:github.com/shibumi/go-pathspec:force \
>
> github.com/docker/cli-docs-tool:github.com/docker/cli-docs-tool:force \
>
> github.com/hashicorp/go-version:github.com/hashicorp/go-version:force \
> -
> github.com/hashicorp/golang-lru:github.com/hashicorp/golang-lru:force \
>
> github.com/moby/sys/symlink:github.com/moby/sys/symlink/symlink:force \
>
> github.com/modern-go/concurrent:github.com/modern-go/concurrent:force \
> -
> github.com/pelletier/go-toml/v2:github.com/pelletier/go-toml/v2:force \
>
> github.com/xeipuuv/gojsonschema:github.com/xeipuuv/gojsonschema:force \
>
> github.com/AlecAivazis/survey/v2:github.com/AlecAivazis/survey/v2:force \
>
> github.com/containerd/containerd:github.com/containerd/containerd:force \
> @@ -127,25 +114,23 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>
> github.com/Masterminds/semver/v3:github.com/Masterminds/semver/v3:force \
>
> github.com/containerd/continuity:github.com/containerd/continuity:force \
>
> github.com/containerd/typeurl/v2:github.com/containerd/typeurl/v2:force \
> -
> github.com/magiconair/properties:github.com/magiconair/properties:force \
>
> github.com/xeipuuv/gojsonpointer:github.com/xeipuuv/gojsonpointer:force \
>
> go.opentelemetry.io/proto/otlp:go.opentelemetry.io/proto/otlp/otlp:force =
\
> +
> github.com/distribution/reference:github.com/distribution/reference:force
> \
>
> github.com/mitchellh/mapstructure:github.com/mitchellh/mapstructure:force
> \
>
> go.opentelemetry.io/otel/trace:go.opentelemetry.io/otel/trace/trace:force
> \
>
> github.com/emicklei/go-restful/v3:github.com/emicklei/go-restful/v3:force
> \
>
> github.com/go-openapi/jsonpointer:github.com/go-openapi/jsonpointer:force
> \
> +
> github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cleanhttp:force
> \
>
> github.com/in-toto/in-toto-golang:github.com/in-toto/in-toto-golang:force
> \
>
> github.com/kballard/go-shellquote:github.com/kballard/go-shellquote:force
> \
>
> github.com/compose-spec/compose-go:github.com/compose-spec/compose-go:for=
ce
> \
>
> github.com/hashicorp/go-multierror:github.com/hashicorp/go-multierror:for=
ce
> \
> -
> github.com/cucumber/gherkin-go/v19:github.com/cucumber/gherkin-go/v19:for=
ce
> \
>
> github.com/moby/sys/mountinfo:github.com/moby/sys/mountinfo/mountinfo:for=
ce
> \
>
> github.com/prometheus/client_model:github.com/prometheus/client_model:for=
ce
> \
> -
> github.com/spf13/jwalterweatherman:github.com/spf13/jwalterweatherman:for=
ce
> \
>
> github.com/xeipuuv/gojsonreference:github.com/xeipuuv/gojsonreference:for=
ce
> \
>
> go.opentelemetry.io/otel/metric:go.opentelemetry.io/otel/metric/metric:fo=
rce
> \
>
> github.com/opencontainers/go-digest:github.com/opencontainers/go-digest:f=
orce
> \
> -
> github.com/cucumber/messages-go/v16:github.com/cucumber/messages-go/v16:f=
orce
> \
>
> github.com/go-openapi/jsonreference:github.com/go-openapi/jsonreference:f=
orce
> \
>
> github.com/prometheus/client_golang:github.com/prometheus/client_golang:f=
orce
> \
>
> github.com/moby/sys/sequential:github.com/moby/sys/sequential/sequential:=
force
> \
> @@ -154,10 +139,7 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>
> github.com/AdaLogics/go-fuzz-headers:github.com/AdaLogics/go-fuzz-headers=
:force
> \
>
> github.com/inconshreveable/mousetrap:github.com/inconshreveable/mousetrap=
:force
> \
>
> sigs.k8s.io/structured-merge-diff/v4:sigs.k8s.io/structured-merge-diff/v4=
:force
> \
> -
> github.com/cyphar/filepath-securejoin:github.com/cyphar/filepath-securejo=
in:force
> \
>
> github.com/aws/aws-sdk-go-v2/config:github.com/aws/aws-sdk-go-v2/config/c=
onfig:force
> \
> -
> github.com/distribution/distribution/v3:github.com/distribution/distribut=
ion/v3:force
> \
> -
> github.com/hashicorp/go-immutable-radix:github.com/hashicorp/go-immutable=
-radix:force
> \
>
> github.com/grpc-ecosystem/grpc-gateway/v2:github.com/grpc-ecosystem/grpc-=
gateway/v2:force
> \
>
> github.com/docker/docker-credential-helpers:github.com/docker/docker-cred=
ential-helpers:force
> \
>
> github.com/grpc-ecosystem/go-grpc-middleware:github.com/grpc-ecosystem/go=
-grpc-middleware:force
> \
> diff --git a/recipes-containers/docker-compose/src_uri.inc
> b/recipes-containers/docker-compose/src_uri.inc
> index 8897c9c..32a16b3 100644
> --- a/recipes-containers/docker-compose/src_uri.inc
> +++ b/recipes-containers/docker-compose/src_uri.inc
> @@ -1,6 +1,6 @@
> -#       k8s.io/api v0.26.2
> -# [1] git ls-remote https://github.com/kubernetes/api
> 1528256abbdf8ff2510112b28a6aacd239789a36
> -SRCREV_k8s.io-api=3D"1528256abbdf8ff2510112b28a6aacd239789a36"
> +#       k8s.io/api v0.26.7
> +# [1] git ls-remote https://github.com/kubernetes/api
> 145ce6cdaea22991c53ba9c7ee7aabae5181cb3e
> +SRCREV_k8s.io-api=3D"145ce6cdaea22991c53ba9c7ee7aabae5181cb3e"
>  SRC_URI +=3D "git://
> github.com/kubernetes/api;name=3Dk8s.io-api;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/api
> <http://github.com/kubernetes/api;name=3Dk8s.io-api;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/k8s.=
io/api>
> "
>
>  #       k8s.io/utils v0.0.0-20230220204549-a5ecb0141aa5
> @@ -13,54 +13,49 @@ SRC_URI +=3D "git://
> github.com/kubernetes/utils;name=3Dutils;protocol=3Dhttps;nobranch
>  SRCREV_klog-v2=3D"d7fc50528570f8276de46570f916682257821e22"
>  SRC_URI +=3D "git://
> github.com/kubernetes/klog;name=3Dklog-v2;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/klog/v2
> <http://github.com/kubernetes/klog;name=3Dklog-v2;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/k8s.io=
/klog/v2>
> "
>
> -#       gotest.tools/v3 v3.5.0
> -# [1] git ls-remote https://github.com/gotestyourself/gotest.tools
> a80f057529047c44e1a85d0d017b200787e537e0
> -SRCREV_gotest.tools-v3=3D"a80f057529047c44e1a85d0d017b200787e537e0"
> -SRC_URI +=3D "git://
> github.com/gotestyourself/gotest.tools;name=3Dgotest.tools-v3;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
test.tools/v3
> <http://github.com/gotestyourself/gotest.tools;name=3Dgotest.tools-v3;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import=
/vendor.fetch/gotest.tools/v3>
> "
> +#       gotest.tools/v3 v3.5.1
> +# [1] git ls-remote https://github.com/gotestyourself/gotest.tools
> 81cea1abc596b025bf2573c7fdf97740512e4c6c
> +SRCREV_v3=3D"81cea1abc596b025bf2573c7fdf97740512e4c6c"
> +SRC_URI +=3D "git://
> github.com/gotestyourself/gotest.tools;name=3Dv3;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gotest.tools/v3
> <http://github.com/gotestyourself/gotest.tools;name=3Dv3;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch=
/gotest.tools/v3>
> "
>
>  #       gopkg.in/inf.v0 v0.9.1
>  # [1] git ls-remote https://github.com/go-inf/inf
> d2d2541c53f18d2a059457998ce2876cc8e67cbf
>  SRCREV_inf.v0=3D"d2d2541c53f18d2a059457998ce2876cc8e67cbf"
>  SRC_URI +=3D "git://
> github.com/go-inf/inf;name=3Dinf.v0;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/inf.v0
> <http://github.com/go-inf/inf;name=3Dinf.v0;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in/inf=
.v0>
> "
>
> -#       gopkg.in/ini.v1 v1.67.0
> -# [1] git ls-remote https://github.com/go-ini/ini
> b2f570e5b5b844226bbefe6fb521d891f529a951
> -SRCREV_ini.v1=3D"b2f570e5b5b844226bbefe6fb521d891f529a951"
> -SRC_URI +=3D "git://
> github.com/go-ini/ini;name=3Dini.v1;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ini.v1
> <http://github.com/go-ini/ini;name=3Dini.v1;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in/ini=
.v1>
> "
> -
> -#       gopkg.in/yaml.v2 v2.4.0
> -# [1] git ls-remote https://github.com/go-yaml/yaml
> 7649d4548cb53a614db133b2a8ac1f31859dda8c
> -SRCREV_yaml.v2=3D"7649d4548cb53a614db133b2a8ac1f31859dda8c"
> -SRC_URI +=3D "git://
> github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v2
> <http://github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in=
/yaml.v2>
> "
> -
>  #       golang.org/x/exp v0.0.0-20230713183714-613f0c0eb8a1
>  # [1] git ls-remote https://go.googlesource.com/exp
> 613f0c0eb8a17a98ecdb096a7f9f7d5053c1c963
>  SRCREV_exp=3D"613f0c0eb8a17a98ecdb096a7f9f7d5053c1c963"
>  SRC_URI +=3D "git://
> go.googlesource.com/exp;name=3Dexp;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/exp
> <http://go.googlesource.com/exp;name=3Dexp;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/=
exp>
> "
>
> +#       golang.org/x/sys v0.14.0
> +# [1] git ls-remote https://go.googlesource.com/sys
> cb378ae1ff8cd45e69d4f172df8370bc844e1f86
> +SRCREV_sys=3D"cb378ae1ff8cd45e69d4f172df8370bc844e1f86"
> +SRC_URI +=3D "git://
> go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys
> <http://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/=
sys>
> "
> +
>  #       golang.org/x/mod v0.11.0
>  # [1] git ls-remote https://go.googlesource.com/mod
> 62c7e578f1a7275d934c99dd48715525bd52b17e
>  SRCREV_mod=3D"62c7e578f1a7275d934c99dd48715525bd52b17e"
>  SRC_URI +=3D "git://
> go.googlesource.com/mod;name=3Dmod;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/mod
> <http://go.googlesource.com/mod;name=3Dmod;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/=
mod>
> "
>
> -#       golang.org/x/net v0.9.0
> -# [1] git ls-remote https://go.googlesource.com/net
> 694cff8668bac64e0864b552bffc280cd27f21b1
> -SRCREV_net=3D"694cff8668bac64e0864b552bffc280cd27f21b1"
> +#       golang.org/x/net v0.17.0
> +# [1] git ls-remote https://go.googlesource.com/net
> b225e7ca6dde1ef5a5ae5ce922861bda011cfabd
> +SRCREV_net=3D"b225e7ca6dde1ef5a5ae5ce922861bda011cfabd"
>  SRC_URI +=3D "git://
> go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/net
> <http://go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/=
net>
> "
>
> -#       golang.org/x/sys v0.7.0
> -# [1] git ls-remote https://go.googlesource.com/sys
> 64840c112d2335ed9874114aed48f946e778a769
> -SRCREV_sys=3D"64840c112d2335ed9874114aed48f946e778a769"
> -SRC_URI +=3D "git://
> go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys
> <http://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/=
sys>
> "
> +#       gopkg.in/yaml.v2 v2.4.0
> +# [1] git ls-remote https://github.com/go-yaml/yaml
> 7649d4548cb53a614db133b2a8ac1f31859dda8c
> +SRCREV_yaml.v2=3D"7649d4548cb53a614db133b2a8ac1f31859dda8c"
> +SRC_URI +=3D "git://
> github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v2
> <http://github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in=
/yaml.v2>
> "
>
>  #       gopkg.in/yaml.v3 v3.0.1
>  # [1] git ls-remote https://github.com/go-yaml/yaml
> f6f7691b1fdeb513f56608cd2c32c51f8194bf51
>  SRCREV_yaml.v3=3D"f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
>  SRC_URI +=3D "git://
> github.com/go-yaml/yaml;name=3Dyaml.v3;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v3
> <http://github.com/go-yaml/yaml;name=3Dyaml.v3;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in=
/yaml.v3>
> "
>
> -#       k8s.io/client-go v0.26.2
> -# [1] git ls-remote https://github.com/kubernetes/client-go
> 620cb60675340a9ca825fd5082b0d500f9b62e90
> -SRCREV_client-go=3D"620cb60675340a9ca825fd5082b0d500f9b62e90"
> +#       k8s.io/client-go v0.26.7
> +# [1] git ls-remote https://github.com/kubernetes/client-go
> 30088cdd7e8d70b3000586d4e9e42e50684359ca
> +SRCREV_client-go=3D"30088cdd7e8d70b3000586d4e9e42e50684359ca"
>  SRC_URI +=3D "git://
> github.com/kubernetes/client-go;name=3Dclient-go;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/client-g=
o
> <http://github.com/kubernetes/client-go;name=3Dclient-go;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch=
/k8s.io/client-go>
> "
>
>  #       sigs.k8s.io/json v0.0.0-20220713155537-f223a00ba0e2
> @@ -73,19 +68,19 @@ SRC_URI +=3D "git://
> github.com/kubernetes-sigs/json;name=3Djson;protocol=3Dhttps;nobra
>  SRCREV_yaml=3D"9535b3b1e2893fe44efb37c5c9f5665e245d786a"
>  SRC_URI +=3D "git://
> github.com/kubernetes-sigs/yaml;name=3Dyaml;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/yaml
> <http://github.com/kubernetes-sigs/yaml;name=3Dyaml;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/sigs=
.k8s.io/yaml>
> "
>
> -#       golang.org/x/sync v0.3.0
> -# [1] git ls-remote https://go.googlesource.com/sync
> 93782cc822b6b554cb7df40332fd010f0473cbc8
> -SRCREV_sync=3D"93782cc822b6b554cb7df40332fd010f0473cbc8"
> +#       golang.org/x/sync v0.5.0
> +# [1] git ls-remote https://go.googlesource.com/sync
> 10739b037d369c748d671b216356d7e04ce68da1
> +SRCREV_sync=3D"10739b037d369c748d671b216356d7e04ce68da1"
>  SRC_URI +=3D "git://
> go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sync
> <http://go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/=
x/sync>
> "
>
> -#       golang.org/x/term v0.7.0
> -# [1] git ls-remote https://go.googlesource.com/term
> 7ae6be6d0150527c2c41e70586b9ade6a972a186
> -SRCREV_x-term=3D"7ae6be6d0150527c2c41e70586b9ade6a972a186"
> +#       golang.org/x/term v0.13.0
> +# [1] git ls-remote https://go.googlesource.com/term
> ea6303ae752eaacd897fec4b7534b74c56e1d787
> +SRCREV_x-term=3D"ea6303ae752eaacd897fec4b7534b74c56e1d787"
>  SRC_URI +=3D "git://
> go.googlesource.com/term;name=3Dx-term;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/term
> <http://go.googlesource.com/term;name=3Dx-term;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.o=
rg/x/term>
> "
>
> -#       golang.org/x/text v0.9.0
> -# [1] git ls-remote https://go.googlesource.com/text
> 48e4a4a957429d31328a685863b594ca9a06b552
> -SRCREV_text=3D"48e4a4a957429d31328a685863b594ca9a06b552"
> +#       golang.org/x/text v0.13.0
> +# [1] git ls-remote https://go.googlesource.com/text
> f488e191e67ed95a5b9b7b39024e5a5f5f1ffd02
> +SRCREV_text=3D"f488e191e67ed95a5b9b7b39024e5a5f5f1ffd02"
>  SRC_URI +=3D "git://
> go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/text
> <http://go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/=
x/text>
> "
>
>  #       golang.org/x/time v0.3.0
> @@ -93,9 +88,9 @@ SRC_URI +=3D "git://
> go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;nobranch=3D1;d
>  SRCREV_time=3D"2c09566ef13fb5556401ddff3c53c3dbc2a42dac"
>  SRC_URI +=3D "git://
> go.googlesource.com/time;name=3Dtime;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/time
> <http://go.googlesource.com/time;name=3Dtime;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/=
x/time>
> "
>
> -#       go.uber.org/goleak v1.2.1
> -# [1] git ls-remote https://github.com/uber-go/goleak
> 83c7e126390f1508ca9cb8e87d70849b55181104
> -SRCREV_goleak=3D"83c7e126390f1508ca9cb8e87d70849b55181104"
> +#       go.uber.org/goleak v1.3.0
> +# [1] git ls-remote https://github.com/uber-go/goleak
> 31095c657c34bba405a8d480db27989aa5f60b9c
> +SRCREV_goleak=3D"31095c657c34bba405a8d480db27989aa5f60b9c"
>  SRC_URI +=3D "git://
> github.com/uber-go/goleak;name=3Dgoleak;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/goleak
> <http://github.com/uber-go/goleak;name=3Dgoleak;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/go.uber.=
org/goleak>
> "
>
>  #       golang.org/x/tools v0.7.0
> @@ -103,24 +98,19 @@ SRC_URI +=3D "git://
> github.com/uber-go/goleak;name=3Dgoleak;protocol=3Dhttps;nobranch=3D
>  SRCREV_tools=3D"031fc75960d487b0b15db12fb328676236a3a39c"
>  SRC_URI +=3D "git://
> go.googlesource.com/tools;name=3Dtools;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/tools
> <http://go.googlesource.com/tools;name=3Dtools;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.o=
rg/x/tools>
> "
>
> -#       github.com/adrg/xdg v0.4.0
> -# [1] git ls-remote https://github.com/adrg/xdg
> 4ec40e24f0cf1039f93c773f2984decdea9719b5
> -SRCREV_xdg=3D"4ec40e24f0cf1039f93c773f2984decdea9719b5"
> -SRC_URI +=3D "git://
> github.com/adrg/xdg;name=3Dxdg;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/adrg/xdg
> <http://github.com/adrg/xdg;name=3Dxdg;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/adrg/x=
dg>
> "
> -
> -#       golang.org/x/crypto v0.7.0
> -# [1] git ls-remote https://go.googlesource.com/crypto
> 776e461a4e6d8b372a43c72122c5c28cfc40dca2
> -SRCREV_crypto=3D"776e461a4e6d8b372a43c72122c5c28cfc40dca2"
> +#       golang.org/x/crypto v0.14.0
> +# [1] git ls-remote https://go.googlesource.com/crypto
> e3cc52e598e302f8c613a645bb7231264d8ec995
> +SRCREV_crypto=3D"e3cc52e598e302f8c613a645bb7231264d8ec995"
>  SRC_URI +=3D "git://
> go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/crypto
> <http://go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.=
org/x/crypto>
> "
>
> -#       golang.org/x/oauth2 v0.7.0
> -# [1] git ls-remote https://go.googlesource.com/oauth2
> 36075149c5b89480def496c735b8a1ba5fc63218
> -SRCREV_oauth2=3D"36075149c5b89480def496c735b8a1ba5fc63218"
> +#       golang.org/x/oauth2 v0.11.0
> +# [1] git ls-remote https://go.googlesource.com/oauth2
> 2e4a4e2bfb69ca7609cb423438c55caa131431c1
> +SRCREV_oauth2=3D"2e4a4e2bfb69ca7609cb423438c55caa131431c1"
>  SRC_URI +=3D "git://
> go.googlesource.com/oauth2;name=3Doauth2;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/oauth2
> <http://go.googlesource.com/oauth2;name=3Doauth2;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.=
org/x/oauth2>
> "
>
> -#       k8s.io/apimachinery v0.26.2
> -# [1] git ls-remote https://github.com/kubernetes/apimachinery
> 53ecdf01b997ca93c7db7615dfe7b27ad8391983
> -SRCREV_apimachinery=3D"53ecdf01b997ca93c7db7615dfe7b27ad8391983"
> +#       k8s.io/apimachinery v0.26.7
> +# [1] git ls-remote https://github.com/kubernetes/apimachinery
> dd46389197a396927dadb194ae5fc9dbebeb5a31
> +SRCREV_apimachinery=3D"dd46389197a396927dadb194ae5fc9dbebeb5a31"
>  SRC_URI +=3D "git://
> github.com/kubernetes/apimachinery;name=3Dapimachinery;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/ap=
imachinery
> <http://github.com/kubernetes/apimachinery;name=3Dapimachinery;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/k8s.io/apimachinery>
> "
>
>  #       k8s.io/kube-openapi v0.0.0-20221012153701-172d655c2280
> @@ -138,44 +128,29 @@ SRC_URI +=3D "git://
> github.com/moby/term;name=3Dterm;protocol=3Dhttps;nobranch=3D1;dests
>  SRCREV_go=3D"d30aec9fd63c35133f8f79c3412ad91a3b08be06"
>  SRC_URI +=3D "git://
> github.com/docker/go;name=3Dgo;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go
> <http://github.com/docker/go;name=3Dgo;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/docker=
/go>
> "
>
> -#       github.com/kr/pretty v0.3.0
> -# [1] git ls-remote https://github.com/kr/pretty
> a883a8422cd235c67c6c4fdcb7bbb022143e10b1
> -SRCREV_pretty=3D"a883a8422cd235c67c6c4fdcb7bbb022143e10b1"
> -SRC_URI +=3D "git://
> github.com/kr/pretty;name=3Dpretty;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kr/pretty
> <http://github.com/kr/pretty;name=3Dpretty;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/kr=
/pretty>
> "
> -
> -#       github.com/docker/cli v24.0.5+incompatible
> -# [1] git ls-remote https://github.com/docker/cli
> ced099660009713e0e845eeb754e6050dbaa45d0
> -SRCREV_cli=3D"ced099660009713e0e845eeb754e6050dbaa45d0"
> +#       github.com/docker/cli v24.0.7+incompatible
> +# [1] git ls-remote https://github.com/docker/cli
> afdd53b4e341be38d2056a42113b938559bb1d94
> +SRCREV_cli=3D"afdd53b4e341be38d2056a42113b938559bb1d94"
>  SRC_URI +=3D "git://
> github.com/docker/cli;name=3Dcli;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/cli
> <http://github.com/docker/cli;name=3Dcli;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/dock=
er/cli>
> "
>
> -#       github.com/pkg/errors v0.9.1
> -# [1] git ls-remote https://github.com/pkg/errors
> 614d223910a179a466c1767a985424175c39b465
> -SRCREV_errors=3D"614d223910a179a466c1767a985424175c39b465"
> -SRC_URI +=3D "git://
> github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors
> <http://github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/p=
kg/errors>
> "
> -
> -#       github.com/gofrs/uuid v4.2.0+incompatible
> -# [1] git ls-remote https://github.com/gofrs/uuid
> 0c84a43ce25087b7041833685982950a65630d28
> -SRCREV_uuid=3D"0c84a43ce25087b7041833685982950a65630d28"
> -SRC_URI +=3D "git://
> github.com/gofrs/uuid;name=3Duuid;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gofrs/uuid
> <http://github.com/gofrs/uuid;name=3Duuid;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/gof=
rs/uuid>
> "
> -
>  #       github.com/mgutz/ansi v0.0.0-20170206155736-9520e82c474b
>  # [1] git ls-remote https://github.com/mgutz/ansi
> 9520e82c474b0a04dd04f8a40959027271bab992
>  SRCREV_ansi=3D"9520e82c474b0a04dd04f8a40959027271bab992"
>  SRC_URI +=3D "git://
> github.com/mgutz/ansi;name=3Dansi;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mgutz/ansi
> <http://github.com/mgutz/ansi;name=3Dansi;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/mgu=
tz/ansi>
> "
>
> -#       github.com/spf13/cast v1.5.0
> -# [1] git ls-remote https://github.com/spf13/cast
> 2b0eb0f724e320b655240e331aef36d1175986c2
> -SRCREV_cast=3D"2b0eb0f724e320b655240e331aef36d1175986c2"
> -SRC_URI +=3D "git://
> github.com/spf13/cast;name=3Dcast;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/cast
> <http://github.com/spf13/cast;name=3Dcast;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/spf=
13/cast>
> "
> +#       github.com/pkg/errors v0.9.1
> +# [1] git ls-remote https://github.com/pkg/errors
> 614d223910a179a466c1767a985424175c39b465
> +SRCREV_errors=3D"614d223910a179a466c1767a985424175c39b465"
> +SRC_URI +=3D "git://
> github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors
> <http://github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/p=
kg/errors>
> "
>
>  #       github.com/golang/mock v1.6.0
>  # [1] git ls-remote https://github.com/golang/mock
> aba2ff9a6844d5e3289e8472d3217d5b3090f083
>  SRCREV_mock=3D"aba2ff9a6844d5e3289e8472d3217d5b3090f083"
>  SRC_URI +=3D "git://
> github.com/golang/mock;name=3Dmock;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/mock
> <http://github.com/golang/mock;name=3Dmock;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/go=
lang/mock>
> "
>
> -#       github.com/spf13/cobra v1.7.0
> -# [1] git ls-remote https://github.com/spf13/cobra
> 4dd4b25de38418174a6e859e8a32eaccca32dccc
> -SRCREV_cobra=3D"4dd4b25de38418174a6e859e8a32eaccca32dccc"
> +#       github.com/spf13/cobra v1.8.0
> +# [1] git ls-remote https://github.com/spf13/cobra
> a0a6ae020bb3899ff0276067863e50523f897370
> +SRCREV_cobra=3D"a0a6ae020bb3899ff0276067863e50523f897370"
>  SRC_URI +=3D "git://
> github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/cobra
> <http://github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/s=
pf13/cobra>
> "
>
>  #       github.com/spf13/pflag v1.0.5
> @@ -183,9 +158,9 @@ SRC_URI +=3D "git://
> github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps;nobranch=3D1;de
>  SRCREV_pflag=3D"2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
>  SRC_URI +=3D "git://
> github.com/spf13/pflag;name=3Dpflag;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/pflag
> <http://github.com/spf13/pflag;name=3Dpflag;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/s=
pf13/pflag>
> "
>
> -#       google.golang.org/grpc v1.57.0
> -# [1] git ls-remote https://github.com/grpc/grpc-go
> 87bf02ad24f6cc071d2553eb5d62332194bba1fe
> -SRCREV_grpc=3D"87bf02ad24f6cc071d2553eb5d62332194bba1fe"
> +#       google.golang.org/grpc v1.59.0
> +# [1] git ls-remote https://github.com/grpc/grpc-go
> 7765221f4bf6104973db7946d56936cf838cad46
> +SRCREV_grpc=3D"7765221f4bf6104973db7946d56936cf838cad46"
>  SRC_URI +=3D "git://
> github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/grpc
> <http://github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/google.golan=
g.org/grpc>
> "
>
>  #       github.com/gofrs/flock v0.8.1
> @@ -198,11 +173,6 @@ SRC_URI +=3D "git://
> github.com/gofrs/flock;name=3Dflock;protocol=3Dhttps;nobranch=3D1;de
>  SRCREV_mux=3D"98cb6bf42e086f6af920b965c38cacc07402d51b"
>  SRC_URI +=3D "git://
> github.com/gorilla/mux;name=3Dmux;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gorilla/mux
> <http://github.com/gorilla/mux;name=3Dmux;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/gor=
illa/mux>
> "
>
> -#       github.com/jinzhu/gorm v1.9.11
> -# [1] git ls-remote https://github.com/jinzhu/gorm
> 81c17a7e2529c59efc4e74c5b32c1fb71fb12fa2
> -SRCREV_gorm=3D"81c17a7e2529c59efc4e74c5b32c1fb71fb12fa2"
> -SRC_URI +=3D "git://
> github.com/jinzhu/gorm;name=3Dgorm;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jinzhu/gorm
> <http://github.com/jinzhu/gorm;name=3Dgorm;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/ji=
nzhu/gorm>
> "
> -
>  #       github.com/moby/locker v1.0.1
>  # [1] git ls-remote https://github.com/moby/locker
> 281af2d563954745bea9d1487c965f24d30742fe
>  SRCREV_locker=3D"281af2d563954745bea9d1487c965f24d30742fe"
> @@ -213,11 +183,6 @@ SRC_URI +=3D "git://
> github.com/moby/locker;name=3Dlocker;protocol=3Dhttps;nobranch=3D1;d
>  SRCREV_uniseg=3D"75711fccf6a3e85bc74c241e2dddd06a9bc9e53d"
>  SRC_URI +=3D "git://
> github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo/uniseg
> <http://github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/=
rivo/uniseg>
> "
>
> -#       github.com/spf13/afero v1.9.2
> -# [1] git ls-remote https://github.com/spf13/afero
> 2a70f2bb2db1524bf2aa3ca0cfebefa8d6367b7b
> -SRCREV_afero=3D"2a70f2bb2db1524bf2aa3ca0cfebefa8d6367b7b"
> -SRC_URI +=3D "git://
> github.com/spf13/afero;name=3Dafero;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/afero
> <http://github.com/spf13/afero;name=3Dafero;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/s=
pf13/afero>
> "
> -
>  #       github.com/buger/goterm v1.0.4
>  # [1] git ls-remote https://github.com/buger/goterm
> a73545aae7d693f786ce4cc687460efca4845f31
>  SRCREV_goterm=3D"a73545aae7d693f786ce4cc687460efca4845f31"
> @@ -228,6 +193,11 @@ SRC_URI +=3D "git://
> github.com/buger/goterm;name=3Dgoterm;protocol=3Dhttps;nobranch=3D1;
>  SRCREV_aec=3D"39771216ff4c63d11f5e604076f9c45e8be1067b"
>  SRC_URI +=3D "git://
> github.com/morikuni/aec;name=3Daec;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/morikuni/aec
> <http://github.com/morikuni/aec;name=3Daec;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/mo=
rikuni/aec>
> "
>
> +#       github.com/otiai10/copy v1.14.0
> +# [1] git ls-remote https://github.com/otiai10/copy
> fba066acb0eb6e25d510073787741c0a8b31bf1e
> +SRCREV_copy=3D"fba066acb0eb6e25d510073787741c0a8b31bf1e"
> +SRC_URI +=3D "git://
> github.com/otiai10/copy;name=3Dcopy;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/otiai10/copy
> <http://github.com/otiai10/copy;name=3Dcopy;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/o=
tiai10/copy>
> "
> +
>  #       github.com/beorn7/perks v1.0.1
>  # [1] git ls-remote https://github.com/beorn7/perks
> 37c8de3658fcb183f997c4e13e8337516ab753e6
>  SRCREV_perks=3D"37c8de3658fcb183f997c4e13e8337516ab753e6"
> @@ -253,24 +223,24 @@ SRC_URI +=3D "git://
> github.com/google/shlex;name=3Dshlex;protocol=3Dhttps;nobranch=3D1;d
>  SRCREV_pkcs11=3D"f3481918a208bd212aa995a41f92d786eb418a7d"
>  SRC_URI +=3D "git://
> github.com/miekg/pkcs11;name=3Dpkcs11;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/miekg/pkcs11
> <http://github.com/miekg/pkcs11;name=3Dpkcs11;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/miekg/pkcs11>
> "
>
> -#       github.com/zmap/zcrypto v0.0.0-20220605182715-4dfcec6e9a8c
> -# [1] git ls-remote https://github.com/zmap/zcrypto
> 4dfcec6e9a8c2014f73dd584e64dc797129d77b8
> -SRCREV_zcrypto=3D"4dfcec6e9a8c2014f73dd584e64dc797129d77b8"
> -SRC_URI +=3D "git://
> github.com/zmap/zcrypto;name=3Dzcrypto;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/zmap/zcrypto
> <http://github.com/zmap/zcrypto;name=3Dzcrypto;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/zmap/zcrypto>
> "
> -
> -#       github.com/docker/buildx v0.11.2
> -# [1] git ls-remote https://github.com/docker/buildx
> 9872040b6626fb7d87ef7296fd5b832e8cc2ad17
> -SRCREV_buildx=3D"9872040b6626fb7d87ef7296fd5b832e8cc2ad17"
> +#       github.com/docker/buildx v0.12.0
> +# [1] git ls-remote https://github.com/docker/buildx
> 542e5d810e4a1a155684f5f3c5bd7e797632a12f
> +SRCREV_buildx=3D"542e5d810e4a1a155684f5f3c5bd7e797632a12f"
>  SRC_URI +=3D "git://
> github.com/docker/buildx;name=3Dbuildx;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/buildx
> <http://github.com/docker/buildx;name=3Dbuildx;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/docker/buildx>
> "
>
> -#       github.com/docker/docker v24.0.5+incompatible
> -# [1] git ls-remote https://github.com/moby/moby
> a61e2b4c9c5f7c241aeb37f389b4444aee26bea4
> -SRCREV_docker=3D"a61e2b4c9c5f7c241aeb37f389b4444aee26bea4"
> +#       github.com/docker/docker v24.0.7+incompatible
> +# [1] git ls-remote https://github.com/moby/moby
> 311b9ff0aa93aa55880e1e5f8871c4fb69583426
> +SRCREV_docker=3D"311b9ff0aa93aa55880e1e5f8871c4fb69583426"
>  SRC_URI +=3D "git://
> github.com/moby/moby;name=3Ddocker;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/docker
> <http://github.com/moby/moby;name=3Ddocker;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/do=
cker/docker>
> "
>
> -#       github.com/moby/buildkit v0.12.1
> -# [1] git ls-remote https://github.com/moby/buildkit
> bb857a0d49f45aa0ce9cd554b78d4075553e20f9
> -SRCREV_buildkit=3D"bb857a0d49f45aa0ce9cd554b78d4075553e20f9"
> +#       github.com/google/go-cmp v0.6.0
> +# [1] git ls-remote https://github.com/google/go-cmp
> c3ad8435e7bef96af35732bc0789e5a2278c6d5f
> +SRCREV_go-cmp=3D"c3ad8435e7bef96af35732bc0789e5a2278c6d5f"
> +SRC_URI +=3D "git://
> github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/go-cmp
> <http://github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/google/go-cmp>
> "
> +
> +#       github.com/moby/buildkit
> v0.13.0-beta1.0.20231023114302-d5c1d785b042
> +# [1] git ls-remote https://github.com/moby/buildkit
> d5c1d785b042cf834a05b08b73479d55b6acb533
> +SRCREV_buildkit=3D"d5c1d785b042cf834a05b08b73479d55b6acb533"
>  SRC_URI +=3D "git://
> github.com/moby/buildkit;name=3Dbuildkit;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/buildki=
t
> <http://github.com/moby/buildkit;name=3Dbuildkit;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/moby/buildkit>
> "
>
>  #       go.opentelemetry.io/otel v1.14.0
> @@ -288,35 +258,30 @@ SRC_URI +=3D "git://
> github.com/aws/smithy-go;name=3Dsmithy-go;protocol=3Dhttps;nobranc
>  SRCREV_protobuf=3D"b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
>  SRC_URI +=3D "git://
> github.com/gogo/protobuf;name=3Dprotobuf;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gogo/protobu=
f
> <http://github.com/gogo/protobuf;name=3Dprotobuf;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/gogo/protobuf>
> "
>
> -#       github.com/google/go-cmp v0.5.9
> -# [1] git ls-remote https://github.com/google/go-cmp
> a97318bf6562f2ed2632c5f985db51b1bc5bdcd0
> -SRCREV_go-cmp=3D"a97318bf6562f2ed2632c5f985db51b1bc5bdcd0"
> -SRC_URI +=3D "git://
> github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/go-cmp
> <http://github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/google/go-cmp>
> "
> -
>  #       github.com/google/gofuzz v1.2.0
>  # [1] git ls-remote https://github.com/google/gofuzz
> 379e164120fbc98885a8f494b5aa41ba94f64c56
>  SRCREV_gofuzz=3D"379e164120fbc98885a8f494b5aa41ba94f64c56"
>  SRC_URI +=3D "git://
> github.com/google/gofuzz;name=3Dgofuzz;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/gofuzz
> <http://github.com/google/gofuzz;name=3Dgofuzz;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/google/gofuzz>
> "
>
> -#       github.com/hashicorp/hcl v1.0.0
> -# [1] git ls-remote https://github.com/hashicorp/hcl
> 8cb6e5b959231cc1119e43259c4a608f9c51a241
> -SRCREV_hcl=3D"8cb6e5b959231cc1119e43259c4a608f9c51a241"
> -SRC_URI +=3D "git://
> github.com/hashicorp/hcl;name=3Dhcl;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/hcl
> <http://github.com/hashicorp/hcl;name=3Dhcl;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/h=
ashicorp/hcl>
> "
> -
>  #       github.com/imdario/mergo v0.3.16
>  # [1] git ls-remote https://github.com/darccio/mergo
> 14fe2b165b83359196f820886a2b24f2771729e9
>  SRCREV_mergo=3D"14fe2b165b83359196f820886a2b24f2771729e9"
>  SRC_URI +=3D "git://
> github.com/darccio/mergo;name=3Dmergo;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/imdario/mergo
> <http://github.com/darccio/mergo;name=3Dmergo;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/imdario/mergo>
> "
>
> +#       github.com/containerd/log v0.1.0
> +# [1] git ls-remote https://github.com/containerd/log
> 0fc1e28871fdf2786e2cc51bbe4133db6547a199
> +SRCREV_log=3D"0fc1e28871fdf2786e2cc51bbe4133db6547a199"
> +SRC_URI +=3D "git://
> github.com/containerd/log;name=3Dlog;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/log
> <http://github.com/containerd/log;name=3Dlog;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/=
containerd/log>
> "
> +
>  #       github.com/google/gnostic v0.5.7-v3refs
>  # [1] git ls-remote https://github.com/google/gnostic
> b49832d97d25b6a41cbe34ea12257924a934eeee
>  SRCREV_gnostic=3D"b49832d97d25b6a41cbe34ea12257924a934eeee"
>  SRC_URI +=3D "git://
> github.com/google/gnostic;name=3Dgnostic;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/gnost=
ic
> <http://github.com/google/gnostic;name=3Dgnostic;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/google/gnostic>
> "
>
> -#       github.com/laurazard/godog v0.0.0-20220922095256-4c4b17abdae7
> -# [1] git ls-remote https://github.com/laurazard/godog
> 4c4b17abdae7fd4f9d35cfe391ca65d172b092e3
> -SRCREV_godog=3D"4c4b17abdae7fd4f9d35cfe391ca65d172b092e3"
> -SRC_URI +=3D "git://
> github.com/laurazard/godog;name=3Dgodog;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/laurazard/god=
og
> <http://github.com/laurazard/godog;name=3Dgodog;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/laurazard/godog>
> "
> +#       github.com/davecgh/go-spew v1.1.1
> +# [1] git ls-remote https://github.com/davecgh/go-spew
> 8991bc29aa16c548c550c7ff78260e27b9ab7c73
> +SRCREV_go-spew=3D"8991bc29aa16c548c550c7ff78260e27b9ab7c73"
> +SRC_URI +=3D "git://
> github.com/davecgh/go-spew;name=3Dgo-spew;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/davecgh/go-=
spew
> <http://github.com/davecgh/go-spew;name=3Dgo-spew;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github=
.com/davecgh/go-spew>
> "
>
>  #       github.com/docker/go-units v0.5.0
>  # [1] git ls-remote https://github.com/docker/go-units
> e682442797b36348f8e1f98defdbf32bac0b6c6f
> @@ -328,11 +293,6 @@ SRC_URI +=3D "git://
> github.com/docker/go-units;name=3Dgo-units;protocol=3Dhttps;nobran
>  SRCREV_logrus=3D"d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd"
>  SRC_URI +=3D "git://
> github.com/sirupsen/logrus;name=3Dlogrus;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/sirupsen/log=
rus
> <http://github.com/sirupsen/logrus;name=3Dlogrus;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/sirupsen/logrus>
> "
>
> -#       github.com/davecgh/go-spew v1.1.1
> -# [1] git ls-remote https://github.com/davecgh/go-spew
> 8991bc29aa16c548c550c7ff78260e27b9ab7c73
> -SRCREV_go-spew=3D"8991bc29aa16c548c550c7ff78260e27b9ab7c73"
> -SRC_URI +=3D "git://
> github.com/davecgh/go-spew;name=3Dgo-spew;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/davecgh/go-=
spew
> <http://github.com/davecgh/go-spew;name=3Dgo-spew;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github=
.com/davecgh/go-spew>
> "
> -
>  #       github.com/go-openapi/swag v0.19.14
>  # [1] git ls-remote https://github.com/go-openapi/swag
> c78fa6719bc3d4b977d19a09064feda1c07571af
>  SRCREV_swag=3D"c78fa6719bc3d4b977d19a09064feda1c07571af"
> @@ -368,19 +328,14 @@ SRC_URI +=3D "git://
> github.com/moby/spdystream;name=3Dspdystream;protocol=3Dhttps;nobr
>  SRCREV_signal=3D"b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5"
>  SRC_URI +=3D "git://
> github.com/moby/sys;name=3Dsignal;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/signal
> <http://github.com/moby/sys;name=3Dsignal;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/mob=
y/sys/signal>
> "
>
> -#       github.com/subosito/gotenv v1.4.1
> -# [1] git ls-remote https://github.com/subosito/gotenv
> d94fdbe829d24b31d6ac30b6beb28b6420c1778a
> -SRCREV_gotenv=3D"d94fdbe829d24b31d6ac30b6beb28b6420c1778a"
> -SRC_URI +=3D "git://
> github.com/subosito/gotenv;name=3Dgotenv;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/subosito/got=
env
> <http://github.com/subosito/gotenv;name=3Dgotenv;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/subosito/gotenv>
> "
> -
> -#       google.golang.org/genproto v0.0.0-20230526161137-0005af68ea54
> -# [1] git ls-remote https://github.com/googleapis/go-genproto
> 0005af68ea5476a8b99ce94ab83ae4aaac864963
> -SRCREV_genproto=3D"0005af68ea5476a8b99ce94ab83ae4aaac864963"
> +#       google.golang.org/genproto v0.0.0-20230822172742-b8732ec3820d
> +# [1] git ls-remote https://github.com/googleapis/go-genproto
> b8732ec3820db4bd1e4eda89392b7728e81bd825
> +SRCREV_genproto=3D"b8732ec3820db4bd1e4eda89392b7728e81bd825"
>  SRC_URI +=3D "git://
> github.com/googleapis/go-genproto;name=3Dgenproto;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.=
org/genproto
> <http://github.com/googleapis/go-genproto;name=3Dgenproto;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/google.golang.org/genproto>
> "
>
> -#       google.golang.org/protobuf v1.30.0
> -# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go
> f221882bfb484564f1714ae05f197dea2c76898d
>
> -SRCREV_google.golang.org-protobuf=3D"f221882bfb484564f1714ae05f197dea2c7=
6898d"
> +#       google.golang.org/protobuf v1.31.0
> +# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go
> 68463f0e96c93bc19ef36ccd3adfe690bfdb568c
>
> +SRCREV_google.golang.org-protobuf=3D"68463f0e96c93bc19ef36ccd3adfe690bfd=
b568c"
>  SRC_URI +=3D "git://
> github.com/protocolbuffers/protobuf-go;name=3Dgoogle.golang.org-protobuf;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/google.golang.org/protobuf
> <http://github.com/protocolbuffers/protobuf-go;name=3Dgoogle.golang.org-p=
rotobuf;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/google.golang.org/protobuf>
> "
>
>  #       github.com/stretchr/testify v1.8.4
> @@ -388,11 +343,6 @@ SRC_URI +=3D "git://
> github.com/protocolbuffers/protobuf-go;name=3Dgoogle.golang.org-
>  SRCREV_testify=3D"f97607b89807936ac4ff96748d766cf4b9711f78"
>  SRC_URI +=3D "git://
> github.com/stretchr/testify;name=3Dtestify;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/stretchr/t=
estify
> <http://github.com/stretchr/testify;name=3Dtestify;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/githu=
b.com/stretchr/testify>
> "
>
> -#       github.com/cloudflare/cfssl v1.6.4
> -# [1] git ls-remote https://github.com/cloudflare/cfssl
> b4d0d877cac528f63db39dfb62d5c96cd3a32a0b
> -SRCREV_cfssl=3D"b4d0d877cac528f63db39dfb62d5c96cd3a32a0b"
> -SRC_URI +=3D "git://
> github.com/cloudflare/cfssl;name=3Dcfssl;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cloudflare/c=
fssl
> <http://github.com/cloudflare/cfssl;name=3Dcfssl;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/cloudflare/cfssl>
> "
> -
>  #       github.com/josharian/intern v1.0.0
>  # [1] git ls-remote https://github.com/josharian/intern
> 8e6ff32b3e7c0b018c43953085fe2ac330fe9acd
>  SRCREV_intern=3D"8e6ff32b3e7c0b018c43953085fe2ac330fe9acd"
> @@ -448,6 +398,11 @@ SRC_URI +=3D "git://
> github.com/open-telemetry/opentelemetry-go;name=3Dsdk;protocol=3Dh
>  SRCREV_go-ansiterm=3D"d185dfc1b5a126116ea5a19e148e29d16b4574c9"
>  SRC_URI +=3D "git://
> github.com/Azure/go-ansiterm;name=3Dgo-ansiterm;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure=
/go-ansiterm
> <http://github.com/Azure/go-ansiterm;name=3Dgo-ansiterm;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/=
github.com/Azure/go-ansiterm>
> "
>
> +#       github.com/Microsoft/hcsshim v0.11.1
> +# [1] git ls-remote https://github.com/microsoft/hcsshim
> 641f8b8a2314aba7ee58223e28d330fbcd66e3c2
> +SRCREV_hcsshim=3D"641f8b8a2314aba7ee58223e28d330fbcd66e3c2"
> +SRC_URI +=3D "git://
> github.com/microsoft/hcsshim;name=3Dhcsshim;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Microsoft=
/hcsshim
> <http://github.com/microsoft/hcsshim;name=3Dhcsshim;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gith=
ub.com/Microsoft/hcsshim>
> "
> +
>  #       github.com/aws/aws-sdk-go-v2 v1.17.6
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2
> 18bff5e44f4c2c140feaf54b2dd92140630c7e50
>  SRCREV_aws-sdk-go-v2=3D"18bff5e44f4c2c140feaf54b2dd92140630c7e50"
> @@ -508,21 +463,11 @@ SRC_URI +=3D "git://
> github.com/microsoft/go-winio;name=3Dgo-winio;protocol=3Dhttps;nob
>  SRCREV_console=3D"b5cb846c9186d67bcae3ce3c324e47cd317d9527"
>  SRC_URI +=3D "git://
> github.com/containerd/console;name=3Dconsole;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containe=
rd/console
> <http://github.com/containerd/console;name=3Dconsole;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/git=
hub.com/containerd/console>
> "
>
> -#       github.com/bugsnag/bugsnag-go v1.5.0
> -# [1] git ls-remote https://github.com/bugsnag/bugsnag-go
> d5b63da7e1f93d83e3980e5ab2bf33179bad7b2a
> -SRCREV_bugsnag-go=3D"d5b63da7e1f93d83e3980e5ab2bf33179bad7b2a"
> -SRC_URI +=3D "git://
> github.com/bugsnag/bugsnag-go;name=3Dbugsnag-go;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/bugsn=
ag/bugsnag-go
> <http://github.com/bugsnag/bugsnag-go;name=3Dbugsnag-go;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/=
github.com/bugsnag/bugsnag-go>
> "
> -
>  #       github.com/fvbommel/sortorder v1.0.2
>  # [1] git ls-remote https://github.com/fvbommel/sortorder
> 26fad50c6b32a3064c09ed089865c16f2f3615f6
>  SRCREV_sortorder=3D"26fad50c6b32a3064c09ed089865c16f2f3615f6"
>  SRC_URI +=3D "git://
> github.com/fvbommel/sortorder;name=3Dsortorder;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fvbom=
mel/sortorder
> <http://github.com/fvbommel/sortorder;name=3Dsortorder;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/g=
ithub.com/fvbommel/sortorder>
> "
>
> -#       github.com/hashicorp/go-memdb v1.3.2
> -# [1] git ls-remote https://github.com/hashicorp/go-memdb
> 542a5804dedaaddf1a0cad8b6a7b0b3fcf438776
> -SRCREV_go-memdb=3D"542a5804dedaaddf1a0cad8b6a7b0b3fcf438776"
> -SRC_URI +=3D "git://
> github.com/hashicorp/go-memdb;name=3Dgo-memdb;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashi=
corp/go-memdb
> <http://github.com/hashicorp/go-memdb;name=3Dgo-memdb;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gi=
thub.com/hashicorp/go-memdb>
> "
> -
>  #       github.com/klauspost/compress v1.16.5
>  # [1] git ls-remote https://github.com/klauspost/compress
> ed6feffc3bb26797dc2a376516b16611046cdecd
>  SRCREV_compress=3D"ed6feffc3bb26797dc2a376516b16611046cdecd"
> @@ -588,9 +533,9 @@ SRC_URI +=3D "git://
> github.com/distribution/distribution;name=3Ddistribution;protoco
>  SRCREV_sequential=3D"b22ba8a69b306f0b4adbbe2a529457e6283ed9f7"
>  SRC_URI +=3D "git://
> github.com/moby/sys;name=3Dsequential;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/sequen=
tial
> <http://github.com/moby/sys;name=3Dsequential;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/moby/sys/sequential>
> "
>
> -#       github.com/opencontainers/runc v1.1.7
> -# [1] git ls-remote https://github.com/opencontainers/runc
> 860f061b76bb4fc671f0f9e900f7d80ff93d4eb7
> -SRCREV_runc=3D"860f061b76bb4fc671f0f9e900f7d80ff93d4eb7"
> +#       github.com/opencontainers/runc v1.1.9
> +# [1] git ls-remote https://github.com/opencontainers/runc
> ccaecfcbc907d70a7aa870a6650887b901b25b82
> +SRCREV_runc=3D"ccaecfcbc907d70a7aa870a6650887b901b25b82"
>  SRC_URI +=3D "git://
> github.com/opencontainers/runc;name=3Drunc;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontai=
ners/runc
> <http://github.com/opencontainers/runc;name=3Drunc;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/githu=
b.com/opencontainers/runc>
> "
>
>  #       github.com/shibumi/go-pathspec v1.3.0
> @@ -613,21 +558,11 @@ SRC_URI +=3D "git://
> github.com/docker/cli-docs-tool;name=3Dcli-docs-tool;protocol=3Dht
>  SRCREV_go-version=3D"78d058c5618891f74d604bd15356fca690b64d8a"
>  SRC_URI +=3D "git://
> github.com/hashicorp/go-version;name=3Dgo-version;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/has=
hicorp/go-version
> <http://github.com/hashicorp/go-version;name=3Dgo-version;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/github.com/hashicorp/go-version>
> "
>
> -#       github.com/hashicorp/golang-lru v0.5.4
> -# [1] git ls-remote https://github.com/hashicorp/golang-lru
> 14eae340515388ca95aa8e7b86f0de668e981f54
> -SRCREV_golang-lru=3D"14eae340515388ca95aa8e7b86f0de668e981f54"
> -SRC_URI +=3D "git://
> github.com/hashicorp/golang-lru;name=3Dgolang-lru;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/has=
hicorp/golang-lru
> <http://github.com/hashicorp/golang-lru;name=3Dgolang-lru;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/github.com/hashicorp/golang-lru>
> "
> -
>  #       github.com/modern-go/concurrent
> v0.0.0-20180306012644-bacd9c7ef1dd
>  # [1] git ls-remote https://github.com/modern-go/concurrent
> bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94
>  SRCREV_concurrent=3D"bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
>  SRC_URI +=3D "git://
> github.com/modern-go/concurrent;name=3Dconcurrent;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mod=
ern-go/concurrent
> <http://github.com/modern-go/concurrent;name=3Dconcurrent;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/github.com/modern-go/concurrent>
> "
>
> -#       github.com/pelletier/go-toml/v2 v2.0.5
> -# [1] git ls-remote https://github.com/pelletier/go-toml
> 942841787a7d70422e4d8bc7d0be28ab911402df
> -SRCREV_go-toml-v2=3D"942841787a7d70422e4d8bc7d0be28ab911402df"
> -SRC_URI +=3D "git://
> github.com/pelletier/go-toml;name=3Dgo-toml-v2;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pelle=
tier/go-toml/v2
> <http://github.com/pelletier/go-toml;name=3Dgo-toml-v2;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/g=
ithub.com/pelletier/go-toml/v2>
> "
> -
>  #       github.com/xeipuuv/gojsonschema v1.2.0
>  # [1] git ls-remote https://github.com/xeipuuv/gojsonschema
> 82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927
>  SRCREV_gojsonschema=3D"82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927"
> @@ -643,9 +578,9 @@ SRC_URI +=3D "git://
> github.com/open-telemetry/opentelemetry-go;name=3Dmetric;protoco
>  SRCREV_v2=3D"fa37277e6394c29db7bcc94062cb30cd7785a126"
>  SRC_URI +=3D "git://
> github.com/AlecAivazis/survey;name=3Dv2;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AlecAivazis/s=
urvey/v2
> <http://github.com/AlecAivazis/survey;name=3Dv2;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/AlecAivazis/survey/v2>
> "
>
> -#       github.com/containerd/containerd v1.7.3
> -# [1] git ls-remote https://github.com/containerd/containerd
> 7880925980b188f4c97b462f709d0db8e8962aff
> -SRCREV_containerd=3D"7880925980b188f4c97b462f709d0db8e8962aff"
> +#       github.com/containerd/containerd v1.7.7
> +# [1] git ls-remote https://github.com/containerd/containerd
> 8c087663b0233f6e6e2f4515cee61d49f14746a8
> +SRCREV_containerd=3D"8c087663b0233f6e6e2f4515cee61d49f14746a8"
>  SRC_URI +=3D "git://
> github.com/containerd/containerd;name=3Dcontainerd;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/co=
ntainerd/containerd
> <http://github.com/containerd/containerd;name=3Dcontainerd;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fet=
ch/github.com/containerd/containerd>
> "
>
>  #       github.com/docker/go-connections v0.4.0
> @@ -658,9 +593,9 @@ SRC_URI +=3D "git://
> github.com/docker/go-connections;name=3Dgo-connections;protocol=3D
>  SRCREV_semver-v3=3D"e06051f8fcc4c8b4a4990c337b9862a2448722e5"
>  SRC_URI +=3D "git://
> github.com/Masterminds/semver;name=3Dsemver-v3;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Maste=
rminds/semver/v3
> <http://github.com/Masterminds/semver;name=3Dsemver-v3;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/g=
ithub.com/Masterminds/semver/v3>
> "
>
> -#       github.com/containerd/continuity v0.4.1
> -# [1] git ls-remote https://github.com/containerd/continuity
> 25762ef7c27a37645197ed6d1d708e55a230e35d
> -SRCREV_continuity=3D"25762ef7c27a37645197ed6d1d708e55a230e35d"
> +#       github.com/containerd/continuity v0.4.2
> +# [1] git ls-remote https://github.com/containerd/continuity
> 77a2d47a6668b82465fdf6cb749fe3a2aa2c9743
> +SRCREV_continuity=3D"77a2d47a6668b82465fdf6cb749fe3a2aa2c9743"
>  SRC_URI +=3D "git://
> github.com/containerd/continuity;name=3Dcontinuity;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/co=
ntainerd/continuity
> <http://github.com/containerd/continuity;name=3Dcontinuity;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fet=
ch/github.com/containerd/continuity>
> "
>
>  #       github.com/containerd/typeurl/v2 v2.1.1
> @@ -668,16 +603,16 @@ SRC_URI +=3D "git://
> github.com/containerd/continuity;name=3Dcontinuity;protocol=3Dhttp
>  SRCREV_typeurl-v2=3D"7ef6316b771f959cbb208b229e3423a466947df3"
>  SRC_URI +=3D "git://
> github.com/containerd/typeurl;name=3Dtypeurl-v2;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/conta=
inerd/typeurl/v2
> <http://github.com/containerd/typeurl;name=3Dtypeurl-v2;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/=
github.com/containerd/typeurl/v2>
> "
>
> -#       github.com/magiconair/properties v1.8.6
> -# [1] git ls-remote https://github.com/magiconair/properties
> 869a5592420f4ff6ebf74500b5c658b29d973172
> -SRCREV_properties=3D"869a5592420f4ff6ebf74500b5c658b29d973172"
> -SRC_URI +=3D "git://
> github.com/magiconair/properties;name=3Dproperties;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ma=
giconair/properties
> <http://github.com/magiconair/properties;name=3Dproperties;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fet=
ch/github.com/magiconair/properties>
> "
> -
>  #       github.com/xeipuuv/gojsonpointer
> v0.0.0-20190905194746-02993c407bfb
>  # [1] git ls-remote https://github.com/xeipuuv/gojsonpointer
> 02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb
>  SRCREV_gojsonpointer=3D"02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb"
>  SRC_URI +=3D "git://
> github.com/xeipuuv/gojsonpointer;name=3Dgojsonpointer;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/xeipuuv/gojsonpointer
> <http://github.com/xeipuuv/gojsonpointer;name=3Dgojsonpointer;protocol=3D=
https;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.=
fetch/github.com/xeipuuv/gojsonpointer>
> "
>
> +#       github.com/distribution/reference v0.5.0
> +# [1] git ls-remote https://github.com/distribution/reference
> 49c28499d219290c3226822e9cfcd4ede6d75379
> +SRCREV_reference=3D"49c28499d219290c3226822e9cfcd4ede6d75379"
> +SRC_URI +=3D "git://
> github.com/distribution/reference;name=3Dreference;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/di=
stribution/reference
> <http://github.com/distribution/reference;name=3Dreference;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fet=
ch/github.com/distribution/reference>
> "
> +
>  #       github.com/mitchellh/mapstructure v1.5.0
>  # [1] git ls-remote https://github.com/mitchellh/mapstructure
> ab69d8d93410fce4361f4912bb1ff88110a81311
>  SRCREV_mapstructure=3D"ab69d8d93410fce4361f4912bb1ff88110a81311"
> @@ -693,6 +628,11 @@ SRC_URI +=3D "git://
> github.com/emicklei/go-restful;name=3Dgo-restful-v3;protocol=3Dhtt
>  SRCREV_jsonpointer=3D"2446e21cad36eee826e1c2380f0ff747074a2faa"
>  SRC_URI +=3D "git://
> github.com/go-openapi/jsonpointer;name=3Djsonpointer;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
go-openapi/jsonpointer
> <http://github.com/go-openapi/jsonpointer;name=3Djsonpointer;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.f=
etch/github.com/go-openapi/jsonpointer>
> "
>
> +#       github.com/hashicorp/go-cleanhttp v0.5.2
> +# [1] git ls-remote https://github.com/hashicorp/go-cleanhttp
> 6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2
> +SRCREV_go-cleanhttp=3D"6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2"
> +SRC_URI +=3D "git://
> github.com/hashicorp/go-cleanhttp;name=3Dgo-cleanhttp;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/hashicorp/go-cleanhttp
> <http://github.com/hashicorp/go-cleanhttp;name=3Dgo-cleanhttp;protocol=3D=
https;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.=
fetch/github.com/hashicorp/go-cleanhttp>
> "
> +
>  #       github.com/in-toto/in-toto-golang v0.5.0
>  # [1] git ls-remote https://github.com/in-toto/in-toto-golang
> ec599036d27ebaca3e8c03559d3f8fd5fe429dfe
>  SRCREV_in-toto-golang=3D"ec599036d27ebaca3e8c03559d3f8fd5fe429dfe"
> @@ -703,9 +643,9 @@ SRC_URI +=3D "git://
> github.com/in-toto/in-toto-golang;name=3Din-toto-golang;protocol
>  SRCREV_go-shellquote=3D"95032a82bc518f77982ea72343cc1ade730072f0"
>  SRC_URI +=3D "git://
> github.com/kballard/go-shellquote;name=3Dgo-shellquote;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/kballard/go-shellquote
> <http://github.com/kballard/go-shellquote;name=3Dgo-shellquote;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/kballard/go-shellquote>
> "
>
> -#       github.com/compose-spec/compose-go v1.18.3
> -# [1] git ls-remote https://github.com/compose-spec/compose-go
> c6eecc55b95f952b6d6406adcd297499d11a300b
> -SRCREV_compose-go=3D"c6eecc55b95f952b6d6406adcd297499d11a300b"
> +#       github.com/compose-spec/compose-go v1.20.2
> +# [1] git ls-remote https://github.com/compose-spec/compose-go
> e390b9774ca100e1d75c8bc075054502783b48b8
> +SRCREV_compose-go=3D"e390b9774ca100e1d75c8bc075054502783b48b8"
>  SRC_URI +=3D "git://
> github.com/compose-spec/compose-go;name=3Dcompose-go;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
compose-spec/compose-go
> <http://github.com/compose-spec/compose-go;name=3Dcompose-go;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.f=
etch/github.com/compose-spec/compose-go>
> "
>
>  #       github.com/hashicorp/go-multierror v1.1.1
> @@ -713,21 +653,11 @@ SRC_URI +=3D "git://
> github.com/compose-spec/compose-go;name=3Dcompose-go;protocol=3Dht
>  SRCREV_go-multierror=3D"9974e9ec57696378079ecc3accd3d6f29401b3a0"
>  SRC_URI +=3D "git://
> github.com/hashicorp/go-multierror;name=3Dgo-multierror;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/hashicorp/go-multierror
> <http://github.com/hashicorp/go-multierror;name=3Dgo-multierror;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/hashicorp/go-multierror>
> "
>
> -#       github.com/cucumber/gherkin-go/v19 v19.0.3
> -# [1] git ls-remote https://github.com/cucumber/gherkin-go
> 11029f28bd1bc215fa57275b576f2b237b7c2b07
> -SRCREV_v19=3D"11029f28bd1bc215fa57275b576f2b237b7c2b07"
> -SRC_URI +=3D "git://
> github.com/cucumber/gherkin-go;name=3Dv19;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cucumber/gh=
erkin-go/v19
> <http://github.com/cucumber/gherkin-go;name=3Dv19;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github=
.com/cucumber/gherkin-go/v19>
> "
> -
>  #       github.com/prometheus/client_model v0.3.0
>  # [1] git ls-remote https://github.com/prometheus/client_model
> 63fb9822ca3ba7a4ba5184071fb8f2ea000a99ef
>  SRCREV_client_model=3D"63fb9822ca3ba7a4ba5184071fb8f2ea000a99ef"
>  SRC_URI +=3D "git://
> github.com/prometheus/client_model;name=3Dclient_model;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/prometheus/client_model
> <http://github.com/prometheus/client_model;name=3Dclient_model;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/prometheus/client_model>
> "
>
> -#       github.com/spf13/jwalterweatherman v1.1.0
> -# [1] git ls-remote https://github.com/spf13/jwalterweatherman
> 94f6ae3ed3bceceafa716478c5fbf8d29ca601a1
> -SRCREV_jwalterweatherman=3D"94f6ae3ed3bceceafa716478c5fbf8d29ca601a1"
> -SRC_URI +=3D "git://
> github.com/spf13/jwalterweatherman;name=3Djwalterweatherman;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/spf13/jwalterweatherman
> <http://github.com/spf13/jwalterweatherman;name=3Djwalterweatherman;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/v=
endor.fetch/github.com/spf13/jwalterweatherman>
> "
> -
>  #       github.com/xeipuuv/gojsonreference
> v0.0.0-20180127040603-bd5ef7bd5415
>  # [1] git ls-remote https://github.com/xeipuuv/gojsonreference
> bd5ef7bd5415a7ac448318e64f11a24cd21e594b
>  SRCREV_gojsonreference=3D"bd5ef7bd5415a7ac448318e64f11a24cd21e594b"
> @@ -743,11 +673,6 @@ SRC_URI +=3D "git://
> github.com/opencontainers/go-digest;name=3Dgo-digest;protocol=3Dht
>  SRCREV_config=3D"18bff5e44f4c2c140feaf54b2dd92140630c7e50"
>  SRC_URI +=3D "git://
> github.com/aws/aws-sdk-go-v2;name=3Dconfig;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sd=
k-go-v2/config
> <http://github.com/aws/aws-sdk-go-v2;name=3Dconfig;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/githu=
b.com/aws/aws-sdk-go-v2/config>
> "
>
> -#       github.com/cucumber/messages-go/v16 v16.0.1
> -# [1] git ls-remote https://github.com/cucumber/messages-go
> 1848e9bfc84e8c1674c4d9ded0bdbfc23c458b28
> -SRCREV_v16=3D"1848e9bfc84e8c1674c4d9ded0bdbfc23c458b28"
> -SRC_URI +=3D "git://
> github.com/cucumber/messages-go;name=3Dv16;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cucumber/m=
essages-go/v16
> <http://github.com/cucumber/messages-go;name=3Dv16;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/githu=
b.com/cucumber/messages-go/v16>
> "
> -
>  #       github.com/go-openapi/jsonreference v0.20.0
>  # [1] git ls-remote https://github.com/go-openapi/jsonreference
> c5db5582e080fbeae80be42f42881230a8caebf6
>  SRCREV_jsonreference=3D"c5db5582e080fbeae80be42f42881230a8caebf6"
> @@ -758,9 +683,9 @@ SRC_URI +=3D "git://
> github.com/go-openapi/jsonreference;name=3Djsonreference;protoco
>  SRCREV_client_golang=3D"254e5468413f19fb75cdad45f5ddc0b8c975188c"
>  SRC_URI +=3D "git://
> github.com/prometheus/client_golang;name=3Dclient_golang;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/prometheus/client_golang
> <http://github.com/prometheus/client_golang;name=3Dclient_golang;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/prometheus/client_golang>
> "
>
> -#       github.com/opencontainers/image-spec v1.1.0-rc4
> -# [1] git ls-remote https://github.com/opencontainers/image-spec
> 82e8329f7eb6df5c62924f2792d285ba276ae876
> -SRCREV_image-spec=3D"82e8329f7eb6df5c62924f2792d285ba276ae876"
> +#       github.com/opencontainers/image-spec v1.1.0-rc5
> +# [1] git ls-remote https://github.com/opencontainers/image-spec
> 1e54f0195ce54b4a1a2ecbac8eab7686d91d3080
> +SRCREV_image-spec=3D"1e54f0195ce54b4a1a2ecbac8eab7686d91d3080"
>  SRC_URI +=3D "git://
> github.com/opencontainers/image-spec;name=3Dimage-spec;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/opencontainers/image-spec
> <http://github.com/opencontainers/image-spec;name=3Dimage-spec;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/opencontainers/image-spec>
> "
>
>  #       github.com/theupdateframework/notary v0.7.0
> @@ -768,9 +693,9 @@ SRC_URI +=3D "git://
> github.com/opencontainers/image-spec;name=3Dimage-spec;protocol=3D
>  SRCREV_notary=3D"b0b6bfdd4933081e8d5ae026b24e8337311dd598"
>  SRC_URI +=3D "git://
> github.com/notaryproject/notary;name=3Dnotary;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/theup=
dateframework/notary
> <http://github.com/notaryproject/notary;name=3Dnotary;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gi=
thub.com/theupdateframework/notary>
> "
>
> -#       github.com/AdaLogics/go-fuzz-headers
> v0.0.0-20230106234847-43070de90fa1
> -# [1] git ls-remote https://github.com/AdaLogics/go-fuzz-headers
> 43070de90fa134c9ea55cd6de4308a2ae59658d3
> -SRCREV_go-fuzz-headers=3D"43070de90fa134c9ea55cd6de4308a2ae59658d3"
> +#       github.com/AdaLogics/go-fuzz-headers
> v0.0.0-20230811130428-ced1acdcaa24
> +# [1] git ls-remote https://github.com/AdaLogics/go-fuzz-headers
> ced1acdcaa24dc39c01b039fc37576c395f506cf
> +SRCREV_go-fuzz-headers=3D"ced1acdcaa24dc39c01b039fc37576c395f506cf"
>  SRC_URI +=3D "git://
> github.com/AdaLogics/go-fuzz-headers;name=3Dgo-fuzz-headers;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/AdaLogics/go-fuzz-headers
> <http://github.com/AdaLogics/go-fuzz-headers;name=3Dgo-fuzz-headers;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/v=
endor.fetch/github.com/AdaLogics/go-fuzz-headers>
> "
>
>  #       github.com/inconshreveable/mousetrap v1.1.0
> @@ -783,21 +708,6 @@ SRC_URI +=3D "git://
> github.com/inconshreveable/mousetrap;name=3Dmousetrap;protocol=3Dh
>  SRCREV_structured-merge-diff-v4=3D"26781d0c10bfdbd7d66b18d8be83985f623df=
9f8"
>  SRC_URI +=3D "git://
> github.com/kubernetes-sigs/structured-merge-diff;name=3Dstructured-merge-=
diff-v4;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/imp=
ort/vendor.fetch/sigs.k8s.io/structured-merge-diff/v4
> <http://github.com/kubernetes-sigs/structured-merge-diff;name=3Dstructure=
d-merge-diff-v4;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$=
%7BBP%7D/src/import/vendor.fetch/sigs.k8s.io/structured-merge-diff/v4>
> "
>
> -#       github.com/cyphar/filepath-securejoin v0.2.3
> -# [1] git ls-remote https://github.com/cyphar/filepath-securejoin
> 8f267f5ea675a20a2cb5e91011d063721f53bf79
> -SRCREV_filepath-securejoin=3D"8f267f5ea675a20a2cb5e91011d063721f53bf79"
> -SRC_URI +=3D "git://
> github.com/cyphar/filepath-securejoin;name=3Dfilepath-securejoin;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/cyphar/filepath-securejoin
> <http://github.com/cyphar/filepath-securejoin;name=3Dfilepath-securejoin;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/imp=
ort/vendor.fetch/github.com/cyphar/filepath-securejoin>
> "
> -
> -#       github.com/distribution/distribution/v3
> v3.0.0-20230601133803-97b1d649c493
> -# [1] git ls-remote https://github.com/distribution/distribution
> 97b1d649c4938d0f608d96454d6a8326b1f96acd
> -SRCREV_v3=3D"97b1d649c4938d0f608d96454d6a8326b1f96acd"
> -SRC_URI +=3D "git://
> github.com/distribution/distribution;name=3Dv3;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/distr=
ibution/distribution/v3
> <http://github.com/distribution/distribution;name=3Dv3;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/g=
ithub.com/distribution/distribution/v3>
> "
> -
> -#       github.com/hashicorp/go-immutable-radix v1.3.1
> -# [1] git ls-remote https://github.com/hashicorp/go-immutable-radix
> 49d1d02c49a783de548d1ba8ae8fde466a20b9e6
> -SRCREV_go-immutable-radix=3D"49d1d02c49a783de548d1ba8ae8fde466a20b9e6"
> -SRC_URI +=3D "git://
> github.com/hashicorp/go-immutable-radix;name=3Dgo-immutable-radix;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/hashicorp/go-immutable-radix
> <http://github.com/hashicorp/go-immutable-radix;name=3Dgo-immutable-radix=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/im=
port/vendor.fetch/github.com/hashicorp/go-immutable-radix>
> "
> -
>  #       github.com/aws/aws-sdk-go-v2/credentials v1.13.16
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2
> 18bff5e44f4c2c140feaf54b2dd92140630c7e50
>  SRCREV_credentials=3D"18bff5e44f4c2c140feaf54b2dd92140630c7e50"
> @@ -823,14 +733,14 @@ SRC_URI +=3D "git://
> github.com/aws/aws-sdk-go-v2;name=3Dini;protocol=3Dhttps;nobranch=3D
>  SRCREV_grpc-gateway-v2=3D"0197faf8b072910084edd1209aa2ac51833b895c"
>  SRC_URI +=3D "git://
> github.com/grpc-ecosystem/grpc-gateway;name=3Dgrpc-gateway-v2;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/grpc-ecosystem/grpc-gateway/v2
> <http://github.com/grpc-ecosystem/grpc-gateway;name=3Dgrpc-gateway-v2;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import=
/vendor.fetch/github.com/grpc-ecosystem/grpc-gateway/v2>
> "
>
> -#       google.golang.org/genproto/googleapis/api
> v0.0.0-20230525234035-dd9d682886f9
> -# [1] git ls-remote https://github.com/googleapis/go-genproto
> dd9d682886f99d242574cd3eaea438ce7ea66399
> -SRCREV_api=3D"dd9d682886f99d242574cd3eaea438ce7ea66399"
> +#       google.golang.org/genproto/googleapis/api
> v0.0.0-20230822172742-b8732ec3820d
> +# [1] git ls-remote https://github.com/googleapis/go-genproto
> b8732ec3820db4bd1e4eda89392b7728e81bd825
> +SRCREV_api=3D"b8732ec3820db4bd1e4eda89392b7728e81bd825"
>  SRC_URI +=3D "git://
> github.com/googleapis/go-genproto;name=3Dapi;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/g=
enproto/googleapis/api
> <http://github.com/googleapis/go-genproto;name=3Dapi;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/goo=
gle.golang.org/genproto/googleapis/api>
> "
>
> -#       google.golang.org/genproto/googleapis/rpc
> v0.0.0-20230525234030-28d5490b6b19
> -# [1] git ls-remote https://github.com/googleapis/go-genproto
> 28d5490b6b19cce1ebbc6ab55ca8637bd35b3486
> -SRCREV_rpc=3D"28d5490b6b19cce1ebbc6ab55ca8637bd35b3486"
> +#       google.golang.org/genproto/googleapis/rpc
> v0.0.0-20230822172742-b8732ec3820d
> +# [1] git ls-remote https://github.com/googleapis/go-genproto
> b8732ec3820db4bd1e4eda89392b7728e81bd825
> +SRCREV_rpc=3D"b8732ec3820db4bd1e4eda89392b7728e81bd825"
>  SRC_URI +=3D "git://
> github.com/googleapis/go-genproto;name=3Drpc;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/g=
enproto/googleapis/rpc
> <http://github.com/googleapis/go-genproto;name=3Drpc;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/goo=
gle.golang.org/genproto/googleapis/rpc>
> "
>
>  #       github.com/docker/docker-credential-helpers v0.7.0
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8595):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8595
> Mute This Topic: https://lists.yoctoproject.org/mt/104628874/5052612
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000095cf51061275912f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>The recipe on meta-virt main-next fails to build with =
go-1.21 and I have updated it with:<div>./meta-virtualization/scripts/oe-go=
-mod-autogen.py --repo <a href=3D"https://github.com/docker/compose">https:=
//github.com/docker/compose</a> --rev v2.23.3<br><br>Jose</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresm=
a via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> =
&lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gma=
il.com@lists.yoctoproject.org</a>&gt; escreveu (quarta, 28/02/2024 =C3=A0(s=
) 18:44):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">- c665=
c53c bump buildx to v0.12.0 and adapt code to changes<br>
- a1aceba6 Merge pull request #11215 from docker/dependabot/go_modules/<a h=
ref=3D"http://github.com/compose-spec/compose-go-1.20.2" rel=3D"noreferrer"=
 target=3D"_blank">github.com/compose-spec/compose-go-1.20.2</a><br>
- a39cf75e build(deps): bump <a href=3D"http://github.com/compose-spec/comp=
ose-go" rel=3D"noreferrer" target=3D"_blank">github.com/compose-spec/compos=
e-go</a><br>
- 5b0dcc5a Merge pull request #11214 from docker/dependabot/go_modules/<a h=
ref=3D"http://github.com/spf13/cobra-1.8.0" rel=3D"noreferrer" target=3D"_b=
lank">github.com/spf13/cobra-1.8.0</a><br>
- 46ba9c99 build(deps): bump <a href=3D"http://github.com/spf13/cobra" rel=
=3D"noreferrer" target=3D"_blank">github.com/spf13/cobra</a> from 1.7.0 to =
1.8.0<br>
- 1148b676 Merge pull request #11142 from docker/dependabot/go_modules/<a h=
ref=3D"http://github.com/docker/cli-24.0.7incompatible" rel=3D"noreferrer" =
target=3D"_blank">github.com/docker/cli-24.0.7incompatible</a><br>
- 5c5d30c6 build(deps): bump <a href=3D"http://github.com/docker/cli" rel=
=3D"noreferrer" target=3D"_blank">github.com/docker/cli</a><br>
- 2068ecee Merge pull request #11143 from docker/dependabot/go_modules/<a h=
ref=3D"http://github.com/docker/docker-24.0.7incompatible" rel=3D"noreferre=
r" target=3D"_blank">github.com/docker/docker-24.0.7incompatible</a><br>
- 36fa8d4e build(deps): bump <a href=3D"http://github.com/docker/docker" re=
l=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a><br>
- 69985b8b Merge pull request #11112 from docker/dependabot/go_modules/<a h=
ref=3D"http://github.com/moby/buildkit-0.12.3" rel=3D"noreferrer" target=3D=
"_blank">github.com/moby/buildkit-0.12.3</a><br>
- 2384635e build(deps): bump <a href=3D"http://github.com/moby/buildkit" re=
l=3D"noreferrer" target=3D"_blank">github.com/moby/buildkit</a> from 0.12.2=
 to 0.12.3<br>
- 587dba11 Merge pull request #11213 from glours/watch-force-build-at-start=
up<br>
- 2ba5e4c1 in watch mode force pull policy to build for services with both =
build and develop attributes This default behaviour will force a rebuild of=
 the service images at watch process startup and be sure containers will be=
 in sync with the local source code<br>
- b1a26dac Assume /src/pkg/compose/testdata absolute workingdir to make tes=
ts reproducible<br>
- 0ab21a20 Merge pull request #11211 from ndeloof/Services<br>
- 5e77ae92 avoir use of []types.ServiceConfig<br>
- f5572201 identify services to build and don&#39;t display &#39;building&#=
39; if none<br>
- 8e1b3236 fix --remove-orphans not to consider disabled services as orphan=
ed<br>
- a1b7bee0 Merge pull request #11206 from ndeloof/check_runtime<br>
- 7cb1f8ba introduce RuntimeVersion for code to check container runtime sup=
ports required features<br>
- cb01186c push also consider build.tags<br>
- efea084d Merge pull request #11192 from ulyssessouza/exclude-tests-contex=
t<br>
- 9c4efbdd Strip project prefix from docker-compose up output<br>
- 8ea7c9e0 Make it context aware and add test skipping options<br>
- c1694360 render quiet after filtering applied<br>
- 254a94b0 bump golang to version 1.21.4<br>
- cf608fa9 bump compose-go to v1.20.1<br>
- 426377a4 reject compose file using `secrets|configs.driver or template_dr=
iver`<br>
- 43c3f545 Merge pull request #11180 from ulyssessouza/skip-flaky-tests<br>
- 493f6c80 skips flaky e2e tests on watch and attach<br>
- c1a9ffa0 Merge pull request #11171 from szampardi/main<br>
- 646a8fc0 fix docker/compose#11170 add newline in cmd/compose/build.go fmt=
.Fprint<br>
- 2945532f fix --pull documentation<br>
- e5cd265a improve watch configuration logging Add action associated to eac=
h managed path<br>
- d646d757 lint<br>
- 71237ef6 do not resolve cache dir until remote resource is in use<br>
- 0d905a89 add a copyright notice with original author<br>
- b847c7f5 implement runtime file selection<br>
- 5e3d8f67 re-implement cache folder detection<br>
- 67279088 introduce --resolve-image-digests for publish to seal service im=
ages by digest<br>
- 5661fd1b Merge pull request #11149 from aevesdocker/ENGDOCS-1764<br>
- 4cd61957 fix build<br>
- 0d4cbbdb fix<br>
- 9631a49d ENGDOCS-1764<br>
- 328ca3f2 add docs upstream validation workflow<br>
- e1bbfc63 build(deps): bump <a href=3D"http://go.uber.org/goleak" rel=3D"n=
oreferrer" target=3D"_blank">go.uber.org/goleak</a> from 1.2.1 to 1.3.0<br>
- 616bba0a linter errors fixed<br>
- ee6e3c2a NetworkList to NetworkInspect for ID search<br>
- c7e31a3c Squashing feature branch commits in order to add signoff message=
.<br>
- 704a9fd3 Use project.ServiceNames() if no service specified in hash<br>
- d9e0e42d Add branch configuration for pull_request trigger<br>
- c48e3c4a Initial codeql.yml commit<br>
- dd0803db fix SIGTERM support to stop/kill stack<br>
- 39008c53 align with OCI artifact best practices<br>
- 6ab41d62 Merge pull request #11060 from Juneezee/refactor/redundant-len-c=
heck<br>
- 6c345b37 refactor(cmd/compose/run): remove redundant `len` check<br>
- b8773ad1 Merge pull request #11110 from ndeloof/wait_missing<br>
- 1ffa194e fail start if depependency is missing<br>
- b9298101 check that the pull policy provided is a valid one or is not mis=
sing when --pull is used<br>
- af87f106 Merge pull request #11108 from ndeloof/down-services<br>
- 5e1d3f2b Merge pull request #11051 from ndeloof/warn_remote_disabled<br>
- 3d0207eb remove uncessary return value of pullComposeFiles function<br>
- 16a7c209 enable profile when down is ran with explicit service names<br>
- 818bc3c3 add sync+restart action to watch attribute<br>
- cf3e686d Merge pull request #11078 from docker/dependabot/go_modules/<a h=
ref=3D"http://github.com/containerd/containerd-1.7.7" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/containerd/containerd-1.7.7</a><br>
- 38bc6d5d build(deps): bump <a href=3D"http://github.com/containerd/contai=
nerd" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/containerd=
</a> from 1.7.6 to 1.7.7<br>
- 4a2d4c44 Merge pull request #11083 from docker/dependabot/go_modules/<a h=
ref=3D"http://github.com/google/go-cmp-0.6.0" rel=3D"noreferrer" target=3D"=
_blank">github.com/google/go-cmp-0.6.0</a><br>
- 0b6ce6ee build(deps): bump <a href=3D"http://github.com/google/go-cmp" re=
l=3D"noreferrer" target=3D"_blank">github.com/google/go-cmp</a> from 0.5.9 =
to 0.6.0<br>
- 034458da Merge pull request #11105 from docker/dependabot/go_modules/<a h=
ref=3D"http://google.golang.org/grpc-1.59.0" rel=3D"noreferrer" target=3D"_=
blank">google.golang.org/grpc-1.59.0</a><br>
- ae16bbbf build(deps): bump <a href=3D"http://google.golang.org/grpc" rel=
=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> from 1.58.2 to=
 1.59.0<br>
- eb5f01ba Merge pull request #11068 from docker/dependabot/go_modules/<a h=
ref=3D"http://golang.org/x/sync-0.4.0" rel=3D"noreferrer" target=3D"_blank"=
>golang.org/x/sync-0.4.0</a><br>
- d13ad1f9 build(deps): bump <a href=3D"http://golang.org/x/sync" rel=3D"no=
referrer" target=3D"_blank">golang.org/x/sync</a> from 0.3.0 to 0.4.0<br>
- 9b4d577c remove refrecence docs generation<br>
- b30978fb Merge pull request #11076 from glours/remove-cucumber<br>
- 14b43c1a remove cucumber tests as we haven&#39;t added new ones for a whi=
le<br>
- 9dd081b9 add support of COMPOSE_ENV_FILES env variable to pass a list of =
env files<br>
- 2c0b0232 add dry-run support for publish command<br>
- 599e4b24 extract method to reduce cyclomatic complexity<br>
- fe8c2780 warn user remote resource is disabled<br>
- a345515f Don&#39;t delete dependent services<br>
- 8967df7a Apply platform before hashing<br>
- 4f694919 deps: remove deprecated <a href=3D"http://github.com/pkg/errors"=
 rel=3D"noreferrer" target=3D"_blank">github.com/pkg/errors</a><br>
- 6ecab957 Include image name in error message<br>
- 12e0ac89 pkg/compose/publish: use empty config descriptor mediaType<br>
- a6b7d785 pkg/remote/oci: check artifactType instead of config.mediaType<b=
r>
- 991901f2 pkg/remote/oci: refer to the manifest as manifest<br>
- bd74a926 Merge pull request #11047 from glours/update-watch-warning-secti=
on<br>
- 2d971fc9 update the watch warning message when no services with a develop=
 section<br>
- 78f33619 ci: enable verbose output for e2e tests (#11045)<br>
- 44d21280 truncate command by default, introduce --no-trunc flag to get th=
e full command<br>
- cd743d17 Merge pull request #11036 from docker/dependabot/go_modules/<a h=
ref=3D"http://google.golang.org/grpc-1.58.2" rel=3D"noreferrer" target=3D"_=
blank">google.golang.org/grpc-1.58.2</a><br>
- ff2ff18c build(deps): bump <a href=3D"http://google.golang.org/grpc" rel=
=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> from 1.58.1 to=
 1.58.2<br>
- bd32ed14 Merge pull request #11025 from ndeloof/SkipResolveEnvironment<br=
>
- ab81db5b config --xx don&#39;t need `env_file` being parsed<br>
- 52a641bf Merge pull request #11021 from glours/move-watch-to-main-cmd<br>
- 75f5c07d Merge pull request #11023 from glours/fix-watch-e2e-test-cleanup=
<br>
- 61c8be11 remove --timeout=3D0 flag to cleanup function of watch e2e test =
compose down command need the watch process to be killed to succeed<br>
- 6be5f300 move watch from alpha to main command<br>
- 421a6b05 Merge pull request #11031 from ndeloof/TestWatch<br>
- c34c306c TestWatch to use new=C2=A0 `develop` section<br>
- 5ca35c88 implement publish<br>
- 805541be watch: use official `develop` section (#11026)<br>
- d322ad91 Merge pull request #11027 from docker/dependabot/go_modules/<a h=
ref=3D"http://github.com/opencontainers/image-spec-1.1.0-rc5" rel=3D"norefe=
rrer" target=3D"_blank">github.com/opencontainers/image-spec-1.1.0-rc5</a><=
br>
- 8f489d6d build(deps): bump <a href=3D"http://github.com/opencontainers/im=
age-spec" rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers/im=
age-spec</a><br>
- a214a715 Merge pull request #11017 from docker/dependabot/go_modules/<a h=
ref=3D"http://github.com/moby/buildkit-0.12.2" rel=3D"noreferrer" target=3D=
"_blank">github.com/moby/buildkit-0.12.2</a><br>
- 9ea8fbc6 build(deps): bump <a href=3D"http://github.com/moby/buildkit" re=
l=3D"noreferrer" target=3D"_blank">github.com/moby/buildkit</a> from 0.12.1=
 to 0.12.2<br>
- 062fa755 Merge pull request #11020 from docker/dependabot/go_modules/gote=
st.tools/v3-3.5.1<br>
- 76f150e4 build(deps): bump gotest.tools/v3 from 3.5.0 to 3.5.1<br>
- d45d943e Merge pull request #11019 from docker/dependabot/go_modules/<a h=
ref=3D"http://google.golang.org/grpc-1.58.1" rel=3D"noreferrer" target=3D"_=
blank">google.golang.org/grpc-1.58.1</a><br>
- f447c809 build(deps): bump <a href=3D"http://google.golang.org/grpc" rel=
=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> from 1.58.0 to=
 1.58.1<br>
- 722796ca Merge pull request #11016 from docker/dependabot/go_modules/<a h=
ref=3D"http://github.com/containerd/containerd-1.7.6" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/containerd/containerd-1.7.6</a><br>
- 4587d4ba build(deps): bump <a href=3D"http://github.com/containerd/contai=
nerd" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/containerd=
</a> from 1.7.3 to 1.7.6<br>
- a697a069 introduce pull --missing flag to only pull images not present in=
 cache<br>
- 8af49ff3 resolve service reference into container based on observed state=
<br>
- f6e31dbc don&#39;t rely on depends_on to resolve volume_from, better use =
observed state<br>
- e19232e8 Merge pull request #11000 from thaJeztah/update_golang_1.21.1<br=
>
- 6d5eb6fd update to go1.21.1<br>
- 9d7e0ad6 correct scale error messages formatting<br>
- 1a98a70b add scale command<br>
- 19bbb12f ci: tweak restricted imports in linter (#10992)<br>
- 7a134578 deps: upgrade Moby to v24.0.6 and gRPC to v1.58.0 (#10991)<br>
- 13115468 cli: fix `--build` flag for `create` (#10982)<br>
- e1aa4f77 otel: add args &amp; flags to cli traces (#10974)<br>
- d7b0b2bd watch: build &amp; launch the project at start (#10957)<br>
- e0f39ebb pull OCI remote resource<br>
- c9d54f09 introduce publish (alpha) command<br>
- aeb835a5 Merge pull request #10966 from kumarlokesh/patch-1<br>
- 52e54ef9 doc: updated README.md to remove broken link<br>
- 203bce88 Merge pull request #10954 from thaJeztah/swap_reference<br>
- f4f2e934 migrate to <a href=3D"http://github.com/distribution/reference" =
rel=3D"noreferrer" target=3D"_blank">github.com/distribution/reference</a><=
br>
- 32c3d0a3 Enable service explicitly requested to be restarted<br>
- 1fdbcb62 build: pass BuildOptions around explicitly &amp; fix multi-platf=
orm issues<br>
- 407a0d5b up: fix various race/deadlock conditions on exit (#10934)<br>
- d0dfb848 Merge pull request #10953 from thaJeztah/drop_uuid<br>
- 8caa6f1f pkg/api: replace uuid for basic random id<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0.../docker-compose/<a href=3D"http://docker-compose_git.bb" rel=3D"no=
referrer" target=3D"_blank">docker-compose_git.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
=C2=A0.../docker-compose/files/modules.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 119 +++---<br>
=C2=A0.../docker-compose/relocation.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 38 +-<br>
=C2=A0recipes-containers/docker-compose/src_uri.inc | 348 +++++++----------=
-<br>
=C2=A04 files changed, 182 insertions(+), 327 deletions(-)<br>
<br>
diff --git a/recipes-containers/docker-compose/<a href=3D"http://docker-com=
pose_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a>=
 b/recipes-containers/docker-compose/<a href=3D"http://docker-compose_git.b=
b" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a><br>
index b7745f2..8154cc5 100644<br>
--- a/recipes-containers/docker-compose/<a href=3D"http://docker-compose_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a><br>
+++ b/recipes-containers/docker-compose/<a href=3D"http://docker-compose_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a><br>
@@ -9,7 +9,7 @@ DEPENDS =3D &quot; \<br>
<br>
=C2=A0# Specify the first two important SRCREVs as the format<br>
=C2=A0SRCREV_FORMAT=3D&quot;compose_survey&quot;<br>
-SRCREV_compose =3D &quot;d6f842b042d2f2926901305336527b3eaadf067a&quot;<br=
>
+SRCREV_compose =3D &quot;c665c53cc1eb633a819fcaa9b47d77597b55d0eb&quot;<br=
>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/docker/compose;n=
ame=3Dcompose;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">github.com/docker/compose;name=3Dcompose;branch=3Dmain;protocol=3Dh=
ttps</a>&quot;<br>
<br>
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=
=3D175792518e4ac015ab6696d16c4f60<br>
<br>
=C2=A0GO_IMPORT =3D &quot;import&quot;<br>
<br>
-PV =3D &quot;v2.21.0&quot;<br>
+PV =3D &quot;v2.23.3&quot;<br>
<br>
=C2=A0COMPOSE_PKG =3D &quot;<a href=3D"http://github.com/docker/compose/v2"=
 rel=3D"noreferrer" target=3D"_blank">github.com/docker/compose/v2</a>&quot=
;<br>
<br>
diff --git a/recipes-containers/docker-compose/files/modules.txt b/recipes-=
containers/docker-compose/files/modules.txt<br>
index d287d12..c8219da 100644<br>
--- a/recipes-containers/docker-compose/files/modules.txt<br>
+++ b/recipes-containers/docker-compose/files/modules.txt<br>
@@ -2,27 +2,25 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/Microsoft/go-winio" rel=3D"noreferrer"=
 target=3D"_blank">github.com/Microsoft/go-winio</a> v0.6.1<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/adrg/xdg" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/adrg/xdg</a> v0.4.0<br>
-## explicit<br>
=C2=A0# <a href=3D"http://github.com/buger/goterm" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/buger/goterm</a> v1.0.4<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/compose-spec/compose-go" rel=3D"noreferrer"=
 target=3D"_blank">github.com/compose-spec/compose-go</a> v1.18.3<br>
+# <a href=3D"http://github.com/compose-spec/compose-go" rel=3D"noreferrer"=
 target=3D"_blank">github.com/compose-spec/compose-go</a> v1.20.2<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/containerd/console" rel=3D"noreferrer"=
 target=3D"_blank">github.com/containerd/console</a> v1.0.3<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/containerd/containerd" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/containerd/containerd</a> v1.7.3<br>
+# <a href=3D"http://github.com/containerd/containerd" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/containerd/containerd</a> v1.7.7<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/cucumber/godog" rel=3D"noreferrer" target=
=3D"_blank">github.com/cucumber/godog</a> v0.0.0-00010101000000-00000000000=
0<br>
+# <a href=3D"http://github.com/davecgh/go-spew" rel=3D"noreferrer" target=
=3D"_blank">github.com/davecgh/go-spew</a> v1.1.1<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/distribution/distribution/v3" rel=3D"norefe=
rrer" target=3D"_blank">github.com/distribution/distribution/v3</a> v3.0.0-=
20230601133803-97b1d649c493<br>
+# <a href=3D"http://github.com/distribution/reference" rel=3D"noreferrer" =
target=3D"_blank">github.com/distribution/reference</a> v0.5.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/docker/buildx" rel=3D"noreferrer" target=3D=
"_blank">github.com/docker/buildx</a> v0.11.2<br>
+# <a href=3D"http://github.com/docker/buildx" rel=3D"noreferrer" target=3D=
"_blank">github.com/docker/buildx</a> v0.12.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/docker/cli" rel=3D"noreferrer" target=3D"_b=
lank">github.com/docker/cli</a> v24.0.5+incompatible<br>
+# <a href=3D"http://github.com/docker/cli" rel=3D"noreferrer" target=3D"_b=
lank">github.com/docker/cli</a> v24.0.7+incompatible<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/docker/cli-docs-tool" rel=3D"noreferre=
r" target=3D"_blank">github.com/docker/cli-docs-tool</a> v0.6.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/docker/docker" rel=3D"noreferrer" target=3D=
"_blank">github.com/docker/docker</a> v24.0.5+incompatible<br>
+# <a href=3D"http://github.com/docker/docker" rel=3D"noreferrer" target=3D=
"_blank">github.com/docker/docker</a> v24.0.7+incompatible<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/docker/go-connections" rel=3D"noreferr=
er" target=3D"_blank">github.com/docker/go-connections</a> v0.4.0<br>
=C2=A0## explicit<br>
@@ -32,6 +30,8 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/golang/mock" rel=3D"noreferrer" target=
=3D"_blank">github.com/golang/mock</a> v1.6.0<br>
=C2=A0## explicit<br>
+# <a href=3D"http://github.com/google/go-cmp" rel=3D"noreferrer" target=3D=
"_blank">github.com/google/go-cmp</a> v0.6.0<br>
+## explicit<br>
=C2=A0# <a href=3D"http://github.com/hashicorp/go-multierror" rel=3D"norefe=
rrer" target=3D"_blank">github.com/hashicorp/go-multierror</a> v1.1.1<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/hashicorp/go-version" rel=3D"noreferre=
r" target=3D"_blank">github.com/hashicorp/go-version</a> v1.6.0<br>
@@ -42,7 +42,7 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/mitchellh/mapstructure" rel=3D"norefer=
rer" target=3D"_blank">github.com/mitchellh/mapstructure</a> v1.5.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/moby/buildkit" rel=3D"noreferrer" target=3D=
"_blank">github.com/moby/buildkit</a> v0.12.1<br>
+# <a href=3D"http://github.com/moby/buildkit" rel=3D"noreferrer" target=3D=
"_blank">github.com/moby/buildkit</a> v0.13.0-beta1.0.20231023114302-d5c1d7=
85b042<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/moby/patternmatcher" rel=3D"noreferrer=
" target=3D"_blank">github.com/moby/patternmatcher</a> v0.6.0<br>
=C2=A0## explicit<br>
@@ -52,13 +52,13 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/opencontainers/go-digest" rel=3D"noref=
errer" target=3D"_blank">github.com/opencontainers/go-digest</a> v1.0.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/opencontainers/image-spec" rel=3D"noreferre=
r" target=3D"_blank">github.com/opencontainers/image-spec</a> v1.1.0-rc4<br=
>
+# <a href=3D"http://github.com/opencontainers/image-spec" rel=3D"noreferre=
r" target=3D"_blank">github.com/opencontainers/image-spec</a> v1.1.0-rc5<br=
>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/pkg/errors" rel=3D"noreferrer" target=3D"_b=
lank">github.com/pkg/errors</a> v0.9.1<br>
+# <a href=3D"http://github.com/otiai10/copy" rel=3D"noreferrer" target=3D"=
_blank">github.com/otiai10/copy</a> v1.14.0<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/sirupsen/logrus" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/sirupsen/logrus</a> v1.9.3<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/spf13/cobra" rel=3D"noreferrer" target=3D"_=
blank">github.com/spf13/cobra</a> v1.7.0<br>
+# <a href=3D"http://github.com/spf13/cobra" rel=3D"noreferrer" target=3D"_=
blank">github.com/spf13/cobra</a> v1.8.0<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/spf13/pflag" rel=3D"noreferrer" target=
=3D"_blank">github.com/spf13/pflag</a> v1.0.5<br>
=C2=A0## explicit<br>
@@ -78,22 +78,26 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://go.opentelemetry.io/otel/trace" rel=3D"noreferrer=
" target=3D"_blank">go.opentelemetry.io/otel/trace</a> v1.14.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://go.uber.org/goleak" rel=3D"noreferrer" target=3D"_blan=
k">go.uber.org/goleak</a> v1.2.1<br>
+# <a href=3D"http://go.uber.org/goleak" rel=3D"noreferrer" target=3D"_blan=
k">go.uber.org/goleak</a> v1.3.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://golang.org/x/sync" rel=3D"noreferrer" target=3D"_blank=
">golang.org/x/sync</a> v0.3.0<br>
+# <a href=3D"http://golang.org/x/exp" rel=3D"noreferrer" target=3D"_blank"=
>golang.org/x/exp</a> v0.0.0-20230713183714-613f0c0eb8a1<br>
=C2=A0## explicit<br>
-# <a href=3D"http://google.golang.org/grpc" rel=3D"noreferrer" target=3D"_=
blank">google.golang.org/grpc</a> v1.57.0<br>
+# <a href=3D"http://golang.org/x/sync" rel=3D"noreferrer" target=3D"_blank=
">golang.org/x/sync</a> v0.5.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://gopkg.in/yaml.v2" rel=3D"noreferrer" target=3D"_blank"=
>gopkg.in/yaml.v2</a> v2.4.0<br>
+# <a href=3D"http://golang.org/x/sys" rel=3D"noreferrer" target=3D"_blank"=
>golang.org/x/sys</a> v0.14.0<br>
=C2=A0## explicit<br>
-# gotest.tools/v3 v3.5.0<br>
+# <a href=3D"http://google.golang.org/grpc" rel=3D"noreferrer" target=3D"_=
blank">google.golang.org/grpc</a> v1.59.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/AdaLogics/go-fuzz-headers" rel=3D"noreferre=
r" target=3D"_blank">github.com/AdaLogics/go-fuzz-headers</a> v0.0.0-202301=
06234847-43070de90fa1<br>
+# gotest.tools/v3 v3.5.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/AdaLogics/go-fuzz-headers" rel=3D"noreferre=
r" target=3D"_blank">github.com/AdaLogics/go-fuzz-headers</a> v0.0.0-202308=
11130428-ced1acdcaa24<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/Azure/go-ansiterm" rel=3D"noreferrer" =
target=3D"_blank">github.com/Azure/go-ansiterm</a> v0.0.0-20210617225240-d1=
85dfc1b5a1<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/Masterminds/semver/v3" rel=3D"noreferr=
er" target=3D"_blank">github.com/Masterminds/semver/v3</a> v3.2.1<br>
=C2=A0## explicit<br>
+# <a href=3D"http://github.com/Microsoft/hcsshim" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/Microsoft/hcsshim</a> v0.11.1<br>
+## explicit<br>
=C2=A0# <a href=3D"http://github.com/aws/aws-sdk-go-v2" rel=3D"noreferrer" =
target=3D"_blank">github.com/aws/aws-sdk-go-v2</a> v1.17.6<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/aws/aws-sdk-go-v2/config" rel=3D"noref=
errer" target=3D"_blank">github.com/aws/aws-sdk-go-v2/config</a> v1.18.16<b=
r>
@@ -120,26 +124,16 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/beorn7/perks" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/beorn7/perks</a> v1.0.1<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/bugsnag/bugsnag-go" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/bugsnag/bugsnag-go</a> v1.5.0<br>
-## explicit<br>
=C2=A0# <a href=3D"http://github.com/cenkalti/backoff/v4" rel=3D"noreferrer=
" target=3D"_blank">github.com/cenkalti/backoff/v4</a> v4.2.0<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/cespare/xxhash/v2" rel=3D"noreferrer" =
target=3D"_blank">github.com/cespare/xxhash/v2</a> v2.2.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/cloudflare/cfssl" rel=3D"noreferrer" target=
=3D"_blank">github.com/cloudflare/cfssl</a> v1.6.4<br>
+# <a href=3D"http://github.com/containerd/continuity" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/containerd/continuity</a> v0.4.2<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/containerd/continuity" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/containerd/continuity</a> v0.4.1<br>
+# <a href=3D"http://github.com/containerd/log" rel=3D"noreferrer" target=
=3D"_blank">github.com/containerd/log</a> v0.1.0<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/containerd/typeurl/v2" rel=3D"noreferr=
er" target=3D"_blank">github.com/containerd/typeurl/v2</a> v2.1.1<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/cucumber/gherkin-go/v19" rel=3D"noreferrer"=
 target=3D"_blank">github.com/cucumber/gherkin-go/v19</a> v19.0.3<br>
-## explicit<br>
-# <a href=3D"http://github.com/cucumber/messages-go/v16" rel=3D"noreferrer=
" target=3D"_blank">github.com/cucumber/messages-go/v16</a> v16.0.1<br>
-## explicit<br>
-# <a href=3D"http://github.com/cyphar/filepath-securejoin" rel=3D"noreferr=
er" target=3D"_blank">github.com/cyphar/filepath-securejoin</a> v0.2.3<br>
-## explicit<br>
-# <a href=3D"http://github.com/davecgh/go-spew" rel=3D"noreferrer" target=
=3D"_blank">github.com/davecgh/go-spew</a> v1.1.1<br>
-## explicit<br>
=C2=A0# <a href=3D"http://github.com/docker/distribution" rel=3D"noreferrer=
" target=3D"_blank">github.com/docker/distribution</a> v2.8.2+incompatible<=
br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/docker/docker-credential-helpers" rel=
=3D"noreferrer" target=3D"_blank">github.com/docker/docker-credential-helpe=
rs</a> v0.7.0<br>
@@ -166,8 +160,6 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/gofrs/flock" rel=3D"noreferrer" target=
=3D"_blank">github.com/gofrs/flock</a> v0.8.1<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/gofrs/uuid" rel=3D"noreferrer" target=3D"_b=
lank">github.com/gofrs/uuid</a> v4.2.0+incompatible<br>
-## explicit<br>
=C2=A0# <a href=3D"http://github.com/gogo/googleapis" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/gogo/googleapis</a> v1.4.1<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/gogo/protobuf" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/gogo/protobuf</a> v1.3.2<br>
@@ -176,8 +168,6 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/google/gnostic" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/google/gnostic</a> v0.5.7-v3refs<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/google/go-cmp" rel=3D"noreferrer" target=3D=
"_blank">github.com/google/go-cmp</a> v0.5.9<br>
-## explicit<br>
=C2=A0# <a href=3D"http://github.com/google/gofuzz" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/google/gofuzz</a> v1.2.0<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/google/shlex" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/google/shlex</a> v0.0.0-20191202100458-e7afc7fbc510=
<br>
@@ -190,13 +180,7 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/hashicorp/errwrap" rel=3D"noreferrer" =
target=3D"_blank">github.com/hashicorp/errwrap</a> v1.1.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/hashicorp/go-immutable-radix" rel=3D"norefe=
rrer" target=3D"_blank">github.com/hashicorp/go-immutable-radix</a> v1.3.1<=
br>
-## explicit<br>
-# <a href=3D"http://github.com/hashicorp/go-memdb" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/hashicorp/go-memdb</a> v1.3.2<br>
-## explicit<br>
-# <a href=3D"http://github.com/hashicorp/golang-lru" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/hashicorp/golang-lru</a> v0.5.4<br>
-## explicit<br>
-# <a href=3D"http://github.com/hashicorp/hcl" rel=3D"noreferrer" target=3D=
"_blank">github.com/hashicorp/hcl</a> v1.0.0<br>
+# <a href=3D"http://github.com/hashicorp/go-cleanhttp" rel=3D"noreferrer" =
target=3D"_blank">github.com/hashicorp/go-cleanhttp</a> v0.5.2<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/imdario/mergo" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/imdario/mergo</a> v0.3.16<br>
=C2=A0## explicit<br>
@@ -204,8 +188,6 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/inconshreveable/mousetrap" rel=3D"nore=
ferrer" target=3D"_blank">github.com/inconshreveable/mousetrap</a> v1.1.0<b=
r>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/jinzhu/gorm" rel=3D"noreferrer" target=3D"_=
blank">github.com/jinzhu/gorm</a> v1.9.11<br>
-## explicit<br>
=C2=A0# <a href=3D"http://github.com/josharian/intern" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/josharian/intern</a> v1.0.0<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/json-iterator/go" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/json-iterator/go</a> v1.1.12<br>
@@ -214,10 +196,6 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/klauspost/compress" rel=3D"noreferrer"=
 target=3D"_blank">github.com/klauspost/compress</a> v1.16.5<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/kr/pretty" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/kr/pretty</a> v0.3.0<br>
-## explicit<br>
-# <a href=3D"http://github.com/magiconair/properties" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/magiconair/properties</a> v1.8.6<br>
-## explicit<br>
=C2=A0# <a href=3D"http://github.com/mailru/easyjson" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/mailru/easyjson</a> v0.7.6<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/mattn/go-colorable" rel=3D"noreferrer"=
 target=3D"_blank">github.com/mattn/go-colorable</a> v0.1.13<br>
@@ -250,11 +228,11 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/munnerz/goautoneg" rel=3D"noreferrer" =
target=3D"_blank">github.com/munnerz/goautoneg</a> v0.0.0-20191010083416-a7=
dc8b61c822<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/opencontainers/runc" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/opencontainers/runc</a> v1.1.7<br>
+# <a href=3D"http://github.com/opencontainers/runc" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/opencontainers/runc</a> v1.1.9<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/pelletier/go-toml" rel=3D"noreferrer" =
target=3D"_blank">github.com/pelletier/go-toml</a> v1.9.5<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/pelletier/go-toml/v2" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/pelletier/go-toml/v2</a> v2.0.5<br>
+# <a href=3D"http://github.com/pkg/errors" rel=3D"noreferrer" target=3D"_b=
lank">github.com/pkg/errors</a> v0.9.1<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/pmezard/go-difflib" rel=3D"noreferrer"=
 target=3D"_blank">github.com/pmezard/go-difflib</a> v1.0.0<br>
=C2=A0## explicit<br>
@@ -274,14 +252,6 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/shibumi/go-pathspec" rel=3D"noreferrer=
" target=3D"_blank">github.com/shibumi/go-pathspec</a> v1.3.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/spf13/afero" rel=3D"noreferrer" target=3D"_=
blank">github.com/spf13/afero</a> v1.9.2<br>
-## explicit<br>
-# <a href=3D"http://github.com/spf13/cast" rel=3D"noreferrer" target=3D"_b=
lank">github.com/spf13/cast</a> v1.5.0<br>
-## explicit<br>
-# <a href=3D"http://github.com/spf13/jwalterweatherman" rel=3D"noreferrer"=
 target=3D"_blank">github.com/spf13/jwalterweatherman</a> v1.1.0<br>
-## explicit<br>
-# <a href=3D"http://github.com/subosito/gotenv" rel=3D"noreferrer" target=
=3D"_blank">github.com/subosito/gotenv</a> v1.4.1<br>
-## explicit<br>
=C2=A0# <a href=3D"http://github.com/tonistiigi/fsutil" rel=3D"noreferrer" =
target=3D"_blank">github.com/tonistiigi/fsutil</a> v0.0.0-20230629203738-36=
ef4d8c0dbb<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/tonistiigi/units" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/tonistiigi/units</a> v0.0.0-20180711220420-6950=
e57a87ea<br>
@@ -294,8 +264,6 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://github.com/xeipuuv/gojsonschema" rel=3D"noreferre=
r" target=3D"_blank">github.com/xeipuuv/gojsonschema</a> v1.2.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/zmap/zcrypto" rel=3D"noreferrer" target=3D"=
_blank">github.com/zmap/zcrypto</a> v0.0.0-20220605182715-4dfcec6e9a8c<br>
-## explicit<br>
=C2=A0# <a href=3D"http://go.opentelemetry.io/contrib/instrumentation/googl=
e.golang.org/grpc/otelgrpc" rel=3D"noreferrer" target=3D"_blank">go.opentel=
emetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc</a> v0.40=
.0<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://go.opentelemetry.io/contrib/instrumentation/net/h=
ttp/httptrace/otelhttptrace" rel=3D"noreferrer" target=3D"_blank">go.opente=
lemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace</a> v0.=
40.0<br>
@@ -310,21 +278,17 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://go.opentelemetry.io/proto/otlp" rel=3D"noreferrer=
" target=3D"_blank">go.opentelemetry.io/proto/otlp</a> v0.19.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://golang.org/x/crypto" rel=3D"noreferrer" target=3D"_bla=
nk">golang.org/x/crypto</a> v0.7.0<br>
-## explicit<br>
-# <a href=3D"http://golang.org/x/exp" rel=3D"noreferrer" target=3D"_blank"=
>golang.org/x/exp</a> v0.0.0-20230713183714-613f0c0eb8a1<br>
+# <a href=3D"http://golang.org/x/crypto" rel=3D"noreferrer" target=3D"_bla=
nk">golang.org/x/crypto</a> v0.14.0<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://golang.org/x/mod" rel=3D"noreferrer" target=3D"_b=
lank">golang.org/x/mod</a> v0.11.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://golang.org/x/net" rel=3D"noreferrer" target=3D"_blank"=
>golang.org/x/net</a> v0.9.0<br>
+# <a href=3D"http://golang.org/x/net" rel=3D"noreferrer" target=3D"_blank"=
>golang.org/x/net</a> v0.17.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://golang.org/x/oauth2" rel=3D"noreferrer" target=3D"_bla=
nk">golang.org/x/oauth2</a> v0.7.0<br>
+# <a href=3D"http://golang.org/x/oauth2" rel=3D"noreferrer" target=3D"_bla=
nk">golang.org/x/oauth2</a> v0.11.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://golang.org/x/sys" rel=3D"noreferrer" target=3D"_blank"=
>golang.org/x/sys</a> v0.7.0<br>
+# <a href=3D"http://golang.org/x/term" rel=3D"noreferrer" target=3D"_blank=
">golang.org/x/term</a> v0.13.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://golang.org/x/term" rel=3D"noreferrer" target=3D"_blank=
">golang.org/x/term</a> v0.7.0<br>
-## explicit<br>
-# <a href=3D"http://golang.org/x/text" rel=3D"noreferrer" target=3D"_blank=
">golang.org/x/text</a> v0.9.0<br>
+# <a href=3D"http://golang.org/x/text" rel=3D"noreferrer" target=3D"_blank=
">golang.org/x/text</a> v0.13.0<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://golang.org/x/time" rel=3D"noreferrer" target=3D"_=
blank">golang.org/x/time</a> v0.3.0<br>
=C2=A0## explicit<br>
@@ -332,25 +296,25 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://google.golang.org/appengine" rel=3D"noreferrer" t=
arget=3D"_blank">google.golang.org/appengine</a> v1.6.7<br>
=C2=A0## explicit<br>
-# <a href=3D"http://google.golang.org/genproto" rel=3D"noreferrer" target=
=3D"_blank">google.golang.org/genproto</a> v0.0.0-20230526161137-0005af68ea=
54<br>
+# <a href=3D"http://google.golang.org/genproto" rel=3D"noreferrer" target=
=3D"_blank">google.golang.org/genproto</a> v0.0.0-20230822172742-b8732ec382=
0d<br>
=C2=A0## explicit<br>
-# <a href=3D"http://google.golang.org/genproto/googleapis/api" rel=3D"nore=
ferrer" target=3D"_blank">google.golang.org/genproto/googleapis/api</a> v0.=
0.0-20230525234035-dd9d682886f9<br>
+# <a href=3D"http://google.golang.org/genproto/googleapis/api" rel=3D"nore=
ferrer" target=3D"_blank">google.golang.org/genproto/googleapis/api</a> v0.=
0.0-20230822172742-b8732ec3820d<br>
=C2=A0## explicit<br>
-# <a href=3D"http://google.golang.org/genproto/googleapis/rpc" rel=3D"nore=
ferrer" target=3D"_blank">google.golang.org/genproto/googleapis/rpc</a> v0.=
0.0-20230525234030-28d5490b6b19<br>
+# <a href=3D"http://google.golang.org/genproto/googleapis/rpc" rel=3D"nore=
ferrer" target=3D"_blank">google.golang.org/genproto/googleapis/rpc</a> v0.=
0.0-20230822172742-b8732ec3820d<br>
=C2=A0## explicit<br>
-# <a href=3D"http://google.golang.org/protobuf" rel=3D"noreferrer" target=
=3D"_blank">google.golang.org/protobuf</a> v1.30.0<br>
+# <a href=3D"http://google.golang.org/protobuf" rel=3D"noreferrer" target=
=3D"_blank">google.golang.org/protobuf</a> v1.31.0<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://gopkg.in/inf.v0" rel=3D"noreferrer" target=3D"_bl=
ank">gopkg.in/inf.v0</a> v0.9.1<br>
=C2=A0## explicit<br>
-# <a href=3D"http://gopkg.in/ini.v1" rel=3D"noreferrer" target=3D"_blank">=
gopkg.in/ini.v1</a> v1.67.0<br>
+# <a href=3D"http://gopkg.in/yaml.v2" rel=3D"noreferrer" target=3D"_blank"=
>gopkg.in/yaml.v2</a> v2.4.0<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://gopkg.in/yaml.v3" rel=3D"noreferrer" target=3D"_b=
lank">gopkg.in/yaml.v3</a> v3.0.1<br>
=C2=A0## explicit<br>
-# <a href=3D"http://k8s.io/api" rel=3D"noreferrer" target=3D"_blank">k8s.i=
o/api</a> v0.26.2<br>
+# <a href=3D"http://k8s.io/api" rel=3D"noreferrer" target=3D"_blank">k8s.i=
o/api</a> v0.26.7<br>
=C2=A0## explicit<br>
-# <a href=3D"http://k8s.io/apimachinery" rel=3D"noreferrer" target=3D"_bla=
nk">k8s.io/apimachinery</a> v0.26.2<br>
+# <a href=3D"http://k8s.io/apimachinery" rel=3D"noreferrer" target=3D"_bla=
nk">k8s.io/apimachinery</a> v0.26.7<br>
=C2=A0## explicit<br>
-# <a href=3D"http://k8s.io/client-go" rel=3D"noreferrer" target=3D"_blank"=
>k8s.io/client-go</a> v0.26.2<br>
+# <a href=3D"http://k8s.io/client-go" rel=3D"noreferrer" target=3D"_blank"=
>k8s.io/client-go</a> v0.26.7<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://k8s.io/klog/v2" rel=3D"noreferrer" target=3D"_bla=
nk">k8s.io/klog/v2</a> v2.90.1<br>
=C2=A0## explicit<br>
@@ -364,4 +328,3 @@<br>
=C2=A0## explicit<br>
=C2=A0# <a href=3D"http://sigs.k8s.io/yaml" rel=3D"noreferrer" target=3D"_b=
lank">sigs.k8s.io/yaml</a> v1.3.0<br>
=C2=A0## explicit<br>
-# <a href=3D"http://github.com/cucumber/godog" rel=3D"noreferrer" target=
=3D"_blank">github.com/cucumber/godog</a> =3D&gt; <a href=3D"http://github.=
com/laurazard/godog" rel=3D"noreferrer" target=3D"_blank">github.com/lauraz=
ard/godog</a> v0.0.0-20220922095256-4c4b17abdae7<br>
diff --git a/recipes-containers/docker-compose/relocation.inc b/recipes-con=
tainers/docker-compose/relocation.inc<br>
index 9e6eacf..daa5be2 100644<br>
--- a/recipes-containers/docker-compose/relocation.inc<br>
+++ b/recipes-containers/docker-compose/relocation.inc<br>
@@ -3,12 +3,11 @@ export sites=3D&quot;<a href=3D"http://k8s.io/api:k8s.io/=
api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.io/api:force=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://k8s.io/klog/v2:=
k8s.io/klog/v2:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/klog/v2:k=
8s.io/klog/v2:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gotest.tools/v3:gotest.tools/v3:f=
orce \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://gopkg.in/inf.v0=
:gopkg.in/inf.v0:force" rel=3D"noreferrer" target=3D"_blank">gopkg.in/inf.v=
0:gopkg.in/inf.v0:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/ini.v1=
:gopkg.in/ini.v1:force" rel=3D"noreferrer" target=3D"_blank">gopkg.in/ini.v=
1:gopkg.in/ini.v1:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/yaml.v=
2:gopkg.in/yaml.v2:force" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yam=
l.v2:gopkg.in/yaml.v2:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/x/ex=
p:golang.org/x/exp:force" rel=3D"noreferrer" target=3D"_blank">golang.org/x=
/exp:golang.org/x/exp:force</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/sy=
s:golang.org/x/sys:force" rel=3D"noreferrer" target=3D"_blank">golang.org/x=
/sys:golang.org/x/sys:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/x/mo=
d:golang.org/x/mod:force" rel=3D"noreferrer" target=3D"_blank">golang.org/x=
/mod:golang.org/x/mod:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/x/ne=
t:golang.org/x/net:force" rel=3D"noreferrer" target=3D"_blank">golang.org/x=
/net:golang.org/x/net:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/sy=
s:golang.org/x/sys:force" rel=3D"noreferrer" target=3D"_blank">golang.org/x=
/sys:golang.org/x/sys:force</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/yaml.v=
2:gopkg.in/yaml.v2:force" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yam=
l.v2:gopkg.in/yaml.v2:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://gopkg.in/yaml.v=
3:gopkg.in/yaml.v3:force" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yam=
l.v3:gopkg.in/yaml.v3:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://k8s.io/client-g=
o:k8s.io/client-go:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/clien=
t-go:k8s.io/client-go:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://sigs.k8s.io/jso=
n:sigs.k8s.io/json:force" rel=3D"noreferrer" target=3D"_blank">sigs.k8s.io/=
json:sigs.k8s.io/json:force</a> \<br>
@@ -19,63 +18,54 @@ export sites=3D&quot;<a href=3D"http://k8s.io/api:k8s.i=
o/api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.io/api:for=
ce</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/x/ti=
me:golang.org/x/time:force" rel=3D"noreferrer" target=3D"_blank">golang.org=
/x/time:golang.org/x/time:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://go.uber.org/gol=
eak:go.uber.org/goleak:force" rel=3D"noreferrer" target=3D"_blank">go.uber.=
org/goleak:go.uber.org/goleak:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/x/to=
ols:golang.org/x/tools:force" rel=3D"noreferrer" target=3D"_blank">golang.o=
rg/x/tools:golang.org/x/tools:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/adrg=
/xdg:github.com/adrg/xdg:force" rel=3D"noreferrer" target=3D"_blank">github=
.com/adrg/xdg:github.com/adrg/xdg:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/x/cr=
ypto:golang.org/x/crypto:force" rel=3D"noreferrer" target=3D"_blank">golang=
.org/x/crypto:golang.org/x/crypto:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/x/oa=
uth2:golang.org/x/oauth2:force" rel=3D"noreferrer" target=3D"_blank">golang=
.org/x/oauth2:golang.org/x/oauth2:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://k8s.io/apimachi=
nery:k8s.io/apimachinery:force" rel=3D"noreferrer" target=3D"_blank">k8s.io=
/apimachinery:k8s.io/apimachinery:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://k8s.io/kube-ope=
napi:k8s.io/kube-openapi:force" rel=3D"noreferrer" target=3D"_blank">k8s.io=
/kube-openapi:k8s.io/kube-openapi:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/moby=
/term:github.com/moby/term:force" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/moby/term:github.com/moby/term:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/dock=
er/go:github.com/docker/go:force" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/docker/go:github.com/docker/go:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/kr/p=
retty:github.com/kr/pretty:force" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/kr/pretty:github.com/kr/pretty:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/dock=
er/cli:github.com/docker/cli:force" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/docker/cli:github.com/docker/cli:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/pkg/=
errors:github.com/pkg/errors:force" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/pkg/errors:github.com/pkg/errors:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/gofr=
s/uuid:github.com/gofrs/uuid:force" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/gofrs/uuid:github.com/gofrs/uuid:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/mgut=
z/ansi:github.com/mgutz/ansi:force" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/mgutz/ansi:github.com/mgutz/ansi:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf1=
3/cast:github.com/spf13/cast:force" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/spf13/cast:github.com/spf13/cast:force</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/pkg/=
errors:github.com/pkg/errors:force" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/pkg/errors:github.com/pkg/errors:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/gola=
ng/mock:github.com/golang/mock:force" rel=3D"noreferrer" target=3D"_blank">=
github.com/golang/mock:github.com/golang/mock:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/spf1=
3/cobra:github.com/spf13/cobra:force" rel=3D"noreferrer" target=3D"_blank">=
github.com/spf13/cobra:github.com/spf13/cobra:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/spf1=
3/pflag:github.com/spf13/pflag:force" rel=3D"noreferrer" target=3D"_blank">=
github.com/spf13/pflag:github.com/spf13/pflag:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://google.golang.o=
rg/grpc:google.golang.org/grpc:force" rel=3D"noreferrer" target=3D"_blank">=
google.golang.org/grpc:google.golang.org/grpc:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/gofr=
s/flock:github.com/gofrs/flock:force" rel=3D"noreferrer" target=3D"_blank">=
github.com/gofrs/flock:github.com/gofrs/flock:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/gori=
lla/mux:github.com/gorilla/mux:force" rel=3D"noreferrer" target=3D"_blank">=
github.com/gorilla/mux:github.com/gorilla/mux:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/jinz=
hu/gorm:github.com/jinzhu/gorm:force" rel=3D"noreferrer" target=3D"_blank">=
github.com/jinzhu/gorm:github.com/jinzhu/gorm:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/moby=
/locker:github.com/moby/locker:force" rel=3D"noreferrer" target=3D"_blank">=
github.com/moby/locker:github.com/moby/locker:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/rivo=
/uniseg:github.com/rivo/uniseg:force" rel=3D"noreferrer" target=3D"_blank">=
github.com/rivo/uniseg:github.com/rivo/uniseg:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf1=
3/afero:github.com/spf13/afero:force" rel=3D"noreferrer" target=3D"_blank">=
github.com/spf13/afero:github.com/spf13/afero:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/buge=
r/goterm:github.com/buger/goterm:force" rel=3D"noreferrer" target=3D"_blank=
">github.com/buger/goterm:github.com/buger/goterm:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/mori=
kuni/aec:github.com/morikuni/aec:force" rel=3D"noreferrer" target=3D"_blank=
">github.com/morikuni/aec:github.com/morikuni/aec:force</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/otia=
i10/copy:github.com/otiai10/copy:force" rel=3D"noreferrer" target=3D"_blank=
">github.com/otiai10/copy:github.com/otiai10/copy:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/beor=
n7/perks:github.com/beorn7/perks:force" rel=3D"noreferrer" target=3D"_blank=
">github.com/beorn7/perks:github.com/beorn7/perks:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/go-l=
ogr/logr:github.com/go-logr/logr:force" rel=3D"noreferrer" target=3D"_blank=
">github.com/go-logr/logr:github.com/go-logr/logr:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/go-l=
ogr/stdr:github.com/go-logr/stdr:force" rel=3D"noreferrer" target=3D"_blank=
">github.com/go-logr/stdr:github.com/go-logr/stdr:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/goog=
le/shlex:github.com/google/shlex:force" rel=3D"noreferrer" target=3D"_blank=
">github.com/google/shlex:github.com/google/shlex:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/miek=
g/pkcs11:github.com/miekg/pkcs11:force" rel=3D"noreferrer" target=3D"_blank=
">github.com/miekg/pkcs11:github.com/miekg/pkcs11:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/zmap=
/zcrypto:github.com/zmap/zcrypto:force" rel=3D"noreferrer" target=3D"_blank=
">github.com/zmap/zcrypto:github.com/zmap/zcrypto:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/dock=
er/buildx:github.com/docker/buildx:force" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/docker/buildx:github.com/docker/buildx:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/dock=
er/docker:github.com/docker/docker:force" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/docker/docker:github.com/docker/docker:force</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/goog=
le/go-cmp:github.com/google/go-cmp:force" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/google/go-cmp:github.com/google/go-cmp:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/moby=
/buildkit:github.com/moby/buildkit:force" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/moby/buildkit:github.com/moby/buildkit:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://go.opentelemetr=
y.io/otel:go.opentelemetry.io/otel:force" rel=3D"noreferrer" target=3D"_bla=
nk">go.opentelemetry.io/otel:go.opentelemetry.io/otel:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/aws/=
smithy-go:github.com/aws/smithy-go:force" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/aws/smithy-go:github.com/aws/smithy-go:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/gogo=
/protobuf:github.com/gogo/protobuf:force" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/gogo/protobuf:github.com/gogo/protobuf:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/goog=
le/go-cmp:github.com/google/go-cmp:force" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/google/go-cmp:github.com/google/go-cmp:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/goog=
le/gofuzz:github.com/google/gofuzz:force" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/google/gofuzz:github.com/google/gofuzz:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hash=
icorp/hcl:github.com/hashicorp/hcl:force" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/hashicorp/hcl:github.com/hashicorp/hcl:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/imda=
rio/mergo:github.com/imdario/mergo:force" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/imdario/mergo:github.com/imdario/mergo:force</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cont=
ainerd/log:github.com/containerd/log:force" rel=3D"noreferrer" target=3D"_b=
lank">github.com/containerd/log:github.com/containerd/log:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/goog=
le/gnostic:github.com/google/gnostic:force" rel=3D"noreferrer" target=3D"_b=
lank">github.com/google/gnostic:github.com/google/gnostic:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cucu=
mber/godog:github.com/laurazard/godog:force" rel=3D"noreferrer" target=3D"_=
blank">github.com/cucumber/godog:github.com/laurazard/godog:force</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/dave=
cgh/go-spew:github.com/davecgh/go-spew:force" rel=3D"noreferrer" target=3D"=
_blank">github.com/davecgh/go-spew:github.com/davecgh/go-spew:force</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/dock=
er/go-units:github.com/docker/go-units:force" rel=3D"noreferrer" target=3D"=
_blank">github.com/docker/go-units:github.com/docker/go-units:force</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/siru=
psen/logrus:github.com/sirupsen/logrus:force" rel=3D"noreferrer" target=3D"=
_blank">github.com/sirupsen/logrus:github.com/sirupsen/logrus:force</a> \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/dave=
cgh/go-spew:github.com/davecgh/go-spew:force" rel=3D"noreferrer" target=3D"=
_blank">github.com/davecgh/go-spew:github.com/davecgh/go-spew:force</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/go-o=
penapi/swag:github.com/go-openapi/swag:force" rel=3D"noreferrer" target=3D"=
_blank">github.com/go-openapi/swag:github.com/go-openapi/swag:force</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/gogo=
/googleapis:github.com/gogo/googleapis:force" rel=3D"noreferrer" target=3D"=
_blank">github.com/gogo/googleapis:github.com/gogo/googleapis:force</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/gola=
ng/protobuf:github.com/golang/protobuf:force" rel=3D"noreferrer" target=3D"=
_blank">github.com/golang/protobuf:github.com/golang/protobuf:force</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/mail=
ru/easyjson:github.com/mailru/easyjson:force" rel=3D"noreferrer" target=3D"=
_blank">github.com/mailru/easyjson:github.com/mailru/easyjson:force</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/matt=
n/go-isatty:github.com/mattn/go-isatty:force" rel=3D"noreferrer" target=3D"=
_blank">github.com/mattn/go-isatty:github.com/mattn/go-isatty:force</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/moby=
/spdystream:github.com/moby/spdystream:force" rel=3D"noreferrer" target=3D"=
_blank">github.com/moby/spdystream:github.com/moby/spdystream:force</a> \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/subo=
sito/gotenv:github.com/subosito/gotenv:force" rel=3D"noreferrer" target=3D"=
_blank">github.com/subosito/gotenv:github.com/subosito/gotenv:force</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://google.golang.o=
rg/genproto:google.golang.org/genproto:force" rel=3D"noreferrer" target=3D"=
_blank">google.golang.org/genproto:google.golang.org/genproto:force</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://google.golang.o=
rg/protobuf:google.golang.org/protobuf:force" rel=3D"noreferrer" target=3D"=
_blank">google.golang.org/protobuf:google.golang.org/protobuf:force</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/stre=
tchr/testify:github.com/stretchr/testify:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/stretchr/testify:github.com/stretchr/testify:force</=
a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/clou=
dflare/cfssl:github.com/cloudflare/cfssl:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/cloudflare/cfssl:github.com/cloudflare/cfssl:force</=
a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/josh=
arian/intern:github.com/josharian/intern:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/josharian/intern:github.com/josharian/intern:force</=
a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/json=
-iterator/go:github.com/json-iterator/go:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/json-iterator/go:github.com/json-iterator/go:force</=
a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/seri=
alx/hashring:github.com/serialx/hashring:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/serialx/hashring:github.com/serialx/hashring:force</=
a> \<br>
@@ -85,6 +75,7 @@ export sites=3D&quot;<a href=3D"http://k8s.io/api:k8s.io/=
api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.io/api:force=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/fsno=
tify/fsevents:github.com/fsnotify/fsevents:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/fsnotify/fsevents:github.com/fsnotify/fsevents:force=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/tilt=
-dev/fsnotify:github.com/tilt-dev/fsnotify:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/tilt-dev/fsnotify:github.com/tilt-dev/fsnotify:force=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/Azur=
e/go-ansiterm:github.com/Azure/go-ansiterm:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm:force=
</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/Micr=
osoft/hcsshim:github.com/Microsoft/hcsshim:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/Microsoft/hcsshim:github.com/Microsoft/hcsshim:force=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/aws/=
aws-sdk-go-v2:github.com/aws/aws-sdk-go-v2:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/aws/aws-sdk-go-v2:github.com/aws/aws-sdk-go-v2:force=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/cesp=
are/xxhash/v2:github.com/cespare/xxhash/v2:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2:force=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/dock=
er/go-metrics:github.com/docker/go-metrics:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/docker/go-metrics:github.com/docker/go-metrics:force=
</a> \<br>
@@ -97,9 +88,7 @@ export sites=3D&quot;<a href=3D"http://k8s.io/api:k8s.io/=
api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.io/api:force=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/toni=
stiigi/fsutil:github.com/tonistiigi/fsutil:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/tonistiigi/fsutil:github.com/tonistiigi/fsutil:force=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/Micr=
osoft/go-winio:github.com/Microsoft/go-winio:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/Microsoft/go-winio:github.com/Microsoft/go-winio:f=
orce</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/cont=
ainerd/console:github.com/containerd/console:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/containerd/console:github.com/containerd/console:f=
orce</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/bugs=
nag/bugsnag-go:github.com/bugsnag/bugsnag-go:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/bugsnag/bugsnag-go:github.com/bugsnag/bugsnag-go:f=
orce</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/fvbo=
mmel/sortorder:github.com/fvbommel/sortorder:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/fvbommel/sortorder:github.com/fvbommel/sortorder:f=
orce</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hash=
icorp/go-memdb:github.com/hashicorp/go-memdb:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/hashicorp/go-memdb:github.com/hashicorp/go-memdb:f=
orce</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/klau=
spost/compress:github.com/klauspost/compress:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/klauspost/compress:github.com/klauspost/compress:f=
orce</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/matt=
n/go-colorable:github.com/mattn/go-colorable:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/mattn/go-colorable:github.com/mattn/go-colorable:f=
orce</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/matt=
n/go-runewidth:github.com/mattn/go-runewidth:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/mattn/go-runewidth:github.com/mattn/go-runewidth:f=
orce</a> \<br>
@@ -116,10 +105,8 @@ export sites=3D&quot;<a href=3D"http://k8s.io/api:k8s.=
io/api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.io/api:fo=
rce</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/shib=
umi/go-pathspec:github.com/shibumi/go-pathspec:force" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/shibumi/go-pathspec:github.com/shibumi/go-pathsp=
ec:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/dock=
er/cli-docs-tool:github.com/docker/cli-docs-tool:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/docker/cli-docs-tool:github.com/docker/cli-doc=
s-tool:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/hash=
icorp/go-version:github.com/hashicorp/go-version:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/hashicorp/go-version:github.com/hashicorp/go-v=
ersion:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hash=
icorp/golang-lru:github.com/hashicorp/golang-lru:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/hashicorp/golang-lru:github.com/hashicorp/gola=
ng-lru:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/moby=
/sys/symlink:github.com/moby/sys/symlink/symlink:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/moby/sys/symlink:github.com/moby/sys/symlink/s=
ymlink:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/mode=
rn-go/concurrent:github.com/modern-go/concurrent:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/modern-go/concurrent:github.com/modern-go/conc=
urrent:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/pell=
etier/go-toml/v2:github.com/pelletier/go-toml/v2:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/pelletier/go-toml/v2:github.com/pelletier/go-t=
oml/v2:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/xeip=
uuv/gojsonschema:github.com/xeipuuv/gojsonschema:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/xeipuuv/gojsonschema:github.com/xeipuuv/gojson=
schema:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/Alec=
Aivazis/survey/v2:github.com/AlecAivazis/survey/v2:force" rel=3D"noreferrer=
" target=3D"_blank">github.com/AlecAivazis/survey/v2:github.com/AlecAivazis=
/survey/v2:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/cont=
ainerd/containerd:github.com/containerd/containerd:force" rel=3D"noreferrer=
" target=3D"_blank">github.com/containerd/containerd:github.com/containerd/=
containerd:force</a> \<br>
@@ -127,25 +114,23 @@ export sites=3D&quot;<a href=3D"http://k8s.io/api:k8s=
.io/api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.io/api:f=
orce</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/Mast=
erminds/semver/v3:github.com/Masterminds/semver/v3:force" rel=3D"noreferrer=
" target=3D"_blank">github.com/Masterminds/semver/v3:github.com/Masterminds=
/semver/v3:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/cont=
ainerd/continuity:github.com/containerd/continuity:force" rel=3D"noreferrer=
" target=3D"_blank">github.com/containerd/continuity:github.com/containerd/=
continuity:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/cont=
ainerd/typeurl/v2:github.com/containerd/typeurl/v2:force" rel=3D"noreferrer=
" target=3D"_blank">github.com/containerd/typeurl/v2:github.com/containerd/=
typeurl/v2:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/magi=
conair/properties:github.com/magiconair/properties:force" rel=3D"noreferrer=
" target=3D"_blank">github.com/magiconair/properties:github.com/magiconair/=
properties:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/xeip=
uuv/gojsonpointer:github.com/xeipuuv/gojsonpointer:force" rel=3D"noreferrer=
" target=3D"_blank">github.com/xeipuuv/gojsonpointer:github.com/xeipuuv/goj=
sonpointer:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://go.opentelemetr=
y.io/proto/otlp:go.opentelemetry.io/proto/otlp/otlp:force" rel=3D"noreferre=
r" target=3D"_blank">go.opentelemetry.io/proto/otlp:go.opentelemetry.io/pro=
to/otlp/otlp:force</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/dist=
ribution/reference:github.com/distribution/reference:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/distribution/reference:github.com/distribu=
tion/reference:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/mitc=
hellh/mapstructure:github.com/mitchellh/mapstructure:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/mitchellh/mapstructure:github.com/mitchell=
h/mapstructure:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://go.opentelemetr=
y.io/otel/trace:go.opentelemetry.io/otel/trace/trace:force" rel=3D"noreferr=
er" target=3D"_blank">go.opentelemetry.io/otel/trace:go.opentelemetry.io/ot=
el/trace/trace:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/emic=
klei/go-restful/v3:github.com/emicklei/go-restful/v3:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/emicklei/go-restful/v3:github.com/emicklei=
/go-restful/v3:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/go-o=
penapi/jsonpointer:github.com/go-openapi/jsonpointer:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/go-openapi/jsonpointer:github.com/go-opena=
pi/jsonpointer:force</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hash=
icorp/go-cleanhttp:github.com/hashicorp/go-cleanhttp:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/hashicorp/go-cleanhttp:github.com/hashicor=
p/go-cleanhttp:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/in-t=
oto/in-toto-golang:github.com/in-toto/in-toto-golang:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/in-toto/in-toto-golang:github.com/in-toto/=
in-toto-golang:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/kbal=
lard/go-shellquote:github.com/kballard/go-shellquote:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/kballard/go-shellquote:github.com/kballard=
/go-shellquote:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/comp=
ose-spec/compose-go:github.com/compose-spec/compose-go:force" rel=3D"norefe=
rrer" target=3D"_blank">github.com/compose-spec/compose-go:github.com/compo=
se-spec/compose-go:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/hash=
icorp/go-multierror:github.com/hashicorp/go-multierror:force" rel=3D"norefe=
rrer" target=3D"_blank">github.com/hashicorp/go-multierror:github.com/hashi=
corp/go-multierror:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cucu=
mber/gherkin-go/v19:github.com/cucumber/gherkin-go/v19:force" rel=3D"norefe=
rrer" target=3D"_blank">github.com/cucumber/gherkin-go/v19:github.com/cucum=
ber/gherkin-go/v19:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/moby=
/sys/mountinfo:github.com/moby/sys/mountinfo/mountinfo:force" rel=3D"norefe=
rrer" target=3D"_blank">github.com/moby/sys/mountinfo:github.com/moby/sys/m=
ountinfo/mountinfo:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/prom=
etheus/client_model:github.com/prometheus/client_model:force" rel=3D"norefe=
rrer" target=3D"_blank">github.com/prometheus/client_model:github.com/prome=
theus/client_model:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf1=
3/jwalterweatherman:github.com/spf13/jwalterweatherman:force" rel=3D"norefe=
rrer" target=3D"_blank">github.com/spf13/jwalterweatherman:github.com/spf13=
/jwalterweatherman:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/xeip=
uuv/gojsonreference:github.com/xeipuuv/gojsonreference:force" rel=3D"norefe=
rrer" target=3D"_blank">github.com/xeipuuv/gojsonreference:github.com/xeipu=
uv/gojsonreference:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://go.opentelemetr=
y.io/otel/metric:go.opentelemetry.io/otel/metric/metric:force" rel=3D"noref=
errer" target=3D"_blank">go.opentelemetry.io/otel/metric:go.opentelemetry.i=
o/otel/metric/metric:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/open=
containers/go-digest:github.com/opencontainers/go-digest:force" rel=3D"nore=
ferrer" target=3D"_blank">github.com/opencontainers/go-digest:github.com/op=
encontainers/go-digest:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cucu=
mber/messages-go/v16:github.com/cucumber/messages-go/v16:force" rel=3D"nore=
ferrer" target=3D"_blank">github.com/cucumber/messages-go/v16:github.com/cu=
cumber/messages-go/v16:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/go-o=
penapi/jsonreference:github.com/go-openapi/jsonreference:force" rel=3D"nore=
ferrer" target=3D"_blank">github.com/go-openapi/jsonreference:github.com/go=
-openapi/jsonreference:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/prom=
etheus/client_golang:github.com/prometheus/client_golang:force" rel=3D"nore=
ferrer" target=3D"_blank">github.com/prometheus/client_golang:github.com/pr=
ometheus/client_golang:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/moby=
/sys/sequential:github.com/moby/sys/sequential/sequential:force" rel=3D"nor=
eferrer" target=3D"_blank">github.com/moby/sys/sequential:github.com/moby/s=
ys/sequential/sequential:force</a> \<br>
@@ -154,10 +139,7 @@ export sites=3D&quot;<a href=3D"http://k8s.io/api:k8s.=
io/api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.io/api:fo=
rce</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/AdaL=
ogics/go-fuzz-headers:github.com/AdaLogics/go-fuzz-headers:force" rel=3D"no=
referrer" target=3D"_blank">github.com/AdaLogics/go-fuzz-headers:github.com=
/AdaLogics/go-fuzz-headers:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/inco=
nshreveable/mousetrap:github.com/inconshreveable/mousetrap:force" rel=3D"no=
referrer" target=3D"_blank">github.com/inconshreveable/mousetrap:github.com=
/inconshreveable/mousetrap:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://sigs.k8s.io/str=
uctured-merge-diff/v4:sigs.k8s.io/structured-merge-diff/v4:force" rel=3D"no=
referrer" target=3D"_blank">sigs.k8s.io/structured-merge-diff/v4:sigs.k8s.i=
o/structured-merge-diff/v4:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cyph=
ar/filepath-securejoin:github.com/cyphar/filepath-securejoin:force" rel=3D"=
noreferrer" target=3D"_blank">github.com/cyphar/filepath-securejoin:github.=
com/cyphar/filepath-securejoin:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/aws/=
aws-sdk-go-v2/config:github.com/aws/aws-sdk-go-v2/config/config:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/aws/aws-sdk-go-v2/config:githu=
b.com/aws/aws-sdk-go-v2/config/config:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/dist=
ribution/distribution/v3:github.com/distribution/distribution/v3:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/distribution/distribution/v3:g=
ithub.com/distribution/distribution/v3:force</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hash=
icorp/go-immutable-radix:github.com/hashicorp/go-immutable-radix:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-immutable-radix:g=
ithub.com/hashicorp/go-immutable-radix:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/grpc=
-ecosystem/grpc-gateway/v2:github.com/grpc-ecosystem/grpc-gateway/v2:force"=
 rel=3D"noreferrer" target=3D"_blank">github.com/grpc-ecosystem/grpc-gatewa=
y/v2:github.com/grpc-ecosystem/grpc-gateway/v2:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/dock=
er/docker-credential-helpers:github.com/docker/docker-credential-helpers:fo=
rce" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker-credenti=
al-helpers:github.com/docker/docker-credential-helpers:force</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/grpc=
-ecosystem/go-grpc-middleware:github.com/grpc-ecosystem/go-grpc-middleware:=
force" rel=3D"noreferrer" target=3D"_blank">github.com/grpc-ecosystem/go-gr=
pc-middleware:github.com/grpc-ecosystem/go-grpc-middleware:force</a> \<br>
diff --git a/recipes-containers/docker-compose/src_uri.inc b/recipes-contai=
ners/docker-compose/src_uri.inc<br>
index 8897c9c..32a16b3 100644<br>
--- a/recipes-containers/docker-compose/src_uri.inc<br>
+++ b/recipes-containers/docker-compose/src_uri.inc<br>
@@ -1,6 +1,6 @@<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/api" rel=3D"noreferre=
r" target=3D"_blank">k8s.io/api</a> v0.26.2<br>
-# [1] git ls-remote <a href=3D"https://github.com/kubernetes/api" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/kubernetes/api</a> 1528256a=
bbdf8ff2510112b28a6aacd239789a36<br>
-SRCREV_k8s.io-api=3D&quot;1528256abbdf8ff2510112b28a6aacd239789a36&quot;<b=
r>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/api" rel=3D"noreferre=
r" target=3D"_blank">k8s.io/api</a> v0.26.7<br>
+# [1] git ls-remote <a href=3D"https://github.com/kubernetes/api" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/kubernetes/api</a> 145ce6cd=
aea22991c53ba9c7ee7aabae5181cb3e<br>
+SRCREV_k8s.io-api=3D&quot;145ce6cdaea22991c53ba9c7ee7aabae5181cb3e&quot;<b=
r>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kubernetes/api;=
name=3Dk8s.io-api;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/k8s.io/api" rel=3D"noreferrer" target=3D=
"_blank">github.com/kubernetes/api;name=3Dk8s.io-api;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/api</a=
>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/utils" rel=3D"no=
referrer" target=3D"_blank">k8s.io/utils</a> v0.0.0-20230220204549-a5ecb014=
1aa5<br>
@@ -13,54 +13,49 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/k=
ubernetes/utils;name=3Dutils;protocol=3Dhttps;nobranch" rel=3D"noreferrer" =
target=3D"_blank">github.com/kubernetes/utils;name=3Dutils;protocol=3Dhttps=
;nobranch</a><br>
=C2=A0SRCREV_klog-v2=3D&quot;d7fc50528570f8276de46570f916682257821e22&quot;=
<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kubernetes/klog=
;name=3Dklog-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$=
%7BBP%7D/src/import/vendor.fetch/k8s.io/klog/v2" rel=3D"noreferrer" target=
=3D"_blank">github.com/kubernetes/klog;name=3Dklog-v2;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/klog/=
v2</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0gotest.tools/v3 v3.5.0<br>
-# [1] git ls-remote <a href=3D"https://github.com/gotestyourself/gotest.to=
ols" rel=3D"noreferrer" target=3D"_blank">https://github.com/gotestyourself=
/gotest.tools</a> a80f057529047c44e1a85d0d017b200787e537e0<br>
-SRCREV_gotest.tools-v3=3D&quot;a80f057529047c44e1a85d0d017b200787e537e0&qu=
ot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/gotestyourself/gotes=
t.tools;name=3Dgotest.tools-v3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$=
%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gotest.tools/v3" rel=3D"nor=
eferrer" target=3D"_blank">github.com/gotestyourself/gotest.tools;name=3Dgo=
test.tools-v3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/s=
rc/import/vendor.fetch/gotest.tools/v3</a>&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0gotest.tools/v3 v3.5.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/gotestyourself/gotest.to=
ols" rel=3D"noreferrer" target=3D"_blank">https://github.com/gotestyourself=
/gotest.tools</a> 81cea1abc596b025bf2573c7fdf97740512e4c6c<br>
+SRCREV_v3=3D&quot;81cea1abc596b025bf2573c7fdf97740512e4c6c&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/gotestyourself/gotes=
t.tools;name=3Dv3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/gotest.tools/v3" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/gotestyourself/gotest.tools;name=3Dv3;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/got=
est.tools/v3</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/inf.v0" rel=3D=
"noreferrer" target=3D"_blank">gopkg.in/inf.v0</a> v0.9.1<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/go-inf/inf" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/go-inf/inf</a> d2d2541c53f=
18d2a059457998ce2876cc8e67cbf<br>
=C2=A0SRCREV_inf.v0=3D&quot;d2d2541c53f18d2a059457998ce2876cc8e67cbf&quot;<=
br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/go-inf/inf;name=
=3Dinf.v0;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/gopkg.in/inf.v0" rel=3D"noreferrer" target=3D"_b=
lank">github.com/go-inf/inf;name=3Dinf.v0;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/inf.v0</a>&quot=
;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/ini.v1" rel=3D"nore=
ferrer" target=3D"_blank">gopkg.in/ini.v1</a> v1.67.0<br>
-# [1] git ls-remote <a href=3D"https://github.com/go-ini/ini" rel=3D"noref=
errer" target=3D"_blank">https://github.com/go-ini/ini</a> b2f570e5b5b84422=
6bbefe6fb521d891f529a951<br>
-SRCREV_ini.v1=3D&quot;b2f570e5b5b844226bbefe6fb521d891f529a951&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/go-ini/ini;name=3Din=
i.v1;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/sr=
c/import/vendor.fetch/gopkg.in/ini.v1" rel=3D"noreferrer" target=3D"_blank"=
>github.com/go-ini/ini;name=3Dini.v1;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ini.v1</a>&quot;<br>
-<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/yaml.v2" rel=3D"nor=
eferrer" target=3D"_blank">gopkg.in/yaml.v2</a> v2.4.0<br>
-# [1] git ls-remote <a href=3D"https://github.com/go-yaml/yaml" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/go-yaml/yaml</a> 7649d4548cb5=
3a614db133b2a8ac1f31859dda8c<br>
-SRCREV_yaml.v2=3D&quot;7649d4548cb53a614db133b2a8ac1f31859dda8c&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/go-yaml/yaml;name=3D=
yaml.v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/gopkg.in/yaml.v2" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v2</a>&q=
uot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/exp" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/exp</a> v0.0.0-2023071318371=
4-613f0c0eb8a1<br>
=C2=A0# [1] git ls-remote <a href=3D"https://go.googlesource.com/exp" rel=
=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/exp</a> 613f0=
c0eb8a17a98ecdb096a7f9f7d5053c1c963<br>
=C2=A0SRCREV_exp=3D&quot;613f0c0eb8a17a98ecdb096a7f9f7d5053c1c963&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/exp;na=
me=3Dexp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7=
D/src/import/vendor.fetch/golang.org/x/exp" rel=3D"noreferrer" target=3D"_b=
lank">go.googlesource.com/exp;name=3Dexp;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/exp</a>&quot=
;<br>
<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/sys" rel=3D"nor=
eferrer" target=3D"_blank">golang.org/x/sys</a> v0.14.0<br>
+# [1] git ls-remote <a href=3D"https://go.googlesource.com/sys" rel=3D"nor=
eferrer" target=3D"_blank">https://go.googlesource.com/sys</a> cb378ae1ff8c=
d45e69d4f172df8370bc844e1f86<br>
+SRCREV_sys=3D&quot;cb378ae1ff8cd45e69d4f172df8370bc844e1f86&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;name=3D=
sys;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src=
/import/vendor.fetch/golang.org/x/sys" rel=3D"noreferrer" target=3D"_blank"=
>go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys</a>&quot;<br>
+<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/mod" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/mod</a> v0.11.0<br>
=C2=A0# [1] git ls-remote <a href=3D"https://go.googlesource.com/mod" rel=
=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/mod</a> 62c7e=
578f1a7275d934c99dd48715525bd52b17e<br>
=C2=A0SRCREV_mod=3D&quot;62c7e578f1a7275d934c99dd48715525bd52b17e&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/mod;na=
me=3Dmod;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7=
D/src/import/vendor.fetch/golang.org/x/mod" rel=3D"noreferrer" target=3D"_b=
lank">go.googlesource.com/mod;name=3Dmod;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/mod</a>&quot=
;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/net" rel=3D"nor=
eferrer" target=3D"_blank">golang.org/x/net</a> v0.9.0<br>
-# [1] git ls-remote <a href=3D"https://go.googlesource.com/net" rel=3D"nor=
eferrer" target=3D"_blank">https://go.googlesource.com/net</a> 694cff8668ba=
c64e0864b552bffc280cd27f21b1<br>
-SRCREV_net=3D&quot;694cff8668bac64e0864b552bffc280cd27f21b1&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/net" rel=3D"nor=
eferrer" target=3D"_blank">golang.org/x/net</a> v0.17.0<br>
+# [1] git ls-remote <a href=3D"https://go.googlesource.com/net" rel=3D"nor=
eferrer" target=3D"_blank">https://go.googlesource.com/net</a> b225e7ca6dde=
1ef5a5ae5ce922861bda011cfabd<br>
+SRCREV_net=3D&quot;b225e7ca6dde1ef5a5ae5ce922861bda011cfabd&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/net;na=
me=3Dnet;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7=
D/src/import/vendor.fetch/golang.org/x/net" rel=3D"noreferrer" target=3D"_b=
lank">go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/net</a>&quot=
;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/sys" rel=3D"nor=
eferrer" target=3D"_blank">golang.org/x/sys</a> v0.7.0<br>
-# [1] git ls-remote <a href=3D"https://go.googlesource.com/sys" rel=3D"nor=
eferrer" target=3D"_blank">https://go.googlesource.com/sys</a> 64840c112d23=
35ed9874114aed48f946e778a769<br>
-SRCREV_sys=3D&quot;64840c112d2335ed9874114aed48f946e778a769&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;name=3D=
sys;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src=
/import/vendor.fetch/golang.org/x/sys" rel=3D"noreferrer" target=3D"_blank"=
>go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys</a>&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/yaml.v2" rel=3D"nor=
eferrer" target=3D"_blank">gopkg.in/yaml.v2</a> v2.4.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/go-yaml/yaml" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/go-yaml/yaml</a> 7649d4548cb5=
3a614db133b2a8ac1f31859dda8c<br>
+SRCREV_yaml.v2=3D&quot;7649d4548cb53a614db133b2a8ac1f31859dda8c&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/go-yaml/yaml;name=3D=
yaml.v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/gopkg.in/yaml.v2" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v2</a>&q=
uot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/yaml.v3" rel=
=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v3</a> v3.0.1<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/go-yaml/yaml" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/go-yaml/yaml</a> f6f76=
91b1fdeb513f56608cd2c32c51f8194bf51<br>
=C2=A0SRCREV_yaml.v3=3D&quot;f6f7691b1fdeb513f56608cd2c32c51f8194bf51&quot;=
<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/go-yaml/yaml;na=
me=3Dyaml.v3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/gopkg.in/yaml.v3" rel=3D"noreferrer" target=
=3D"_blank">github.com/go-yaml/yaml;name=3Dyaml.v3;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v=
3</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/client-go" rel=3D"nor=
eferrer" target=3D"_blank">k8s.io/client-go</a> v0.26.2<br>
-# [1] git ls-remote <a href=3D"https://github.com/kubernetes/client-go" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/kubernetes/client-go<=
/a> 620cb60675340a9ca825fd5082b0d500f9b62e90<br>
-SRCREV_client-go=3D&quot;620cb60675340a9ca825fd5082b0d500f9b62e90&quot;<br=
>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/client-go" rel=3D"nor=
eferrer" target=3D"_blank">k8s.io/client-go</a> v0.26.7<br>
+# [1] git ls-remote <a href=3D"https://github.com/kubernetes/client-go" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/kubernetes/client-go<=
/a> 30088cdd7e8d70b3000586d4e9e42e50684359ca<br>
+SRCREV_client-go=3D&quot;30088cdd7e8d70b3000586d4e9e42e50684359ca&quot;<br=
>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kubernetes/clie=
nt-go;name=3Dclient-go;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKD=
IR%7D/$%7BBP%7D/src/import/vendor.fetch/k8s.io/client-go" rel=3D"noreferrer=
" target=3D"_blank">github.com/kubernetes/client-go;name=3Dclient-go;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/k8s.io/client-go</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://sigs.k8s.io/json" rel=
=3D"noreferrer" target=3D"_blank">sigs.k8s.io/json</a> v0.0.0-2022071315553=
7-f223a00ba0e2<br>
@@ -73,19 +68,19 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/k=
ubernetes-sigs/json;name=3Djson;protocol=3Dhttps;nobra" rel=3D"noreferrer" =
target=3D"_blank">github.com/kubernetes-sigs/json;name=3Djson;protocol=3Dht=
tps;nobra</a><br>
=C2=A0SRCREV_yaml=3D&quot;9535b3b1e2893fe44efb37c5c9f5665e245d786a&quot;<br=
>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kubernetes-sigs=
/yaml;name=3Dyaml;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/sigs.k8s.io/yaml" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/kubernetes-sigs/yaml;name=3Dyaml;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8=
s.io/yaml</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/sync" rel=3D"no=
referrer" target=3D"_blank">golang.org/x/sync</a> v0.3.0<br>
-# [1] git ls-remote <a href=3D"https://go.googlesource.com/sync" rel=3D"no=
referrer" target=3D"_blank">https://go.googlesource.com/sync</a> 93782cc822=
b6b554cb7df40332fd010f0473cbc8<br>
-SRCREV_sync=3D&quot;93782cc822b6b554cb7df40332fd010f0473cbc8&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/sync" rel=3D"no=
referrer" target=3D"_blank">golang.org/x/sync</a> v0.5.0<br>
+# [1] git ls-remote <a href=3D"https://go.googlesource.com/sync" rel=3D"no=
referrer" target=3D"_blank">https://go.googlesource.com/sync</a> 10739b037d=
369c748d671b216356d7e04ce68da1<br>
+SRCREV_sync=3D&quot;10739b037d369c748d671b216356d7e04ce68da1&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sync;n=
ame=3Dsync;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP=
%7D/src/import/vendor.fetch/golang.org/x/sync" rel=3D"noreferrer" target=3D=
"_blank">go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sync</a=
>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/term" rel=3D"no=
referrer" target=3D"_blank">golang.org/x/term</a> v0.7.0<br>
-# [1] git ls-remote <a href=3D"https://go.googlesource.com/term" rel=3D"no=
referrer" target=3D"_blank">https://go.googlesource.com/term</a> 7ae6be6d01=
50527c2c41e70586b9ade6a972a186<br>
-SRCREV_x-term=3D&quot;7ae6be6d0150527c2c41e70586b9ade6a972a186&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/term" rel=3D"no=
referrer" target=3D"_blank">golang.org/x/term</a> v0.13.0<br>
+# [1] git ls-remote <a href=3D"https://go.googlesource.com/term" rel=3D"no=
referrer" target=3D"_blank">https://go.googlesource.com/term</a> ea6303ae75=
2eaacd897fec4b7534b74c56e1d787<br>
+SRCREV_x-term=3D&quot;ea6303ae752eaacd897fec4b7534b74c56e1d787&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/term;n=
ame=3Dx-term;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/golang.org/x/term" rel=3D"noreferrer" target=
=3D"_blank">go.googlesource.com/term;name=3Dx-term;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/te=
rm</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/text" rel=3D"no=
referrer" target=3D"_blank">golang.org/x/text</a> v0.9.0<br>
-# [1] git ls-remote <a href=3D"https://go.googlesource.com/text" rel=3D"no=
referrer" target=3D"_blank">https://go.googlesource.com/text</a> 48e4a4a957=
429d31328a685863b594ca9a06b552<br>
-SRCREV_text=3D&quot;48e4a4a957429d31328a685863b594ca9a06b552&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/text" rel=3D"no=
referrer" target=3D"_blank">golang.org/x/text</a> v0.13.0<br>
+# [1] git ls-remote <a href=3D"https://go.googlesource.com/text" rel=3D"no=
referrer" target=3D"_blank">https://go.googlesource.com/text</a> f488e191e6=
7ed95a5b9b7b39024e5a5f5f1ffd02<br>
+SRCREV_text=3D&quot;f488e191e67ed95a5b9b7b39024e5a5f5f1ffd02&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/text;n=
ame=3Dtext;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP=
%7D/src/import/vendor.fetch/golang.org/x/text" rel=3D"noreferrer" target=3D=
"_blank">go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/text</a=
>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/time" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/time</a> v0.3.0<br>
@@ -93,9 +88,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesourc=
e.com/text;name=3Dtext;protocol=3Dhttps;nobranch=3D1;d" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;nob=
ranch=3D1;d</a><br>
=C2=A0SRCREV_time=3D&quot;2c09566ef13fb5556401ddff3c53c3dbc2a42dac&quot;<br=
>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/time;n=
ame=3Dtime;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP=
%7D/src/import/vendor.fetch/golang.org/x/time" rel=3D"noreferrer" target=3D=
"_blank">go.googlesource.com/time;name=3Dtime;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/time</a=
>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.uber.org/goleak" rel=3D"n=
oreferrer" target=3D"_blank">go.uber.org/goleak</a> v1.2.1<br>
-# [1] git ls-remote <a href=3D"https://github.com/uber-go/goleak" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/uber-go/goleak</a> 83c7e126=
390f1508ca9cb8e87d70849b55181104<br>
-SRCREV_goleak=3D&quot;83c7e126390f1508ca9cb8e87d70849b55181104&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.uber.org/goleak" rel=3D"n=
oreferrer" target=3D"_blank">go.uber.org/goleak</a> v1.3.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/uber-go/goleak" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/uber-go/goleak</a> 31095c65=
7c34bba405a8d480db27989aa5f60b9c<br>
+SRCREV_goleak=3D&quot;31095c657c34bba405a8d480db27989aa5f60b9c&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/uber-go/goleak;=
name=3Dgoleak;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7=
BBP%7D/src/import/vendor.fetch/go.uber.org/goleak" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/uber-go/goleak;name=3Dgoleak;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/g=
oleak</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/tools" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/tools</a> v0.7.0<br>
@@ -103,24 +98,19 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/=
uber-go/goleak;name=3Dgoleak;protocol=3Dhttps;nobranch=3D" rel=3D"noreferre=
r" target=3D"_blank">github.com/uber-go/goleak;name=3Dgoleak;protocol=3Dhtt=
ps;nobranch=3D</a><br>
=C2=A0SRCREV_tools=3D&quot;031fc75960d487b0b15db12fb328676236a3a39c&quot;<b=
r>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/tools;=
name=3Dtools;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/golang.org/x/tools" rel=3D"noreferrer" target=
=3D"_blank">go.googlesource.com/tools;name=3Dtools;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/to=
ols</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/adrg/xdg" rel=3D"=
noreferrer" target=3D"_blank">github.com/adrg/xdg</a> v0.4.0<br>
-# [1] git ls-remote <a href=3D"https://github.com/adrg/xdg" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/adrg/xdg</a> 4ec40e24f0cf1039f93c=
773f2984decdea9719b5<br>
-SRCREV_xdg=3D&quot;4ec40e24f0cf1039f93c773f2984decdea9719b5&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/adrg/xdg;name=3Dxdg;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/imp=
ort/vendor.fetch/github.com/adrg/xdg" rel=3D"noreferrer" target=3D"_blank">=
github.com/adrg/xdg;name=3Dxdg;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$=
{WORKDIR}/${BP}/src/import/vendor.fetch/github.com/adrg/xdg</a>&quot;<br>
-<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/crypto" rel=3D"=
noreferrer" target=3D"_blank">golang.org/x/crypto</a> v0.7.0<br>
-# [1] git ls-remote <a href=3D"https://go.googlesource.com/crypto" rel=3D"=
noreferrer" target=3D"_blank">https://go.googlesource.com/crypto</a> 776e46=
1a4e6d8b372a43c72122c5c28cfc40dca2<br>
-SRCREV_crypto=3D&quot;776e461a4e6d8b372a43c72122c5c28cfc40dca2&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/crypto" rel=3D"=
noreferrer" target=3D"_blank">golang.org/x/crypto</a> v0.14.0<br>
+# [1] git ls-remote <a href=3D"https://go.googlesource.com/crypto" rel=3D"=
noreferrer" target=3D"_blank">https://go.googlesource.com/crypto</a> e3cc52=
e598e302f8c613a645bb7231264d8ec995<br>
+SRCREV_crypto=3D&quot;e3cc52e598e302f8c613a645bb7231264d8ec995&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/crypto=
;name=3Dcrypto;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/golang.org/x/crypto" rel=3D"noreferrer" tar=
get=3D"_blank">go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org=
/x/crypto</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/oauth2" rel=3D"=
noreferrer" target=3D"_blank">golang.org/x/oauth2</a> v0.7.0<br>
-# [1] git ls-remote <a href=3D"https://go.googlesource.com/oauth2" rel=3D"=
noreferrer" target=3D"_blank">https://go.googlesource.com/oauth2</a> 360751=
49c5b89480def496c735b8a1ba5fc63218<br>
-SRCREV_oauth2=3D&quot;36075149c5b89480def496c735b8a1ba5fc63218&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/oauth2" rel=3D"=
noreferrer" target=3D"_blank">golang.org/x/oauth2</a> v0.11.0<br>
+# [1] git ls-remote <a href=3D"https://go.googlesource.com/oauth2" rel=3D"=
noreferrer" target=3D"_blank">https://go.googlesource.com/oauth2</a> 2e4a4e=
2bfb69ca7609cb423438c55caa131431c1<br>
+SRCREV_oauth2=3D&quot;2e4a4e2bfb69ca7609cb423438c55caa131431c1&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/oauth2=
;name=3Doauth2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/golang.org/x/oauth2" rel=3D"noreferrer" tar=
get=3D"_blank">go.googlesource.com/oauth2;name=3Doauth2;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org=
/x/oauth2</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/apimachinery" rel=3D"=
noreferrer" target=3D"_blank">k8s.io/apimachinery</a> v0.26.2<br>
-# [1] git ls-remote <a href=3D"https://github.com/kubernetes/apimachinery"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/kubernetes/apimach=
inery</a> 53ecdf01b997ca93c7db7615dfe7b27ad8391983<br>
-SRCREV_apimachinery=3D&quot;53ecdf01b997ca93c7db7615dfe7b27ad8391983&quot;=
<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/apimachinery" rel=3D"=
noreferrer" target=3D"_blank">k8s.io/apimachinery</a> v0.26.7<br>
+# [1] git ls-remote <a href=3D"https://github.com/kubernetes/apimachinery"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/kubernetes/apimach=
inery</a> dd46389197a396927dadb194ae5fc9dbebeb5a31<br>
+SRCREV_apimachinery=3D&quot;dd46389197a396927dadb194ae5fc9dbebeb5a31&quot;=
<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kubernetes/apim=
achinery;name=3Dapimachinery;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7=
BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/k8s.io/apimachinery" rel=3D"n=
oreferrer" target=3D"_blank">github.com/kubernetes/apimachinery;name=3Dapim=
achinery;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/im=
port/vendor.fetch/k8s.io/apimachinery</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/kube-openapi" re=
l=3D"noreferrer" target=3D"_blank">k8s.io/kube-openapi</a> v0.0.0-202210121=
53701-172d655c2280<br>
@@ -138,44 +128,29 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com=
/moby/term;name=3Dterm;protocol=3Dhttps;nobranch=3D1;dests" rel=3D"noreferr=
er" target=3D"_blank">github.com/moby/term;name=3Dterm;protocol=3Dhttps;nob=
ranch=3D1;dests</a><br>
=C2=A0SRCREV_go=3D&quot;d30aec9fd63c35133f8f79c3412ad91a3b08be06&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/docker/go;name=
=3Dgo;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/s=
rc/import/vendor.fetch/github.com/docker/go" rel=3D"noreferrer" target=3D"_=
blank">github.com/docker/go;name=3Dgo;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go</a>&quo=
t;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/kr/pretty" rel=3D=
"noreferrer" target=3D"_blank">github.com/kr/pretty</a> v0.3.0<br>
-# [1] git ls-remote <a href=3D"https://github.com/kr/pretty" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/kr/pretty</a> a883a8422cd235c67c=
6c4fdcb7bbb022143e10b1<br>
-SRCREV_pretty=3D&quot;a883a8422cd235c67c6c4fdcb7bbb022143e10b1&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kr/pretty;name=3Dpre=
tty;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src=
/import/vendor.fetch/github.com/kr/pretty" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/kr/pretty;name=3Dpretty;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kr/pretty</a>&q=
uot;<br>
-<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/cli" rel=
=3D"noreferrer" target=3D"_blank">github.com/docker/cli</a> v24.0.5+incompa=
tible<br>
-# [1] git ls-remote <a href=3D"https://github.com/docker/cli" rel=3D"noref=
errer" target=3D"_blank">https://github.com/docker/cli</a> ced099660009713e=
0e845eeb754e6050dbaa45d0<br>
-SRCREV_cli=3D&quot;ced099660009713e0e845eeb754e6050dbaa45d0&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/cli" rel=
=3D"noreferrer" target=3D"_blank">github.com/docker/cli</a> v24.0.7+incompa=
tible<br>
+# [1] git ls-remote <a href=3D"https://github.com/docker/cli" rel=3D"noref=
errer" target=3D"_blank">https://github.com/docker/cli</a> afdd53b4e341be38=
d2056a42113b938559bb1d94<br>
+SRCREV_cli=3D&quot;afdd53b4e341be38d2056a42113b938559bb1d94&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/docker/cli;name=
=3Dcli;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/=
src/import/vendor.fetch/github.com/docker/cli" rel=3D"noreferrer" target=3D=
"_blank">github.com/docker/cli;name=3Dcli;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/cli</a=
>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/pkg/errors" rel=
=3D"noreferrer" target=3D"_blank">github.com/pkg/errors</a> v0.9.1<br>
-# [1] git ls-remote <a href=3D"https://github.com/pkg/errors" rel=3D"noref=
errer" target=3D"_blank">https://github.com/pkg/errors</a> 614d223910a179a4=
66c1767a985424175c39b465<br>
-SRCREV_errors=3D&quot;614d223910a179a466c1767a985424175c39b465&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/pkg/errors;name=3Der=
rors;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/sr=
c/import/vendor.fetch/github.com/pkg/errors" rel=3D"noreferrer" target=3D"_=
blank">github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors</=
a>&quot;<br>
-<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/gofrs/uuid" rel=
=3D"noreferrer" target=3D"_blank">github.com/gofrs/uuid</a> v4.2.0+incompat=
ible<br>
-# [1] git ls-remote <a href=3D"https://github.com/gofrs/uuid" rel=3D"noref=
errer" target=3D"_blank">https://github.com/gofrs/uuid</a> 0c84a43ce25087b7=
041833685982950a65630d28<br>
-SRCREV_uuid=3D&quot;0c84a43ce25087b7041833685982950a65630d28&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/gofrs/uuid;name=3Duu=
id;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/=
import/vendor.fetch/github.com/gofrs/uuid" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/gofrs/uuid;name=3Duuid;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gofrs/uuid</a>&q=
uot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mgutz/ansi" =
rel=3D"noreferrer" target=3D"_blank">github.com/mgutz/ansi</a> v0.0.0-20170=
206155736-9520e82c474b<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/mgutz/ansi" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/mgutz/ansi</a> 9520e82c474=
b0a04dd04f8a40959027271bab992<br>
=C2=A0SRCREV_ansi=3D&quot;9520e82c474b0a04dd04f8a40959027271bab992&quot;<br=
>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/mgutz/ansi;name=
=3Dansi;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/github.com/mgutz/ansi" rel=3D"noreferrer" target=
=3D"_blank">github.com/mgutz/ansi;name=3Dansi;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mgutz/ans=
i</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf13/cast" rel=
=3D"noreferrer" target=3D"_blank">github.com/spf13/cast</a> v1.5.0<br>
-# [1] git ls-remote <a href=3D"https://github.com/spf13/cast" rel=3D"noref=
errer" target=3D"_blank">https://github.com/spf13/cast</a> 2b0eb0f724e320b6=
55240e331aef36d1175986c2<br>
-SRCREV_cast=3D&quot;2b0eb0f724e320b655240e331aef36d1175986c2&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/spf13/cast;name=3Dca=
st;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/=
import/vendor.fetch/github.com/spf13/cast" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/spf13/cast;name=3Dcast;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/cast</a>&q=
uot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/pkg/errors" rel=
=3D"noreferrer" target=3D"_blank">github.com/pkg/errors</a> v0.9.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/pkg/errors" rel=3D"noref=
errer" target=3D"_blank">https://github.com/pkg/errors</a> 614d223910a179a4=
66c1767a985424175c39b465<br>
+SRCREV_errors=3D&quot;614d223910a179a466c1767a985424175c39b465&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/pkg/errors;name=3Der=
rors;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/sr=
c/import/vendor.fetch/github.com/pkg/errors" rel=3D"noreferrer" target=3D"_=
blank">github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors</=
a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/golang/mock"=
 rel=3D"noreferrer" target=3D"_blank">github.com/golang/mock</a> v1.6.0<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/golang/mock" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/golang/mock</a> aba2ff9a6=
844d5e3289e8472d3217d5b3090f083<br>
=C2=A0SRCREV_mock=3D&quot;aba2ff9a6844d5e3289e8472d3217d5b3090f083&quot;<br=
>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/golang/mock;nam=
e=3Dmock;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7=
D/src/import/vendor.fetch/github.com/golang/mock" rel=3D"noreferrer" target=
=3D"_blank">github.com/golang/mock;name=3Dmock;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/m=
ock</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf13/cobra" rel=
=3D"noreferrer" target=3D"_blank">github.com/spf13/cobra</a> v1.7.0<br>
-# [1] git ls-remote <a href=3D"https://github.com/spf13/cobra" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/spf13/cobra</a> 4dd4b25de38418=
174a6e859e8a32eaccca32dccc<br>
-SRCREV_cobra=3D&quot;4dd4b25de38418174a6e859e8a32eaccca32dccc&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf13/cobra" rel=
=3D"noreferrer" target=3D"_blank">github.com/spf13/cobra</a> v1.8.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/spf13/cobra" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/spf13/cobra</a> a0a6ae020bb389=
9ff0276067863e50523f897370<br>
+SRCREV_cobra=3D&quot;a0a6ae020bb3899ff0276067863e50523f897370&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/spf13/cobra;nam=
e=3Dcobra;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/github.com/spf13/cobra" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13=
/cobra</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf13/pflag"=
 rel=3D"noreferrer" target=3D"_blank">github.com/spf13/pflag</a> v1.0.5<br>
@@ -183,9 +158,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/s=
pf13/cobra;name=3Dcobra;protocol=3Dhttps;nobranch=3D1;de" rel=3D"noreferrer=
" target=3D"_blank">github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps;no=
branch=3D1;de</a><br>
=C2=A0SRCREV_pflag=3D&quot;2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab&quot;<b=
r>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/spf13/pflag;nam=
e=3Dpflag;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/github.com/spf13/pflag" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/spf13/pflag;name=3Dpflag;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13=
/pflag</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/grpc" rel=
=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> v1.57.0<br>
-# [1] git ls-remote <a href=3D"https://github.com/grpc/grpc-go" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/grpc/grpc-go</a> 87bf02ad24f6=
cc071d2553eb5d62332194bba1fe<br>
-SRCREV_grpc=3D&quot;87bf02ad24f6cc071d2553eb5d62332194bba1fe&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/grpc" rel=
=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> v1.59.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/grpc/grpc-go" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/grpc/grpc-go</a> 7765221f4bf6=
104973db7946d56936cf838cad46<br>
+SRCREV_grpc=3D&quot;7765221f4bf6104973db7946d56936cf838cad46&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/grpc/grpc-go;na=
me=3Dgrpc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/google.golang.org/grpc" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.or=
g/grpc</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/gofrs/flock"=
 rel=3D"noreferrer" target=3D"_blank">github.com/gofrs/flock</a> v0.8.1<br>
@@ -198,11 +173,6 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/=
gofrs/flock;name=3Dflock;protocol=3Dhttps;nobranch=3D1;de" rel=3D"noreferre=
r" target=3D"_blank">github.com/gofrs/flock;name=3Dflock;protocol=3Dhttps;n=
obranch=3D1;de</a><br>
=C2=A0SRCREV_mux=3D&quot;98cb6bf42e086f6af920b965c38cacc07402d51b&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/gorilla/mux;nam=
e=3Dmux;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/github.com/gorilla/mux" rel=3D"noreferrer" target=
=3D"_blank">github.com/gorilla/mux;name=3Dmux;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gorilla/m=
ux</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/jinzhu/gorm" rel=
=3D"noreferrer" target=3D"_blank">github.com/jinzhu/gorm</a> v1.9.11<br>
-# [1] git ls-remote <a href=3D"https://github.com/jinzhu/gorm" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/jinzhu/gorm</a> 81c17a7e2529c5=
9efc4e74c5b32c1fb71fb12fa2<br>
-SRCREV_gorm=3D&quot;81c17a7e2529c59efc4e74c5b32c1fb71fb12fa2&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/jinzhu/gorm;name=3Dg=
orm;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src=
/import/vendor.fetch/github.com/jinzhu/gorm" rel=3D"noreferrer" target=3D"_=
blank">github.com/jinzhu/gorm;name=3Dgorm;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jinzhu/gorm</=
a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/moby/locker"=
 rel=3D"noreferrer" target=3D"_blank">github.com/moby/locker</a> v1.0.1<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/moby/locker" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/moby/locker</a> 281af2d56=
3954745bea9d1487c965f24d30742fe<br>
=C2=A0SRCREV_locker=3D&quot;281af2d563954745bea9d1487c965f24d30742fe&quot;<=
br>
@@ -213,11 +183,6 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/=
moby/locker;name=3Dlocker;protocol=3Dhttps;nobranch=3D1;d" rel=3D"noreferre=
r" target=3D"_blank">github.com/moby/locker;name=3Dlocker;protocol=3Dhttps;=
nobranch=3D1;d</a><br>
=C2=A0SRCREV_uniseg=3D&quot;75711fccf6a3e85bc74c241e2dddd06a9bc9e53d&quot;<=
br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/rivo/uniseg;nam=
e=3Duniseg;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP=
%7D/src/import/vendor.fetch/github.com/rivo/uniseg" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo=
/uniseg</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf13/afero" rel=
=3D"noreferrer" target=3D"_blank">github.com/spf13/afero</a> v1.9.2<br>
-# [1] git ls-remote <a href=3D"https://github.com/spf13/afero" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/spf13/afero</a> 2a70f2bb2db152=
4bf2aa3ca0cfebefa8d6367b7b<br>
-SRCREV_afero=3D&quot;2a70f2bb2db1524bf2aa3ca0cfebefa8d6367b7b&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/spf13/afero;name=3Da=
fero;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/sr=
c/import/vendor.fetch/github.com/spf13/afero" rel=3D"noreferrer" target=3D"=
_blank">github.com/spf13/afero;name=3Dafero;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/afero=
</a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/buger/goterm=
" rel=3D"noreferrer" target=3D"_blank">github.com/buger/goterm</a> v1.0.4<b=
r>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/buger/goterm" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/buger/goterm</a> a7354=
5aae7d693f786ce4cc687460efca4845f31<br>
=C2=A0SRCREV_goterm=3D&quot;a73545aae7d693f786ce4cc687460efca4845f31&quot;<=
br>
@@ -228,6 +193,11 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/=
buger/goterm;name=3Dgoterm;protocol=3Dhttps;nobranch=3D1" rel=3D"noreferrer=
" target=3D"_blank">github.com/buger/goterm;name=3Dgoterm;protocol=3Dhttps;=
nobranch=3D1</a>;<br>
=C2=A0SRCREV_aec=3D&quot;39771216ff4c63d11f5e604076f9c45e8be1067b&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/morikuni/aec;na=
me=3Daec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7=
D/src/import/vendor.fetch/github.com/morikuni/aec" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/morikuni/aec;name=3Daec;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/morik=
uni/aec</a>&quot;<br>
<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/otiai10/copy" rel=
=3D"noreferrer" target=3D"_blank">github.com/otiai10/copy</a> v1.14.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/otiai10/copy" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/otiai10/copy</a> fba066acb0eb=
6e25d510073787741c0a8b31bf1e<br>
+SRCREV_copy=3D&quot;fba066acb0eb6e25d510073787741c0a8b31bf1e&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/otiai10/copy;name=3D=
copy;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/sr=
c/import/vendor.fetch/github.com/otiai10/copy" rel=3D"noreferrer" target=3D=
"_blank">github.com/otiai10/copy;name=3Dcopy;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/otiai10/co=
py</a>&quot;<br>
+<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/beorn7/perks=
" rel=3D"noreferrer" target=3D"_blank">github.com/beorn7/perks</a> v1.0.1<b=
r>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/beorn7/perks" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/beorn7/perks</a> 37c8d=
e3658fcb183f997c4e13e8337516ab753e6<br>
=C2=A0SRCREV_perks=3D&quot;37c8de3658fcb183f997c4e13e8337516ab753e6&quot;<b=
r>
@@ -253,24 +223,24 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com=
/google/shlex;name=3Dshlex;protocol=3Dhttps;nobranch=3D1;d" rel=3D"noreferr=
er" target=3D"_blank">github.com/google/shlex;name=3Dshlex;protocol=3Dhttps=
;nobranch=3D1;d</a><br>
=C2=A0SRCREV_pkcs11=3D&quot;f3481918a208bd212aa995a41f92d786eb418a7d&quot;<=
br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/miekg/pkcs11;na=
me=3Dpkcs11;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BB=
P%7D/src/import/vendor.fetch/github.com/miekg/pkcs11" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/miekg/pkcs11;name=3Dpkcs11;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/m=
iekg/pkcs11</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/zmap/zcrypto" rel=
=3D"noreferrer" target=3D"_blank">github.com/zmap/zcrypto</a> v0.0.0-202206=
05182715-4dfcec6e9a8c<br>
-# [1] git ls-remote <a href=3D"https://github.com/zmap/zcrypto" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/zmap/zcrypto</a> 4dfcec6e9a8c=
2014f73dd584e64dc797129d77b8<br>
-SRCREV_zcrypto=3D&quot;4dfcec6e9a8c2014f73dd584e64dc797129d77b8&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/zmap/zcrypto;name=3D=
zcrypto;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/github.com/zmap/zcrypto" rel=3D"noreferrer" target=
=3D"_blank">github.com/zmap/zcrypto;name=3Dzcrypto;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/zmap=
/zcrypto</a>&quot;<br>
-<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/buildx" re=
l=3D"noreferrer" target=3D"_blank">github.com/docker/buildx</a> v0.11.2<br>
-# [1] git ls-remote <a href=3D"https://github.com/docker/buildx" rel=3D"no=
referrer" target=3D"_blank">https://github.com/docker/buildx</a> 9872040b66=
26fb7d87ef7296fd5b832e8cc2ad17<br>
-SRCREV_buildx=3D&quot;9872040b6626fb7d87ef7296fd5b832e8cc2ad17&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/buildx" re=
l=3D"noreferrer" target=3D"_blank">github.com/docker/buildx</a> v0.12.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/docker/buildx" rel=3D"no=
referrer" target=3D"_blank">https://github.com/docker/buildx</a> 542e5d810e=
4a1a155684f5f3c5bd7e797632a12f<br>
+SRCREV_buildx=3D&quot;542e5d810e4a1a155684f5f3c5bd7e797632a12f&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/docker/buildx;n=
ame=3Dbuildx;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/docker/buildx" rel=3D"noreferrer" =
target=3D"_blank">github.com/docker/buildx;name=3Dbuildx;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/docker/buildx</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/docker" re=
l=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v24.0.5+inc=
ompatible<br>
-# [1] git ls-remote <a href=3D"https://github.com/moby/moby" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/moby/moby</a> a61e2b4c9c5f7c241a=
eb37f389b4444aee26bea4<br>
-SRCREV_docker=3D&quot;a61e2b4c9c5f7c241aeb37f389b4444aee26bea4&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/docker" re=
l=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v24.0.7+inc=
ompatible<br>
+# [1] git ls-remote <a href=3D"https://github.com/moby/moby" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/moby/moby</a> 311b9ff0aa93aa5588=
0e1e5f8871c4fb69583426<br>
+SRCREV_docker=3D&quot;311b9ff0aa93aa55880e1e5f8871c4fb69583426&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/moby/moby;name=
=3Ddocker;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/github.com/docker/docker" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/moby/moby;name=3Ddocker;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docke=
r/docker</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/moby/buildkit" re=
l=3D"noreferrer" target=3D"_blank">github.com/moby/buildkit</a> v0.12.1<br>
-# [1] git ls-remote <a href=3D"https://github.com/moby/buildkit" rel=3D"no=
referrer" target=3D"_blank">https://github.com/moby/buildkit</a> bb857a0d49=
f45aa0ce9cd554b78d4075553e20f9<br>
-SRCREV_buildkit=3D&quot;bb857a0d49f45aa0ce9cd554b78d4075553e20f9&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/google/go-cmp" re=
l=3D"noreferrer" target=3D"_blank">github.com/google/go-cmp</a> v0.6.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/google/go-cmp" rel=3D"no=
referrer" target=3D"_blank">https://github.com/google/go-cmp</a> c3ad8435e7=
bef96af35732bc0789e5a2278c6d5f<br>
+SRCREV_go-cmp=3D&quot;c3ad8435e7bef96af35732bc0789e5a2278c6d5f&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google/go-cmp;name=
=3Dgo-cmp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/github.com/google/go-cmp" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/g=
oogle/go-cmp</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/moby/buildkit" re=
l=3D"noreferrer" target=3D"_blank">github.com/moby/buildkit</a> v0.13.0-bet=
a1.0.20231023114302-d5c1d785b042<br>
+# [1] git ls-remote <a href=3D"https://github.com/moby/buildkit" rel=3D"no=
referrer" target=3D"_blank">https://github.com/moby/buildkit</a> d5c1d785b0=
42cf834a05b08b73479d55b6acb533<br>
+SRCREV_buildkit=3D&quot;d5c1d785b042cf834a05b08b73479d55b6acb533&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/moby/buildkit;n=
ame=3Dbuildkit;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/github.com/moby/buildkit" rel=3D"noreferrer=
" target=3D"_blank">github.com/moby/buildkit;name=3Dbuildkit;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/moby/buildkit</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.opentelemetry.io/ote=
l" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel</a> v1.14.=
0<br>
@@ -288,35 +258,30 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com=
/aws/smithy-go;name=3Dsmithy-go;protocol=3Dhttps;nobranc" rel=3D"noreferrer=
" target=3D"_blank">github.com/aws/smithy-go;name=3Dsmithy-go;protocol=3Dht=
tps;nobranc</a><br>
=C2=A0SRCREV_protobuf=3D&quot;b03c65ea87cdc3521ede29f62fe3ce239267c1bc&quot=
;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/gogo/protobuf;n=
ame=3Dprotobuf;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/github.com/gogo/protobuf" rel=3D"noreferrer=
" target=3D"_blank">github.com/gogo/protobuf;name=3Dprotobuf;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/gogo/protobuf</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/google/go-cmp" re=
l=3D"noreferrer" target=3D"_blank">github.com/google/go-cmp</a> v0.5.9<br>
-# [1] git ls-remote <a href=3D"https://github.com/google/go-cmp" rel=3D"no=
referrer" target=3D"_blank">https://github.com/google/go-cmp</a> a97318bf65=
62f2ed2632c5f985db51b1bc5bdcd0<br>
-SRCREV_go-cmp=3D&quot;a97318bf6562f2ed2632c5f985db51b1bc5bdcd0&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google/go-cmp;name=
=3Dgo-cmp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/github.com/google/go-cmp" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/g=
oogle/go-cmp</a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/google/gofuz=
z" rel=3D"noreferrer" target=3D"_blank">github.com/google/gofuzz</a> v1.2.0=
<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/google/gofuzz" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/google/gofuzz</a> 379e=
164120fbc98885a8f494b5aa41ba94f64c56<br>
=C2=A0SRCREV_gofuzz=3D&quot;379e164120fbc98885a8f494b5aa41ba94f64c56&quot;<=
br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google/gofuzz;n=
ame=3Dgofuzz;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/google/gofuzz" rel=3D"noreferrer" =
target=3D"_blank">github.com/google/gofuzz;name=3Dgofuzz;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/google/gofuzz</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hashicorp/hcl" re=
l=3D"noreferrer" target=3D"_blank">github.com/hashicorp/hcl</a> v1.0.0<br>
-# [1] git ls-remote <a href=3D"https://github.com/hashicorp/hcl" rel=3D"no=
referrer" target=3D"_blank">https://github.com/hashicorp/hcl</a> 8cb6e5b959=
231cc1119e43259c4a608f9c51a241<br>
-SRCREV_hcl=3D&quot;8cb6e5b959231cc1119e43259c4a608f9c51a241&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/hcl;name=
=3Dhcl;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/=
src/import/vendor.fetch/github.com/hashicorp/hcl" rel=3D"noreferrer" target=
=3D"_blank">github.com/hashicorp/hcl;name=3Dhcl;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashi=
corp/hcl</a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/imdario/merg=
o" rel=3D"noreferrer" target=3D"_blank">github.com/imdario/mergo</a> v0.3.1=
6<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/darccio/mergo" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/darccio/mergo</a> 14fe=
2b165b83359196f820886a2b24f2771729e9<br>
=C2=A0SRCREV_mergo=3D&quot;14fe2b165b83359196f820886a2b24f2771729e9&quot;<b=
r>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/darccio/mergo;n=
ame=3Dmergo;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BB=
P%7D/src/import/vendor.fetch/github.com/imdario/mergo" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/darccio/mergo;name=3Dmergo;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
imdario/mergo</a>&quot;<br>
<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/containerd/log" r=
el=3D"noreferrer" target=3D"_blank">github.com/containerd/log</a> v0.1.0<br=
>
+# [1] git ls-remote <a href=3D"https://github.com/containerd/log" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/containerd/log</a> 0fc1e288=
71fdf2786e2cc51bbe4133db6547a199<br>
+SRCREV_log=3D&quot;0fc1e28871fdf2786e2cc51bbe4133db6547a199&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/containerd/log;name=
=3Dlog;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/=
src/import/vendor.fetch/github.com/containerd/log" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/containerd/log;name=3Dlog;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/conta=
inerd/log</a>&quot;<br>
+<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/google/gnost=
ic" rel=3D"noreferrer" target=3D"_blank">github.com/google/gnostic</a> v0.5=
.7-v3refs<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/google/gnostic" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/google/gnostic</a> b49=
832d97d25b6a41cbe34ea12257924a934eeee<br>
=C2=A0SRCREV_gnostic=3D&quot;b49832d97d25b6a41cbe34ea12257924a934eeee&quot;=
<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google/gnostic;=
name=3Dgnostic;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/github.com/google/gnostic" rel=3D"noreferre=
r" target=3D"_blank">github.com/google/gnostic;name=3Dgnostic;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/google/gnostic</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/laurazard/godog" =
rel=3D"noreferrer" target=3D"_blank">github.com/laurazard/godog</a> v0.0.0-=
20220922095256-4c4b17abdae7<br>
-# [1] git ls-remote <a href=3D"https://github.com/laurazard/godog" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/laurazard/godog</a> 4c4b17=
abdae7fd4f9d35cfe391ca65d172b092e3<br>
-SRCREV_godog=3D&quot;4c4b17abdae7fd4f9d35cfe391ca65d172b092e3&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/laurazard/godog;name=
=3Dgodog;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7=
D/src/import/vendor.fetch/github.com/laurazard/godog" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/laurazard/godog;name=3Dgodog;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/laurazard/godog</a>&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/davecgh/go-spew" =
rel=3D"noreferrer" target=3D"_blank">github.com/davecgh/go-spew</a> v1.1.1<=
br>
+# [1] git ls-remote <a href=3D"https://github.com/davecgh/go-spew" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/davecgh/go-spew</a> 8991bc=
29aa16c548c550c7ff78260e27b9ab7c73<br>
+SRCREV_go-spew=3D&quot;8991bc29aa16c548c550c7ff78260e27b9ab7c73&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/davecgh/go-spew;name=
=3Dgo-spew;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP=
%7D/src/import/vendor.fetch/github.com/davecgh/go-spew" rel=3D"noreferrer" =
target=3D"_blank">github.com/davecgh/go-spew;name=3Dgo-spew;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/davecgh/go-spew</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/go-un=
its" rel=3D"noreferrer" target=3D"_blank">github.com/docker/go-units</a> v0=
.5.0<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/docker/go-units" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/docker/go-units</a> e=
682442797b36348f8e1f98defdbf32bac0b6c6f<br>
@@ -328,11 +293,6 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/=
docker/go-units;name=3Dgo-units;protocol=3Dhttps;nobran" rel=3D"noreferrer"=
 target=3D"_blank">github.com/docker/go-units;name=3Dgo-units;protocol=3Dht=
tps;nobran</a><br>
=C2=A0SRCREV_logrus=3D&quot;d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd&quot;<=
br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/sirupsen/logrus=
;name=3Dlogrus;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/github.com/sirupsen/logrus" rel=3D"noreferr=
er" target=3D"_blank">github.com/sirupsen/logrus;name=3Dlogrus;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/sirupsen/logrus</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/davecgh/go-spew" =
rel=3D"noreferrer" target=3D"_blank">github.com/davecgh/go-spew</a> v1.1.1<=
br>
-# [1] git ls-remote <a href=3D"https://github.com/davecgh/go-spew" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/davecgh/go-spew</a> 8991bc=
29aa16c548c550c7ff78260e27b9ab7c73<br>
-SRCREV_go-spew=3D&quot;8991bc29aa16c548c550c7ff78260e27b9ab7c73&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/davecgh/go-spew;name=
=3Dgo-spew;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP=
%7D/src/import/vendor.fetch/github.com/davecgh/go-spew" rel=3D"noreferrer" =
target=3D"_blank">github.com/davecgh/go-spew;name=3Dgo-spew;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/davecgh/go-spew</a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/go-openapi/s=
wag" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/swag</a> v0=
.19.14<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/go-openapi/swag" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/go-openapi/swag</a> c=
78fa6719bc3d4b977d19a09064feda1c07571af<br>
=C2=A0SRCREV_swag=3D&quot;c78fa6719bc3d4b977d19a09064feda1c07571af&quot;<br=
>
@@ -368,19 +328,14 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com=
/moby/spdystream;name=3Dspdystream;protocol=3Dhttps;nobr" rel=3D"noreferrer=
" target=3D"_blank">github.com/moby/spdystream;name=3Dspdystream;protocol=
=3Dhttps;nobr</a><br>
=C2=A0SRCREV_signal=3D&quot;b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5&quot;<=
br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/moby/sys;name=
=3Dsignal;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/github.com/moby/sys/signal" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/moby/sys;name=3Dsignal;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby=
/sys/signal</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/subosito/gotenv" =
rel=3D"noreferrer" target=3D"_blank">github.com/subosito/gotenv</a> v1.4.1<=
br>
-# [1] git ls-remote <a href=3D"https://github.com/subosito/gotenv" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/subosito/gotenv</a> d94fdb=
e829d24b31d6ac30b6beb28b6420c1778a<br>
-SRCREV_gotenv=3D&quot;d94fdbe829d24b31d6ac30b6beb28b6420c1778a&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/subosito/gotenv;name=
=3Dgotenv;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/github.com/subosito/gotenv" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/subosito/gotenv;name=3Dgotenv;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/subosito/gotenv</a>&quot;<br>
-<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/genproto" =
rel=3D"noreferrer" target=3D"_blank">google.golang.org/genproto</a> v0.0.0-=
20230526161137-0005af68ea54<br>
-# [1] git ls-remote <a href=3D"https://github.com/googleapis/go-genproto" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/googleapis/go-genpr=
oto</a> 0005af68ea5476a8b99ce94ab83ae4aaac864963<br>
-SRCREV_genproto=3D&quot;0005af68ea5476a8b99ce94ab83ae4aaac864963&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/genproto" =
rel=3D"noreferrer" target=3D"_blank">google.golang.org/genproto</a> v0.0.0-=
20230822172742-b8732ec3820d<br>
+# [1] git ls-remote <a href=3D"https://github.com/googleapis/go-genproto" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/googleapis/go-genpr=
oto</a> b8732ec3820db4bd1e4eda89392b7728e81bd825<br>
+SRCREV_genproto=3D&quot;b8732ec3820db4bd1e4eda89392b7728e81bd825&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/googleapis/go-g=
enproto;name=3Dgenproto;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORK=
DIR%7D/$%7BBP%7D/src/import/vendor.fetch/google.golang.org/genproto" rel=3D=
"noreferrer" target=3D"_blank">github.com/googleapis/go-genproto;name=3Dgen=
proto;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impor=
t/vendor.fetch/google.golang.org/genproto</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/protobuf" =
rel=3D"noreferrer" target=3D"_blank">google.golang.org/protobuf</a> v1.30.0=
<br>
-# [1] git ls-remote <a href=3D"https://github.com/protocolbuffers/protobuf=
-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/protocolbuffer=
s/protobuf-go</a> f221882bfb484564f1714ae05f197dea2c76898d<br>
-SRCREV_google.golang.org-protobuf=3D&quot;f221882bfb484564f1714ae05f197dea=
2c76898d&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/protobuf" =
rel=3D"noreferrer" target=3D"_blank">google.golang.org/protobuf</a> v1.31.0=
<br>
+# [1] git ls-remote <a href=3D"https://github.com/protocolbuffers/protobuf=
-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/protocolbuffer=
s/protobuf-go</a> 68463f0e96c93bc19ef36ccd3adfe690bfdb568c<br>
+SRCREV_google.golang.org-protobuf=3D&quot;68463f0e96c93bc19ef36ccd3adfe690=
bfdb568c&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/protocolbuffers=
/protobuf-go;name=3Dgoogle.golang.org-protobuf;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/google.gola=
ng.org/protobuf" rel=3D"noreferrer" target=3D"_blank">github.com/protocolbu=
ffers/protobuf-go;name=3Dgoogle.golang.org-protobuf;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.=
org/protobuf</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/stretchr/tes=
tify" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/testify</a> =
v1.8.4<br>
@@ -388,11 +343,6 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/=
protocolbuffers/protobuf-go;name=3Dgoogle.golang.org-" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/protocolbuffers/protobuf-go;name=3Dgoogle.golan=
g.org-</a><br>
=C2=A0SRCREV_testify=3D&quot;f97607b89807936ac4ff96748d766cf4b9711f78&quot;=
<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/stretchr/testif=
y;name=3Dtestify;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/github.com/stretchr/testify" rel=3D"noref=
errer" target=3D"_blank">github.com/stretchr/testify;name=3Dtestify;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/stretchr/testify</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cloudflare/cfssl"=
 rel=3D"noreferrer" target=3D"_blank">github.com/cloudflare/cfssl</a> v1.6.=
4<br>
-# [1] git ls-remote <a href=3D"https://github.com/cloudflare/cfssl" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/cloudflare/cfssl</a> b4d0=
d877cac528f63db39dfb62d5c96cd3a32a0b<br>
-SRCREV_cfssl=3D&quot;b4d0d877cac528f63db39dfb62d5c96cd3a32a0b&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/cloudflare/cfssl;nam=
e=3Dcfssl;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/github.com/cloudflare/cfssl" rel=3D"noreferrer" =
target=3D"_blank">github.com/cloudflare/cfssl;name=3Dcfssl;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/cloudflare/cfssl</a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/josharian/in=
tern" rel=3D"noreferrer" target=3D"_blank">github.com/josharian/intern</a> =
v1.0.0<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/josharian/intern" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/josharian/intern</a>=
 8e6ff32b3e7c0b018c43953085fe2ac330fe9acd<br>
=C2=A0SRCREV_intern=3D&quot;8e6ff32b3e7c0b018c43953085fe2ac330fe9acd&quot;<=
br>
@@ -448,6 +398,11 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/=
open-telemetry/opentelemetry-go;name=3Dsdk;protocol=3Dh" rel=3D"noreferrer"=
 target=3D"_blank">github.com/open-telemetry/opentelemetry-go;name=3Dsdk;pr=
otocol=3Dh</a><br>
=C2=A0SRCREV_go-ansiterm=3D&quot;d185dfc1b5a126116ea5a19e148e29d16b4574c9&q=
uot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/Azure/go-ansite=
rm;name=3Dgo-ansiterm;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDI=
R%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/Azure/go-ansiterm" rel=3D=
"noreferrer" target=3D"_blank">github.com/Azure/go-ansiterm;name=3Dgo-ansit=
erm;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/github.com/Azure/go-ansiterm</a>&quot;<br>
<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/Microsoft/hcsshim=
" rel=3D"noreferrer" target=3D"_blank">github.com/Microsoft/hcsshim</a> v0.=
11.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/microsoft/hcsshim" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/microsoft/hcsshim</a> =
641f8b8a2314aba7ee58223e28d330fbcd66e3c2<br>
+SRCREV_hcsshim=3D&quot;641f8b8a2314aba7ee58223e28d330fbcd66e3c2&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/microsoft/hcsshim;na=
me=3Dhcsshim;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/Microsoft/hcsshim" rel=3D"noreferr=
er" target=3D"_blank">github.com/microsoft/hcsshim;name=3Dhcsshim;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/Microsoft/hcsshim</a>&quot;<br>
+<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/aws/aws-sdk-=
go-v2" rel=3D"noreferrer" target=3D"_blank">github.com/aws/aws-sdk-go-v2</a=
> v1.17.6<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/aws/aws-sdk-go-v2" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/aws/aws-sdk-go-v2</=
a> 18bff5e44f4c2c140feaf54b2dd92140630c7e50<br>
=C2=A0SRCREV_aws-sdk-go-v2=3D&quot;18bff5e44f4c2c140feaf54b2dd92140630c7e50=
&quot;<br>
@@ -508,21 +463,11 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com=
/microsoft/go-winio;name=3Dgo-winio;protocol=3Dhttps;nob" rel=3D"noreferrer=
" target=3D"_blank">github.com/microsoft/go-winio;name=3Dgo-winio;protocol=
=3Dhttps;nob</a><br>
=C2=A0SRCREV_console=3D&quot;b5cb846c9186d67bcae3ce3c324e47cd317d9527&quot;=
<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/containerd/cons=
ole;name=3Dconsole;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/github.com/containerd/console" rel=3D"n=
oreferrer" target=3D"_blank">github.com/containerd/console;name=3Dconsole;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/containerd/console</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/bugsnag/bugsnag-g=
o" rel=3D"noreferrer" target=3D"_blank">github.com/bugsnag/bugsnag-go</a> v=
1.5.0<br>
-# [1] git ls-remote <a href=3D"https://github.com/bugsnag/bugsnag-go" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/bugsnag/bugsnag-go</a>=
 d5b63da7e1f93d83e3980e5ab2bf33179bad7b2a<br>
-SRCREV_bugsnag-go=3D&quot;d5b63da7e1f93d83e3980e5ab2bf33179bad7b2a&quot;<b=
r>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/bugsnag/bugsnag-go;n=
ame=3Dbugsnag-go;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/github.com/bugsnag/bugsnag-go" rel=3D"nor=
eferrer" target=3D"_blank">github.com/bugsnag/bugsnag-go;name=3Dbugsnag-go;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/bugsnag/bugsnag-go</a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/fvbommel/sor=
torder" rel=3D"noreferrer" target=3D"_blank">github.com/fvbommel/sortorder<=
/a> v1.0.2<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/fvbommel/sortorder"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/fvbommel/sortorder=
</a> 26fad50c6b32a3064c09ed089865c16f2f3615f6<br>
=C2=A0SRCREV_sortorder=3D&quot;26fad50c6b32a3064c09ed089865c16f2f3615f6&quo=
t;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/fvbommel/sortor=
der;name=3Dsortorder;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR=
%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/fvbommel/sortorder" rel=3D=
"noreferrer" target=3D"_blank">github.com/fvbommel/sortorder;name=3Dsortord=
er;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/fvbommel/sortorder</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hashicorp/go-memd=
b" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-memdb</a> v=
1.3.2<br>
-# [1] git ls-remote <a href=3D"https://github.com/hashicorp/go-memdb" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/hashicorp/go-memdb</a>=
 542a5804dedaaddf1a0cad8b6a7b0b3fcf438776<br>
-SRCREV_go-memdb=3D&quot;542a5804dedaaddf1a0cad8b6a7b0b3fcf438776&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/go-memdb;n=
ame=3Dgo-memdb;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/github.com/hashicorp/go-memdb" rel=3D"noref=
errer" target=3D"_blank">github.com/hashicorp/go-memdb;name=3Dgo-memdb;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/hashicorp/go-memdb</a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/klauspost/co=
mpress" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/compress<=
/a> v1.16.5<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/klauspost/compress"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/klauspost/compress=
</a> ed6feffc3bb26797dc2a376516b16611046cdecd<br>
=C2=A0SRCREV_compress=3D&quot;ed6feffc3bb26797dc2a376516b16611046cdecd&quot=
;<br>
@@ -588,9 +533,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/d=
istribution/distribution;name=3Ddistribution;protoco" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/distribution/distribution;name=3Ddistribution;pr=
otoco</a><br>
=C2=A0SRCREV_sequential=3D&quot;b22ba8a69b306f0b4adbbe2a529457e6283ed9f7&qu=
ot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/moby/sys;name=
=3Dsequential;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7=
BBP%7D/src/import/vendor.fetch/github.com/moby/sys/sequential" rel=3D"noref=
errer" target=3D"_blank">github.com/moby/sys;name=3Dsequential;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/moby/sys/sequential</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/opencontainers/ru=
nc" rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers/runc</a>=
 v1.1.7<br>
-# [1] git ls-remote <a href=3D"https://github.com/opencontainers/runc" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/opencontainers/runc</a=
> 860f061b76bb4fc671f0f9e900f7d80ff93d4eb7<br>
-SRCREV_runc=3D&quot;860f061b76bb4fc671f0f9e900f7d80ff93d4eb7&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/opencontainers/ru=
nc" rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers/runc</a>=
 v1.1.9<br>
+# [1] git ls-remote <a href=3D"https://github.com/opencontainers/runc" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/opencontainers/runc</a=
> ccaecfcbc907d70a7aa870a6650887b901b25b82<br>
+SRCREV_runc=3D&quot;ccaecfcbc907d70a7aa870a6650887b901b25b82&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/opencontainers/=
runc;name=3Drunc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/github.com/opencontainers/runc" rel=3D"no=
referrer" target=3D"_blank">github.com/opencontainers/runc;name=3Drunc;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/opencontainers/runc</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/shibumi/go-p=
athspec" rel=3D"noreferrer" target=3D"_blank">github.com/shibumi/go-pathspe=
c</a> v1.3.0<br>
@@ -613,21 +558,11 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com=
/docker/cli-docs-tool;name=3Dcli-docs-tool;protocol=3Dht" rel=3D"noreferrer=
" target=3D"_blank">github.com/docker/cli-docs-tool;name=3Dcli-docs-tool;pr=
otocol=3Dht</a><br>
=C2=A0SRCREV_go-version=3D&quot;78d058c5618891f74d604bd15356fca690b64d8a&qu=
ot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/go-ve=
rsion;name=3Dgo-version;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORK=
DIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/hashicorp/go-version" r=
el=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-version;name=3D=
go-version;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/=
import/vendor.fetch/github.com/hashicorp/go-version</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hashicorp/golang-=
lru" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/golang-lru</=
a> v0.5.4<br>
-# [1] git ls-remote <a href=3D"https://github.com/hashicorp/golang-lru" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/hashicorp/golang-lru<=
/a> 14eae340515388ca95aa8e7b86f0de668e981f54<br>
-SRCREV_golang-lru=3D&quot;14eae340515388ca95aa8e7b86f0de668e981f54&quot;<b=
r>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/golang-lru=
;name=3Dgolang-lru;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/github.com/hashicorp/golang-lru" rel=3D=
"noreferrer" target=3D"_blank">github.com/hashicorp/golang-lru;name=3Dgolan=
g-lru;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impor=
t/vendor.fetch/github.com/hashicorp/golang-lru</a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/modern-go/co=
ncurrent" rel=3D"noreferrer" target=3D"_blank">github.com/modern-go/concurr=
ent</a> v0.0.0-20180306012644-bacd9c7ef1dd<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/modern-go/concurren=
t" rel=3D"noreferrer" target=3D"_blank">https://github.com/modern-go/concur=
rent</a> bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94<br>
=C2=A0SRCREV_concurrent=3D&quot;bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94&qu=
ot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/modern-go/concu=
rrent;name=3Dconcurrent;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORK=
DIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/modern-go/concurrent" r=
el=3D"noreferrer" target=3D"_blank">github.com/modern-go/concurrent;name=3D=
concurrent;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/=
import/vendor.fetch/github.com/modern-go/concurrent</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/pelletier/go-toml=
/v2" rel=3D"noreferrer" target=3D"_blank">github.com/pelletier/go-toml/v2</=
a> v2.0.5<br>
-# [1] git ls-remote <a href=3D"https://github.com/pelletier/go-toml" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/pelletier/go-toml</a> =
942841787a7d70422e4d8bc7d0be28ab911402df<br>
-SRCREV_go-toml-v2=3D&quot;942841787a7d70422e4d8bc7d0be28ab911402df&quot;<b=
r>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/pelletier/go-toml;na=
me=3Dgo-toml-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$=
%7BBP%7D/src/import/vendor.fetch/github.com/pelletier/go-toml/v2" rel=3D"no=
referrer" target=3D"_blank">github.com/pelletier/go-toml;name=3Dgo-toml-v2;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/pelletier/go-toml/v2</a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/xeipuuv/gojs=
onschema" rel=3D"noreferrer" target=3D"_blank">github.com/xeipuuv/gojsonsch=
ema</a> v1.2.0<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/xeipuuv/gojsonschem=
a" rel=3D"noreferrer" target=3D"_blank">https://github.com/xeipuuv/gojsonsc=
hema</a> 82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927<br>
=C2=A0SRCREV_gojsonschema=3D&quot;82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927&=
quot;<br>
@@ -643,9 +578,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/o=
pen-telemetry/opentelemetry-go;name=3Dmetric;protoco" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/open-telemetry/opentelemetry-go;name=3Dmetric;pr=
otoco</a><br>
=C2=A0SRCREV_v2=3D&quot;fa37277e6394c29db7bcc94062cb30cd7785a126&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/AlecAivazis/sur=
vey;name=3Dv2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7=
BBP%7D/src/import/vendor.fetch/github.com/AlecAivazis/survey/v2" rel=3D"nor=
eferrer" target=3D"_blank">github.com/AlecAivazis/survey;name=3Dv2;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/AlecAivazis/survey/v2</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/containerd/contai=
nerd" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/containerd=
</a> v1.7.3<br>
-# [1] git ls-remote <a href=3D"https://github.com/containerd/containerd" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/containerd/container=
d</a> 7880925980b188f4c97b462f709d0db8e8962aff<br>
-SRCREV_containerd=3D&quot;7880925980b188f4c97b462f709d0db8e8962aff&quot;<b=
r>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/containerd/contai=
nerd" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/containerd=
</a> v1.7.7<br>
+# [1] git ls-remote <a href=3D"https://github.com/containerd/containerd" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/containerd/container=
d</a> 8c087663b0233f6e6e2f4515cee61d49f14746a8<br>
+SRCREV_containerd=3D&quot;8c087663b0233f6e6e2f4515cee61d49f14746a8&quot;<b=
r>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/containerd/cont=
ainerd;name=3Dcontainerd;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWOR=
KDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/containerd/containerd"=
 rel=3D"noreferrer" target=3D"_blank">github.com/containerd/containerd;name=
=3Dcontainerd;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/s=
rc/import/vendor.fetch/github.com/containerd/containerd</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/go-co=
nnections" rel=3D"noreferrer" target=3D"_blank">github.com/docker/go-connec=
tions</a> v0.4.0<br>
@@ -658,9 +593,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/d=
ocker/go-connections;name=3Dgo-connections;protocol=3D" rel=3D"noreferrer" =
target=3D"_blank">github.com/docker/go-connections;name=3Dgo-connections;pr=
otocol=3D</a><br>
=C2=A0SRCREV_semver-v3=3D&quot;e06051f8fcc4c8b4a4990c337b9862a2448722e5&quo=
t;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/Masterminds/sem=
ver;name=3Dsemver-v3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR=
%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/Masterminds/semver/v3" rel=
=3D"noreferrer" target=3D"_blank">github.com/Masterminds/semver;name=3Dsemv=
er-v3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impor=
t/vendor.fetch/github.com/Masterminds/semver/v3</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/containerd/contin=
uity" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/continuity=
</a> v0.4.1<br>
-# [1] git ls-remote <a href=3D"https://github.com/containerd/continuity" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/containerd/continuit=
y</a> 25762ef7c27a37645197ed6d1d708e55a230e35d<br>
-SRCREV_continuity=3D&quot;25762ef7c27a37645197ed6d1d708e55a230e35d&quot;<b=
r>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/containerd/contin=
uity" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/continuity=
</a> v0.4.2<br>
+# [1] git ls-remote <a href=3D"https://github.com/containerd/continuity" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/containerd/continuit=
y</a> 77a2d47a6668b82465fdf6cb749fe3a2aa2c9743<br>
+SRCREV_continuity=3D&quot;77a2d47a6668b82465fdf6cb749fe3a2aa2c9743&quot;<b=
r>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/containerd/cont=
inuity;name=3Dcontinuity;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWOR=
KDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/containerd/continuity"=
 rel=3D"noreferrer" target=3D"_blank">github.com/containerd/continuity;name=
=3Dcontinuity;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/s=
rc/import/vendor.fetch/github.com/containerd/continuity</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/containerd/t=
ypeurl/v2" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/typeu=
rl/v2</a> v2.1.1<br>
@@ -668,16 +603,16 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com=
/containerd/continuity;name=3Dcontinuity;protocol=3Dhttp" rel=3D"noreferrer=
" target=3D"_blank">github.com/containerd/continuity;name=3Dcontinuity;prot=
ocol=3Dhttp</a><br>
=C2=A0SRCREV_typeurl-v2=3D&quot;7ef6316b771f959cbb208b229e3423a466947df3&qu=
ot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/containerd/type=
url;name=3Dtypeurl-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDI=
R%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/containerd/typeurl/v2" re=
l=3D"noreferrer" target=3D"_blank">github.com/containerd/typeurl;name=3Dtyp=
eurl-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/imp=
ort/vendor.fetch/github.com/containerd/typeurl/v2</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/magiconair/proper=
ties" rel=3D"noreferrer" target=3D"_blank">github.com/magiconair/properties=
</a> v1.8.6<br>
-# [1] git ls-remote <a href=3D"https://github.com/magiconair/properties" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/magiconair/propertie=
s</a> 869a5592420f4ff6ebf74500b5c658b29d973172<br>
-SRCREV_properties=3D&quot;869a5592420f4ff6ebf74500b5c658b29d973172&quot;<b=
r>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/magiconair/propertie=
s;name=3Dproperties;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%=
7D/$%7BBP%7D/src/import/vendor.fetch/github.com/magiconair/properties" rel=
=3D"noreferrer" target=3D"_blank">github.com/magiconair/properties;name=3Dp=
roperties;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/i=
mport/vendor.fetch/github.com/magiconair/properties</a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/xeipuuv/gojs=
onpointer" rel=3D"noreferrer" target=3D"_blank">github.com/xeipuuv/gojsonpo=
inter</a> v0.0.0-20190905194746-02993c407bfb<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/xeipuuv/gojsonpoint=
er" rel=3D"noreferrer" target=3D"_blank">https://github.com/xeipuuv/gojsonp=
ointer</a> 02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb<br>
=C2=A0SRCREV_gojsonpointer=3D&quot;02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb=
&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/xeipuuv/gojsonp=
ointer;name=3Dgojsonpointer;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7B=
WORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/xeipuuv/gojsonpoint=
er" rel=3D"noreferrer" target=3D"_blank">github.com/xeipuuv/gojsonpointer;n=
ame=3Dgojsonpointer;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/$=
{BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonpointer</a>&quot;<br>
<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/distribution/refe=
rence" rel=3D"noreferrer" target=3D"_blank">github.com/distribution/referen=
ce</a> v0.5.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/distribution/reference" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/distribution/refere=
nce</a> 49c28499d219290c3226822e9cfcd4ede6d75379<br>
+SRCREV_reference=3D&quot;49c28499d219290c3226822e9cfcd4ede6d75379&quot;<br=
>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/distribution/referen=
ce;name=3Dreference;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%=
7D/$%7BBP%7D/src/import/vendor.fetch/github.com/distribution/reference" rel=
=3D"noreferrer" target=3D"_blank">github.com/distribution/reference;name=3D=
reference;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/i=
mport/vendor.fetch/github.com/distribution/reference</a>&quot;<br>
+<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mitchellh/ma=
pstructure" rel=3D"noreferrer" target=3D"_blank">github.com/mitchellh/mapst=
ructure</a> v1.5.0<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/mitchellh/mapstruct=
ure" rel=3D"noreferrer" target=3D"_blank">https://github.com/mitchellh/maps=
tructure</a> ab69d8d93410fce4361f4912bb1ff88110a81311<br>
=C2=A0SRCREV_mapstructure=3D&quot;ab69d8d93410fce4361f4912bb1ff88110a81311&=
quot;<br>
@@ -693,6 +628,11 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/=
emicklei/go-restful;name=3Dgo-restful-v3;protocol=3Dhtt" rel=3D"noreferrer"=
 target=3D"_blank">github.com/emicklei/go-restful;name=3Dgo-restful-v3;prot=
ocol=3Dhtt</a><br>
=C2=A0SRCREV_jsonpointer=3D&quot;2446e21cad36eee826e1c2380f0ff747074a2faa&q=
uot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/go-openapi/json=
pointer;name=3Djsonpointer;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BW=
ORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/go-openapi/jsonpoint=
er" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/jsonpointer;=
name=3Djsonpointer;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${=
BP}/src/import/vendor.fetch/github.com/go-openapi/jsonpointer</a>&quot;<br>
<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hashicorp/go-clea=
nhttp" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-cleanht=
tp</a> v0.5.2<br>
+# [1] git ls-remote <a href=3D"https://github.com/hashicorp/go-cleanhttp" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/hashicorp/go-cleanh=
ttp</a> 6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2<br>
+SRCREV_go-cleanhttp=3D&quot;6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2&quot;=
<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/go-cleanht=
tp;name=3Dgo-cleanhttp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKD=
IR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/hashicorp/go-cleanhttp" =
rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-cleanhttp;name=
=3Dgo-cleanhttp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}=
/src/import/vendor.fetch/github.com/hashicorp/go-cleanhttp</a>&quot;<br>
+<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/in-toto/in-t=
oto-golang" rel=3D"noreferrer" target=3D"_blank">github.com/in-toto/in-toto=
-golang</a> v0.5.0<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/in-toto/in-toto-gol=
ang" rel=3D"noreferrer" target=3D"_blank">https://github.com/in-toto/in-tot=
o-golang</a> ec599036d27ebaca3e8c03559d3f8fd5fe429dfe<br>
=C2=A0SRCREV_in-toto-golang=3D&quot;ec599036d27ebaca3e8c03559d3f8fd5fe429df=
e&quot;<br>
@@ -703,9 +643,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/i=
n-toto/in-toto-golang;name=3Din-toto-golang;protocol" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/in-toto/in-toto-golang;name=3Din-toto-golang;pro=
tocol</a><br>
=C2=A0SRCREV_go-shellquote=3D&quot;95032a82bc518f77982ea72343cc1ade730072f0=
&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kballard/go-she=
llquote;name=3Dgo-shellquote;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7=
BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/kballard/go-shellq=
uote" rel=3D"noreferrer" target=3D"_blank">github.com/kballard/go-shellquot=
e;name=3Dgo-shellquote;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR=
}/${BP}/src/import/vendor.fetch/github.com/kballard/go-shellquote</a>&quot;=
<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/compose-spec/comp=
ose-go" rel=3D"noreferrer" target=3D"_blank">github.com/compose-spec/compos=
e-go</a> v1.18.3<br>
-# [1] git ls-remote <a href=3D"https://github.com/compose-spec/compose-go"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/compose-spec/compo=
se-go</a> c6eecc55b95f952b6d6406adcd297499d11a300b<br>
-SRCREV_compose-go=3D&quot;c6eecc55b95f952b6d6406adcd297499d11a300b&quot;<b=
r>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/compose-spec/comp=
ose-go" rel=3D"noreferrer" target=3D"_blank">github.com/compose-spec/compos=
e-go</a> v1.20.2<br>
+# [1] git ls-remote <a href=3D"https://github.com/compose-spec/compose-go"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/compose-spec/compo=
se-go</a> e390b9774ca100e1d75c8bc075054502783b48b8<br>
+SRCREV_compose-go=3D&quot;e390b9774ca100e1d75c8bc075054502783b48b8&quot;<b=
r>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/compose-spec/co=
mpose-go;name=3Dcompose-go;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BW=
ORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/compose-spec/compose=
-go" rel=3D"noreferrer" target=3D"_blank">github.com/compose-spec/compose-g=
o;name=3Dcompose-go;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/$=
{BP}/src/import/vendor.fetch/github.com/compose-spec/compose-go</a>&quot;<b=
r>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hashicorp/go=
-multierror" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-m=
ultierror</a> v1.1.1<br>
@@ -713,21 +653,11 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com=
/compose-spec/compose-go;name=3Dcompose-go;protocol=3Dht" rel=3D"noreferrer=
" target=3D"_blank">github.com/compose-spec/compose-go;name=3Dcompose-go;pr=
otocol=3Dht</a><br>
=C2=A0SRCREV_go-multierror=3D&quot;9974e9ec57696378079ecc3accd3d6f29401b3a0=
&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/go-mu=
ltierror;name=3Dgo-multierror;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%=
7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/hashicorp/go-mult=
ierror" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-multie=
rror;name=3Dgo-multierror;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORK=
DIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-multierror</a>&q=
uot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cucumber/gherkin-=
go/v19" rel=3D"noreferrer" target=3D"_blank">github.com/cucumber/gherkin-go=
/v19</a> v19.0.3<br>
-# [1] git ls-remote <a href=3D"https://github.com/cucumber/gherkin-go" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/cucumber/gherkin-go</a=
> 11029f28bd1bc215fa57275b576f2b237b7c2b07<br>
-SRCREV_v19=3D&quot;11029f28bd1bc215fa57275b576f2b237b7c2b07&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/cucumber/gherkin-go;=
name=3Dv19;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP=
%7D/src/import/vendor.fetch/github.com/cucumber/gherkin-go/v19" rel=3D"nore=
ferrer" target=3D"_blank">github.com/cucumber/gherkin-go;name=3Dv19;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/cucumber/gherkin-go/v19</a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/prometheus/c=
lient_model" rel=3D"noreferrer" target=3D"_blank">github.com/prometheus/cli=
ent_model</a> v0.3.0<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/prometheus/client_m=
odel" rel=3D"noreferrer" target=3D"_blank">https://github.com/prometheus/cl=
ient_model</a> 63fb9822ca3ba7a4ba5184071fb8f2ea000a99ef<br>
=C2=A0SRCREV_client_model=3D&quot;63fb9822ca3ba7a4ba5184071fb8f2ea000a99ef&=
quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/prometheus/clie=
nt_model;name=3Dclient_model;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7=
BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/prometheus/client_=
model" rel=3D"noreferrer" target=3D"_blank">github.com/prometheus/client_mo=
del;name=3Dclient_model;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDI=
R}/${BP}/src/import/vendor.fetch/github.com/prometheus/client_model</a>&quo=
t;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf13/jwalterweat=
herman" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/jwalterweathe=
rman</a> v1.1.0<br>
-# [1] git ls-remote <a href=3D"https://github.com/spf13/jwalterweatherman"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/spf13/jwalterweath=
erman</a> 94f6ae3ed3bceceafa716478c5fbf8d29ca601a1<br>
-SRCREV_jwalterweatherman=3D&quot;94f6ae3ed3bceceafa716478c5fbf8d29ca601a1&=
quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/spf13/jwalterweather=
man;name=3Djwalterweatherman;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7=
BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/spf13/jwalterweath=
erman" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/jwalterweather=
man;name=3Djwalterweatherman;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${W=
ORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/jwalterweatherman</a=
>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/xeipuuv/gojs=
onreference" rel=3D"noreferrer" target=3D"_blank">github.com/xeipuuv/gojson=
reference</a> v0.0.0-20180127040603-bd5ef7bd5415<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/xeipuuv/gojsonrefer=
ence" rel=3D"noreferrer" target=3D"_blank">https://github.com/xeipuuv/gojso=
nreference</a> bd5ef7bd5415a7ac448318e64f11a24cd21e594b<br>
=C2=A0SRCREV_gojsonreference=3D&quot;bd5ef7bd5415a7ac448318e64f11a24cd21e59=
4b&quot;<br>
@@ -743,11 +673,6 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/=
opencontainers/go-digest;name=3Dgo-digest;protocol=3Dht" rel=3D"noreferrer"=
 target=3D"_blank">github.com/opencontainers/go-digest;name=3Dgo-digest;pro=
tocol=3Dht</a><br>
=C2=A0SRCREV_config=3D&quot;18bff5e44f4c2c140feaf54b2dd92140630c7e50&quot;<=
br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/aws/aws-sdk-go-=
v2;name=3Dconfig;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2/config" rel=
=3D"noreferrer" target=3D"_blank">github.com/aws/aws-sdk-go-v2;name=3Dconfi=
g;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/aws/aws-sdk-go-v2/config</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cucumber/messages=
-go/v16" rel=3D"noreferrer" target=3D"_blank">github.com/cucumber/messages-=
go/v16</a> v16.0.1<br>
-# [1] git ls-remote <a href=3D"https://github.com/cucumber/messages-go" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/cucumber/messages-go<=
/a> 1848e9bfc84e8c1674c4d9ded0bdbfc23c458b28<br>
-SRCREV_v16=3D&quot;1848e9bfc84e8c1674c4d9ded0bdbfc23c458b28&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/cucumber/messages-go=
;name=3Dv16;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BB=
P%7D/src/import/vendor.fetch/github.com/cucumber/messages-go/v16" rel=3D"no=
referrer" target=3D"_blank">github.com/cucumber/messages-go;name=3Dv16;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/cucumber/messages-go/v16</a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/go-openapi/j=
sonreference" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/js=
onreference</a> v0.20.0<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/go-openapi/jsonrefe=
rence" rel=3D"noreferrer" target=3D"_blank">https://github.com/go-openapi/j=
sonreference</a> c5db5582e080fbeae80be42f42881230a8caebf6<br>
=C2=A0SRCREV_jsonreference=3D&quot;c5db5582e080fbeae80be42f42881230a8caebf6=
&quot;<br>
@@ -758,9 +683,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/g=
o-openapi/jsonreference;name=3Djsonreference;protoco" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/go-openapi/jsonreference;name=3Djsonreference;pr=
otoco</a><br>
=C2=A0SRCREV_client_golang=3D&quot;254e5468413f19fb75cdad45f5ddc0b8c975188c=
&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/prometheus/clie=
nt_golang;name=3Dclient_golang;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$=
%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/prometheus/clien=
t_golang" rel=3D"noreferrer" target=3D"_blank">github.com/prometheus/client=
_golang;name=3Dclient_golang;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${W=
ORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/client_golang</=
a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/opencontainers/im=
age-spec" rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers/im=
age-spec</a> v1.1.0-rc4<br>
-# [1] git ls-remote <a href=3D"https://github.com/opencontainers/image-spe=
c" rel=3D"noreferrer" target=3D"_blank">https://github.com/opencontainers/i=
mage-spec</a> 82e8329f7eb6df5c62924f2792d285ba276ae876<br>
-SRCREV_image-spec=3D&quot;82e8329f7eb6df5c62924f2792d285ba276ae876&quot;<b=
r>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/opencontainers/im=
age-spec" rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers/im=
age-spec</a> v1.1.0-rc5<br>
+# [1] git ls-remote <a href=3D"https://github.com/opencontainers/image-spe=
c" rel=3D"noreferrer" target=3D"_blank">https://github.com/opencontainers/i=
mage-spec</a> 1e54f0195ce54b4a1a2ecbac8eab7686d91d3080<br>
+SRCREV_image-spec=3D&quot;1e54f0195ce54b4a1a2ecbac8eab7686d91d3080&quot;<b=
r>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/opencontainers/=
image-spec;name=3Dimage-spec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7=
BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/opencontainers/ima=
ge-spec" rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers/ima=
ge-spec;name=3Dimage-spec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORK=
DIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/image-spec</a>=
&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/theupdatefra=
mework/notary" rel=3D"noreferrer" target=3D"_blank">github.com/theupdatefra=
mework/notary</a> v0.7.0<br>
@@ -768,9 +693,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/o=
pencontainers/image-spec;name=3Dimage-spec;protocol=3D" rel=3D"noreferrer" =
target=3D"_blank">github.com/opencontainers/image-spec;name=3Dimage-spec;pr=
otocol=3D</a><br>
=C2=A0SRCREV_notary=3D&quot;b0b6bfdd4933081e8d5ae026b24e8337311dd598&quot;<=
br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/notaryproject/n=
otary;name=3Dnotary;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%=
7D/$%7BBP%7D/src/import/vendor.fetch/github.com/theupdateframework/notary" =
rel=3D"noreferrer" target=3D"_blank">github.com/notaryproject/notary;name=
=3Dnotary;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/i=
mport/vendor.fetch/github.com/theupdateframework/notary</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/AdaLogics/go-fuzz=
-headers" rel=3D"noreferrer" target=3D"_blank">github.com/AdaLogics/go-fuzz=
-headers</a> v0.0.0-20230106234847-43070de90fa1<br>
-# [1] git ls-remote <a href=3D"https://github.com/AdaLogics/go-fuzz-header=
s" rel=3D"noreferrer" target=3D"_blank">https://github.com/AdaLogics/go-fuz=
z-headers</a> 43070de90fa134c9ea55cd6de4308a2ae59658d3<br>
-SRCREV_go-fuzz-headers=3D&quot;43070de90fa134c9ea55cd6de4308a2ae59658d3&qu=
ot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/AdaLogics/go-fuzz=
-headers" rel=3D"noreferrer" target=3D"_blank">github.com/AdaLogics/go-fuzz=
-headers</a> v0.0.0-20230811130428-ced1acdcaa24<br>
+# [1] git ls-remote <a href=3D"https://github.com/AdaLogics/go-fuzz-header=
s" rel=3D"noreferrer" target=3D"_blank">https://github.com/AdaLogics/go-fuz=
z-headers</a> ced1acdcaa24dc39c01b039fc37576c395f506cf<br>
+SRCREV_go-fuzz-headers=3D&quot;ced1acdcaa24dc39c01b039fc37576c395f506cf&qu=
ot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/AdaLogics/go-fu=
zz-headers;name=3Dgo-fuzz-headers;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/AdaLogics/go=
-fuzz-headers" rel=3D"noreferrer" target=3D"_blank">github.com/AdaLogics/go=
-fuzz-headers;name=3Dgo-fuzz-headers;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AdaLogics/go-fuzz-=
headers</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/inconshrevea=
ble/mousetrap" rel=3D"noreferrer" target=3D"_blank">github.com/inconshrevea=
ble/mousetrap</a> v1.1.0<br>
@@ -783,21 +708,6 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com/=
inconshreveable/mousetrap;name=3Dmousetrap;protocol=3Dh" rel=3D"noreferrer"=
 target=3D"_blank">github.com/inconshreveable/mousetrap;name=3Dmousetrap;pr=
otocol=3Dh</a><br>
=C2=A0SRCREV_structured-merge-diff-v4=3D&quot;26781d0c10bfdbd7d66b18d8be839=
85f623df9f8&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kubernetes-sigs=
/structured-merge-diff;name=3Dstructured-merge-diff-v4;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/sig=
s.k8s.io/structured-merge-diff/v4" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/kubernetes-sigs/structured-merge-diff;name=3Dstructured-merge-diff-=
v4;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/sigs.k8s.io/structured-merge-diff/v4</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cyphar/filepath-s=
ecurejoin" rel=3D"noreferrer" target=3D"_blank">github.com/cyphar/filepath-=
securejoin</a> v0.2.3<br>
-# [1] git ls-remote <a href=3D"https://github.com/cyphar/filepath-securejo=
in" rel=3D"noreferrer" target=3D"_blank">https://github.com/cyphar/filepath=
-securejoin</a> 8f267f5ea675a20a2cb5e91011d063721f53bf79<br>
-SRCREV_filepath-securejoin=3D&quot;8f267f5ea675a20a2cb5e91011d063721f53bf7=
9&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/cyphar/filepath-secu=
rejoin;name=3Dfilepath-securejoin;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/cyphar/filep=
ath-securejoin" rel=3D"noreferrer" target=3D"_blank">github.com/cyphar/file=
path-securejoin;name=3Dfilepath-securejoin;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cyphar/filep=
ath-securejoin</a>&quot;<br>
-<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/distribution/dist=
ribution/v3" rel=3D"noreferrer" target=3D"_blank">github.com/distribution/d=
istribution/v3</a> v3.0.0-20230601133803-97b1d649c493<br>
-# [1] git ls-remote <a href=3D"https://github.com/distribution/distributio=
n" rel=3D"noreferrer" target=3D"_blank">https://github.com/distribution/dis=
tribution</a> 97b1d649c4938d0f608d96454d6a8326b1f96acd<br>
-SRCREV_v3=3D&quot;97b1d649c4938d0f608d96454d6a8326b1f96acd&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/distribution/distrib=
ution;name=3Dv3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$=
%7BBP%7D/src/import/vendor.fetch/github.com/distribution/distribution/v3" r=
el=3D"noreferrer" target=3D"_blank">github.com/distribution/distribution;na=
me=3Dv3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/imp=
ort/vendor.fetch/github.com/distribution/distribution/v3</a>&quot;<br>
-<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hashicorp/go-immu=
table-radix" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-i=
mmutable-radix</a> v1.3.1<br>
-# [1] git ls-remote <a href=3D"https://github.com/hashicorp/go-immutable-r=
adix" rel=3D"noreferrer" target=3D"_blank">https://github.com/hashicorp/go-=
immutable-radix</a> 49d1d02c49a783de548d1ba8ae8fde466a20b9e6<br>
-SRCREV_go-immutable-radix=3D&quot;49d1d02c49a783de548d1ba8ae8fde466a20b9e6=
&quot;<br>
-SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/go-immutab=
le-radix;name=3Dgo-immutable-radix;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/hashicorp/go=
-immutable-radix" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp=
/go-immutable-radix;name=3Dgo-immutable-radix;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp=
/go-immutable-radix</a>&quot;<br>
-<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/aws/aws-sdk-=
go-v2/credentials" rel=3D"noreferrer" target=3D"_blank">github.com/aws/aws-=
sdk-go-v2/credentials</a> v1.13.16<br>
=C2=A0# [1] git ls-remote <a href=3D"https://github.com/aws/aws-sdk-go-v2" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/aws/aws-sdk-go-v2</=
a> 18bff5e44f4c2c140feaf54b2dd92140630c7e50<br>
=C2=A0SRCREV_credentials=3D&quot;18bff5e44f4c2c140feaf54b2dd92140630c7e50&q=
uot;<br>
@@ -823,14 +733,14 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.com=
/aws/aws-sdk-go-v2;name=3Dini;protocol=3Dhttps;nobranch=3D" rel=3D"noreferr=
er" target=3D"_blank">github.com/aws/aws-sdk-go-v2;name=3Dini;protocol=3Dht=
tps;nobranch=3D</a><br>
=C2=A0SRCREV_grpc-gateway-v2=3D&quot;0197faf8b072910084edd1209aa2ac51833b89=
5c&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/grpc-ecosystem/=
grpc-gateway;name=3Dgrpc-gateway-v2;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/grpc-ecosys=
tem/grpc-gateway/v2" rel=3D"noreferrer" target=3D"_blank">github.com/grpc-e=
cosystem/grpc-gateway;name=3Dgrpc-gateway-v2;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/grpc-ecosy=
stem/grpc-gateway/v2</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/genproto/g=
oogleapis/api" rel=3D"noreferrer" target=3D"_blank">google.golang.org/genpr=
oto/googleapis/api</a> v0.0.0-20230525234035-dd9d682886f9<br>
-# [1] git ls-remote <a href=3D"https://github.com/googleapis/go-genproto" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/googleapis/go-genpr=
oto</a> dd9d682886f99d242574cd3eaea438ce7ea66399<br>
-SRCREV_api=3D&quot;dd9d682886f99d242574cd3eaea438ce7ea66399&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/genproto/g=
oogleapis/api" rel=3D"noreferrer" target=3D"_blank">google.golang.org/genpr=
oto/googleapis/api</a> v0.0.0-20230822172742-b8732ec3820d<br>
+# [1] git ls-remote <a href=3D"https://github.com/googleapis/go-genproto" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/googleapis/go-genpr=
oto</a> b8732ec3820db4bd1e4eda89392b7728e81bd825<br>
+SRCREV_api=3D&quot;b8732ec3820db4bd1e4eda89392b7728e81bd825&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/googleapis/go-g=
enproto;name=3Dapi;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/google.golang.org/genproto/googleapis/a=
pi" rel=3D"noreferrer" target=3D"_blank">github.com/googleapis/go-genproto;=
name=3Dapi;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/=
import/vendor.fetch/google.golang.org/genproto/googleapis/api</a>&quot;<br>
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/genproto/g=
oogleapis/rpc" rel=3D"noreferrer" target=3D"_blank">google.golang.org/genpr=
oto/googleapis/rpc</a> v0.0.0-20230525234030-28d5490b6b19<br>
-# [1] git ls-remote <a href=3D"https://github.com/googleapis/go-genproto" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/googleapis/go-genpr=
oto</a> 28d5490b6b19cce1ebbc6ab55ca8637bd35b3486<br>
-SRCREV_rpc=3D&quot;28d5490b6b19cce1ebbc6ab55ca8637bd35b3486&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/genproto/g=
oogleapis/rpc" rel=3D"noreferrer" target=3D"_blank">google.golang.org/genpr=
oto/googleapis/rpc</a> v0.0.0-20230822172742-b8732ec3820d<br>
+# [1] git ls-remote <a href=3D"https://github.com/googleapis/go-genproto" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/googleapis/go-genpr=
oto</a> b8732ec3820db4bd1e4eda89392b7728e81bd825<br>
+SRCREV_rpc=3D&quot;b8732ec3820db4bd1e4eda89392b7728e81bd825&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/googleapis/go-g=
enproto;name=3Drpc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/google.golang.org/genproto/googleapis/r=
pc" rel=3D"noreferrer" target=3D"_blank">github.com/googleapis/go-genproto;=
name=3Drpc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/=
import/vendor.fetch/google.golang.org/genproto/googleapis/rpc</a>&quot;<br>
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/docke=
r-credential-helpers" rel=3D"noreferrer" target=3D"_blank">github.com/docke=
r/docker-credential-helpers</a> v0.7.0<br>
-- <br>
2.44.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8595): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8595" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8595</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/104628874/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/104628874/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--00000000000095cf51061275912f--

