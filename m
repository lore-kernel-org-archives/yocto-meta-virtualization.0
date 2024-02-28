Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE17C5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 18:57:17 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.5242.1709146635170814878
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 10:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NSHX6TTd;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29a74c88f74so4182696a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Feb 2024 10:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709146634; x=1709751434; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3buQdeDUcqBGusGN2TV7h5rXGMYzDd/BZvuWxVun+10=;
        b=NSHX6TTd6CFTRTGt1OapqsRWaamxzPh2eFp7lTqaWOhjRro7/IdcwEob7xgiHa1B+3
         zFH9/9OfQvdOiuMBE+gCAS3sZUoAre6fhR7u7VcQT9LIMbliFb6minqxPT/NHorRKyUz
         9SvrLFnnpetp1k/KWl0JX56JrqVyfC7XqAWRwEw29zQzRxjelYAZdHz8kvNKXb1FUeYZ
         yv548oikUyz0Fl0LUpdTb2qskFLho+FuVDCDHU9xXLf2vDOxfM5ShcHpX1zQTbnnuI4z
         ZDl8UAMk/OcvFqJbXIV+aHdqcEx3Ymk0uGIcA3T6RQX0pqPJwXB6m/k04eb/fYOY96np
         OxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709146634; x=1709751434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3buQdeDUcqBGusGN2TV7h5rXGMYzDd/BZvuWxVun+10=;
        b=Sdjq8Zxh7tr/kLS9yhP+1kNvXOA9CzABMdkYh6/gxzylhFlphQLGYUGUCAs/K/aaKa
         EI0lNAAlxx6hcyr6Y8rK/tLmN8+FZ2crT7J8pwF27LaQgHqjVV3fUw5wSx0VOxt8iOac
         Pu0S+DrJw7/uEoz2tSUgM9y4GHPsibr+0G1GeiuZYMyLkgl+UB/zlKAX/TdKT4a8viBS
         WTvjufaUF2i3J2IOYLbYUCH6qEvj2mc3AHwrkDFBoB70AtNVTHdgfh92BW9nQFK+Y9PX
         oHWADIHud0rLS0GSwyqY+fzY9QZcTNisl0h7w0AdAPK6Eav35mbtsgzJuQh/kOWlbHxe
         iAJA==
X-Gm-Message-State: AOJu0Yy9LRYOJzvITaS2XTFootoVfX+cjPPCVQBdXWOiX3gBo+LToXFY
	xq9S8IjNkhCHZFVXh+2IyjWI+biiwjG852Eh10IFWxyBr5ufL+WQkfCO7E+6EhyPWohYMav0PnB
	OuWk5h2rpLRgfT5u6auRRauRWjiM=
X-Google-Smtp-Source: AGHT+IFfGcREp787e+Db3RYdGACBKVGux5wSigjlyCPOXcYQo7RElM4kYRj0tzeIoa5/ueCheELW7pmJlsoug44PX+Q=
X-Received: by 2002:a17:90a:bd90:b0:29a:b6d7:be22 with SMTP id
 z16-20020a17090abd9000b0029ab6d7be22mr37155pjr.17.1709146633989; Wed, 28 Feb
 2024 10:57:13 -0800 (PST)
MIME-Version: 1.0
References: <17B81B224EDE23E7.18468@lists.yoctoproject.org> <CANPvuRnSVmphHUtVub0=Q3cMAVX2cpyK-Mc7OvYyXFOuu1-8zg@mail.gmail.com>
In-Reply-To: <CANPvuRnSVmphHUtVub0=Q3cMAVX2cpyK-Mc7OvYyXFOuu1-8zg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 28 Feb 2024 13:57:02 -0500
Message-ID: <CADkTA4NAo-8TbbADV3_TyfcJr1JTsLNdX9xRy7FxaSAhcafpuA@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC meta-virtualization][PATCH]
 docker-compose: v2.21.0 -> v2.23.3
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Feb 2024 18:57:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8597

On Wed, Feb 28, 2024 at 1:47=E2=80=AFPM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
>
> The recipe on meta-virt main-next fails to build with go-1.21 and I have =
updated it with:
> ./meta-virtualization/scripts/oe-go-mod-autogen.py --repo https://github.=
com/docker/compose --rev v2.23.3
>

My intent is to wait as long as possible on these recipes, since
obviously, I'm aware of what the issues are with go 1.2.x, even then,
I'll be doing multiple recipes versus upgrading what is there to leave
the layer in a forward looking state if 1.21+ doesn't merge into core.

So for now, I won't be grabbing the bump.

Bruce

> Jose
>
> Jose Quaresma via lists.yoctoproject.org <quaresma.jose=3Dgmail.com@lists=
.yoctoproject.org> escreveu (quarta, 28/02/2024 =C3=A0(s) 18:44):
>>
>> - c665c53c bump buildx to v0.12.0 and adapt code to changes
>> - a1aceba6 Merge pull request #11215 from docker/dependabot/go_modules/g=
ithub.com/compose-spec/compose-go-1.20.2
>> - a39cf75e build(deps): bump github.com/compose-spec/compose-go
>> - 5b0dcc5a Merge pull request #11214 from docker/dependabot/go_modules/g=
ithub.com/spf13/cobra-1.8.0
>> - 46ba9c99 build(deps): bump github.com/spf13/cobra from 1.7.0 to 1.8.0
>> - 1148b676 Merge pull request #11142 from docker/dependabot/go_modules/g=
ithub.com/docker/cli-24.0.7incompatible
>> - 5c5d30c6 build(deps): bump github.com/docker/cli
>> - 2068ecee Merge pull request #11143 from docker/dependabot/go_modules/g=
ithub.com/docker/docker-24.0.7incompatible
>> - 36fa8d4e build(deps): bump github.com/docker/docker
>> - 69985b8b Merge pull request #11112 from docker/dependabot/go_modules/g=
ithub.com/moby/buildkit-0.12.3
>> - 2384635e build(deps): bump github.com/moby/buildkit from 0.12.2 to 0.1=
2.3
>> - 587dba11 Merge pull request #11213 from glours/watch-force-build-at-st=
artup
>> - 2ba5e4c1 in watch mode force pull policy to build for services with bo=
th build and develop attributes This default behaviour will force a rebuild=
 of the service images at watch process startup and be sure containers will=
 be in sync with the local source code
>> - b1a26dac Assume /src/pkg/compose/testdata absolute workingdir to make =
tests reproducible
>> - 0ab21a20 Merge pull request #11211 from ndeloof/Services
>> - 5e77ae92 avoir use of []types.ServiceConfig
>> - f5572201 identify services to build and don't display 'building' if no=
ne
>> - 8e1b3236 fix --remove-orphans not to consider disabled services as orp=
haned
>> - a1b7bee0 Merge pull request #11206 from ndeloof/check_runtime
>> - 7cb1f8ba introduce RuntimeVersion for code to check container runtime =
supports required features
>> - cb01186c push also consider build.tags
>> - efea084d Merge pull request #11192 from ulyssessouza/exclude-tests-con=
text
>> - 9c4efbdd Strip project prefix from docker-compose up output
>> - 8ea7c9e0 Make it context aware and add test skipping options
>> - c1694360 render quiet after filtering applied
>> - 254a94b0 bump golang to version 1.21.4
>> - cf608fa9 bump compose-go to v1.20.1
>> - 426377a4 reject compose file using `secrets|configs.driver or template=
_driver`
>> - 43c3f545 Merge pull request #11180 from ulyssessouza/skip-flaky-tests
>> - 493f6c80 skips flaky e2e tests on watch and attach
>> - c1a9ffa0 Merge pull request #11171 from szampardi/main
>> - 646a8fc0 fix docker/compose#11170 add newline in cmd/compose/build.go =
fmt.Fprint
>> - 2945532f fix --pull documentation
>> - e5cd265a improve watch configuration logging Add action associated to =
each managed path
>> - d646d757 lint
>> - 71237ef6 do not resolve cache dir until remote resource is in use
>> - 0d905a89 add a copyright notice with original author
>> - b847c7f5 implement runtime file selection
>> - 5e3d8f67 re-implement cache folder detection
>> - 67279088 introduce --resolve-image-digests for publish to seal service=
 images by digest
>> - 5661fd1b Merge pull request #11149 from aevesdocker/ENGDOCS-1764
>> - 4cd61957 fix build
>> - 0d4cbbdb fix
>> - 9631a49d ENGDOCS-1764
>> - 328ca3f2 add docs upstream validation workflow
>> - e1bbfc63 build(deps): bump go.uber.org/goleak from 1.2.1 to 1.3.0
>> - 616bba0a linter errors fixed
>> - ee6e3c2a NetworkList to NetworkInspect for ID search
>> - c7e31a3c Squashing feature branch commits in order to add signoff mess=
age.
>> - 704a9fd3 Use project.ServiceNames() if no service specified in hash
>> - d9e0e42d Add branch configuration for pull_request trigger
>> - c48e3c4a Initial codeql.yml commit
>> - dd0803db fix SIGTERM support to stop/kill stack
>> - 39008c53 align with OCI artifact best practices
>> - 6ab41d62 Merge pull request #11060 from Juneezee/refactor/redundant-le=
n-check
>> - 6c345b37 refactor(cmd/compose/run): remove redundant `len` check
>> - b8773ad1 Merge pull request #11110 from ndeloof/wait_missing
>> - 1ffa194e fail start if depependency is missing
>> - b9298101 check that the pull policy provided is a valid one or is not =
missing when --pull is used
>> - af87f106 Merge pull request #11108 from ndeloof/down-services
>> - 5e1d3f2b Merge pull request #11051 from ndeloof/warn_remote_disabled
>> - 3d0207eb remove uncessary return value of pullComposeFiles function
>> - 16a7c209 enable profile when down is ran with explicit service names
>> - 818bc3c3 add sync+restart action to watch attribute
>> - cf3e686d Merge pull request #11078 from docker/dependabot/go_modules/g=
ithub.com/containerd/containerd-1.7.7
>> - 38bc6d5d build(deps): bump github.com/containerd/containerd from 1.7.6=
 to 1.7.7
>> - 4a2d4c44 Merge pull request #11083 from docker/dependabot/go_modules/g=
ithub.com/google/go-cmp-0.6.0
>> - 0b6ce6ee build(deps): bump github.com/google/go-cmp from 0.5.9 to 0.6.=
0
>> - 034458da Merge pull request #11105 from docker/dependabot/go_modules/g=
oogle.golang.org/grpc-1.59.0
>> - ae16bbbf build(deps): bump google.golang.org/grpc from 1.58.2 to 1.59.=
0
>> - eb5f01ba Merge pull request #11068 from docker/dependabot/go_modules/g=
olang.org/x/sync-0.4.0
>> - d13ad1f9 build(deps): bump golang.org/x/sync from 0.3.0 to 0.4.0
>> - 9b4d577c remove refrecence docs generation
>> - b30978fb Merge pull request #11076 from glours/remove-cucumber
>> - 14b43c1a remove cucumber tests as we haven't added new ones for a whil=
e
>> - 9dd081b9 add support of COMPOSE_ENV_FILES env variable to pass a list =
of env files
>> - 2c0b0232 add dry-run support for publish command
>> - 599e4b24 extract method to reduce cyclomatic complexity
>> - fe8c2780 warn user remote resource is disabled
>> - a345515f Don't delete dependent services
>> - 8967df7a Apply platform before hashing
>> - 4f694919 deps: remove deprecated github.com/pkg/errors
>> - 6ecab957 Include image name in error message
>> - 12e0ac89 pkg/compose/publish: use empty config descriptor mediaType
>> - a6b7d785 pkg/remote/oci: check artifactType instead of config.mediaTyp=
e
>> - 991901f2 pkg/remote/oci: refer to the manifest as manifest
>> - bd74a926 Merge pull request #11047 from glours/update-watch-warning-se=
ction
>> - 2d971fc9 update the watch warning message when no services with a deve=
lop section
>> - 78f33619 ci: enable verbose output for e2e tests (#11045)
>> - 44d21280 truncate command by default, introduce --no-trunc flag to get=
 the full command
>> - cd743d17 Merge pull request #11036 from docker/dependabot/go_modules/g=
oogle.golang.org/grpc-1.58.2
>> - ff2ff18c build(deps): bump google.golang.org/grpc from 1.58.1 to 1.58.=
2
>> - bd32ed14 Merge pull request #11025 from ndeloof/SkipResolveEnvironment
>> - ab81db5b config --xx don't need `env_file` being parsed
>> - 52a641bf Merge pull request #11021 from glours/move-watch-to-main-cmd
>> - 75f5c07d Merge pull request #11023 from glours/fix-watch-e2e-test-clea=
nup
>> - 61c8be11 remove --timeout=3D0 flag to cleanup function of watch e2e te=
st compose down command need the watch process to be killed to succeed
>> - 6be5f300 move watch from alpha to main command
>> - 421a6b05 Merge pull request #11031 from ndeloof/TestWatch
>> - c34c306c TestWatch to use new  `develop` section
>> - 5ca35c88 implement publish
>> - 805541be watch: use official `develop` section (#11026)
>> - d322ad91 Merge pull request #11027 from docker/dependabot/go_modules/g=
ithub.com/opencontainers/image-spec-1.1.0-rc5
>> - 8f489d6d build(deps): bump github.com/opencontainers/image-spec
>> - a214a715 Merge pull request #11017 from docker/dependabot/go_modules/g=
ithub.com/moby/buildkit-0.12.2
>> - 9ea8fbc6 build(deps): bump github.com/moby/buildkit from 0.12.1 to 0.1=
2.2
>> - 062fa755 Merge pull request #11020 from docker/dependabot/go_modules/g=
otest.tools/v3-3.5.1
>> - 76f150e4 build(deps): bump gotest.tools/v3 from 3.5.0 to 3.5.1
>> - d45d943e Merge pull request #11019 from docker/dependabot/go_modules/g=
oogle.golang.org/grpc-1.58.1
>> - f447c809 build(deps): bump google.golang.org/grpc from 1.58.0 to 1.58.=
1
>> - 722796ca Merge pull request #11016 from docker/dependabot/go_modules/g=
ithub.com/containerd/containerd-1.7.6
>> - 4587d4ba build(deps): bump github.com/containerd/containerd from 1.7.3=
 to 1.7.6
>> - a697a069 introduce pull --missing flag to only pull images not present=
 in cache
>> - 8af49ff3 resolve service reference into container based on observed st=
ate
>> - f6e31dbc don't rely on depends_on to resolve volume_from, better use o=
bserved state
>> - e19232e8 Merge pull request #11000 from thaJeztah/update_golang_1.21.1
>> - 6d5eb6fd update to go1.21.1
>> - 9d7e0ad6 correct scale error messages formatting
>> - 1a98a70b add scale command
>> - 19bbb12f ci: tweak restricted imports in linter (#10992)
>> - 7a134578 deps: upgrade Moby to v24.0.6 and gRPC to v1.58.0 (#10991)
>> - 13115468 cli: fix `--build` flag for `create` (#10982)
>> - e1aa4f77 otel: add args & flags to cli traces (#10974)
>> - d7b0b2bd watch: build & launch the project at start (#10957)
>> - e0f39ebb pull OCI remote resource
>> - c9d54f09 introduce publish (alpha) command
>> - aeb835a5 Merge pull request #10966 from kumarlokesh/patch-1
>> - 52e54ef9 doc: updated README.md to remove broken link
>> - 203bce88 Merge pull request #10954 from thaJeztah/swap_reference
>> - f4f2e934 migrate to github.com/distribution/reference
>> - 32c3d0a3 Enable service explicitly requested to be restarted
>> - 1fdbcb62 build: pass BuildOptions around explicitly & fix multi-platfo=
rm issues
>> - 407a0d5b up: fix various race/deadlock conditions on exit (#10934)
>> - d0dfb848 Merge pull request #10953 from thaJeztah/drop_uuid
>> - 8caa6f1f pkg/api: replace uuid for basic random id
>>
>> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> ---
>>  .../docker-compose/docker-compose_git.bb      |   4 +-
>>  .../docker-compose/files/modules.txt          | 119 +++---
>>  .../docker-compose/relocation.inc             |  38 +-
>>  recipes-containers/docker-compose/src_uri.inc | 348 +++++++-----------
>>  4 files changed, 182 insertions(+), 327 deletions(-)
>>
>> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/r=
ecipes-containers/docker-compose/docker-compose_git.bb
>> index b7745f2..8154cc5 100644
>> --- a/recipes-containers/docker-compose/docker-compose_git.bb
>> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
>> @@ -9,7 +9,7 @@ DEPENDS =3D " \
>>
>>  # Specify the first two important SRCREVs as the format
>>  SRCREV_FORMAT=3D"compose_survey"
>> -SRCREV_compose =3D "d6f842b042d2f2926901305336527b3eaadf067a"
>> +SRCREV_compose =3D "c665c53cc1eb633a819fcaa9b47d77597b55d0eb"
>>
>>  SRC_URI =3D "git://github.com/docker/compose;name=3Dcompose;branch=3Dma=
in;protocol=3Dhttps"
>>
>> @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D=
175792518e4ac015ab6696d16c4f60
>>
>>  GO_IMPORT =3D "import"
>>
>> -PV =3D "v2.21.0"
>> +PV =3D "v2.23.3"
>>
>>  COMPOSE_PKG =3D "github.com/docker/compose/v2"
>>
>> diff --git a/recipes-containers/docker-compose/files/modules.txt b/recip=
es-containers/docker-compose/files/modules.txt
>> index d287d12..c8219da 100644
>> --- a/recipes-containers/docker-compose/files/modules.txt
>> +++ b/recipes-containers/docker-compose/files/modules.txt
>> @@ -2,27 +2,25 @@
>>  ## explicit
>>  # github.com/Microsoft/go-winio v0.6.1
>>  ## explicit
>> -# github.com/adrg/xdg v0.4.0
>> -## explicit
>>  # github.com/buger/goterm v1.0.4
>>  ## explicit
>> -# github.com/compose-spec/compose-go v1.18.3
>> +# github.com/compose-spec/compose-go v1.20.2
>>  ## explicit
>>  # github.com/containerd/console v1.0.3
>>  ## explicit
>> -# github.com/containerd/containerd v1.7.3
>> +# github.com/containerd/containerd v1.7.7
>>  ## explicit
>> -# github.com/cucumber/godog v0.0.0-00010101000000-000000000000
>> +# github.com/davecgh/go-spew v1.1.1
>>  ## explicit
>> -# github.com/distribution/distribution/v3 v3.0.0-20230601133803-97b1d64=
9c493
>> +# github.com/distribution/reference v0.5.0
>>  ## explicit
>> -# github.com/docker/buildx v0.11.2
>> +# github.com/docker/buildx v0.12.0
>>  ## explicit
>> -# github.com/docker/cli v24.0.5+incompatible
>> +# github.com/docker/cli v24.0.7+incompatible
>>  ## explicit
>>  # github.com/docker/cli-docs-tool v0.6.0
>>  ## explicit
>> -# github.com/docker/docker v24.0.5+incompatible
>> +# github.com/docker/docker v24.0.7+incompatible
>>  ## explicit
>>  # github.com/docker/go-connections v0.4.0
>>  ## explicit
>> @@ -32,6 +30,8 @@
>>  ## explicit
>>  # github.com/golang/mock v1.6.0
>>  ## explicit
>> +# github.com/google/go-cmp v0.6.0
>> +## explicit
>>  # github.com/hashicorp/go-multierror v1.1.1
>>  ## explicit
>>  # github.com/hashicorp/go-version v1.6.0
>> @@ -42,7 +42,7 @@
>>  ## explicit
>>  # github.com/mitchellh/mapstructure v1.5.0
>>  ## explicit
>> -# github.com/moby/buildkit v0.12.1
>> +# github.com/moby/buildkit v0.13.0-beta1.0.20231023114302-d5c1d785b042
>>  ## explicit
>>  # github.com/moby/patternmatcher v0.6.0
>>  ## explicit
>> @@ -52,13 +52,13 @@
>>  ## explicit
>>  # github.com/opencontainers/go-digest v1.0.0
>>  ## explicit
>> -# github.com/opencontainers/image-spec v1.1.0-rc4
>> +# github.com/opencontainers/image-spec v1.1.0-rc5
>>  ## explicit
>> -# github.com/pkg/errors v0.9.1
>> +# github.com/otiai10/copy v1.14.0
>>  ## explicit
>>  # github.com/sirupsen/logrus v1.9.3
>>  ## explicit
>> -# github.com/spf13/cobra v1.7.0
>> +# github.com/spf13/cobra v1.8.0
>>  ## explicit
>>  # github.com/spf13/pflag v1.0.5
>>  ## explicit
>> @@ -78,22 +78,26 @@
>>  ## explicit
>>  # go.opentelemetry.io/otel/trace v1.14.0
>>  ## explicit
>> -# go.uber.org/goleak v1.2.1
>> +# go.uber.org/goleak v1.3.0
>>  ## explicit
>> -# golang.org/x/sync v0.3.0
>> +# golang.org/x/exp v0.0.0-20230713183714-613f0c0eb8a1
>>  ## explicit
>> -# google.golang.org/grpc v1.57.0
>> +# golang.org/x/sync v0.5.0
>>  ## explicit
>> -# gopkg.in/yaml.v2 v2.4.0
>> +# golang.org/x/sys v0.14.0
>>  ## explicit
>> -# gotest.tools/v3 v3.5.0
>> +# google.golang.org/grpc v1.59.0
>>  ## explicit
>> -# github.com/AdaLogics/go-fuzz-headers v0.0.0-20230106234847-43070de90f=
a1
>> +# gotest.tools/v3 v3.5.1
>> +## explicit
>> +# github.com/AdaLogics/go-fuzz-headers v0.0.0-20230811130428-ced1acdcaa=
24
>>  ## explicit
>>  # github.com/Azure/go-ansiterm v0.0.0-20210617225240-d185dfc1b5a1
>>  ## explicit
>>  # github.com/Masterminds/semver/v3 v3.2.1
>>  ## explicit
>> +# github.com/Microsoft/hcsshim v0.11.1
>> +## explicit
>>  # github.com/aws/aws-sdk-go-v2 v1.17.6
>>  ## explicit
>>  # github.com/aws/aws-sdk-go-v2/config v1.18.16
>> @@ -120,26 +124,16 @@
>>  ## explicit
>>  # github.com/beorn7/perks v1.0.1
>>  ## explicit
>> -# github.com/bugsnag/bugsnag-go v1.5.0
>> -## explicit
>>  # github.com/cenkalti/backoff/v4 v4.2.0
>>  ## explicit
>>  # github.com/cespare/xxhash/v2 v2.2.0
>>  ## explicit
>> -# github.com/cloudflare/cfssl v1.6.4
>> +# github.com/containerd/continuity v0.4.2
>>  ## explicit
>> -# github.com/containerd/continuity v0.4.1
>> +# github.com/containerd/log v0.1.0
>>  ## explicit
>>  # github.com/containerd/typeurl/v2 v2.1.1
>>  ## explicit
>> -# github.com/cucumber/gherkin-go/v19 v19.0.3
>> -## explicit
>> -# github.com/cucumber/messages-go/v16 v16.0.1
>> -## explicit
>> -# github.com/cyphar/filepath-securejoin v0.2.3
>> -## explicit
>> -# github.com/davecgh/go-spew v1.1.1
>> -## explicit
>>  # github.com/docker/distribution v2.8.2+incompatible
>>  ## explicit
>>  # github.com/docker/docker-credential-helpers v0.7.0
>> @@ -166,8 +160,6 @@
>>  ## explicit
>>  # github.com/gofrs/flock v0.8.1
>>  ## explicit
>> -# github.com/gofrs/uuid v4.2.0+incompatible
>> -## explicit
>>  # github.com/gogo/googleapis v1.4.1
>>  ## explicit
>>  # github.com/gogo/protobuf v1.3.2
>> @@ -176,8 +168,6 @@
>>  ## explicit
>>  # github.com/google/gnostic v0.5.7-v3refs
>>  ## explicit
>> -# github.com/google/go-cmp v0.5.9
>> -## explicit
>>  # github.com/google/gofuzz v1.2.0
>>  ## explicit
>>  # github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
>> @@ -190,13 +180,7 @@
>>  ## explicit
>>  # github.com/hashicorp/errwrap v1.1.0
>>  ## explicit
>> -# github.com/hashicorp/go-immutable-radix v1.3.1
>> -## explicit
>> -# github.com/hashicorp/go-memdb v1.3.2
>> -## explicit
>> -# github.com/hashicorp/golang-lru v0.5.4
>> -## explicit
>> -# github.com/hashicorp/hcl v1.0.0
>> +# github.com/hashicorp/go-cleanhttp v0.5.2
>>  ## explicit
>>  # github.com/imdario/mergo v0.3.16
>>  ## explicit
>> @@ -204,8 +188,6 @@
>>  ## explicit
>>  # github.com/inconshreveable/mousetrap v1.1.0
>>  ## explicit
>> -# github.com/jinzhu/gorm v1.9.11
>> -## explicit
>>  # github.com/josharian/intern v1.0.0
>>  ## explicit
>>  # github.com/json-iterator/go v1.1.12
>> @@ -214,10 +196,6 @@
>>  ## explicit
>>  # github.com/klauspost/compress v1.16.5
>>  ## explicit
>> -# github.com/kr/pretty v0.3.0
>> -## explicit
>> -# github.com/magiconair/properties v1.8.6
>> -## explicit
>>  # github.com/mailru/easyjson v0.7.6
>>  ## explicit
>>  # github.com/mattn/go-colorable v0.1.13
>> @@ -250,11 +228,11 @@
>>  ## explicit
>>  # github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822
>>  ## explicit
>> -# github.com/opencontainers/runc v1.1.7
>> +# github.com/opencontainers/runc v1.1.9
>>  ## explicit
>>  # github.com/pelletier/go-toml v1.9.5
>>  ## explicit
>> -# github.com/pelletier/go-toml/v2 v2.0.5
>> +# github.com/pkg/errors v0.9.1
>>  ## explicit
>>  # github.com/pmezard/go-difflib v1.0.0
>>  ## explicit
>> @@ -274,14 +252,6 @@
>>  ## explicit
>>  # github.com/shibumi/go-pathspec v1.3.0
>>  ## explicit
>> -# github.com/spf13/afero v1.9.2
>> -## explicit
>> -# github.com/spf13/cast v1.5.0
>> -## explicit
>> -# github.com/spf13/jwalterweatherman v1.1.0
>> -## explicit
>> -# github.com/subosito/gotenv v1.4.1
>> -## explicit
>>  # github.com/tonistiigi/fsutil v0.0.0-20230629203738-36ef4d8c0dbb
>>  ## explicit
>>  # github.com/tonistiigi/units v0.0.0-20180711220420-6950e57a87ea
>> @@ -294,8 +264,6 @@
>>  ## explicit
>>  # github.com/xeipuuv/gojsonschema v1.2.0
>>  ## explicit
>> -# github.com/zmap/zcrypto v0.0.0-20220605182715-4dfcec6e9a8c
>> -## explicit
>>  # go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/ot=
elgrpc v0.40.0
>>  ## explicit
>>  # go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelht=
tptrace v0.40.0
>> @@ -310,21 +278,17 @@
>>  ## explicit
>>  # go.opentelemetry.io/proto/otlp v0.19.0
>>  ## explicit
>> -# golang.org/x/crypto v0.7.0
>> -## explicit
>> -# golang.org/x/exp v0.0.0-20230713183714-613f0c0eb8a1
>> +# golang.org/x/crypto v0.14.0
>>  ## explicit
>>  # golang.org/x/mod v0.11.0
>>  ## explicit
>> -# golang.org/x/net v0.9.0
>> +# golang.org/x/net v0.17.0
>>  ## explicit
>> -# golang.org/x/oauth2 v0.7.0
>> +# golang.org/x/oauth2 v0.11.0
>>  ## explicit
>> -# golang.org/x/sys v0.7.0
>> +# golang.org/x/term v0.13.0
>>  ## explicit
>> -# golang.org/x/term v0.7.0
>> -## explicit
>> -# golang.org/x/text v0.9.0
>> +# golang.org/x/text v0.13.0
>>  ## explicit
>>  # golang.org/x/time v0.3.0
>>  ## explicit
>> @@ -332,25 +296,25 @@
>>  ## explicit
>>  # google.golang.org/appengine v1.6.7
>>  ## explicit
>> -# google.golang.org/genproto v0.0.0-20230526161137-0005af68ea54
>> +# google.golang.org/genproto v0.0.0-20230822172742-b8732ec3820d
>>  ## explicit
>> -# google.golang.org/genproto/googleapis/api v0.0.0-20230525234035-dd9d6=
82886f9
>> +# google.golang.org/genproto/googleapis/api v0.0.0-20230822172742-b8732=
ec3820d
>>  ## explicit
>> -# google.golang.org/genproto/googleapis/rpc v0.0.0-20230525234030-28d54=
90b6b19
>> +# google.golang.org/genproto/googleapis/rpc v0.0.0-20230822172742-b8732=
ec3820d
>>  ## explicit
>> -# google.golang.org/protobuf v1.30.0
>> +# google.golang.org/protobuf v1.31.0
>>  ## explicit
>>  # gopkg.in/inf.v0 v0.9.1
>>  ## explicit
>> -# gopkg.in/ini.v1 v1.67.0
>> +# gopkg.in/yaml.v2 v2.4.0
>>  ## explicit
>>  # gopkg.in/yaml.v3 v3.0.1
>>  ## explicit
>> -# k8s.io/api v0.26.2
>> +# k8s.io/api v0.26.7
>>  ## explicit
>> -# k8s.io/apimachinery v0.26.2
>> +# k8s.io/apimachinery v0.26.7
>>  ## explicit
>> -# k8s.io/client-go v0.26.2
>> +# k8s.io/client-go v0.26.7
>>  ## explicit
>>  # k8s.io/klog/v2 v2.90.1
>>  ## explicit
>> @@ -364,4 +328,3 @@
>>  ## explicit
>>  # sigs.k8s.io/yaml v1.3.0
>>  ## explicit
>> -# github.com/cucumber/godog =3D> github.com/laurazard/godog v0.0.0-2022=
0922095256-4c4b17abdae7
>> diff --git a/recipes-containers/docker-compose/relocation.inc b/recipes-=
containers/docker-compose/relocation.inc
>> index 9e6eacf..daa5be2 100644
>> --- a/recipes-containers/docker-compose/relocation.inc
>> +++ b/recipes-containers/docker-compose/relocation.inc
>> @@ -3,12 +3,11 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>>             k8s.io/klog/v2:k8s.io/klog/v2:force \
>>             gotest.tools/v3:gotest.tools/v3:force \
>>             gopkg.in/inf.v0:gopkg.in/inf.v0:force \
>> -           gopkg.in/ini.v1:gopkg.in/ini.v1:force \
>> -           gopkg.in/yaml.v2:gopkg.in/yaml.v2:force \
>>             golang.org/x/exp:golang.org/x/exp:force \
>> +           golang.org/x/sys:golang.org/x/sys:force \
>>             golang.org/x/mod:golang.org/x/mod:force \
>>             golang.org/x/net:golang.org/x/net:force \
>> -           golang.org/x/sys:golang.org/x/sys:force \
>> +           gopkg.in/yaml.v2:gopkg.in/yaml.v2:force \
>>             gopkg.in/yaml.v3:gopkg.in/yaml.v3:force \
>>             k8s.io/client-go:k8s.io/client-go:force \
>>             sigs.k8s.io/json:sigs.k8s.io/json:force \
>> @@ -19,63 +18,54 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>>             golang.org/x/time:golang.org/x/time:force \
>>             go.uber.org/goleak:go.uber.org/goleak:force \
>>             golang.org/x/tools:golang.org/x/tools:force \
>> -           github.com/adrg/xdg:github.com/adrg/xdg:force \
>>             golang.org/x/crypto:golang.org/x/crypto:force \
>>             golang.org/x/oauth2:golang.org/x/oauth2:force \
>>             k8s.io/apimachinery:k8s.io/apimachinery:force \
>>             k8s.io/kube-openapi:k8s.io/kube-openapi:force \
>>             github.com/moby/term:github.com/moby/term:force \
>>             github.com/docker/go:github.com/docker/go:force \
>> -           github.com/kr/pretty:github.com/kr/pretty:force \
>>             github.com/docker/cli:github.com/docker/cli:force \
>> -           github.com/pkg/errors:github.com/pkg/errors:force \
>> -           github.com/gofrs/uuid:github.com/gofrs/uuid:force \
>>             github.com/mgutz/ansi:github.com/mgutz/ansi:force \
>> -           github.com/spf13/cast:github.com/spf13/cast:force \
>> +           github.com/pkg/errors:github.com/pkg/errors:force \
>>             github.com/golang/mock:github.com/golang/mock:force \
>>             github.com/spf13/cobra:github.com/spf13/cobra:force \
>>             github.com/spf13/pflag:github.com/spf13/pflag:force \
>>             google.golang.org/grpc:google.golang.org/grpc:force \
>>             github.com/gofrs/flock:github.com/gofrs/flock:force \
>>             github.com/gorilla/mux:github.com/gorilla/mux:force \
>> -           github.com/jinzhu/gorm:github.com/jinzhu/gorm:force \
>>             github.com/moby/locker:github.com/moby/locker:force \
>>             github.com/rivo/uniseg:github.com/rivo/uniseg:force \
>> -           github.com/spf13/afero:github.com/spf13/afero:force \
>>             github.com/buger/goterm:github.com/buger/goterm:force \
>>             github.com/morikuni/aec:github.com/morikuni/aec:force \
>> +           github.com/otiai10/copy:github.com/otiai10/copy:force \
>>             github.com/beorn7/perks:github.com/beorn7/perks:force \
>>             github.com/go-logr/logr:github.com/go-logr/logr:force \
>>             github.com/go-logr/stdr:github.com/go-logr/stdr:force \
>>             github.com/google/shlex:github.com/google/shlex:force \
>>             github.com/miekg/pkcs11:github.com/miekg/pkcs11:force \
>> -           github.com/zmap/zcrypto:github.com/zmap/zcrypto:force \
>>             github.com/docker/buildx:github.com/docker/buildx:force \
>>             github.com/docker/docker:github.com/docker/docker:force \
>> +           github.com/google/go-cmp:github.com/google/go-cmp:force \
>>             github.com/moby/buildkit:github.com/moby/buildkit:force \
>>             go.opentelemetry.io/otel:go.opentelemetry.io/otel:force \
>>             github.com/aws/smithy-go:github.com/aws/smithy-go:force \
>>             github.com/gogo/protobuf:github.com/gogo/protobuf:force \
>> -           github.com/google/go-cmp:github.com/google/go-cmp:force \
>>             github.com/google/gofuzz:github.com/google/gofuzz:force \
>> -           github.com/hashicorp/hcl:github.com/hashicorp/hcl:force \
>>             github.com/imdario/mergo:github.com/imdario/mergo:force \
>> +           github.com/containerd/log:github.com/containerd/log:force \
>>             github.com/google/gnostic:github.com/google/gnostic:force \
>> -           github.com/cucumber/godog:github.com/laurazard/godog:force \
>> +           github.com/davecgh/go-spew:github.com/davecgh/go-spew:force =
\
>>             github.com/docker/go-units:github.com/docker/go-units:force =
\
>>             github.com/sirupsen/logrus:github.com/sirupsen/logrus:force =
\
>> -           github.com/davecgh/go-spew:github.com/davecgh/go-spew:force =
\
>>             github.com/go-openapi/swag:github.com/go-openapi/swag:force =
\
>>             github.com/gogo/googleapis:github.com/gogo/googleapis:force =
\
>>             github.com/golang/protobuf:github.com/golang/protobuf:force =
\
>>             github.com/mailru/easyjson:github.com/mailru/easyjson:force =
\
>>             github.com/mattn/go-isatty:github.com/mattn/go-isatty:force =
\
>>             github.com/moby/spdystream:github.com/moby/spdystream:force =
\
>> -           github.com/subosito/gotenv:github.com/subosito/gotenv:force =
\
>>             google.golang.org/genproto:google.golang.org/genproto:force =
\
>>             google.golang.org/protobuf:google.golang.org/protobuf:force =
\
>>             github.com/stretchr/testify:github.com/stretchr/testify:forc=
e \
>> -           github.com/cloudflare/cfssl:github.com/cloudflare/cfssl:forc=
e \
>>             github.com/josharian/intern:github.com/josharian/intern:forc=
e \
>>             github.com/json-iterator/go:github.com/json-iterator/go:forc=
e \
>>             github.com/serialx/hashring:github.com/serialx/hashring:forc=
e \
>> @@ -85,6 +75,7 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>>             github.com/fsnotify/fsevents:github.com/fsnotify/fsevents:fo=
rce \
>>             github.com/tilt-dev/fsnotify:github.com/tilt-dev/fsnotify:fo=
rce \
>>             github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm:fo=
rce \
>> +           github.com/Microsoft/hcsshim:github.com/Microsoft/hcsshim:fo=
rce \
>>             github.com/aws/aws-sdk-go-v2:github.com/aws/aws-sdk-go-v2:fo=
rce \
>>             github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2:fo=
rce \
>>             github.com/docker/go-metrics:github.com/docker/go-metrics:fo=
rce \
>> @@ -97,9 +88,7 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>>             github.com/tonistiigi/fsutil:github.com/tonistiigi/fsutil:fo=
rce \
>>             github.com/Microsoft/go-winio:github.com/Microsoft/go-winio:=
force \
>>             github.com/containerd/console:github.com/containerd/console:=
force \
>> -           github.com/bugsnag/bugsnag-go:github.com/bugsnag/bugsnag-go:=
force \
>>             github.com/fvbommel/sortorder:github.com/fvbommel/sortorder:=
force \
>> -           github.com/hashicorp/go-memdb:github.com/hashicorp/go-memdb:=
force \
>>             github.com/klauspost/compress:github.com/klauspost/compress:=
force \
>>             github.com/mattn/go-colorable:github.com/mattn/go-colorable:=
force \
>>             github.com/mattn/go-runewidth:github.com/mattn/go-runewidth:=
force \
>> @@ -116,10 +105,8 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>>             github.com/shibumi/go-pathspec:github.com/shibumi/go-pathspe=
c:force \
>>             github.com/docker/cli-docs-tool:github.com/docker/cli-docs-t=
ool:force \
>>             github.com/hashicorp/go-version:github.com/hashicorp/go-vers=
ion:force \
>> -           github.com/hashicorp/golang-lru:github.com/hashicorp/golang-=
lru:force \
>>             github.com/moby/sys/symlink:github.com/moby/sys/symlink/syml=
ink:force \
>>             github.com/modern-go/concurrent:github.com/modern-go/concurr=
ent:force \
>> -           github.com/pelletier/go-toml/v2:github.com/pelletier/go-toml=
/v2:force \
>>             github.com/xeipuuv/gojsonschema:github.com/xeipuuv/gojsonsch=
ema:force \
>>             github.com/AlecAivazis/survey/v2:github.com/AlecAivazis/surv=
ey/v2:force \
>>             github.com/containerd/containerd:github.com/containerd/conta=
inerd:force \
>> @@ -127,25 +114,23 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>>             github.com/Masterminds/semver/v3:github.com/Masterminds/semv=
er/v3:force \
>>             github.com/containerd/continuity:github.com/containerd/conti=
nuity:force \
>>             github.com/containerd/typeurl/v2:github.com/containerd/typeu=
rl/v2:force \
>> -           github.com/magiconair/properties:github.com/magiconair/prope=
rties:force \
>>             github.com/xeipuuv/gojsonpointer:github.com/xeipuuv/gojsonpo=
inter:force \
>>             go.opentelemetry.io/proto/otlp:go.opentelemetry.io/proto/otl=
p/otlp:force \
>> +           github.com/distribution/reference:github.com/distribution/re=
ference:force \
>>             github.com/mitchellh/mapstructure:github.com/mitchellh/mapst=
ructure:force \
>>             go.opentelemetry.io/otel/trace:go.opentelemetry.io/otel/trac=
e/trace:force \
>>             github.com/emicklei/go-restful/v3:github.com/emicklei/go-res=
tful/v3:force \
>>             github.com/go-openapi/jsonpointer:github.com/go-openapi/json=
pointer:force \
>> +           github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cl=
eanhttp:force \
>>             github.com/in-toto/in-toto-golang:github.com/in-toto/in-toto=
-golang:force \
>>             github.com/kballard/go-shellquote:github.com/kballard/go-she=
llquote:force \
>>             github.com/compose-spec/compose-go:github.com/compose-spec/c=
ompose-go:force \
>>             github.com/hashicorp/go-multierror:github.com/hashicorp/go-m=
ultierror:force \
>> -           github.com/cucumber/gherkin-go/v19:github.com/cucumber/gherk=
in-go/v19:force \
>>             github.com/moby/sys/mountinfo:github.com/moby/sys/mountinfo/=
mountinfo:force \
>>             github.com/prometheus/client_model:github.com/prometheus/cli=
ent_model:force \
>> -           github.com/spf13/jwalterweatherman:github.com/spf13/jwalterw=
eatherman:force \
>>             github.com/xeipuuv/gojsonreference:github.com/xeipuuv/gojson=
reference:force \
>>             go.opentelemetry.io/otel/metric:go.opentelemetry.io/otel/met=
ric/metric:force \
>>             github.com/opencontainers/go-digest:github.com/opencontainer=
s/go-digest:force \
>> -           github.com/cucumber/messages-go/v16:github.com/cucumber/mess=
ages-go/v16:force \
>>             github.com/go-openapi/jsonreference:github.com/go-openapi/js=
onreference:force \
>>             github.com/prometheus/client_golang:github.com/prometheus/cl=
ient_golang:force \
>>             github.com/moby/sys/sequential:github.com/moby/sys/sequentia=
l/sequential:force \
>> @@ -154,10 +139,7 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>>             github.com/AdaLogics/go-fuzz-headers:github.com/AdaLogics/go=
-fuzz-headers:force \
>>             github.com/inconshreveable/mousetrap:github.com/inconshrevea=
ble/mousetrap:force \
>>             sigs.k8s.io/structured-merge-diff/v4:sigs.k8s.io/structured-=
merge-diff/v4:force \
>> -           github.com/cyphar/filepath-securejoin:github.com/cyphar/file=
path-securejoin:force \
>>             github.com/aws/aws-sdk-go-v2/config:github.com/aws/aws-sdk-g=
o-v2/config/config:force \
>> -           github.com/distribution/distribution/v3:github.com/distribut=
ion/distribution/v3:force \
>> -           github.com/hashicorp/go-immutable-radix:github.com/hashicorp=
/go-immutable-radix:force \
>>             github.com/grpc-ecosystem/grpc-gateway/v2:github.com/grpc-ec=
osystem/grpc-gateway/v2:force \
>>             github.com/docker/docker-credential-helpers:github.com/docke=
r/docker-credential-helpers:force \
>>             github.com/grpc-ecosystem/go-grpc-middleware:github.com/grpc=
-ecosystem/go-grpc-middleware:force \
>> diff --git a/recipes-containers/docker-compose/src_uri.inc b/recipes-con=
tainers/docker-compose/src_uri.inc
>> index 8897c9c..32a16b3 100644
>> --- a/recipes-containers/docker-compose/src_uri.inc
>> +++ b/recipes-containers/docker-compose/src_uri.inc
>> @@ -1,6 +1,6 @@
>> -#       k8s.io/api v0.26.2
>> -# [1] git ls-remote https://github.com/kubernetes/api 1528256abbdf8ff25=
10112b28a6aacd239789a36
>> -SRCREV_k8s.io-api=3D"1528256abbdf8ff2510112b28a6aacd239789a36"
>> +#       k8s.io/api v0.26.7
>> +# [1] git ls-remote https://github.com/kubernetes/api 145ce6cdaea22991c=
53ba9c7ee7aabae5181cb3e
>> +SRCREV_k8s.io-api=3D"145ce6cdaea22991c53ba9c7ee7aabae5181cb3e"
>>  SRC_URI +=3D "git://github.com/kubernetes/api;name=3Dk8s.io-api;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/k8s.io/api"
>>
>>  #       k8s.io/utils v0.0.0-20230220204549-a5ecb0141aa5
>> @@ -13,54 +13,49 @@ SRC_URI +=3D "git://github.com/kubernetes/utils;name=
=3Dutils;protocol=3Dhttps;nobranch
>>  SRCREV_klog-v2=3D"d7fc50528570f8276de46570f916682257821e22"
>>  SRC_URI +=3D "git://github.com/kubernetes/klog;name=3Dklog-v2;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/k8s.io/klog/v2"
>>
>> -#       gotest.tools/v3 v3.5.0
>> -# [1] git ls-remote https://github.com/gotestyourself/gotest.tools a80f=
057529047c44e1a85d0d017b200787e537e0
>> -SRCREV_gotest.tools-v3=3D"a80f057529047c44e1a85d0d017b200787e537e0"
>> -SRC_URI +=3D "git://github.com/gotestyourself/gotest.tools;name=3Dgotes=
t.tools-v3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/=
import/vendor.fetch/gotest.tools/v3"
>> +#       gotest.tools/v3 v3.5.1
>> +# [1] git ls-remote https://github.com/gotestyourself/gotest.tools 81ce=
a1abc596b025bf2573c7fdf97740512e4c6c
>> +SRCREV_v3=3D"81cea1abc596b025bf2573c7fdf97740512e4c6c"
>> +SRC_URI +=3D "git://github.com/gotestyourself/gotest.tools;name=3Dv3;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/gotest.tools/v3"
>>
>>  #       gopkg.in/inf.v0 v0.9.1
>>  # [1] git ls-remote https://github.com/go-inf/inf d2d2541c53f18d2a05945=
7998ce2876cc8e67cbf
>>  SRCREV_inf.v0=3D"d2d2541c53f18d2a059457998ce2876cc8e67cbf"
>>  SRC_URI +=3D "git://github.com/go-inf/inf;name=3Dinf.v0;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.=
in/inf.v0"
>>
>> -#       gopkg.in/ini.v1 v1.67.0
>> -# [1] git ls-remote https://github.com/go-ini/ini b2f570e5b5b844226bbef=
e6fb521d891f529a951
>> -SRCREV_ini.v1=3D"b2f570e5b5b844226bbefe6fb521d891f529a951"
>> -SRC_URI +=3D "git://github.com/go-ini/ini;name=3Dini.v1;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.=
in/ini.v1"
>> -
>> -#       gopkg.in/yaml.v2 v2.4.0
>> -# [1] git ls-remote https://github.com/go-yaml/yaml 7649d4548cb53a614db=
133b2a8ac1f31859dda8c
>> -SRCREV_yaml.v2=3D"7649d4548cb53a614db133b2a8ac1f31859dda8c"
>> -SRC_URI +=3D "git://github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gop=
kg.in/yaml.v2"
>> -
>>  #       golang.org/x/exp v0.0.0-20230713183714-613f0c0eb8a1
>>  # [1] git ls-remote https://go.googlesource.com/exp 613f0c0eb8a17a98ecd=
b096a7f9f7d5053c1c963
>>  SRCREV_exp=3D"613f0c0eb8a17a98ecdb096a7f9f7d5053c1c963"
>>  SRC_URI +=3D "git://go.googlesource.com/exp;name=3Dexp;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.=
org/x/exp"
>>
>> +#       golang.org/x/sys v0.14.0
>> +# [1] git ls-remote https://go.googlesource.com/sys cb378ae1ff8cd45e69d=
4f172df8370bc844e1f86
>> +SRCREV_sys=3D"cb378ae1ff8cd45e69d4f172df8370bc844e1f86"
>> +SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.=
org/x/sys"
>> +
>>  #       golang.org/x/mod v0.11.0
>>  # [1] git ls-remote https://go.googlesource.com/mod 62c7e578f1a7275d934=
c99dd48715525bd52b17e
>>  SRCREV_mod=3D"62c7e578f1a7275d934c99dd48715525bd52b17e"
>>  SRC_URI +=3D "git://go.googlesource.com/mod;name=3Dmod;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.=
org/x/mod"
>>
>> -#       golang.org/x/net v0.9.0
>> -# [1] git ls-remote https://go.googlesource.com/net 694cff8668bac64e086=
4b552bffc280cd27f21b1
>> -SRCREV_net=3D"694cff8668bac64e0864b552bffc280cd27f21b1"
>> +#       golang.org/x/net v0.17.0
>> +# [1] git ls-remote https://go.googlesource.com/net b225e7ca6dde1ef5a5a=
e5ce922861bda011cfabd
>> +SRCREV_net=3D"b225e7ca6dde1ef5a5ae5ce922861bda011cfabd"
>>  SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.=
org/x/net"
>>
>> -#       golang.org/x/sys v0.7.0
>> -# [1] git ls-remote https://go.googlesource.com/sys 64840c112d2335ed987=
4114aed48f946e778a769
>> -SRCREV_sys=3D"64840c112d2335ed9874114aed48f946e778a769"
>> -SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.=
org/x/sys"
>> +#       gopkg.in/yaml.v2 v2.4.0
>> +# [1] git ls-remote https://github.com/go-yaml/yaml 7649d4548cb53a614db=
133b2a8ac1f31859dda8c
>> +SRCREV_yaml.v2=3D"7649d4548cb53a614db133b2a8ac1f31859dda8c"
>> +SRC_URI +=3D "git://github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gop=
kg.in/yaml.v2"
>>
>>  #       gopkg.in/yaml.v3 v3.0.1
>>  # [1] git ls-remote https://github.com/go-yaml/yaml f6f7691b1fdeb513f56=
608cd2c32c51f8194bf51
>>  SRCREV_yaml.v3=3D"f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
>>  SRC_URI +=3D "git://github.com/go-yaml/yaml;name=3Dyaml.v3;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gop=
kg.in/yaml.v3"
>>
>> -#       k8s.io/client-go v0.26.2
>> -# [1] git ls-remote https://github.com/kubernetes/client-go 620cb606753=
40a9ca825fd5082b0d500f9b62e90
>> -SRCREV_client-go=3D"620cb60675340a9ca825fd5082b0d500f9b62e90"
>> +#       k8s.io/client-go v0.26.7
>> +# [1] git ls-remote https://github.com/kubernetes/client-go 30088cdd7e8=
d70b3000586d4e9e42e50684359ca
>> +SRCREV_client-go=3D"30088cdd7e8d70b3000586d4e9e42e50684359ca"
>>  SRC_URI +=3D "git://github.com/kubernetes/client-go;name=3Dclient-go;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/k8s.io/client-go"
>>
>>  #       sigs.k8s.io/json v0.0.0-20220713155537-f223a00ba0e2
>> @@ -73,19 +68,19 @@ SRC_URI +=3D "git://github.com/kubernetes-sigs/json;=
name=3Djson;protocol=3Dhttps;nobra
>>  SRCREV_yaml=3D"9535b3b1e2893fe44efb37c5c9f5665e245d786a"
>>  SRC_URI +=3D "git://github.com/kubernetes-sigs/yaml;name=3Dyaml;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/sigs.k8s.io/yaml"
>>
>> -#       golang.org/x/sync v0.3.0
>> -# [1] git ls-remote https://go.googlesource.com/sync 93782cc822b6b554cb=
7df40332fd010f0473cbc8
>> -SRCREV_sync=3D"93782cc822b6b554cb7df40332fd010f0473cbc8"
>> +#       golang.org/x/sync v0.5.0
>> +# [1] git ls-remote https://go.googlesource.com/sync 10739b037d369c748d=
671b216356d7e04ce68da1
>> +SRCREV_sync=3D"10739b037d369c748d671b216356d7e04ce68da1"
>>  SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golan=
g.org/x/sync"
>>
>> -#       golang.org/x/term v0.7.0
>> -# [1] git ls-remote https://go.googlesource.com/term 7ae6be6d0150527c2c=
41e70586b9ade6a972a186
>> -SRCREV_x-term=3D"7ae6be6d0150527c2c41e70586b9ade6a972a186"
>> +#       golang.org/x/term v0.13.0
>> +# [1] git ls-remote https://go.googlesource.com/term ea6303ae752eaacd89=
7fec4b7534b74c56e1d787
>> +SRCREV_x-term=3D"ea6303ae752eaacd897fec4b7534b74c56e1d787"
>>  SRC_URI +=3D "git://go.googlesource.com/term;name=3Dx-term;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gol=
ang.org/x/term"
>>
>> -#       golang.org/x/text v0.9.0
>> -# [1] git ls-remote https://go.googlesource.com/text 48e4a4a957429d3132=
8a685863b594ca9a06b552
>> -SRCREV_text=3D"48e4a4a957429d31328a685863b594ca9a06b552"
>> +#       golang.org/x/text v0.13.0
>> +# [1] git ls-remote https://go.googlesource.com/text f488e191e67ed95a5b=
9b7b39024e5a5f5f1ffd02
>> +SRCREV_text=3D"f488e191e67ed95a5b9b7b39024e5a5f5f1ffd02"
>>  SRC_URI +=3D "git://go.googlesource.com/text;name=3Dtext;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golan=
g.org/x/text"
>>
>>  #       golang.org/x/time v0.3.0
>> @@ -93,9 +88,9 @@ SRC_URI +=3D "git://go.googlesource.com/text;name=3Dte=
xt;protocol=3Dhttps;nobranch=3D1;d
>>  SRCREV_time=3D"2c09566ef13fb5556401ddff3c53c3dbc2a42dac"
>>  SRC_URI +=3D "git://go.googlesource.com/time;name=3Dtime;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golan=
g.org/x/time"
>>
>> -#       go.uber.org/goleak v1.2.1
>> -# [1] git ls-remote https://github.com/uber-go/goleak 83c7e126390f1508c=
a9cb8e87d70849b55181104
>> -SRCREV_goleak=3D"83c7e126390f1508ca9cb8e87d70849b55181104"
>> +#       go.uber.org/goleak v1.3.0
>> +# [1] git ls-remote https://github.com/uber-go/goleak 31095c657c34bba40=
5a8d480db27989aa5f60b9c
>> +SRCREV_goleak=3D"31095c657c34bba405a8d480db27989aa5f60b9c"
>>  SRC_URI +=3D "git://github.com/uber-go/goleak;name=3Dgoleak;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.uber.org/goleak"
>>
>>  #       golang.org/x/tools v0.7.0
>> @@ -103,24 +98,19 @@ SRC_URI +=3D "git://github.com/uber-go/goleak;name=
=3Dgoleak;protocol=3Dhttps;nobranch=3D
>>  SRCREV_tools=3D"031fc75960d487b0b15db12fb328676236a3a39c"
>>  SRC_URI +=3D "git://go.googlesource.com/tools;name=3Dtools;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gol=
ang.org/x/tools"
>>
>> -#       github.com/adrg/xdg v0.4.0
>> -# [1] git ls-remote https://github.com/adrg/xdg 4ec40e24f0cf1039f93c773=
f2984decdea9719b5
>> -SRCREV_xdg=3D"4ec40e24f0cf1039f93c773f2984decdea9719b5"
>> -SRC_URI +=3D "git://github.com/adrg/xdg;name=3Dxdg;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
adrg/xdg"
>> -
>> -#       golang.org/x/crypto v0.7.0
>> -# [1] git ls-remote https://go.googlesource.com/crypto 776e461a4e6d8b37=
2a43c72122c5c28cfc40dca2
>> -SRCREV_crypto=3D"776e461a4e6d8b372a43c72122c5c28cfc40dca2"
>> +#       golang.org/x/crypto v0.14.0
>> +# [1] git ls-remote https://go.googlesource.com/crypto e3cc52e598e302f8=
c613a645bb7231264d8ec995
>> +SRCREV_crypto=3D"e3cc52e598e302f8c613a645bb7231264d8ec995"
>>  SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/golang.org/x/crypto"
>>
>> -#       golang.org/x/oauth2 v0.7.0
>> -# [1] git ls-remote https://go.googlesource.com/oauth2 36075149c5b89480=
def496c735b8a1ba5fc63218
>> -SRCREV_oauth2=3D"36075149c5b89480def496c735b8a1ba5fc63218"
>> +#       golang.org/x/oauth2 v0.11.0
>> +# [1] git ls-remote https://go.googlesource.com/oauth2 2e4a4e2bfb69ca76=
09cb423438c55caa131431c1
>> +SRCREV_oauth2=3D"2e4a4e2bfb69ca7609cb423438c55caa131431c1"
>>  SRC_URI +=3D "git://go.googlesource.com/oauth2;name=3Doauth2;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/golang.org/x/oauth2"
>>
>> -#       k8s.io/apimachinery v0.26.2
>> -# [1] git ls-remote https://github.com/kubernetes/apimachinery 53ecdf01=
b997ca93c7db7615dfe7b27ad8391983
>> -SRCREV_apimachinery=3D"53ecdf01b997ca93c7db7615dfe7b27ad8391983"
>> +#       k8s.io/apimachinery v0.26.7
>> +# [1] git ls-remote https://github.com/kubernetes/apimachinery dd463891=
97a396927dadb194ae5fc9dbebeb5a31
>> +SRCREV_apimachinery=3D"dd46389197a396927dadb194ae5fc9dbebeb5a31"
>>  SRC_URI +=3D "git://github.com/kubernetes/apimachinery;name=3Dapimachin=
ery;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/k8s.io/apimachinery"
>>
>>  #       k8s.io/kube-openapi v0.0.0-20221012153701-172d655c2280
>> @@ -138,44 +128,29 @@ SRC_URI +=3D "git://github.com/moby/term;name=3Dte=
rm;protocol=3Dhttps;nobranch=3D1;dests
>>  SRCREV_go=3D"d30aec9fd63c35133f8f79c3412ad91a3b08be06"
>>  SRC_URI +=3D "git://github.com/docker/go;name=3Dgo;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
docker/go"
>>
>> -#       github.com/kr/pretty v0.3.0
>> -# [1] git ls-remote https://github.com/kr/pretty a883a8422cd235c67c6c4f=
dcb7bbb022143e10b1
>> -SRCREV_pretty=3D"a883a8422cd235c67c6c4fdcb7bbb022143e10b1"
>> -SRC_URI +=3D "git://github.com/kr/pretty;name=3Dpretty;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/kr/pretty"
>> -
>> -#       github.com/docker/cli v24.0.5+incompatible
>> -# [1] git ls-remote https://github.com/docker/cli ced099660009713e0e845=
eeb754e6050dbaa45d0
>> -SRCREV_cli=3D"ced099660009713e0e845eeb754e6050dbaa45d0"
>> +#       github.com/docker/cli v24.0.7+incompatible
>> +# [1] git ls-remote https://github.com/docker/cli afdd53b4e341be38d2056=
a42113b938559bb1d94
>> +SRCREV_cli=3D"afdd53b4e341be38d2056a42113b938559bb1d94"
>>  SRC_URI +=3D "git://github.com/docker/cli;name=3Dcli;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/docker/cli"
>>
>> -#       github.com/pkg/errors v0.9.1
>> -# [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c17=
67a985424175c39b465
>> -SRCREV_errors=3D"614d223910a179a466c1767a985424175c39b465"
>> -SRC_URI +=3D "git://github.com/pkg/errors;name=3Derrors;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/pkg/errors"
>> -
>> -#       github.com/gofrs/uuid v4.2.0+incompatible
>> -# [1] git ls-remote https://github.com/gofrs/uuid 0c84a43ce25087b704183=
3685982950a65630d28
>> -SRCREV_uuid=3D"0c84a43ce25087b7041833685982950a65630d28"
>> -SRC_URI +=3D "git://github.com/gofrs/uuid;name=3Duuid;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/gofrs/uuid"
>> -
>>  #       github.com/mgutz/ansi v0.0.0-20170206155736-9520e82c474b
>>  # [1] git ls-remote https://github.com/mgutz/ansi 9520e82c474b0a04dd04f=
8a40959027271bab992
>>  SRCREV_ansi=3D"9520e82c474b0a04dd04f8a40959027271bab992"
>>  SRC_URI +=3D "git://github.com/mgutz/ansi;name=3Dansi;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/mgutz/ansi"
>>
>> -#       github.com/spf13/cast v1.5.0
>> -# [1] git ls-remote https://github.com/spf13/cast 2b0eb0f724e320b655240=
e331aef36d1175986c2
>> -SRCREV_cast=3D"2b0eb0f724e320b655240e331aef36d1175986c2"
>> -SRC_URI +=3D "git://github.com/spf13/cast;name=3Dcast;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/spf13/cast"
>> +#       github.com/pkg/errors v0.9.1
>> +# [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c17=
67a985424175c39b465
>> +SRCREV_errors=3D"614d223910a179a466c1767a985424175c39b465"
>> +SRC_URI +=3D "git://github.com/pkg/errors;name=3Derrors;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/pkg/errors"
>>
>>  #       github.com/golang/mock v1.6.0
>>  # [1] git ls-remote https://github.com/golang/mock aba2ff9a6844d5e3289e=
8472d3217d5b3090f083
>>  SRCREV_mock=3D"aba2ff9a6844d5e3289e8472d3217d5b3090f083"
>>  SRC_URI +=3D "git://github.com/golang/mock;name=3Dmock;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/golang/mock"
>>
>> -#       github.com/spf13/cobra v1.7.0
>> -# [1] git ls-remote https://github.com/spf13/cobra 4dd4b25de38418174a6e=
859e8a32eaccca32dccc
>> -SRCREV_cobra=3D"4dd4b25de38418174a6e859e8a32eaccca32dccc"
>> +#       github.com/spf13/cobra v1.8.0
>> +# [1] git ls-remote https://github.com/spf13/cobra a0a6ae020bb3899ff027=
6067863e50523f897370
>> +SRCREV_cobra=3D"a0a6ae020bb3899ff0276067863e50523f897370"
>>  SRC_URI +=3D "git://github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/spf13/cobra"
>>
>>  #       github.com/spf13/pflag v1.0.5
>> @@ -183,9 +158,9 @@ SRC_URI +=3D "git://github.com/spf13/cobra;name=3Dco=
bra;protocol=3Dhttps;nobranch=3D1;de
>>  SRCREV_pflag=3D"2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
>>  SRC_URI +=3D "git://github.com/spf13/pflag;name=3Dpflag;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/spf13/pflag"
>>
>> -#       google.golang.org/grpc v1.57.0
>> -# [1] git ls-remote https://github.com/grpc/grpc-go 87bf02ad24f6cc071d2=
553eb5d62332194bba1fe
>> -SRCREV_grpc=3D"87bf02ad24f6cc071d2553eb5d62332194bba1fe"
>> +#       google.golang.org/grpc v1.59.0
>> +# [1] git ls-remote https://github.com/grpc/grpc-go 7765221f4bf6104973d=
b7946d56936cf838cad46
>> +SRCREV_grpc=3D"7765221f4bf6104973db7946d56936cf838cad46"
>>  SRC_URI +=3D "git://github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google=
.golang.org/grpc"
>>
>>  #       github.com/gofrs/flock v0.8.1
>> @@ -198,11 +173,6 @@ SRC_URI +=3D "git://github.com/gofrs/flock;name=3Df=
lock;protocol=3Dhttps;nobranch=3D1;de
>>  SRCREV_mux=3D"98cb6bf42e086f6af920b965c38cacc07402d51b"
>>  SRC_URI +=3D "git://github.com/gorilla/mux;name=3Dmux;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/gorilla/mux"
>>
>> -#       github.com/jinzhu/gorm v1.9.11
>> -# [1] git ls-remote https://github.com/jinzhu/gorm 81c17a7e2529c59efc4e=
74c5b32c1fb71fb12fa2
>> -SRCREV_gorm=3D"81c17a7e2529c59efc4e74c5b32c1fb71fb12fa2"
>> -SRC_URI +=3D "git://github.com/jinzhu/gorm;name=3Dgorm;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/jinzhu/gorm"
>> -
>>  #       github.com/moby/locker v1.0.1
>>  # [1] git ls-remote https://github.com/moby/locker 281af2d563954745bea9=
d1487c965f24d30742fe
>>  SRCREV_locker=3D"281af2d563954745bea9d1487c965f24d30742fe"
>> @@ -213,11 +183,6 @@ SRC_URI +=3D "git://github.com/moby/locker;name=3Dl=
ocker;protocol=3Dhttps;nobranch=3D1;d
>>  SRCREV_uniseg=3D"75711fccf6a3e85bc74c241e2dddd06a9bc9e53d"
>>  SRC_URI +=3D "git://github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/rivo/uniseg"
>>
>> -#       github.com/spf13/afero v1.9.2
>> -# [1] git ls-remote https://github.com/spf13/afero 2a70f2bb2db1524bf2aa=
3ca0cfebefa8d6367b7b
>> -SRCREV_afero=3D"2a70f2bb2db1524bf2aa3ca0cfebefa8d6367b7b"
>> -SRC_URI +=3D "git://github.com/spf13/afero;name=3Dafero;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/spf13/afero"
>> -
>>  #       github.com/buger/goterm v1.0.4
>>  # [1] git ls-remote https://github.com/buger/goterm a73545aae7d693f786c=
e4cc687460efca4845f31
>>  SRCREV_goterm=3D"a73545aae7d693f786ce4cc687460efca4845f31"
>> @@ -228,6 +193,11 @@ SRC_URI +=3D "git://github.com/buger/goterm;name=3D=
goterm;protocol=3Dhttps;nobranch=3D1;
>>  SRCREV_aec=3D"39771216ff4c63d11f5e604076f9c45e8be1067b"
>>  SRC_URI +=3D "git://github.com/morikuni/aec;name=3Daec;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/morikuni/aec"
>>
>> +#       github.com/otiai10/copy v1.14.0
>> +# [1] git ls-remote https://github.com/otiai10/copy fba066acb0eb6e25d51=
0073787741c0a8b31bf1e
>> +SRCREV_copy=3D"fba066acb0eb6e25d510073787741c0a8b31bf1e"
>> +SRC_URI +=3D "git://github.com/otiai10/copy;name=3Dcopy;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/otiai10/copy"
>> +
>>  #       github.com/beorn7/perks v1.0.1
>>  # [1] git ls-remote https://github.com/beorn7/perks 37c8de3658fcb183f99=
7c4e13e8337516ab753e6
>>  SRCREV_perks=3D"37c8de3658fcb183f997c4e13e8337516ab753e6"
>> @@ -253,24 +223,24 @@ SRC_URI +=3D "git://github.com/google/shlex;name=
=3Dshlex;protocol=3Dhttps;nobranch=3D1;d
>>  SRCREV_pkcs11=3D"f3481918a208bd212aa995a41f92d786eb418a7d"
>>  SRC_URI +=3D "git://github.com/miekg/pkcs11;name=3Dpkcs11;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/miekg/pkcs11"
>>
>> -#       github.com/zmap/zcrypto v0.0.0-20220605182715-4dfcec6e9a8c
>> -# [1] git ls-remote https://github.com/zmap/zcrypto 4dfcec6e9a8c2014f73=
dd584e64dc797129d77b8
>> -SRCREV_zcrypto=3D"4dfcec6e9a8c2014f73dd584e64dc797129d77b8"
>> -SRC_URI +=3D "git://github.com/zmap/zcrypto;name=3Dzcrypto;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/zmap/zcrypto"
>> -
>> -#       github.com/docker/buildx v0.11.2
>> -# [1] git ls-remote https://github.com/docker/buildx 9872040b6626fb7d87=
ef7296fd5b832e8cc2ad17
>> -SRCREV_buildx=3D"9872040b6626fb7d87ef7296fd5b832e8cc2ad17"
>> +#       github.com/docker/buildx v0.12.0
>> +# [1] git ls-remote https://github.com/docker/buildx 542e5d810e4a1a1556=
84f5f3c5bd7e797632a12f
>> +SRCREV_buildx=3D"542e5d810e4a1a155684f5f3c5bd7e797632a12f"
>>  SRC_URI +=3D "git://github.com/docker/buildx;name=3Dbuildx;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/docker/buildx"
>>
>> -#       github.com/docker/docker v24.0.5+incompatible
>> -# [1] git ls-remote https://github.com/moby/moby a61e2b4c9c5f7c241aeb37=
f389b4444aee26bea4
>> -SRCREV_docker=3D"a61e2b4c9c5f7c241aeb37f389b4444aee26bea4"
>> +#       github.com/docker/docker v24.0.7+incompatible
>> +# [1] git ls-remote https://github.com/moby/moby 311b9ff0aa93aa55880e1e=
5f8871c4fb69583426
>> +SRCREV_docker=3D"311b9ff0aa93aa55880e1e5f8871c4fb69583426"
>>  SRC_URI +=3D "git://github.com/moby/moby;name=3Ddocker;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/docker/docker"
>>
>> -#       github.com/moby/buildkit v0.12.1
>> -# [1] git ls-remote https://github.com/moby/buildkit bb857a0d49f45aa0ce=
9cd554b78d4075553e20f9
>> -SRCREV_buildkit=3D"bb857a0d49f45aa0ce9cd554b78d4075553e20f9"
>> +#       github.com/google/go-cmp v0.6.0
>> +# [1] git ls-remote https://github.com/google/go-cmp c3ad8435e7bef96af3=
5732bc0789e5a2278c6d5f
>> +SRCREV_go-cmp=3D"c3ad8435e7bef96af35732bc0789e5a2278c6d5f"
>> +SRC_URI +=3D "git://github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/google/go-cmp"
>> +
>> +#       github.com/moby/buildkit v0.13.0-beta1.0.20231023114302-d5c1d78=
5b042
>> +# [1] git ls-remote https://github.com/moby/buildkit d5c1d785b042cf834a=
05b08b73479d55b6acb533
>> +SRCREV_buildkit=3D"d5c1d785b042cf834a05b08b73479d55b6acb533"
>>  SRC_URI +=3D "git://github.com/moby/buildkit;name=3Dbuildkit;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/moby/buildkit"
>>
>>  #       go.opentelemetry.io/otel v1.14.0
>> @@ -288,35 +258,30 @@ SRC_URI +=3D "git://github.com/aws/smithy-go;name=
=3Dsmithy-go;protocol=3Dhttps;nobranc
>>  SRCREV_protobuf=3D"b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
>>  SRC_URI +=3D "git://github.com/gogo/protobuf;name=3Dprotobuf;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/gogo/protobuf"
>>
>> -#       github.com/google/go-cmp v0.5.9
>> -# [1] git ls-remote https://github.com/google/go-cmp a97318bf6562f2ed26=
32c5f985db51b1bc5bdcd0
>> -SRCREV_go-cmp=3D"a97318bf6562f2ed2632c5f985db51b1bc5bdcd0"
>> -SRC_URI +=3D "git://github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/google/go-cmp"
>> -
>>  #       github.com/google/gofuzz v1.2.0
>>  # [1] git ls-remote https://github.com/google/gofuzz 379e164120fbc98885=
a8f494b5aa41ba94f64c56
>>  SRCREV_gofuzz=3D"379e164120fbc98885a8f494b5aa41ba94f64c56"
>>  SRC_URI +=3D "git://github.com/google/gofuzz;name=3Dgofuzz;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/google/gofuzz"
>>
>> -#       github.com/hashicorp/hcl v1.0.0
>> -# [1] git ls-remote https://github.com/hashicorp/hcl 8cb6e5b959231cc111=
9e43259c4a608f9c51a241
>> -SRCREV_hcl=3D"8cb6e5b959231cc1119e43259c4a608f9c51a241"
>> -SRC_URI +=3D "git://github.com/hashicorp/hcl;name=3Dhcl;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/hashicorp/hcl"
>> -
>>  #       github.com/imdario/mergo v0.3.16
>>  # [1] git ls-remote https://github.com/darccio/mergo 14fe2b165b83359196=
f820886a2b24f2771729e9
>>  SRCREV_mergo=3D"14fe2b165b83359196f820886a2b24f2771729e9"
>>  SRC_URI +=3D "git://github.com/darccio/mergo;name=3Dmergo;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/imdario/mergo"
>>
>> +#       github.com/containerd/log v0.1.0
>> +# [1] git ls-remote https://github.com/containerd/log 0fc1e28871fdf2786=
e2cc51bbe4133db6547a199
>> +SRCREV_log=3D"0fc1e28871fdf2786e2cc51bbe4133db6547a199"
>> +SRC_URI +=3D "git://github.com/containerd/log;name=3Dlog;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/containerd/log"
>> +
>>  #       github.com/google/gnostic v0.5.7-v3refs
>>  # [1] git ls-remote https://github.com/google/gnostic b49832d97d25b6a41=
cbe34ea12257924a934eeee
>>  SRCREV_gnostic=3D"b49832d97d25b6a41cbe34ea12257924a934eeee"
>>  SRC_URI +=3D "git://github.com/google/gnostic;name=3Dgnostic;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/google/gnostic"
>>
>> -#       github.com/laurazard/godog v0.0.0-20220922095256-4c4b17abdae7
>> -# [1] git ls-remote https://github.com/laurazard/godog 4c4b17abdae7fd4f=
9d35cfe391ca65d172b092e3
>> -SRCREV_godog=3D"4c4b17abdae7fd4f9d35cfe391ca65d172b092e3"
>> -SRC_URI +=3D "git://github.com/laurazard/godog;name=3Dgodog;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/laurazard/godog"
>> +#       github.com/davecgh/go-spew v1.1.1
>> +# [1] git ls-remote https://github.com/davecgh/go-spew 8991bc29aa16c548=
c550c7ff78260e27b9ab7c73
>> +SRCREV_go-spew=3D"8991bc29aa16c548c550c7ff78260e27b9ab7c73"
>> +SRC_URI +=3D "git://github.com/davecgh/go-spew;name=3Dgo-spew;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/davecgh/go-spew"
>>
>>  #       github.com/docker/go-units v0.5.0
>>  # [1] git ls-remote https://github.com/docker/go-units e682442797b36348=
f8e1f98defdbf32bac0b6c6f
>> @@ -328,11 +293,6 @@ SRC_URI +=3D "git://github.com/docker/go-units;name=
=3Dgo-units;protocol=3Dhttps;nobran
>>  SRCREV_logrus=3D"d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd"
>>  SRC_URI +=3D "git://github.com/sirupsen/logrus;name=3Dlogrus;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/sirupsen/logrus"
>>
>> -#       github.com/davecgh/go-spew v1.1.1
>> -# [1] git ls-remote https://github.com/davecgh/go-spew 8991bc29aa16c548=
c550c7ff78260e27b9ab7c73
>> -SRCREV_go-spew=3D"8991bc29aa16c548c550c7ff78260e27b9ab7c73"
>> -SRC_URI +=3D "git://github.com/davecgh/go-spew;name=3Dgo-spew;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/davecgh/go-spew"
>> -
>>  #       github.com/go-openapi/swag v0.19.14
>>  # [1] git ls-remote https://github.com/go-openapi/swag c78fa6719bc3d4b9=
77d19a09064feda1c07571af
>>  SRCREV_swag=3D"c78fa6719bc3d4b977d19a09064feda1c07571af"
>> @@ -368,19 +328,14 @@ SRC_URI +=3D "git://github.com/moby/spdystream;nam=
e=3Dspdystream;protocol=3Dhttps;nobr
>>  SRCREV_signal=3D"b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5"
>>  SRC_URI +=3D "git://github.com/moby/sys;name=3Dsignal;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/moby/sys/signal"
>>
>> -#       github.com/subosito/gotenv v1.4.1
>> -# [1] git ls-remote https://github.com/subosito/gotenv d94fdbe829d24b31=
d6ac30b6beb28b6420c1778a
>> -SRCREV_gotenv=3D"d94fdbe829d24b31d6ac30b6beb28b6420c1778a"
>> -SRC_URI +=3D "git://github.com/subosito/gotenv;name=3Dgotenv;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/subosito/gotenv"
>> -
>> -#       google.golang.org/genproto v0.0.0-20230526161137-0005af68ea54
>> -# [1] git ls-remote https://github.com/googleapis/go-genproto 0005af68e=
a5476a8b99ce94ab83ae4aaac864963
>> -SRCREV_genproto=3D"0005af68ea5476a8b99ce94ab83ae4aaac864963"
>> +#       google.golang.org/genproto v0.0.0-20230822172742-b8732ec3820d
>> +# [1] git ls-remote https://github.com/googleapis/go-genproto b8732ec38=
20db4bd1e4eda89392b7728e81bd825
>> +SRCREV_genproto=3D"b8732ec3820db4bd1e4eda89392b7728e81bd825"
>>  SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Dgenproto;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/google.golang.org/genproto"
>>
>> -#       google.golang.org/protobuf v1.30.0
>> -# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go f221=
882bfb484564f1714ae05f197dea2c76898d
>> -SRCREV_google.golang.org-protobuf=3D"f221882bfb484564f1714ae05f197dea2c=
76898d"
>> +#       google.golang.org/protobuf v1.31.0
>> +# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go 6846=
3f0e96c93bc19ef36ccd3adfe690bfdb568c
>> +SRCREV_google.golang.org-protobuf=3D"68463f0e96c93bc19ef36ccd3adfe690bf=
db568c"
>>  SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;name=3Dgoogl=
e.golang.org-protobuf;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}=
/${BP}/src/import/vendor.fetch/google.golang.org/protobuf"
>>
>>  #       github.com/stretchr/testify v1.8.4
>> @@ -388,11 +343,6 @@ SRC_URI +=3D "git://github.com/protocolbuffers/prot=
obuf-go;name=3Dgoogle.golang.org-
>>  SRCREV_testify=3D"f97607b89807936ac4ff96748d766cf4b9711f78"
>>  SRC_URI +=3D "git://github.com/stretchr/testify;name=3Dtestify;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/stretchr/testify"
>>
>> -#       github.com/cloudflare/cfssl v1.6.4
>> -# [1] git ls-remote https://github.com/cloudflare/cfssl b4d0d877cac528f=
63db39dfb62d5c96cd3a32a0b
>> -SRCREV_cfssl=3D"b4d0d877cac528f63db39dfb62d5c96cd3a32a0b"
>> -SRC_URI +=3D "git://github.com/cloudflare/cfssl;name=3Dcfssl;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/cloudflare/cfssl"
>> -
>>  #       github.com/josharian/intern v1.0.0
>>  # [1] git ls-remote https://github.com/josharian/intern 8e6ff32b3e7c0b0=
18c43953085fe2ac330fe9acd
>>  SRCREV_intern=3D"8e6ff32b3e7c0b018c43953085fe2ac330fe9acd"
>> @@ -448,6 +398,11 @@ SRC_URI +=3D "git://github.com/open-telemetry/opent=
elemetry-go;name=3Dsdk;protocol=3Dh
>>  SRCREV_go-ansiterm=3D"d185dfc1b5a126116ea5a19e148e29d16b4574c9"
>>  SRC_URI +=3D "git://github.com/Azure/go-ansiterm;name=3Dgo-ansiterm;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/Azure/go-ansiterm"
>>
>> +#       github.com/Microsoft/hcsshim v0.11.1
>> +# [1] git ls-remote https://github.com/microsoft/hcsshim 641f8b8a2314ab=
a7ee58223e28d330fbcd66e3c2
>> +SRCREV_hcsshim=3D"641f8b8a2314aba7ee58223e28d330fbcd66e3c2"
>> +SRC_URI +=3D "git://github.com/microsoft/hcsshim;name=3Dhcsshim;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/Microsoft/hcsshim"
>> +
>>  #       github.com/aws/aws-sdk-go-v2 v1.17.6
>>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 18bff5e44f4c2c=
140feaf54b2dd92140630c7e50
>>  SRCREV_aws-sdk-go-v2=3D"18bff5e44f4c2c140feaf54b2dd92140630c7e50"
>> @@ -508,21 +463,11 @@ SRC_URI +=3D "git://github.com/microsoft/go-winio;=
name=3Dgo-winio;protocol=3Dhttps;nob
>>  SRCREV_console=3D"b5cb846c9186d67bcae3ce3c324e47cd317d9527"
>>  SRC_URI +=3D "git://github.com/containerd/console;name=3Dconsole;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/containerd/console"
>>
>> -#       github.com/bugsnag/bugsnag-go v1.5.0
>> -# [1] git ls-remote https://github.com/bugsnag/bugsnag-go d5b63da7e1f93=
d83e3980e5ab2bf33179bad7b2a
>> -SRCREV_bugsnag-go=3D"d5b63da7e1f93d83e3980e5ab2bf33179bad7b2a"
>> -SRC_URI +=3D "git://github.com/bugsnag/bugsnag-go;name=3Dbugsnag-go;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/bugsnag/bugsnag-go"
>> -
>>  #       github.com/fvbommel/sortorder v1.0.2
>>  # [1] git ls-remote https://github.com/fvbommel/sortorder 26fad50c6b32a=
3064c09ed089865c16f2f3615f6
>>  SRCREV_sortorder=3D"26fad50c6b32a3064c09ed089865c16f2f3615f6"
>>  SRC_URI +=3D "git://github.com/fvbommel/sortorder;name=3Dsortorder;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/fvbommel/sortorder"
>>
>> -#       github.com/hashicorp/go-memdb v1.3.2
>> -# [1] git ls-remote https://github.com/hashicorp/go-memdb 542a5804dedaa=
ddf1a0cad8b6a7b0b3fcf438776
>> -SRCREV_go-memdb=3D"542a5804dedaaddf1a0cad8b6a7b0b3fcf438776"
>> -SRC_URI +=3D "git://github.com/hashicorp/go-memdb;name=3Dgo-memdb;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/hashicorp/go-memdb"
>> -
>>  #       github.com/klauspost/compress v1.16.5
>>  # [1] git ls-remote https://github.com/klauspost/compress ed6feffc3bb26=
797dc2a376516b16611046cdecd
>>  SRCREV_compress=3D"ed6feffc3bb26797dc2a376516b16611046cdecd"
>> @@ -588,9 +533,9 @@ SRC_URI +=3D "git://github.com/distribution/distribu=
tion;name=3Ddistribution;protoco
>>  SRCREV_sequential=3D"b22ba8a69b306f0b4adbbe2a529457e6283ed9f7"
>>  SRC_URI +=3D "git://github.com/moby/sys;name=3Dsequential;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/moby/sys/sequential"
>>
>> -#       github.com/opencontainers/runc v1.1.7
>> -# [1] git ls-remote https://github.com/opencontainers/runc 860f061b76bb=
4fc671f0f9e900f7d80ff93d4eb7
>> -SRCREV_runc=3D"860f061b76bb4fc671f0f9e900f7d80ff93d4eb7"
>> +#       github.com/opencontainers/runc v1.1.9
>> +# [1] git ls-remote https://github.com/opencontainers/runc ccaecfcbc907=
d70a7aa870a6650887b901b25b82
>> +SRCREV_runc=3D"ccaecfcbc907d70a7aa870a6650887b901b25b82"
>>  SRC_URI +=3D "git://github.com/opencontainers/runc;name=3Drunc;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/opencontainers/runc"
>>
>>  #       github.com/shibumi/go-pathspec v1.3.0
>> @@ -613,21 +558,11 @@ SRC_URI +=3D "git://github.com/docker/cli-docs-too=
l;name=3Dcli-docs-tool;protocol=3Dht
>>  SRCREV_go-version=3D"78d058c5618891f74d604bd15356fca690b64d8a"
>>  SRC_URI +=3D "git://github.com/hashicorp/go-version;name=3Dgo-version;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/hashicorp/go-version"
>>
>> -#       github.com/hashicorp/golang-lru v0.5.4
>> -# [1] git ls-remote https://github.com/hashicorp/golang-lru 14eae340515=
388ca95aa8e7b86f0de668e981f54
>> -SRCREV_golang-lru=3D"14eae340515388ca95aa8e7b86f0de668e981f54"
>> -SRC_URI +=3D "git://github.com/hashicorp/golang-lru;name=3Dgolang-lru;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/hashicorp/golang-lru"
>> -
>>  #       github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef=
1dd
>>  # [1] git ls-remote https://github.com/modern-go/concurrent bacd9c7ef1d=
d9b15be4a9909b8ac7a4e313eec94
>>  SRCREV_concurrent=3D"bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
>>  SRC_URI +=3D "git://github.com/modern-go/concurrent;name=3Dconcurrent;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/modern-go/concurrent"
>>
>> -#       github.com/pelletier/go-toml/v2 v2.0.5
>> -# [1] git ls-remote https://github.com/pelletier/go-toml 942841787a7d70=
422e4d8bc7d0be28ab911402df
>> -SRCREV_go-toml-v2=3D"942841787a7d70422e4d8bc7d0be28ab911402df"
>> -SRC_URI +=3D "git://github.com/pelletier/go-toml;name=3Dgo-toml-v2;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/pelletier/go-toml/v2"
>> -
>>  #       github.com/xeipuuv/gojsonschema v1.2.0
>>  # [1] git ls-remote https://github.com/xeipuuv/gojsonschema 82fcdeb203e=
b6ab2a67d0a623d9c19e5e5a64927
>>  SRCREV_gojsonschema=3D"82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927"
>> @@ -643,9 +578,9 @@ SRC_URI +=3D "git://github.com/open-telemetry/opente=
lemetry-go;name=3Dmetric;protoco
>>  SRCREV_v2=3D"fa37277e6394c29db7bcc94062cb30cd7785a126"
>>  SRC_URI +=3D "git://github.com/AlecAivazis/survey;name=3Dv2;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/AlecAivazis/survey/v2"
>>
>> -#       github.com/containerd/containerd v1.7.3
>> -# [1] git ls-remote https://github.com/containerd/containerd 7880925980=
b188f4c97b462f709d0db8e8962aff
>> -SRCREV_containerd=3D"7880925980b188f4c97b462f709d0db8e8962aff"
>> +#       github.com/containerd/containerd v1.7.7
>> +# [1] git ls-remote https://github.com/containerd/containerd 8c087663b0=
233f6e6e2f4515cee61d49f14746a8
>> +SRCREV_containerd=3D"8c087663b0233f6e6e2f4515cee61d49f14746a8"
>>  SRC_URI +=3D "git://github.com/containerd/containerd;name=3Dcontainerd;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/containerd/containerd"
>>
>>  #       github.com/docker/go-connections v0.4.0
>> @@ -658,9 +593,9 @@ SRC_URI +=3D "git://github.com/docker/go-connections=
;name=3Dgo-connections;protocol=3D
>>  SRCREV_semver-v3=3D"e06051f8fcc4c8b4a4990c337b9862a2448722e5"
>>  SRC_URI +=3D "git://github.com/Masterminds/semver;name=3Dsemver-v3;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/Masterminds/semver/v3"
>>
>> -#       github.com/containerd/continuity v0.4.1
>> -# [1] git ls-remote https://github.com/containerd/continuity 25762ef7c2=
7a37645197ed6d1d708e55a230e35d
>> -SRCREV_continuity=3D"25762ef7c27a37645197ed6d1d708e55a230e35d"
>> +#       github.com/containerd/continuity v0.4.2
>> +# [1] git ls-remote https://github.com/containerd/continuity 77a2d47a66=
68b82465fdf6cb749fe3a2aa2c9743
>> +SRCREV_continuity=3D"77a2d47a6668b82465fdf6cb749fe3a2aa2c9743"
>>  SRC_URI +=3D "git://github.com/containerd/continuity;name=3Dcontinuity;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/containerd/continuity"
>>
>>  #       github.com/containerd/typeurl/v2 v2.1.1
>> @@ -668,16 +603,16 @@ SRC_URI +=3D "git://github.com/containerd/continui=
ty;name=3Dcontinuity;protocol=3Dhttp
>>  SRCREV_typeurl-v2=3D"7ef6316b771f959cbb208b229e3423a466947df3"
>>  SRC_URI +=3D "git://github.com/containerd/typeurl;name=3Dtypeurl-v2;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/containerd/typeurl/v2"
>>
>> -#       github.com/magiconair/properties v1.8.6
>> -# [1] git ls-remote https://github.com/magiconair/properties 869a559242=
0f4ff6ebf74500b5c658b29d973172
>> -SRCREV_properties=3D"869a5592420f4ff6ebf74500b5c658b29d973172"
>> -SRC_URI +=3D "git://github.com/magiconair/properties;name=3Dproperties;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/magiconair/properties"
>> -
>>  #       github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c40=
7bfb
>>  # [1] git ls-remote https://github.com/xeipuuv/gojsonpointer 02993c407b=
fbf5f6dae44c4f4b1cf6a39b5fc5bb
>>  SRCREV_gojsonpointer=3D"02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb"
>>  SRC_URI +=3D "git://github.com/xeipuuv/gojsonpointer;name=3Dgojsonpoint=
er;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/xeipuuv/gojsonpointer"
>>
>> +#       github.com/distribution/reference v0.5.0
>> +# [1] git ls-remote https://github.com/distribution/reference 49c28499d=
219290c3226822e9cfcd4ede6d75379
>> +SRCREV_reference=3D"49c28499d219290c3226822e9cfcd4ede6d75379"
>> +SRC_URI +=3D "git://github.com/distribution/reference;name=3Dreference;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/distribution/reference"
>> +
>>  #       github.com/mitchellh/mapstructure v1.5.0
>>  # [1] git ls-remote https://github.com/mitchellh/mapstructure ab69d8d93=
410fce4361f4912bb1ff88110a81311
>>  SRCREV_mapstructure=3D"ab69d8d93410fce4361f4912bb1ff88110a81311"
>> @@ -693,6 +628,11 @@ SRC_URI +=3D "git://github.com/emicklei/go-restful;=
name=3Dgo-restful-v3;protocol=3Dhtt
>>  SRCREV_jsonpointer=3D"2446e21cad36eee826e1c2380f0ff747074a2faa"
>>  SRC_URI +=3D "git://github.com/go-openapi/jsonpointer;name=3Djsonpointe=
r;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/go-openapi/jsonpointer"
>>
>> +#       github.com/hashicorp/go-cleanhttp v0.5.2
>> +# [1] git ls-remote https://github.com/hashicorp/go-cleanhttp 6d9e2ac5d=
828e5f8594b97f88c4bde14a67bb6d2
>> +SRCREV_go-cleanhttp=3D"6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2"
>> +SRC_URI +=3D "git://github.com/hashicorp/go-cleanhttp;name=3Dgo-cleanht=
tp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/hashicorp/go-cleanhttp"
>> +
>>  #       github.com/in-toto/in-toto-golang v0.5.0
>>  # [1] git ls-remote https://github.com/in-toto/in-toto-golang ec599036d=
27ebaca3e8c03559d3f8fd5fe429dfe
>>  SRCREV_in-toto-golang=3D"ec599036d27ebaca3e8c03559d3f8fd5fe429dfe"
>> @@ -703,9 +643,9 @@ SRC_URI +=3D "git://github.com/in-toto/in-toto-golan=
g;name=3Din-toto-golang;protocol
>>  SRCREV_go-shellquote=3D"95032a82bc518f77982ea72343cc1ade730072f0"
>>  SRC_URI +=3D "git://github.com/kballard/go-shellquote;name=3Dgo-shellqu=
ote;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/github.com/kballard/go-shellquote"
>>
>> -#       github.com/compose-spec/compose-go v1.18.3
>> -# [1] git ls-remote https://github.com/compose-spec/compose-go c6eecc55=
b95f952b6d6406adcd297499d11a300b
>> -SRCREV_compose-go=3D"c6eecc55b95f952b6d6406adcd297499d11a300b"
>> +#       github.com/compose-spec/compose-go v1.20.2
>> +# [1] git ls-remote https://github.com/compose-spec/compose-go e390b977=
4ca100e1d75c8bc075054502783b48b8
>> +SRCREV_compose-go=3D"e390b9774ca100e1d75c8bc075054502783b48b8"
>>  SRC_URI +=3D "git://github.com/compose-spec/compose-go;name=3Dcompose-g=
o;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/compose-spec/compose-go"
>>
>>  #       github.com/hashicorp/go-multierror v1.1.1
>> @@ -713,21 +653,11 @@ SRC_URI +=3D "git://github.com/compose-spec/compos=
e-go;name=3Dcompose-go;protocol=3Dht
>>  SRCREV_go-multierror=3D"9974e9ec57696378079ecc3accd3d6f29401b3a0"
>>  SRC_URI +=3D "git://github.com/hashicorp/go-multierror;name=3Dgo-multie=
rror;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/github.com/hashicorp/go-multierror"
>>
>> -#       github.com/cucumber/gherkin-go/v19 v19.0.3
>> -# [1] git ls-remote https://github.com/cucumber/gherkin-go 11029f28bd1b=
c215fa57275b576f2b237b7c2b07
>> -SRCREV_v19=3D"11029f28bd1bc215fa57275b576f2b237b7c2b07"
>> -SRC_URI +=3D "git://github.com/cucumber/gherkin-go;name=3Dv19;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/cucumber/gherkin-go/v19"
>> -
>>  #       github.com/prometheus/client_model v0.3.0
>>  # [1] git ls-remote https://github.com/prometheus/client_model 63fb9822=
ca3ba7a4ba5184071fb8f2ea000a99ef
>>  SRCREV_client_model=3D"63fb9822ca3ba7a4ba5184071fb8f2ea000a99ef"
>>  SRC_URI +=3D "git://github.com/prometheus/client_model;name=3Dclient_mo=
del;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/github.com/prometheus/client_model"
>>
>> -#       github.com/spf13/jwalterweatherman v1.1.0
>> -# [1] git ls-remote https://github.com/spf13/jwalterweatherman 94f6ae3e=
d3bceceafa716478c5fbf8d29ca601a1
>> -SRCREV_jwalterweatherman=3D"94f6ae3ed3bceceafa716478c5fbf8d29ca601a1"
>> -SRC_URI +=3D "git://github.com/spf13/jwalterweatherman;name=3Djwalterwe=
atherman;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/im=
port/vendor.fetch/github.com/spf13/jwalterweatherman"
>> -
>>  #       github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7=
bd5415
>>  # [1] git ls-remote https://github.com/xeipuuv/gojsonreference bd5ef7bd=
5415a7ac448318e64f11a24cd21e594b
>>  SRCREV_gojsonreference=3D"bd5ef7bd5415a7ac448318e64f11a24cd21e594b"
>> @@ -743,11 +673,6 @@ SRC_URI +=3D "git://github.com/opencontainers/go-di=
gest;name=3Dgo-digest;protocol=3Dht
>>  SRCREV_config=3D"18bff5e44f4c2c140feaf54b2dd92140630c7e50"
>>  SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dconfig;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/aws/aws-sdk-go-v2/config"
>>
>> -#       github.com/cucumber/messages-go/v16 v16.0.1
>> -# [1] git ls-remote https://github.com/cucumber/messages-go 1848e9bfc84=
e8c1674c4d9ded0bdbfc23c458b28
>> -SRCREV_v16=3D"1848e9bfc84e8c1674c4d9ded0bdbfc23c458b28"
>> -SRC_URI +=3D "git://github.com/cucumber/messages-go;name=3Dv16;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/cucumber/messages-go/v16"
>> -
>>  #       github.com/go-openapi/jsonreference v0.20.0
>>  # [1] git ls-remote https://github.com/go-openapi/jsonreference c5db558=
2e080fbeae80be42f42881230a8caebf6
>>  SRCREV_jsonreference=3D"c5db5582e080fbeae80be42f42881230a8caebf6"
>> @@ -758,9 +683,9 @@ SRC_URI +=3D "git://github.com/go-openapi/jsonrefere=
nce;name=3Djsonreference;protoco
>>  SRCREV_client_golang=3D"254e5468413f19fb75cdad45f5ddc0b8c975188c"
>>  SRC_URI +=3D "git://github.com/prometheus/client_golang;name=3Dclient_g=
olang;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impor=
t/vendor.fetch/github.com/prometheus/client_golang"
>>
>> -#       github.com/opencontainers/image-spec v1.1.0-rc4
>> -# [1] git ls-remote https://github.com/opencontainers/image-spec 82e832=
9f7eb6df5c62924f2792d285ba276ae876
>> -SRCREV_image-spec=3D"82e8329f7eb6df5c62924f2792d285ba276ae876"
>> +#       github.com/opencontainers/image-spec v1.1.0-rc5
>> +# [1] git ls-remote https://github.com/opencontainers/image-spec 1e54f0=
195ce54b4a1a2ecbac8eab7686d91d3080
>> +SRCREV_image-spec=3D"1e54f0195ce54b4a1a2ecbac8eab7686d91d3080"
>>  SRC_URI +=3D "git://github.com/opencontainers/image-spec;name=3Dimage-s=
pec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/github.com/opencontainers/image-spec"
>>
>>  #       github.com/theupdateframework/notary v0.7.0
>> @@ -768,9 +693,9 @@ SRC_URI +=3D "git://github.com/opencontainers/image-=
spec;name=3Dimage-spec;protocol=3D
>>  SRCREV_notary=3D"b0b6bfdd4933081e8d5ae026b24e8337311dd598"
>>  SRC_URI +=3D "git://github.com/notaryproject/notary;name=3Dnotary;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/theupdateframework/notary"
>>
>> -#       github.com/AdaLogics/go-fuzz-headers v0.0.0-20230106234847-4307=
0de90fa1
>> -# [1] git ls-remote https://github.com/AdaLogics/go-fuzz-headers 43070d=
e90fa134c9ea55cd6de4308a2ae59658d3
>> -SRCREV_go-fuzz-headers=3D"43070de90fa134c9ea55cd6de4308a2ae59658d3"
>> +#       github.com/AdaLogics/go-fuzz-headers v0.0.0-20230811130428-ced1=
acdcaa24
>> +# [1] git ls-remote https://github.com/AdaLogics/go-fuzz-headers ced1ac=
dcaa24dc39c01b039fc37576c395f506cf
>> +SRCREV_go-fuzz-headers=3D"ced1acdcaa24dc39c01b039fc37576c395f506cf"
>>  SRC_URI +=3D "git://github.com/AdaLogics/go-fuzz-headers;name=3Dgo-fuzz=
-headers;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/im=
port/vendor.fetch/github.com/AdaLogics/go-fuzz-headers"
>>
>>  #       github.com/inconshreveable/mousetrap v1.1.0
>> @@ -783,21 +708,6 @@ SRC_URI +=3D "git://github.com/inconshreveable/mous=
etrap;name=3Dmousetrap;protocol=3Dh
>>  SRCREV_structured-merge-diff-v4=3D"26781d0c10bfdbd7d66b18d8be83985f623d=
f9f8"
>>  SRC_URI +=3D "git://github.com/kubernetes-sigs/structured-merge-diff;na=
me=3Dstructured-merge-diff-v4;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${=
WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/structured-merge-diff/v4=
"
>>
>> -#       github.com/cyphar/filepath-securejoin v0.2.3
>> -# [1] git ls-remote https://github.com/cyphar/filepath-securejoin 8f267=
f5ea675a20a2cb5e91011d063721f53bf79
>> -SRCREV_filepath-securejoin=3D"8f267f5ea675a20a2cb5e91011d063721f53bf79"
>> -SRC_URI +=3D "git://github.com/cyphar/filepath-securejoin;name=3Dfilepa=
th-securejoin;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/s=
rc/import/vendor.fetch/github.com/cyphar/filepath-securejoin"
>> -
>> -#       github.com/distribution/distribution/v3 v3.0.0-20230601133803-9=
7b1d649c493
>> -# [1] git ls-remote https://github.com/distribution/distribution 97b1d6=
49c4938d0f608d96454d6a8326b1f96acd
>> -SRCREV_v3=3D"97b1d649c4938d0f608d96454d6a8326b1f96acd"
>> -SRC_URI +=3D "git://github.com/distribution/distribution;name=3Dv3;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/distribution/distribution/v3"
>> -
>> -#       github.com/hashicorp/go-immutable-radix v1.3.1
>> -# [1] git ls-remote https://github.com/hashicorp/go-immutable-radix 49d=
1d02c49a783de548d1ba8ae8fde466a20b9e6
>> -SRCREV_go-immutable-radix=3D"49d1d02c49a783de548d1ba8ae8fde466a20b9e6"
>> -SRC_URI +=3D "git://github.com/hashicorp/go-immutable-radix;name=3Dgo-i=
mmutable-radix;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/=
src/import/vendor.fetch/github.com/hashicorp/go-immutable-radix"
>> -
>>  #       github.com/aws/aws-sdk-go-v2/credentials v1.13.16
>>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 18bff5e44f4c2c=
140feaf54b2dd92140630c7e50
>>  SRCREV_credentials=3D"18bff5e44f4c2c140feaf54b2dd92140630c7e50"
>> @@ -823,14 +733,14 @@ SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;n=
ame=3Dini;protocol=3Dhttps;nobranch=3D
>>  SRCREV_grpc-gateway-v2=3D"0197faf8b072910084edd1209aa2ac51833b895c"
>>  SRC_URI +=3D "git://github.com/grpc-ecosystem/grpc-gateway;name=3Dgrpc-=
gateway-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/=
import/vendor.fetch/github.com/grpc-ecosystem/grpc-gateway/v2"
>>
>> -#       google.golang.org/genproto/googleapis/api v0.0.0-20230525234035=
-dd9d682886f9
>> -# [1] git ls-remote https://github.com/googleapis/go-genproto dd9d68288=
6f99d242574cd3eaea438ce7ea66399
>> -SRCREV_api=3D"dd9d682886f99d242574cd3eaea438ce7ea66399"
>> +#       google.golang.org/genproto/googleapis/api v0.0.0-20230822172742=
-b8732ec3820d
>> +# [1] git ls-remote https://github.com/googleapis/go-genproto b8732ec38=
20db4bd1e4eda89392b7728e81bd825
>> +SRCREV_api=3D"b8732ec3820db4bd1e4eda89392b7728e81bd825"
>>  SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Dapi;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/google.golang.org/genproto/googleapis/api"
>>
>> -#       google.golang.org/genproto/googleapis/rpc v0.0.0-20230525234030=
-28d5490b6b19
>> -# [1] git ls-remote https://github.com/googleapis/go-genproto 28d5490b6=
b19cce1ebbc6ab55ca8637bd35b3486
>> -SRCREV_rpc=3D"28d5490b6b19cce1ebbc6ab55ca8637bd35b3486"
>> +#       google.golang.org/genproto/googleapis/rpc v0.0.0-20230822172742=
-b8732ec3820d
>> +# [1] git ls-remote https://github.com/googleapis/go-genproto b8732ec38=
20db4bd1e4eda89392b7728e81bd825
>> +SRCREV_rpc=3D"b8732ec3820db4bd1e4eda89392b7728e81bd825"
>>  SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Drpc;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/google.golang.org/genproto/googleapis/rpc"
>>
>>  #       github.com/docker/docker-credential-helpers v0.7.0
>> --
>> 2.44.0
>>
>>
>>
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8596): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8596
> Mute This Topic: https://lists.yoctoproject.org/mt/104628874/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

