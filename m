Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2258C5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 19:03:17 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.5426.1709146987544331440
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 11:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kZqp3F8g;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: quaresma.jose@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6093b4f82ceso990887b3.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Feb 2024 11:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709146987; x=1709751787; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2fHethQvZP6VJm3rsvWSuRrSGR627ZyC+M0jhkm1zWQ=;
        b=kZqp3F8ge/W6AtSmJ8Pp7JLCxTcH7eheq3v5awsAX5aN+X2xJcdHNV3nHgD9Xgxol+
         XGM8YAfnAAtuyvEj/y+hDe7aeFS8QIX2FSv04jKVrdudKvPYRCivgEbqmZ1s+8IPUtyN
         lHWaEASiq6bRXXGT4L+phvyZJPmXhmXelyZORlrpc0EeV4L9FiuXhlJgKb89vj7eiIVL
         6f6FPjUyWJD2dmKkqlOX6BnFPANVSjhnUiZtG7d/QvAtJNVidNCZk/FGFJuXQeuOJQSR
         lA5FLYEQVqC7GuH8mrljg8Ft1nkfrGGqcrfwgTBtcn6gioFh2ad2sq8Z8mMBF2nx7uh6
         6Fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709146987; x=1709751787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fHethQvZP6VJm3rsvWSuRrSGR627ZyC+M0jhkm1zWQ=;
        b=DyMLV3U8JGvbJqXhe97BcASzQnuOkNd5z/P1q6LM69kaTPdhqvBDuqs4MOSO/ka35l
         xrWX/Be0CymCZVe+Cjup3eyff21z8PS3GbuwUolMq1/C74LArBku9DOHhKbvSpuZV0Op
         Aq+mO/G98QYGlojCsM27ulH3O5I6Olh84YBbsI6DwE+ngggqFvi7gbMsqRD39OLuW91B
         gEaXXuEtPBNlCi+r/lHfwN7lP+QL88NOdwu14Z4uVZ3dExn/MnXbim/M7ko/UogNaX17
         Cq4837z1F9krj8DCVy/3JSLZHeuRfYXb4dKf8TsukRI1wHAAWPbX3A8kGGMfQkMEV8gX
         fp6A==
X-Gm-Message-State: AOJu0YxojbmkbpMHB6xXl6GRrJjo1tvJRG41InanbuOBWx8DDr2lJuR/
	AG7mqTiKSin/YuWBJ0HZlVRQhXdNf2/ErfslejS2EavAKvin5mOARbCcmbC5o/cNlfyTJAotfqQ
	SAcYzln0UcERJRTpr23SMusYjs0w=
X-Google-Smtp-Source: AGHT+IFPyo2SlRrv0/Io0vVVLUzwQLHKov//dDmg8PGoaEi7groRQuV8U9vYOjT64GttDNCIsKou9iFykjIfIGibbxU=
X-Received: by 2002:a81:400a:0:b0:608:bf09:a152 with SMTP id
 l10-20020a81400a000000b00608bf09a152mr5913486ywn.3.1709146986157; Wed, 28 Feb
 2024 11:03:06 -0800 (PST)
MIME-Version: 1.0
References: <17B81B224EDE23E7.18468@lists.yoctoproject.org>
 <CANPvuRnSVmphHUtVub0=Q3cMAVX2cpyK-Mc7OvYyXFOuu1-8zg@mail.gmail.com> <CADkTA4NAo-8TbbADV3_TyfcJr1JTsLNdX9xRy7FxaSAhcafpuA@mail.gmail.com>
In-Reply-To: <CADkTA4NAo-8TbbADV3_TyfcJr1JTsLNdX9xRy7FxaSAhcafpuA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 28 Feb 2024 19:02:54 +0000
Message-ID: <CANPvuRmiNax_5NVkn5kGe74qZUB9ozoLvSV5NgesWzMbBANw=g@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC meta-virtualization][PATCH]
 docker-compose: v2.21.0 -> v2.23.3
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000fa9d13061275ca8a"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Feb 2024 19:03:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8598

--000000000000fa9d13061275ca8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu (quarta, 28/02/2024 =C3=
=A0(s)
18:57):

> On Wed, Feb 28, 2024 at 1:47=E2=80=AFPM Jose Quaresma <quaresma.jose@gmai=
l.com>
> wrote:
> >
> >
> > The recipe on meta-virt main-next fails to build with go-1.21 and I hav=
e
> updated it with:
> > ./meta-virtualization/scripts/oe-go-mod-autogen.py --repo
> https://github.com/docker/compose --rev v2.23.3
> >
>
> My intent is to wait as long as possible on these recipes, since
> obviously, I'm aware of what the issues are with go 1.2.x, even then,
> I'll be doing multiple recipes versus upgrading what is there to leave
> the layer in a forward looking state if 1.21+ doesn't merge into core.
>
> So for now, I won't be grabbing the bump.
>

I have sent the updates for 1.21 and 1.22 to oe-core with RFC.
I know it's already too late but it was the best I could do.

No problem with not merging this patch, the patch is just to let you know.

Jose


>
> Bruce
>
> > Jose
> >
> > Jose Quaresma via lists.yoctoproject.org <quaresma.jose=3D
> gmail.com@lists.yoctoproject.org> escreveu (quarta, 28/02/2024 =C3=A0(s)
> 18:44):
> >>
> >> - c665c53c bump buildx to v0.12.0 and adapt code to changes
> >> - a1aceba6 Merge pull request #11215 from docker/dependabot/go_modules=
/
> github.com/compose-spec/compose-go-1.20.2
> >> - a39cf75e build(deps): bump github.com/compose-spec/compose-go
> >> - 5b0dcc5a Merge pull request #11214 from docker/dependabot/go_modules=
/
> github.com/spf13/cobra-1.8.0
> >> - 46ba9c99 build(deps): bump github.com/spf13/cobra from 1.7.0 to 1.8.=
0
> >> - 1148b676 Merge pull request #11142 from docker/dependabot/go_modules=
/
> github.com/docker/cli-24.0.7incompatible
> >> - 5c5d30c6 build(deps): bump github.com/docker/cli
> >> - 2068ecee Merge pull request #11143 from docker/dependabot/go_modules=
/
> github.com/docker/docker-24.0.7incompatible
> >> - 36fa8d4e build(deps): bump github.com/docker/docker
> >> - 69985b8b Merge pull request #11112 from docker/dependabot/go_modules=
/
> github.com/moby/buildkit-0.12.3
> >> - 2384635e build(deps): bump github.com/moby/buildkit from 0.12.2 to
> 0.12.3
> >> - 587dba11 Merge pull request #11213 from
> glours/watch-force-build-at-startup
> >> - 2ba5e4c1 in watch mode force pull policy to build for services with
> both build and develop attributes This default behaviour will force a
> rebuild of the service images at watch process startup and be sure
> containers will be in sync with the local source code
> >> - b1a26dac Assume /src/pkg/compose/testdata absolute workingdir to mak=
e
> tests reproducible
> >> - 0ab21a20 Merge pull request #11211 from ndeloof/Services
> >> - 5e77ae92 avoir use of []types.ServiceConfig
> >> - f5572201 identify services to build and don't display 'building' if
> none
> >> - 8e1b3236 fix --remove-orphans not to consider disabled services as
> orphaned
> >> - a1b7bee0 Merge pull request #11206 from ndeloof/check_runtime
> >> - 7cb1f8ba introduce RuntimeVersion for code to check container runtim=
e
> supports required features
> >> - cb01186c push also consider build.tags
> >> - efea084d Merge pull request #11192 from
> ulyssessouza/exclude-tests-context
> >> - 9c4efbdd Strip project prefix from docker-compose up output
> >> - 8ea7c9e0 Make it context aware and add test skipping options
> >> - c1694360 render quiet after filtering applied
> >> - 254a94b0 bump golang to version 1.21.4
> >> - cf608fa9 bump compose-go to v1.20.1
> >> - 426377a4 reject compose file using `secrets|configs.driver or
> template_driver`
> >> - 43c3f545 Merge pull request #11180 from ulyssessouza/skip-flaky-test=
s
> >> - 493f6c80 skips flaky e2e tests on watch and attach
> >> - c1a9ffa0 Merge pull request #11171 from szampardi/main
> >> - 646a8fc0 fix docker/compose#11170 add newline in cmd/compose/build.g=
o
> fmt.Fprint
> >> - 2945532f fix --pull documentation
> >> - e5cd265a improve watch configuration logging Add action associated t=
o
> each managed path
> >> - d646d757 lint
> >> - 71237ef6 do not resolve cache dir until remote resource is in use
> >> - 0d905a89 add a copyright notice with original author
> >> - b847c7f5 implement runtime file selection
> >> - 5e3d8f67 re-implement cache folder detection
> >> - 67279088 introduce --resolve-image-digests for publish to seal
> service images by digest
> >> - 5661fd1b Merge pull request #11149 from aevesdocker/ENGDOCS-1764
> >> - 4cd61957 fix build
> >> - 0d4cbbdb fix
> >> - 9631a49d ENGDOCS-1764
> >> - 328ca3f2 add docs upstream validation workflow
> >> - e1bbfc63 build(deps): bump go.uber.org/goleak from 1.2.1 to 1.3.0
> >> - 616bba0a linter errors fixed
> >> - ee6e3c2a NetworkList to NetworkInspect for ID search
> >> - c7e31a3c Squashing feature branch commits in order to add signoff
> message.
> >> - 704a9fd3 Use project.ServiceNames() if no service specified in hash
> >> - d9e0e42d Add branch configuration for pull_request trigger
> >> - c48e3c4a Initial codeql.yml commit
> >> - dd0803db fix SIGTERM support to stop/kill stack
> >> - 39008c53 align with OCI artifact best practices
> >> - 6ab41d62 Merge pull request #11060 from
> Juneezee/refactor/redundant-len-check
> >> - 6c345b37 refactor(cmd/compose/run): remove redundant `len` check
> >> - b8773ad1 Merge pull request #11110 from ndeloof/wait_missing
> >> - 1ffa194e fail start if depependency is missing
> >> - b9298101 check that the pull policy provided is a valid one or is no=
t
> missing when --pull is used
> >> - af87f106 Merge pull request #11108 from ndeloof/down-services
> >> - 5e1d3f2b Merge pull request #11051 from ndeloof/warn_remote_disabled
> >> - 3d0207eb remove uncessary return value of pullComposeFiles function
> >> - 16a7c209 enable profile when down is ran with explicit service names
> >> - 818bc3c3 add sync+restart action to watch attribute
> >> - cf3e686d Merge pull request #11078 from docker/dependabot/go_modules=
/
> github.com/containerd/containerd-1.7.7
> >> - 38bc6d5d build(deps): bump github.com/containerd/containerd from
> 1.7.6 to 1.7.7
> >> - 4a2d4c44 Merge pull request #11083 from docker/dependabot/go_modules=
/
> github.com/google/go-cmp-0.6.0
> >> - 0b6ce6ee build(deps): bump github.com/google/go-cmp from 0.5.9 to
> 0.6.0
> >> - 034458da Merge pull request #11105 from docker/dependabot/go_modules=
/
> google.golang.org/grpc-1.59.0
> >> - ae16bbbf build(deps): bump google.golang.org/grpc from 1.58.2 to
> 1.59.0
> >> - eb5f01ba Merge pull request #11068 from docker/dependabot/go_modules=
/
> golang.org/x/sync-0.4.0
> >> - d13ad1f9 build(deps): bump golang.org/x/sync from 0.3.0 to 0.4.0
> >> - 9b4d577c remove refrecence docs generation
> >> - b30978fb Merge pull request #11076 from glours/remove-cucumber
> >> - 14b43c1a remove cucumber tests as we haven't added new ones for a
> while
> >> - 9dd081b9 add support of COMPOSE_ENV_FILES env variable to pass a lis=
t
> of env files
> >> - 2c0b0232 add dry-run support for publish command
> >> - 599e4b24 extract method to reduce cyclomatic complexity
> >> - fe8c2780 warn user remote resource is disabled
> >> - a345515f Don't delete dependent services
> >> - 8967df7a Apply platform before hashing
> >> - 4f694919 deps: remove deprecated github.com/pkg/errors
> >> - 6ecab957 Include image name in error message
> >> - 12e0ac89 pkg/compose/publish: use empty config descriptor mediaType
> >> - a6b7d785 pkg/remote/oci: check artifactType instead of
> config.mediaType
> >> - 991901f2 pkg/remote/oci: refer to the manifest as manifest
> >> - bd74a926 Merge pull request #11047 from
> glours/update-watch-warning-section
> >> - 2d971fc9 update the watch warning message when no services with a
> develop section
> >> - 78f33619 ci: enable verbose output for e2e tests (#11045)
> >> - 44d21280 truncate command by default, introduce --no-trunc flag to
> get the full command
> >> - cd743d17 Merge pull request #11036 from docker/dependabot/go_modules=
/
> google.golang.org/grpc-1.58.2
> >> - ff2ff18c build(deps): bump google.golang.org/grpc from 1.58.1 to
> 1.58.2
> >> - bd32ed14 Merge pull request #11025 from ndeloof/SkipResolveEnvironme=
nt
> >> - ab81db5b config --xx don't need `env_file` being parsed
> >> - 52a641bf Merge pull request #11021 from glours/move-watch-to-main-cm=
d
> >> - 75f5c07d Merge pull request #11023 from
> glours/fix-watch-e2e-test-cleanup
> >> - 61c8be11 remove --timeout=3D0 flag to cleanup function of watch e2e
> test compose down command need the watch process to be killed to succeed
> >> - 6be5f300 move watch from alpha to main command
> >> - 421a6b05 Merge pull request #11031 from ndeloof/TestWatch
> >> - c34c306c TestWatch to use new  `develop` section
> >> - 5ca35c88 implement publish
> >> - 805541be watch: use official `develop` section (#11026)
> >> - d322ad91 Merge pull request #11027 from docker/dependabot/go_modules=
/
> github.com/opencontainers/image-spec-1.1.0-rc5
> >> - 8f489d6d build(deps): bump github.com/opencontainers/image-spec
> >> - a214a715 Merge pull request #11017 from docker/dependabot/go_modules=
/
> github.com/moby/buildkit-0.12.2
> >> - 9ea8fbc6 build(deps): bump github.com/moby/buildkit from 0.12.1 to
> 0.12.2
> >> - 062fa755 Merge pull request #11020 from
> docker/dependabot/go_modules/gotest.tools/v3-3.5.1
> >> - 76f150e4 build(deps): bump gotest.tools/v3 from 3.5.0 to 3.5.1
> >> - d45d943e Merge pull request #11019 from docker/dependabot/go_modules=
/
> google.golang.org/grpc-1.58.1
> >> - f447c809 build(deps): bump google.golang.org/grpc from 1.58.0 to
> 1.58.1
> >> - 722796ca Merge pull request #11016 from docker/dependabot/go_modules=
/
> github.com/containerd/containerd-1.7.6
> >> - 4587d4ba build(deps): bump github.com/containerd/containerd from
> 1.7.3 to 1.7.6
> >> - a697a069 introduce pull --missing flag to only pull images not
> present in cache
> >> - 8af49ff3 resolve service reference into container based on observed
> state
> >> - f6e31dbc don't rely on depends_on to resolve volume_from, better use
> observed state
> >> - e19232e8 Merge pull request #11000 from thaJeztah/update_golang_1.21=
.1
> >> - 6d5eb6fd update to go1.21.1
> >> - 9d7e0ad6 correct scale error messages formatting
> >> - 1a98a70b add scale command
> >> - 19bbb12f ci: tweak restricted imports in linter (#10992)
> >> - 7a134578 deps: upgrade Moby to v24.0.6 and gRPC to v1.58.0 (#10991)
> >> - 13115468 cli: fix `--build` flag for `create` (#10982)
> >> - e1aa4f77 otel: add args & flags to cli traces (#10974)
> >> - d7b0b2bd watch: build & launch the project at start (#10957)
> >> - e0f39ebb pull OCI remote resource
> >> - c9d54f09 introduce publish (alpha) command
> >> - aeb835a5 Merge pull request #10966 from kumarlokesh/patch-1
> >> - 52e54ef9 doc: updated README.md to remove broken link
> >> - 203bce88 Merge pull request #10954 from thaJeztah/swap_reference
> >> - f4f2e934 migrate to github.com/distribution/reference
> >> - 32c3d0a3 Enable service explicitly requested to be restarted
> >> - 1fdbcb62 build: pass BuildOptions around explicitly & fix
> multi-platform issues
> >> - 407a0d5b up: fix various race/deadlock conditions on exit (#10934)
> >> - d0dfb848 Merge pull request #10953 from thaJeztah/drop_uuid
> >> - 8caa6f1f pkg/api: replace uuid for basic random id
> >>
> >> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >> ---
> >>  .../docker-compose/docker-compose_git.bb      |   4 +-
> >>  .../docker-compose/files/modules.txt          | 119 +++---
> >>  .../docker-compose/relocation.inc             |  38 +-
> >>  recipes-containers/docker-compose/src_uri.inc | 348 +++++++----------=
-
> >>  4 files changed, 182 insertions(+), 327 deletions(-)
> >>
> >> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb
> b/recipes-containers/docker-compose/docker-compose_git.bb
> >> index b7745f2..8154cc5 100644
> >> --- a/recipes-containers/docker-compose/docker-compose_git.bb
> >> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> >> @@ -9,7 +9,7 @@ DEPENDS =3D " \
> >>
> >>  # Specify the first two important SRCREVs as the format
> >>  SRCREV_FORMAT=3D"compose_survey"
> >> -SRCREV_compose =3D "d6f842b042d2f2926901305336527b3eaadf067a"
> >> +SRCREV_compose =3D "c665c53cc1eb633a819fcaa9b47d77597b55d0eb"
> >>
> >>  SRC_URI =3D "git://
> github.com/docker/compose;name=3Dcompose;branch=3Dmain;protocol=3Dhttps"
> >>
> >> @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D
> "file://src/import/LICENSE;md5=3D175792518e4ac015ab6696d16c4f60
> >>
> >>  GO_IMPORT =3D "import"
> >>
> >> -PV =3D "v2.21.0"
> >> +PV =3D "v2.23.3"
> >>
> >>  COMPOSE_PKG =3D "github.com/docker/compose/v2"
> >>
> >> diff --git a/recipes-containers/docker-compose/files/modules.txt
> b/recipes-containers/docker-compose/files/modules.txt
> >> index d287d12..c8219da 100644
> >> --- a/recipes-containers/docker-compose/files/modules.txt
> >> +++ b/recipes-containers/docker-compose/files/modules.txt
> >> @@ -2,27 +2,25 @@
> >>  ## explicit
> >>  # github.com/Microsoft/go-winio v0.6.1
> >>  ## explicit
> >> -# github.com/adrg/xdg v0.4.0
> >> -## explicit
> >>  # github.com/buger/goterm v1.0.4
> >>  ## explicit
> >> -# github.com/compose-spec/compose-go v1.18.3
> >> +# github.com/compose-spec/compose-go v1.20.2
> >>  ## explicit
> >>  # github.com/containerd/console v1.0.3
> >>  ## explicit
> >> -# github.com/containerd/containerd v1.7.3
> >> +# github.com/containerd/containerd v1.7.7
> >>  ## explicit
> >> -# github.com/cucumber/godog v0.0.0-00010101000000-000000000000
> >> +# github.com/davecgh/go-spew v1.1.1
> >>  ## explicit
> >> -# github.com/distribution/distribution/v3
> v3.0.0-20230601133803-97b1d649c493
> >> +# github.com/distribution/reference v0.5.0
> >>  ## explicit
> >> -# github.com/docker/buildx v0.11.2
> >> +# github.com/docker/buildx v0.12.0
> >>  ## explicit
> >> -# github.com/docker/cli v24.0.5+incompatible
> >> +# github.com/docker/cli v24.0.7+incompatible
> >>  ## explicit
> >>  # github.com/docker/cli-docs-tool v0.6.0
> >>  ## explicit
> >> -# github.com/docker/docker v24.0.5+incompatible
> >> +# github.com/docker/docker v24.0.7+incompatible
> >>  ## explicit
> >>  # github.com/docker/go-connections v0.4.0
> >>  ## explicit
> >> @@ -32,6 +30,8 @@
> >>  ## explicit
> >>  # github.com/golang/mock v1.6.0
> >>  ## explicit
> >> +# github.com/google/go-cmp v0.6.0
> >> +## explicit
> >>  # github.com/hashicorp/go-multierror v1.1.1
> >>  ## explicit
> >>  # github.com/hashicorp/go-version v1.6.0
> >> @@ -42,7 +42,7 @@
> >>  ## explicit
> >>  # github.com/mitchellh/mapstructure v1.5.0
> >>  ## explicit
> >> -# github.com/moby/buildkit v0.12.1
> >> +# github.com/moby/buildkit v0.13.0-beta1.0.20231023114302-d5c1d785b04=
2
> >>  ## explicit
> >>  # github.com/moby/patternmatcher v0.6.0
> >>  ## explicit
> >> @@ -52,13 +52,13 @@
> >>  ## explicit
> >>  # github.com/opencontainers/go-digest v1.0.0
> >>  ## explicit
> >> -# github.com/opencontainers/image-spec v1.1.0-rc4
> >> +# github.com/opencontainers/image-spec v1.1.0-rc5
> >>  ## explicit
> >> -# github.com/pkg/errors v0.9.1
> >> +# github.com/otiai10/copy v1.14.0
> >>  ## explicit
> >>  # github.com/sirupsen/logrus v1.9.3
> >>  ## explicit
> >> -# github.com/spf13/cobra v1.7.0
> >> +# github.com/spf13/cobra v1.8.0
> >>  ## explicit
> >>  # github.com/spf13/pflag v1.0.5
> >>  ## explicit
> >> @@ -78,22 +78,26 @@
> >>  ## explicit
> >>  # go.opentelemetry.io/otel/trace v1.14.0
> >>  ## explicit
> >> -# go.uber.org/goleak v1.2.1
> >> +# go.uber.org/goleak v1.3.0
> >>  ## explicit
> >> -# golang.org/x/sync v0.3.0
> >> +# golang.org/x/exp v0.0.0-20230713183714-613f0c0eb8a1
> >>  ## explicit
> >> -# google.golang.org/grpc v1.57.0
> >> +# golang.org/x/sync v0.5.0
> >>  ## explicit
> >> -# gopkg.in/yaml.v2 v2.4.0
> >> +# golang.org/x/sys v0.14.0
> >>  ## explicit
> >> -# gotest.tools/v3 v3.5.0
> >> +# google.golang.org/grpc v1.59.0
> >>  ## explicit
> >> -# github.com/AdaLogics/go-fuzz-headers
> v0.0.0-20230106234847-43070de90fa1
> >> +# gotest.tools/v3 v3.5.1
> >> +## explicit
> >> +# github.com/AdaLogics/go-fuzz-headers
> v0.0.0-20230811130428-ced1acdcaa24
> >>  ## explicit
> >>  # github.com/Azure/go-ansiterm v0.0.0-20210617225240-d185dfc1b5a1
> >>  ## explicit
> >>  # github.com/Masterminds/semver/v3 v3.2.1
> >>  ## explicit
> >> +# github.com/Microsoft/hcsshim v0.11.1
> >> +## explicit
> >>  # github.com/aws/aws-sdk-go-v2 v1.17.6
> >>  ## explicit
> >>  # github.com/aws/aws-sdk-go-v2/config v1.18.16
> >> @@ -120,26 +124,16 @@
> >>  ## explicit
> >>  # github.com/beorn7/perks v1.0.1
> >>  ## explicit
> >> -# github.com/bugsnag/bugsnag-go v1.5.0
> >> -## explicit
> >>  # github.com/cenkalti/backoff/v4 v4.2.0
> >>  ## explicit
> >>  # github.com/cespare/xxhash/v2 v2.2.0
> >>  ## explicit
> >> -# github.com/cloudflare/cfssl v1.6.4
> >> +# github.com/containerd/continuity v0.4.2
> >>  ## explicit
> >> -# github.com/containerd/continuity v0.4.1
> >> +# github.com/containerd/log v0.1.0
> >>  ## explicit
> >>  # github.com/containerd/typeurl/v2 v2.1.1
> >>  ## explicit
> >> -# github.com/cucumber/gherkin-go/v19 v19.0.3
> >> -## explicit
> >> -# github.com/cucumber/messages-go/v16 v16.0.1
> >> -## explicit
> >> -# github.com/cyphar/filepath-securejoin v0.2.3
> >> -## explicit
> >> -# github.com/davecgh/go-spew v1.1.1
> >> -## explicit
> >>  # github.com/docker/distribution v2.8.2+incompatible
> >>  ## explicit
> >>  # github.com/docker/docker-credential-helpers v0.7.0
> >> @@ -166,8 +160,6 @@
> >>  ## explicit
> >>  # github.com/gofrs/flock v0.8.1
> >>  ## explicit
> >> -# github.com/gofrs/uuid v4.2.0+incompatible
> >> -## explicit
> >>  # github.com/gogo/googleapis v1.4.1
> >>  ## explicit
> >>  # github.com/gogo/protobuf v1.3.2
> >> @@ -176,8 +168,6 @@
> >>  ## explicit
> >>  # github.com/google/gnostic v0.5.7-v3refs
> >>  ## explicit
> >> -# github.com/google/go-cmp v0.5.9
> >> -## explicit
> >>  # github.com/google/gofuzz v1.2.0
> >>  ## explicit
> >>  # github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
> >> @@ -190,13 +180,7 @@
> >>  ## explicit
> >>  # github.com/hashicorp/errwrap v1.1.0
> >>  ## explicit
> >> -# github.com/hashicorp/go-immutable-radix v1.3.1
> >> -## explicit
> >> -# github.com/hashicorp/go-memdb v1.3.2
> >> -## explicit
> >> -# github.com/hashicorp/golang-lru v0.5.4
> >> -## explicit
> >> -# github.com/hashicorp/hcl v1.0.0
> >> +# github.com/hashicorp/go-cleanhttp v0.5.2
> >>  ## explicit
> >>  # github.com/imdario/mergo v0.3.16
> >>  ## explicit
> >> @@ -204,8 +188,6 @@
> >>  ## explicit
> >>  # github.com/inconshreveable/mousetrap v1.1.0
> >>  ## explicit
> >> -# github.com/jinzhu/gorm v1.9.11
> >> -## explicit
> >>  # github.com/josharian/intern v1.0.0
> >>  ## explicit
> >>  # github.com/json-iterator/go v1.1.12
> >> @@ -214,10 +196,6 @@
> >>  ## explicit
> >>  # github.com/klauspost/compress v1.16.5
> >>  ## explicit
> >> -# github.com/kr/pretty v0.3.0
> >> -## explicit
> >> -# github.com/magiconair/properties v1.8.6
> >> -## explicit
> >>  # github.com/mailru/easyjson v0.7.6
> >>  ## explicit
> >>  # github.com/mattn/go-colorable v0.1.13
> >> @@ -250,11 +228,11 @@
> >>  ## explicit
> >>  # github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822
> >>  ## explicit
> >> -# github.com/opencontainers/runc v1.1.7
> >> +# github.com/opencontainers/runc v1.1.9
> >>  ## explicit
> >>  # github.com/pelletier/go-toml v1.9.5
> >>  ## explicit
> >> -# github.com/pelletier/go-toml/v2 v2.0.5
> >> +# github.com/pkg/errors v0.9.1
> >>  ## explicit
> >>  # github.com/pmezard/go-difflib v1.0.0
> >>  ## explicit
> >> @@ -274,14 +252,6 @@
> >>  ## explicit
> >>  # github.com/shibumi/go-pathspec v1.3.0
> >>  ## explicit
> >> -# github.com/spf13/afero v1.9.2
> >> -## explicit
> >> -# github.com/spf13/cast v1.5.0
> >> -## explicit
> >> -# github.com/spf13/jwalterweatherman v1.1.0
> >> -## explicit
> >> -# github.com/subosito/gotenv v1.4.1
> >> -## explicit
> >>  # github.com/tonistiigi/fsutil v0.0.0-20230629203738-36ef4d8c0dbb
> >>  ## explicit
> >>  # github.com/tonistiigi/units v0.0.0-20180711220420-6950e57a87ea
> >> @@ -294,8 +264,6 @@
> >>  ## explicit
> >>  # github.com/xeipuuv/gojsonschema v1.2.0
> >>  ## explicit
> >> -# github.com/zmap/zcrypto v0.0.0-20220605182715-4dfcec6e9a8c
> >> -## explicit
> >>  #
> go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgr=
pc
> v0.40.0
> >>  ## explicit
> >>  #
> go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptr=
ace
> v0.40.0
> >> @@ -310,21 +278,17 @@
> >>  ## explicit
> >>  # go.opentelemetry.io/proto/otlp v0.19.0
> >>  ## explicit
> >> -# golang.org/x/crypto v0.7.0
> >> -## explicit
> >> -# golang.org/x/exp v0.0.0-20230713183714-613f0c0eb8a1
> >> +# golang.org/x/crypto v0.14.0
> >>  ## explicit
> >>  # golang.org/x/mod v0.11.0
> >>  ## explicit
> >> -# golang.org/x/net v0.9.0
> >> +# golang.org/x/net v0.17.0
> >>  ## explicit
> >> -# golang.org/x/oauth2 v0.7.0
> >> +# golang.org/x/oauth2 v0.11.0
> >>  ## explicit
> >> -# golang.org/x/sys v0.7.0
> >> +# golang.org/x/term v0.13.0
> >>  ## explicit
> >> -# golang.org/x/term v0.7.0
> >> -## explicit
> >> -# golang.org/x/text v0.9.0
> >> +# golang.org/x/text v0.13.0
> >>  ## explicit
> >>  # golang.org/x/time v0.3.0
> >>  ## explicit
> >> @@ -332,25 +296,25 @@
> >>  ## explicit
> >>  # google.golang.org/appengine v1.6.7
> >>  ## explicit
> >> -# google.golang.org/genproto v0.0.0-20230526161137-0005af68ea54
> >> +# google.golang.org/genproto v0.0.0-20230822172742-b8732ec3820d
> >>  ## explicit
> >> -# google.golang.org/genproto/googleapis/api
> v0.0.0-20230525234035-dd9d682886f9
> >> +# google.golang.org/genproto/googleapis/api
> v0.0.0-20230822172742-b8732ec3820d
> >>  ## explicit
> >> -# google.golang.org/genproto/googleapis/rpc
> v0.0.0-20230525234030-28d5490b6b19
> >> +# google.golang.org/genproto/googleapis/rpc
> v0.0.0-20230822172742-b8732ec3820d
> >>  ## explicit
> >> -# google.golang.org/protobuf v1.30.0
> >> +# google.golang.org/protobuf v1.31.0
> >>  ## explicit
> >>  # gopkg.in/inf.v0 v0.9.1
> >>  ## explicit
> >> -# gopkg.in/ini.v1 v1.67.0
> >> +# gopkg.in/yaml.v2 v2.4.0
> >>  ## explicit
> >>  # gopkg.in/yaml.v3 v3.0.1
> >>  ## explicit
> >> -# k8s.io/api v0.26.2
> >> +# k8s.io/api v0.26.7
> >>  ## explicit
> >> -# k8s.io/apimachinery v0.26.2
> >> +# k8s.io/apimachinery v0.26.7
> >>  ## explicit
> >> -# k8s.io/client-go v0.26.2
> >> +# k8s.io/client-go v0.26.7
> >>  ## explicit
> >>  # k8s.io/klog/v2 v2.90.1
> >>  ## explicit
> >> @@ -364,4 +328,3 @@
> >>  ## explicit
> >>  # sigs.k8s.io/yaml v1.3.0
> >>  ## explicit
> >> -# github.com/cucumber/godog =3D> github.com/laurazard/godog
> v0.0.0-20220922095256-4c4b17abdae7
> >> diff --git a/recipes-containers/docker-compose/relocation.inc
> b/recipes-containers/docker-compose/relocation.inc
> >> index 9e6eacf..daa5be2 100644
> >> --- a/recipes-containers/docker-compose/relocation.inc
> >> +++ b/recipes-containers/docker-compose/relocation.inc
> >> @@ -3,12 +3,11 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
> >>             k8s.io/klog/v2:k8s.io/klog/v2:force \
> >>             gotest.tools/v3:gotest.tools/v3:force \
> >>             gopkg.in/inf.v0:gopkg.in/inf.v0:force \
> >> -           gopkg.in/ini.v1:gopkg.in/ini.v1:force \
> >> -           gopkg.in/yaml.v2:gopkg.in/yaml.v2:force \
> >>             golang.org/x/exp:golang.org/x/exp:force \
> >> +           golang.org/x/sys:golang.org/x/sys:force \
> >>             golang.org/x/mod:golang.org/x/mod:force \
> >>             golang.org/x/net:golang.org/x/net:force \
> >> -           golang.org/x/sys:golang.org/x/sys:force \
> >> +           gopkg.in/yaml.v2:gopkg.in/yaml.v2:force \
> >>             gopkg.in/yaml.v3:gopkg.in/yaml.v3:force \
> >>             k8s.io/client-go:k8s.io/client-go:force \
> >>             sigs.k8s.io/json:sigs.k8s.io/json:force \
> >> @@ -19,63 +18,54 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
> >>             golang.org/x/time:golang.org/x/time:force \
> >>             go.uber.org/goleak:go.uber.org/goleak:force \
> >>             golang.org/x/tools:golang.org/x/tools:force \
> >> -           github.com/adrg/xdg:github.com/adrg/xdg:force \
> >>             golang.org/x/crypto:golang.org/x/crypto:force \
> >>             golang.org/x/oauth2:golang.org/x/oauth2:force \
> >>             k8s.io/apimachinery:k8s.io/apimachinery:force \
> >>             k8s.io/kube-openapi:k8s.io/kube-openapi:force \
> >>             github.com/moby/term:github.com/moby/term:force \
> >>             github.com/docker/go:github.com/docker/go:force \
> >> -           github.com/kr/pretty:github.com/kr/pretty:force \
> >>             github.com/docker/cli:github.com/docker/cli:force \
> >> -           github.com/pkg/errors:github.com/pkg/errors:force \
> >> -           github.com/gofrs/uuid:github.com/gofrs/uuid:force \
> >>             github.com/mgutz/ansi:github.com/mgutz/ansi:force \
> >> -           github.com/spf13/cast:github.com/spf13/cast:force \
> >> +           github.com/pkg/errors:github.com/pkg/errors:force \
> >>             github.com/golang/mock:github.com/golang/mock:force \
> >>             github.com/spf13/cobra:github.com/spf13/cobra:force \
> >>             github.com/spf13/pflag:github.com/spf13/pflag:force \
> >>             google.golang.org/grpc:google.golang.org/grpc:force \
> >>             github.com/gofrs/flock:github.com/gofrs/flock:force \
> >>             github.com/gorilla/mux:github.com/gorilla/mux:force \
> >> -           github.com/jinzhu/gorm:github.com/jinzhu/gorm:force \
> >>             github.com/moby/locker:github.com/moby/locker:force \
> >>             github.com/rivo/uniseg:github.com/rivo/uniseg:force \
> >> -           github.com/spf13/afero:github.com/spf13/afero:force \
> >>             github.com/buger/goterm:github.com/buger/goterm:force \
> >>             github.com/morikuni/aec:github.com/morikuni/aec:force \
> >> +           github.com/otiai10/copy:github.com/otiai10/copy:force \
> >>             github.com/beorn7/perks:github.com/beorn7/perks:force \
> >>             github.com/go-logr/logr:github.com/go-logr/logr:force \
> >>             github.com/go-logr/stdr:github.com/go-logr/stdr:force \
> >>             github.com/google/shlex:github.com/google/shlex:force \
> >>             github.com/miekg/pkcs11:github.com/miekg/pkcs11:force \
> >> -           github.com/zmap/zcrypto:github.com/zmap/zcrypto:force \
> >>             github.com/docker/buildx:github.com/docker/buildx:force \
> >>             github.com/docker/docker:github.com/docker/docker:force \
> >> +           github.com/google/go-cmp:github.com/google/go-cmp:force \
> >>             github.com/moby/buildkit:github.com/moby/buildkit:force \
> >>             go.opentelemetry.io/otel:go.opentelemetry.io/otel:force \
> >>             github.com/aws/smithy-go:github.com/aws/smithy-go:force \
> >>             github.com/gogo/protobuf:github.com/gogo/protobuf:force \
> >> -           github.com/google/go-cmp:github.com/google/go-cmp:force \
> >>             github.com/google/gofuzz:github.com/google/gofuzz:force \
> >> -           github.com/hashicorp/hcl:github.com/hashicorp/hcl:force \
> >>             github.com/imdario/mergo:github.com/imdario/mergo:force \
> >> +           github.com/containerd/log:github.com/containerd/log:force =
\
> >>             github.com/google/gnostic:github.com/google/gnostic:force =
\
> >> -           github.com/cucumber/godog:github.com/laurazard/godog:force
> \
> >> +           github.com/davecgh/go-spew:github.com/davecgh/go-spew:forc=
e
> \
> >>             github.com/docker/go-units:github.com/docker/go-units:forc=
e
> \
> >>             github.com/sirupsen/logrus:github.com/sirupsen/logrus:forc=
e
> \
> >> -           github.com/davecgh/go-spew:github.com/davecgh/go-spew:forc=
e
> \
> >>             github.com/go-openapi/swag:github.com/go-openapi/swag:forc=
e
> \
> >>             github.com/gogo/googleapis:github.com/gogo/googleapis:forc=
e
> \
> >>             github.com/golang/protobuf:github.com/golang/protobuf:forc=
e
> \
> >>             github.com/mailru/easyjson:github.com/mailru/easyjson:forc=
e
> \
> >>             github.com/mattn/go-isatty:github.com/mattn/go-isatty:forc=
e
> \
> >>             github.com/moby/spdystream:github.com/moby/spdystream:forc=
e
> \
> >> -           github.com/subosito/gotenv:github.com/subosito/gotenv:forc=
e
> \
> >>             google.golang.org/genproto:google.golang.org/genproto:forc=
e
> \
> >>             google.golang.org/protobuf:google.golang.org/protobuf:forc=
e
> \
> >>
> github.com/stretchr/testify:github.com/stretchr/testify:force \
> >> -
> github.com/cloudflare/cfssl:github.com/cloudflare/cfssl:force \
> >>
> github.com/josharian/intern:github.com/josharian/intern:force \
> >>
> github.com/json-iterator/go:github.com/json-iterator/go:force \
> >>
> github.com/serialx/hashring:github.com/serialx/hashring:force \
> >> @@ -85,6 +75,7 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
> >>
> github.com/fsnotify/fsevents:github.com/fsnotify/fsevents:force \
> >>
> github.com/tilt-dev/fsnotify:github.com/tilt-dev/fsnotify:force \
> >>
> github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm:force \
> >> +
> github.com/Microsoft/hcsshim:github.com/Microsoft/hcsshim:force \
> >>
> github.com/aws/aws-sdk-go-v2:github.com/aws/aws-sdk-go-v2:force \
> >>
> github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2:force \
> >>
> github.com/docker/go-metrics:github.com/docker/go-metrics:force \
> >> @@ -97,9 +88,7 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
> >>
> github.com/tonistiigi/fsutil:github.com/tonistiigi/fsutil:force \
> >>
> github.com/Microsoft/go-winio:github.com/Microsoft/go-winio:force \
> >>
> github.com/containerd/console:github.com/containerd/console:force \
> >> -
> github.com/bugsnag/bugsnag-go:github.com/bugsnag/bugsnag-go:force \
> >>
> github.com/fvbommel/sortorder:github.com/fvbommel/sortorder:force \
> >> -
> github.com/hashicorp/go-memdb:github.com/hashicorp/go-memdb:force \
> >>
> github.com/klauspost/compress:github.com/klauspost/compress:force \
> >>
> github.com/mattn/go-colorable:github.com/mattn/go-colorable:force \
> >>
> github.com/mattn/go-runewidth:github.com/mattn/go-runewidth:force \
> >> @@ -116,10 +105,8 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
> >>
> github.com/shibumi/go-pathspec:github.com/shibumi/go-pathspec:force \
> >>
> github.com/docker/cli-docs-tool:github.com/docker/cli-docs-tool:force \
> >>
> github.com/hashicorp/go-version:github.com/hashicorp/go-version:force \
> >> -
> github.com/hashicorp/golang-lru:github.com/hashicorp/golang-lru:force \
> >>
> github.com/moby/sys/symlink:github.com/moby/sys/symlink/symlink:force \
> >>
> github.com/modern-go/concurrent:github.com/modern-go/concurrent:force \
> >> -
> github.com/pelletier/go-toml/v2:github.com/pelletier/go-toml/v2:force \
> >>
> github.com/xeipuuv/gojsonschema:github.com/xeipuuv/gojsonschema:force \
> >>
> github.com/AlecAivazis/survey/v2:github.com/AlecAivazis/survey/v2:force \
> >>
> github.com/containerd/containerd:github.com/containerd/containerd:force \
> >> @@ -127,25 +114,23 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
> >>
> github.com/Masterminds/semver/v3:github.com/Masterminds/semver/v3:force \
> >>
> github.com/containerd/continuity:github.com/containerd/continuity:force \
> >>
> github.com/containerd/typeurl/v2:github.com/containerd/typeurl/v2:force \
> >> -
> github.com/magiconair/properties:github.com/magiconair/properties:force \
> >>
> github.com/xeipuuv/gojsonpointer:github.com/xeipuuv/gojsonpointer:force \
> >>
> go.opentelemetry.io/proto/otlp:go.opentelemetry.io/proto/otlp/otlp:force =
\
> >> +
> github.com/distribution/reference:github.com/distribution/reference:force
> \
> >>
> github.com/mitchellh/mapstructure:github.com/mitchellh/mapstructure:force
> \
> >>
> go.opentelemetry.io/otel/trace:go.opentelemetry.io/otel/trace/trace:force
> \
> >>
> github.com/emicklei/go-restful/v3:github.com/emicklei/go-restful/v3:force
> \
> >>
> github.com/go-openapi/jsonpointer:github.com/go-openapi/jsonpointer:force
> \
> >> +
> github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cleanhttp:force
> \
> >>
> github.com/in-toto/in-toto-golang:github.com/in-toto/in-toto-golang:force
> \
> >>
> github.com/kballard/go-shellquote:github.com/kballard/go-shellquote:force
> \
> >>
> github.com/compose-spec/compose-go:github.com/compose-spec/compose-go:for=
ce
> \
> >>
> github.com/hashicorp/go-multierror:github.com/hashicorp/go-multierror:for=
ce
> \
> >> -
> github.com/cucumber/gherkin-go/v19:github.com/cucumber/gherkin-go/v19:for=
ce
> \
> >>
> github.com/moby/sys/mountinfo:github.com/moby/sys/mountinfo/mountinfo:for=
ce
> \
> >>
> github.com/prometheus/client_model:github.com/prometheus/client_model:for=
ce
> \
> >> -
> github.com/spf13/jwalterweatherman:github.com/spf13/jwalterweatherman:for=
ce
> \
> >>
> github.com/xeipuuv/gojsonreference:github.com/xeipuuv/gojsonreference:for=
ce
> \
> >>
> go.opentelemetry.io/otel/metric:go.opentelemetry.io/otel/metric/metric:fo=
rce
> \
> >>
> github.com/opencontainers/go-digest:github.com/opencontainers/go-digest:f=
orce
> \
> >> -
> github.com/cucumber/messages-go/v16:github.com/cucumber/messages-go/v16:f=
orce
> \
> >>
> github.com/go-openapi/jsonreference:github.com/go-openapi/jsonreference:f=
orce
> \
> >>
> github.com/prometheus/client_golang:github.com/prometheus/client_golang:f=
orce
> \
> >>
> github.com/moby/sys/sequential:github.com/moby/sys/sequential/sequential:=
force
> \
> >> @@ -154,10 +139,7 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
> >>
> github.com/AdaLogics/go-fuzz-headers:github.com/AdaLogics/go-fuzz-headers=
:force
> \
> >>
> github.com/inconshreveable/mousetrap:github.com/inconshreveable/mousetrap=
:force
> \
> >>
> sigs.k8s.io/structured-merge-diff/v4:sigs.k8s.io/structured-merge-diff/v4=
:force
> \
> >> -
> github.com/cyphar/filepath-securejoin:github.com/cyphar/filepath-securejo=
in:force
> \
> >>
> github.com/aws/aws-sdk-go-v2/config:github.com/aws/aws-sdk-go-v2/config/c=
onfig:force
> \
> >> -
> github.com/distribution/distribution/v3:github.com/distribution/distribut=
ion/v3:force
> \
> >> -
> github.com/hashicorp/go-immutable-radix:github.com/hashicorp/go-immutable=
-radix:force
> \
> >>
> github.com/grpc-ecosystem/grpc-gateway/v2:github.com/grpc-ecosystem/grpc-=
gateway/v2:force
> \
> >>
> github.com/docker/docker-credential-helpers:github.com/docker/docker-cred=
ential-helpers:force
> \
> >>
> github.com/grpc-ecosystem/go-grpc-middleware:github.com/grpc-ecosystem/go=
-grpc-middleware:force
> \
> >> diff --git a/recipes-containers/docker-compose/src_uri.inc
> b/recipes-containers/docker-compose/src_uri.inc
> >> index 8897c9c..32a16b3 100644
> >> --- a/recipes-containers/docker-compose/src_uri.inc
> >> +++ b/recipes-containers/docker-compose/src_uri.inc
> >> @@ -1,6 +1,6 @@
> >> -#       k8s.io/api v0.26.2
> >> -# [1] git ls-remote https://github.com/kubernetes/api
> 1528256abbdf8ff2510112b28a6aacd239789a36
> >> -SRCREV_k8s.io-api=3D"1528256abbdf8ff2510112b28a6aacd239789a36"
> >> +#       k8s.io/api v0.26.7
> >> +# [1] git ls-remote https://github.com/kubernetes/api
> 145ce6cdaea22991c53ba9c7ee7aabae5181cb3e
> >> +SRCREV_k8s.io-api=3D"145ce6cdaea22991c53ba9c7ee7aabae5181cb3e"
> >>  SRC_URI +=3D "git://
> github.com/kubernetes/api;name=3Dk8s.io-api;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/api
> <http://github.com/kubernetes/api;name=3Dk8s.io-api;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/k8s.=
io/api>
> "
> >>
> >>  #       k8s.io/utils v0.0.0-20230220204549-a5ecb0141aa5
> >> @@ -13,54 +13,49 @@ SRC_URI +=3D "git://
> github.com/kubernetes/utils;name=3Dutils;protocol=3Dhttps;nobranch
> >>  SRCREV_klog-v2=3D"d7fc50528570f8276de46570f916682257821e22"
> >>  SRC_URI +=3D "git://
> github.com/kubernetes/klog;name=3Dklog-v2;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/klog/v2
> <http://github.com/kubernetes/klog;name=3Dklog-v2;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/k8s.io=
/klog/v2>
> "
> >>
> >> -#       gotest.tools/v3 v3.5.0
> >> -# [1] git ls-remote https://github.com/gotestyourself/gotest.tools
> a80f057529047c44e1a85d0d017b200787e537e0
> >> -SRCREV_gotest.tools-v3=3D"a80f057529047c44e1a85d0d017b200787e537e0"
> >> -SRC_URI +=3D "git://
> github.com/gotestyourself/gotest.tools;name=3Dgotest.tools-v3;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
test.tools/v3
> <http://github.com/gotestyourself/gotest.tools;name=3Dgotest.tools-v3;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import=
/vendor.fetch/gotest.tools/v3>
> "
> >> +#       gotest.tools/v3 v3.5.1
> >> +# [1] git ls-remote https://github.com/gotestyourself/gotest.tools
> 81cea1abc596b025bf2573c7fdf97740512e4c6c
> >> +SRCREV_v3=3D"81cea1abc596b025bf2573c7fdf97740512e4c6c"
> >> +SRC_URI +=3D "git://
> github.com/gotestyourself/gotest.tools;name=3Dv3;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gotest.tools/v3
> <http://github.com/gotestyourself/gotest.tools;name=3Dv3;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch=
/gotest.tools/v3>
> "
> >>
> >>  #       gopkg.in/inf.v0 v0.9.1
> >>  # [1] git ls-remote https://github.com/go-inf/inf
> d2d2541c53f18d2a059457998ce2876cc8e67cbf
> >>  SRCREV_inf.v0=3D"d2d2541c53f18d2a059457998ce2876cc8e67cbf"
> >>  SRC_URI +=3D "git://
> github.com/go-inf/inf;name=3Dinf.v0;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/inf.v0
> <http://github.com/go-inf/inf;name=3Dinf.v0;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in/inf=
.v0>
> "
> >>
> >> -#       gopkg.in/ini.v1 v1.67.0
> >> -# [1] git ls-remote https://github.com/go-ini/ini
> b2f570e5b5b844226bbefe6fb521d891f529a951
> >> -SRCREV_ini.v1=3D"b2f570e5b5b844226bbefe6fb521d891f529a951"
> >> -SRC_URI +=3D "git://
> github.com/go-ini/ini;name=3Dini.v1;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ini.v1
> <http://github.com/go-ini/ini;name=3Dini.v1;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in/ini=
.v1>
> "
> >> -
> >> -#       gopkg.in/yaml.v2 v2.4.0
> >> -# [1] git ls-remote https://github.com/go-yaml/yaml
> 7649d4548cb53a614db133b2a8ac1f31859dda8c
> >> -SRCREV_yaml.v2=3D"7649d4548cb53a614db133b2a8ac1f31859dda8c"
> >> -SRC_URI +=3D "git://
> github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v2
> <http://github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in=
/yaml.v2>
> "
> >> -
> >>  #       golang.org/x/exp v0.0.0-20230713183714-613f0c0eb8a1
> >>  # [1] git ls-remote https://go.googlesource.com/exp
> 613f0c0eb8a17a98ecdb096a7f9f7d5053c1c963
> >>  SRCREV_exp=3D"613f0c0eb8a17a98ecdb096a7f9f7d5053c1c963"
> >>  SRC_URI +=3D "git://
> go.googlesource.com/exp;name=3Dexp;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/exp
> <http://go.googlesource.com/exp;name=3Dexp;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/=
exp>
> "
> >>
> >> +#       golang.org/x/sys v0.14.0
> >> +# [1] git ls-remote https://go.googlesource.com/sys
> cb378ae1ff8cd45e69d4f172df8370bc844e1f86
> >> +SRCREV_sys=3D"cb378ae1ff8cd45e69d4f172df8370bc844e1f86"
> >> +SRC_URI +=3D "git://
> go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys
> <http://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/=
sys>
> "
> >> +
> >>  #       golang.org/x/mod v0.11.0
> >>  # [1] git ls-remote https://go.googlesource.com/mod
> 62c7e578f1a7275d934c99dd48715525bd52b17e
> >>  SRCREV_mod=3D"62c7e578f1a7275d934c99dd48715525bd52b17e"
> >>  SRC_URI +=3D "git://
> go.googlesource.com/mod;name=3Dmod;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/mod
> <http://go.googlesource.com/mod;name=3Dmod;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/=
mod>
> "
> >>
> >> -#       golang.org/x/net v0.9.0
> >> -# [1] git ls-remote https://go.googlesource.com/net
> 694cff8668bac64e0864b552bffc280cd27f21b1
> >> -SRCREV_net=3D"694cff8668bac64e0864b552bffc280cd27f21b1"
> >> +#       golang.org/x/net v0.17.0
> >> +# [1] git ls-remote https://go.googlesource.com/net
> b225e7ca6dde1ef5a5ae5ce922861bda011cfabd
> >> +SRCREV_net=3D"b225e7ca6dde1ef5a5ae5ce922861bda011cfabd"
> >>  SRC_URI +=3D "git://
> go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/net
> <http://go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/=
net>
> "
> >>
> >> -#       golang.org/x/sys v0.7.0
> >> -# [1] git ls-remote https://go.googlesource.com/sys
> 64840c112d2335ed9874114aed48f946e778a769
> >> -SRCREV_sys=3D"64840c112d2335ed9874114aed48f946e778a769"
> >> -SRC_URI +=3D "git://
> go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys
> <http://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/=
sys>
> "
> >> +#       gopkg.in/yaml.v2 v2.4.0
> >> +# [1] git ls-remote https://github.com/go-yaml/yaml
> 7649d4548cb53a614db133b2a8ac1f31859dda8c
> >> +SRCREV_yaml.v2=3D"7649d4548cb53a614db133b2a8ac1f31859dda8c"
> >> +SRC_URI +=3D "git://
> github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v2
> <http://github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in=
/yaml.v2>
> "
> >>
> >>  #       gopkg.in/yaml.v3 v3.0.1
> >>  # [1] git ls-remote https://github.com/go-yaml/yaml
> f6f7691b1fdeb513f56608cd2c32c51f8194bf51
> >>  SRCREV_yaml.v3=3D"f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
> >>  SRC_URI +=3D "git://
> github.com/go-yaml/yaml;name=3Dyaml.v3;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v3
> <http://github.com/go-yaml/yaml;name=3Dyaml.v3;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in=
/yaml.v3>
> "
> >>
> >> -#       k8s.io/client-go v0.26.2
> >> -# [1] git ls-remote https://github.com/kubernetes/client-go
> 620cb60675340a9ca825fd5082b0d500f9b62e90
> >> -SRCREV_client-go=3D"620cb60675340a9ca825fd5082b0d500f9b62e90"
> >> +#       k8s.io/client-go v0.26.7
> >> +# [1] git ls-remote https://github.com/kubernetes/client-go
> 30088cdd7e8d70b3000586d4e9e42e50684359ca
> >> +SRCREV_client-go=3D"30088cdd7e8d70b3000586d4e9e42e50684359ca"
> >>  SRC_URI +=3D "git://
> github.com/kubernetes/client-go;name=3Dclient-go;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/client-g=
o
> <http://github.com/kubernetes/client-go;name=3Dclient-go;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch=
/k8s.io/client-go>
> "
> >>
> >>  #       sigs.k8s.io/json v0.0.0-20220713155537-f223a00ba0e2
> >> @@ -73,19 +68,19 @@ SRC_URI +=3D "git://
> github.com/kubernetes-sigs/json;name=3Djson;protocol=3Dhttps;nobra
> >>  SRCREV_yaml=3D"9535b3b1e2893fe44efb37c5c9f5665e245d786a"
> >>  SRC_URI +=3D "git://
> github.com/kubernetes-sigs/yaml;name=3Dyaml;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/yaml
> <http://github.com/kubernetes-sigs/yaml;name=3Dyaml;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/sigs=
.k8s.io/yaml>
> "
> >>
> >> -#       golang.org/x/sync v0.3.0
> >> -# [1] git ls-remote https://go.googlesource.com/sync
> 93782cc822b6b554cb7df40332fd010f0473cbc8
> >> -SRCREV_sync=3D"93782cc822b6b554cb7df40332fd010f0473cbc8"
> >> +#       golang.org/x/sync v0.5.0
> >> +# [1] git ls-remote https://go.googlesource.com/sync
> 10739b037d369c748d671b216356d7e04ce68da1
> >> +SRCREV_sync=3D"10739b037d369c748d671b216356d7e04ce68da1"
> >>  SRC_URI +=3D "git://
> go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sync
> <http://go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/=
x/sync>
> "
> >>
> >> -#       golang.org/x/term v0.7.0
> >> -# [1] git ls-remote https://go.googlesource.com/term
> 7ae6be6d0150527c2c41e70586b9ade6a972a186
> >> -SRCREV_x-term=3D"7ae6be6d0150527c2c41e70586b9ade6a972a186"
> >> +#       golang.org/x/term v0.13.0
> >> +# [1] git ls-remote https://go.googlesource.com/term
> ea6303ae752eaacd897fec4b7534b74c56e1d787
> >> +SRCREV_x-term=3D"ea6303ae752eaacd897fec4b7534b74c56e1d787"
> >>  SRC_URI +=3D "git://
> go.googlesource.com/term;name=3Dx-term;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/term
> <http://go.googlesource.com/term;name=3Dx-term;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.o=
rg/x/term>
> "
> >>
> >> -#       golang.org/x/text v0.9.0
> >> -# [1] git ls-remote https://go.googlesource.com/text
> 48e4a4a957429d31328a685863b594ca9a06b552
> >> -SRCREV_text=3D"48e4a4a957429d31328a685863b594ca9a06b552"
> >> +#       golang.org/x/text v0.13.0
> >> +# [1] git ls-remote https://go.googlesource.com/text
> f488e191e67ed95a5b9b7b39024e5a5f5f1ffd02
> >> +SRCREV_text=3D"f488e191e67ed95a5b9b7b39024e5a5f5f1ffd02"
> >>  SRC_URI +=3D "git://
> go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/text
> <http://go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/=
x/text>
> "
> >>
> >>  #       golang.org/x/time v0.3.0
> >> @@ -93,9 +88,9 @@ SRC_URI +=3D "git://
> go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;nobranch=3D1;d
> >>  SRCREV_time=3D"2c09566ef13fb5556401ddff3c53c3dbc2a42dac"
> >>  SRC_URI +=3D "git://
> go.googlesource.com/time;name=3Dtime;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/time
> <http://go.googlesource.com/time;name=3Dtime;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/=
x/time>
> "
> >>
> >> -#       go.uber.org/goleak v1.2.1
> >> -# [1] git ls-remote https://github.com/uber-go/goleak
> 83c7e126390f1508ca9cb8e87d70849b55181104
> >> -SRCREV_goleak=3D"83c7e126390f1508ca9cb8e87d70849b55181104"
> >> +#       go.uber.org/goleak v1.3.0
> >> +# [1] git ls-remote https://github.com/uber-go/goleak
> 31095c657c34bba405a8d480db27989aa5f60b9c
> >> +SRCREV_goleak=3D"31095c657c34bba405a8d480db27989aa5f60b9c"
> >>  SRC_URI +=3D "git://
> github.com/uber-go/goleak;name=3Dgoleak;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/goleak
> <http://github.com/uber-go/goleak;name=3Dgoleak;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/go.uber.=
org/goleak>
> "
> >>
> >>  #       golang.org/x/tools v0.7.0
> >> @@ -103,24 +98,19 @@ SRC_URI +=3D "git://
> github.com/uber-go/goleak;name=3Dgoleak;protocol=3Dhttps;nobranch=3D
> >>  SRCREV_tools=3D"031fc75960d487b0b15db12fb328676236a3a39c"
> >>  SRC_URI +=3D "git://
> go.googlesource.com/tools;name=3Dtools;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/tools
> <http://go.googlesource.com/tools;name=3Dtools;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.o=
rg/x/tools>
> "
> >>
> >> -#       github.com/adrg/xdg v0.4.0
> >> -# [1] git ls-remote https://github.com/adrg/xdg
> 4ec40e24f0cf1039f93c773f2984decdea9719b5
> >> -SRCREV_xdg=3D"4ec40e24f0cf1039f93c773f2984decdea9719b5"
> >> -SRC_URI +=3D "git://
> github.com/adrg/xdg;name=3Dxdg;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/adrg/xdg
> <http://github.com/adrg/xdg;name=3Dxdg;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/adrg/x=
dg>
> "
> >> -
> >> -#       golang.org/x/crypto v0.7.0
> >> -# [1] git ls-remote https://go.googlesource.com/crypto
> 776e461a4e6d8b372a43c72122c5c28cfc40dca2
> >> -SRCREV_crypto=3D"776e461a4e6d8b372a43c72122c5c28cfc40dca2"
> >> +#       golang.org/x/crypto v0.14.0
> >> +# [1] git ls-remote https://go.googlesource.com/crypto
> e3cc52e598e302f8c613a645bb7231264d8ec995
> >> +SRCREV_crypto=3D"e3cc52e598e302f8c613a645bb7231264d8ec995"
> >>  SRC_URI +=3D "git://
> go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/crypto
> <http://go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.=
org/x/crypto>
> "
> >>
> >> -#       golang.org/x/oauth2 v0.7.0
> >> -# [1] git ls-remote https://go.googlesource.com/oauth2
> 36075149c5b89480def496c735b8a1ba5fc63218
> >> -SRCREV_oauth2=3D"36075149c5b89480def496c735b8a1ba5fc63218"
> >> +#       golang.org/x/oauth2 v0.11.0
> >> +# [1] git ls-remote https://go.googlesource.com/oauth2
> 2e4a4e2bfb69ca7609cb423438c55caa131431c1
> >> +SRCREV_oauth2=3D"2e4a4e2bfb69ca7609cb423438c55caa131431c1"
> >>  SRC_URI +=3D "git://
> go.googlesource.com/oauth2;name=3Doauth2;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/oauth2
> <http://go.googlesource.com/oauth2;name=3Doauth2;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.=
org/x/oauth2>
> "
> >>
> >> -#       k8s.io/apimachinery v0.26.2
> >> -# [1] git ls-remote https://github.com/kubernetes/apimachinery
> 53ecdf01b997ca93c7db7615dfe7b27ad8391983
> >> -SRCREV_apimachinery=3D"53ecdf01b997ca93c7db7615dfe7b27ad8391983"
> >> +#       k8s.io/apimachinery v0.26.7
> >> +# [1] git ls-remote https://github.com/kubernetes/apimachinery
> dd46389197a396927dadb194ae5fc9dbebeb5a31
> >> +SRCREV_apimachinery=3D"dd46389197a396927dadb194ae5fc9dbebeb5a31"
> >>  SRC_URI +=3D "git://
> github.com/kubernetes/apimachinery;name=3Dapimachinery;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/ap=
imachinery
> <http://github.com/kubernetes/apimachinery;name=3Dapimachinery;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/k8s.io/apimachinery>
> "
> >>
> >>  #       k8s.io/kube-openapi v0.0.0-20221012153701-172d655c2280
> >> @@ -138,44 +128,29 @@ SRC_URI +=3D "git://
> github.com/moby/term;name=3Dterm;protocol=3Dhttps;nobranch=3D1;dests
> >>  SRCREV_go=3D"d30aec9fd63c35133f8f79c3412ad91a3b08be06"
> >>  SRC_URI +=3D "git://
> github.com/docker/go;name=3Dgo;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go
> <http://github.com/docker/go;name=3Dgo;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/docker=
/go>
> "
> >>
> >> -#       github.com/kr/pretty v0.3.0
> >> -# [1] git ls-remote https://github.com/kr/pretty
> a883a8422cd235c67c6c4fdcb7bbb022143e10b1
> >> -SRCREV_pretty=3D"a883a8422cd235c67c6c4fdcb7bbb022143e10b1"
> >> -SRC_URI +=3D "git://
> github.com/kr/pretty;name=3Dpretty;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kr/pretty
> <http://github.com/kr/pretty;name=3Dpretty;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/kr=
/pretty>
> "
> >> -
> >> -#       github.com/docker/cli v24.0.5+incompatible
> >> -# [1] git ls-remote https://github.com/docker/cli
> ced099660009713e0e845eeb754e6050dbaa45d0
> >> -SRCREV_cli=3D"ced099660009713e0e845eeb754e6050dbaa45d0"
> >> +#       github.com/docker/cli v24.0.7+incompatible
> >> +# [1] git ls-remote https://github.com/docker/cli
> afdd53b4e341be38d2056a42113b938559bb1d94
> >> +SRCREV_cli=3D"afdd53b4e341be38d2056a42113b938559bb1d94"
> >>  SRC_URI +=3D "git://
> github.com/docker/cli;name=3Dcli;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/cli
> <http://github.com/docker/cli;name=3Dcli;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/dock=
er/cli>
> "
> >>
> >> -#       github.com/pkg/errors v0.9.1
> >> -# [1] git ls-remote https://github.com/pkg/errors
> 614d223910a179a466c1767a985424175c39b465
> >> -SRCREV_errors=3D"614d223910a179a466c1767a985424175c39b465"
> >> -SRC_URI +=3D "git://
> github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors
> <http://github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/p=
kg/errors>
> "
> >> -
> >> -#       github.com/gofrs/uuid v4.2.0+incompatible
> >> -# [1] git ls-remote https://github.com/gofrs/uuid
> 0c84a43ce25087b7041833685982950a65630d28
> >> -SRCREV_uuid=3D"0c84a43ce25087b7041833685982950a65630d28"
> >> -SRC_URI +=3D "git://
> github.com/gofrs/uuid;name=3Duuid;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gofrs/uuid
> <http://github.com/gofrs/uuid;name=3Duuid;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/gof=
rs/uuid>
> "
> >> -
> >>  #       github.com/mgutz/ansi v0.0.0-20170206155736-9520e82c474b
> >>  # [1] git ls-remote https://github.com/mgutz/ansi
> 9520e82c474b0a04dd04f8a40959027271bab992
> >>  SRCREV_ansi=3D"9520e82c474b0a04dd04f8a40959027271bab992"
> >>  SRC_URI +=3D "git://
> github.com/mgutz/ansi;name=3Dansi;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mgutz/ansi
> <http://github.com/mgutz/ansi;name=3Dansi;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/mgu=
tz/ansi>
> "
> >>
> >> -#       github.com/spf13/cast v1.5.0
> >> -# [1] git ls-remote https://github.com/spf13/cast
> 2b0eb0f724e320b655240e331aef36d1175986c2
> >> -SRCREV_cast=3D"2b0eb0f724e320b655240e331aef36d1175986c2"
> >> -SRC_URI +=3D "git://
> github.com/spf13/cast;name=3Dcast;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/cast
> <http://github.com/spf13/cast;name=3Dcast;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/spf=
13/cast>
> "
> >> +#       github.com/pkg/errors v0.9.1
> >> +# [1] git ls-remote https://github.com/pkg/errors
> 614d223910a179a466c1767a985424175c39b465
> >> +SRCREV_errors=3D"614d223910a179a466c1767a985424175c39b465"
> >> +SRC_URI +=3D "git://
> github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors
> <http://github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/p=
kg/errors>
> "
> >>
> >>  #       github.com/golang/mock v1.6.0
> >>  # [1] git ls-remote https://github.com/golang/mock
> aba2ff9a6844d5e3289e8472d3217d5b3090f083
> >>  SRCREV_mock=3D"aba2ff9a6844d5e3289e8472d3217d5b3090f083"
> >>  SRC_URI +=3D "git://
> github.com/golang/mock;name=3Dmock;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/mock
> <http://github.com/golang/mock;name=3Dmock;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/go=
lang/mock>
> "
> >>
> >> -#       github.com/spf13/cobra v1.7.0
> >> -# [1] git ls-remote https://github.com/spf13/cobra
> 4dd4b25de38418174a6e859e8a32eaccca32dccc
> >> -SRCREV_cobra=3D"4dd4b25de38418174a6e859e8a32eaccca32dccc"
> >> +#       github.com/spf13/cobra v1.8.0
> >> +# [1] git ls-remote https://github.com/spf13/cobra
> a0a6ae020bb3899ff0276067863e50523f897370
> >> +SRCREV_cobra=3D"a0a6ae020bb3899ff0276067863e50523f897370"
> >>  SRC_URI +=3D "git://
> github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/cobra
> <http://github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/s=
pf13/cobra>
> "
> >>
> >>  #       github.com/spf13/pflag v1.0.5
> >> @@ -183,9 +158,9 @@ SRC_URI +=3D "git://
> github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps;nobranch=3D1;de
> >>  SRCREV_pflag=3D"2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
> >>  SRC_URI +=3D "git://
> github.com/spf13/pflag;name=3Dpflag;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/pflag
> <http://github.com/spf13/pflag;name=3Dpflag;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/s=
pf13/pflag>
> "
> >>
> >> -#       google.golang.org/grpc v1.57.0
> >> -# [1] git ls-remote https://github.com/grpc/grpc-go
> 87bf02ad24f6cc071d2553eb5d62332194bba1fe
> >> -SRCREV_grpc=3D"87bf02ad24f6cc071d2553eb5d62332194bba1fe"
> >> +#       google.golang.org/grpc v1.59.0
> >> +# [1] git ls-remote https://github.com/grpc/grpc-go
> 7765221f4bf6104973db7946d56936cf838cad46
> >> +SRCREV_grpc=3D"7765221f4bf6104973db7946d56936cf838cad46"
> >>  SRC_URI +=3D "git://
> github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/grpc
> <http://github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/google.golan=
g.org/grpc>
> "
> >>
> >>  #       github.com/gofrs/flock v0.8.1
> >> @@ -198,11 +173,6 @@ SRC_URI +=3D "git://
> github.com/gofrs/flock;name=3Dflock;protocol=3Dhttps;nobranch=3D1;de
> >>  SRCREV_mux=3D"98cb6bf42e086f6af920b965c38cacc07402d51b"
> >>  SRC_URI +=3D "git://
> github.com/gorilla/mux;name=3Dmux;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gorilla/mux
> <http://github.com/gorilla/mux;name=3Dmux;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/gor=
illa/mux>
> "
> >>
> >> -#       github.com/jinzhu/gorm v1.9.11
> >> -# [1] git ls-remote https://github.com/jinzhu/gorm
> 81c17a7e2529c59efc4e74c5b32c1fb71fb12fa2
> >> -SRCREV_gorm=3D"81c17a7e2529c59efc4e74c5b32c1fb71fb12fa2"
> >> -SRC_URI +=3D "git://
> github.com/jinzhu/gorm;name=3Dgorm;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jinzhu/gorm
> <http://github.com/jinzhu/gorm;name=3Dgorm;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/ji=
nzhu/gorm>
> "
> >> -
> >>  #       github.com/moby/locker v1.0.1
> >>  # [1] git ls-remote https://github.com/moby/locker
> 281af2d563954745bea9d1487c965f24d30742fe
> >>  SRCREV_locker=3D"281af2d563954745bea9d1487c965f24d30742fe"
> >> @@ -213,11 +183,6 @@ SRC_URI +=3D "git://
> github.com/moby/locker;name=3Dlocker;protocol=3Dhttps;nobranch=3D1;d
> >>  SRCREV_uniseg=3D"75711fccf6a3e85bc74c241e2dddd06a9bc9e53d"
> >>  SRC_URI +=3D "git://
> github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo/uniseg
> <http://github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/=
rivo/uniseg>
> "
> >>
> >> -#       github.com/spf13/afero v1.9.2
> >> -# [1] git ls-remote https://github.com/spf13/afero
> 2a70f2bb2db1524bf2aa3ca0cfebefa8d6367b7b
> >> -SRCREV_afero=3D"2a70f2bb2db1524bf2aa3ca0cfebefa8d6367b7b"
> >> -SRC_URI +=3D "git://
> github.com/spf13/afero;name=3Dafero;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/afero
> <http://github.com/spf13/afero;name=3Dafero;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/s=
pf13/afero>
> "
> >> -
> >>  #       github.com/buger/goterm v1.0.4
> >>  # [1] git ls-remote https://github.com/buger/goterm
> a73545aae7d693f786ce4cc687460efca4845f31
> >>  SRCREV_goterm=3D"a73545aae7d693f786ce4cc687460efca4845f31"
> >> @@ -228,6 +193,11 @@ SRC_URI +=3D "git://
> github.com/buger/goterm;name=3Dgoterm;protocol=3Dhttps;nobranch=3D1;
> >>  SRCREV_aec=3D"39771216ff4c63d11f5e604076f9c45e8be1067b"
> >>  SRC_URI +=3D "git://
> github.com/morikuni/aec;name=3Daec;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/morikuni/aec
> <http://github.com/morikuni/aec;name=3Daec;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/mo=
rikuni/aec>
> "
> >>
> >> +#       github.com/otiai10/copy v1.14.0
> >> +# [1] git ls-remote https://github.com/otiai10/copy
> fba066acb0eb6e25d510073787741c0a8b31bf1e
> >> +SRCREV_copy=3D"fba066acb0eb6e25d510073787741c0a8b31bf1e"
> >> +SRC_URI +=3D "git://
> github.com/otiai10/copy;name=3Dcopy;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/otiai10/copy
> <http://github.com/otiai10/copy;name=3Dcopy;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/o=
tiai10/copy>
> "
> >> +
> >>  #       github.com/beorn7/perks v1.0.1
> >>  # [1] git ls-remote https://github.com/beorn7/perks
> 37c8de3658fcb183f997c4e13e8337516ab753e6
> >>  SRCREV_perks=3D"37c8de3658fcb183f997c4e13e8337516ab753e6"
> >> @@ -253,24 +223,24 @@ SRC_URI +=3D "git://
> github.com/google/shlex;name=3Dshlex;protocol=3Dhttps;nobranch=3D1;d
> >>  SRCREV_pkcs11=3D"f3481918a208bd212aa995a41f92d786eb418a7d"
> >>  SRC_URI +=3D "git://
> github.com/miekg/pkcs11;name=3Dpkcs11;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/miekg/pkcs11
> <http://github.com/miekg/pkcs11;name=3Dpkcs11;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/miekg/pkcs11>
> "
> >>
> >> -#       github.com/zmap/zcrypto v0.0.0-20220605182715-4dfcec6e9a8c
> >> -# [1] git ls-remote https://github.com/zmap/zcrypto
> 4dfcec6e9a8c2014f73dd584e64dc797129d77b8
> >> -SRCREV_zcrypto=3D"4dfcec6e9a8c2014f73dd584e64dc797129d77b8"
> >> -SRC_URI +=3D "git://
> github.com/zmap/zcrypto;name=3Dzcrypto;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/zmap/zcrypto
> <http://github.com/zmap/zcrypto;name=3Dzcrypto;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/zmap/zcrypto>
> "
> >> -
> >> -#       github.com/docker/buildx v0.11.2
> >> -# [1] git ls-remote https://github.com/docker/buildx
> 9872040b6626fb7d87ef7296fd5b832e8cc2ad17
> >> -SRCREV_buildx=3D"9872040b6626fb7d87ef7296fd5b832e8cc2ad17"
> >> +#       github.com/docker/buildx v0.12.0
> >> +# [1] git ls-remote https://github.com/docker/buildx
> 542e5d810e4a1a155684f5f3c5bd7e797632a12f
> >> +SRCREV_buildx=3D"542e5d810e4a1a155684f5f3c5bd7e797632a12f"
> >>  SRC_URI +=3D "git://
> github.com/docker/buildx;name=3Dbuildx;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/buildx
> <http://github.com/docker/buildx;name=3Dbuildx;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/docker/buildx>
> "
> >>
> >> -#       github.com/docker/docker v24.0.5+incompatible
> >> -# [1] git ls-remote https://github.com/moby/moby
> a61e2b4c9c5f7c241aeb37f389b4444aee26bea4
> >> -SRCREV_docker=3D"a61e2b4c9c5f7c241aeb37f389b4444aee26bea4"
> >> +#       github.com/docker/docker v24.0.7+incompatible
> >> +# [1] git ls-remote https://github.com/moby/moby
> 311b9ff0aa93aa55880e1e5f8871c4fb69583426
> >> +SRCREV_docker=3D"311b9ff0aa93aa55880e1e5f8871c4fb69583426"
> >>  SRC_URI +=3D "git://
> github.com/moby/moby;name=3Ddocker;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/docker
> <http://github.com/moby/moby;name=3Ddocker;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/do=
cker/docker>
> "
> >>
> >> -#       github.com/moby/buildkit v0.12.1
> >> -# [1] git ls-remote https://github.com/moby/buildkit
> bb857a0d49f45aa0ce9cd554b78d4075553e20f9
> >> -SRCREV_buildkit=3D"bb857a0d49f45aa0ce9cd554b78d4075553e20f9"
> >> +#       github.com/google/go-cmp v0.6.0
> >> +# [1] git ls-remote https://github.com/google/go-cmp
> c3ad8435e7bef96af35732bc0789e5a2278c6d5f
> >> +SRCREV_go-cmp=3D"c3ad8435e7bef96af35732bc0789e5a2278c6d5f"
> >> +SRC_URI +=3D "git://
> github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/go-cmp
> <http://github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/google/go-cmp>
> "
> >> +
> >> +#       github.com/moby/buildkit
> v0.13.0-beta1.0.20231023114302-d5c1d785b042
> >> +# [1] git ls-remote https://github.com/moby/buildkit
> d5c1d785b042cf834a05b08b73479d55b6acb533
> >> +SRCREV_buildkit=3D"d5c1d785b042cf834a05b08b73479d55b6acb533"
> >>  SRC_URI +=3D "git://
> github.com/moby/buildkit;name=3Dbuildkit;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/buildki=
t
> <http://github.com/moby/buildkit;name=3Dbuildkit;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/moby/buildkit>
> "
> >>
> >>  #       go.opentelemetry.io/otel v1.14.0
> >> @@ -288,35 +258,30 @@ SRC_URI +=3D "git://
> github.com/aws/smithy-go;name=3Dsmithy-go;protocol=3Dhttps;nobranc
> >>  SRCREV_protobuf=3D"b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
> >>  SRC_URI +=3D "git://
> github.com/gogo/protobuf;name=3Dprotobuf;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gogo/protobu=
f
> <http://github.com/gogo/protobuf;name=3Dprotobuf;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/gogo/protobuf>
> "
> >>
> >> -#       github.com/google/go-cmp v0.5.9
> >> -# [1] git ls-remote https://github.com/google/go-cmp
> a97318bf6562f2ed2632c5f985db51b1bc5bdcd0
> >> -SRCREV_go-cmp=3D"a97318bf6562f2ed2632c5f985db51b1bc5bdcd0"
> >> -SRC_URI +=3D "git://
> github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/go-cmp
> <http://github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/google/go-cmp>
> "
> >> -
> >>  #       github.com/google/gofuzz v1.2.0
> >>  # [1] git ls-remote https://github.com/google/gofuzz
> 379e164120fbc98885a8f494b5aa41ba94f64c56
> >>  SRCREV_gofuzz=3D"379e164120fbc98885a8f494b5aa41ba94f64c56"
> >>  SRC_URI +=3D "git://
> github.com/google/gofuzz;name=3Dgofuzz;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/gofuzz
> <http://github.com/google/gofuzz;name=3Dgofuzz;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/google/gofuzz>
> "
> >>
> >> -#       github.com/hashicorp/hcl v1.0.0
> >> -# [1] git ls-remote https://github.com/hashicorp/hcl
> 8cb6e5b959231cc1119e43259c4a608f9c51a241
> >> -SRCREV_hcl=3D"8cb6e5b959231cc1119e43259c4a608f9c51a241"
> >> -SRC_URI +=3D "git://
> github.com/hashicorp/hcl;name=3Dhcl;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/hcl
> <http://github.com/hashicorp/hcl;name=3Dhcl;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/h=
ashicorp/hcl>
> "
> >> -
> >>  #       github.com/imdario/mergo v0.3.16
> >>  # [1] git ls-remote https://github.com/darccio/mergo
> 14fe2b165b83359196f820886a2b24f2771729e9
> >>  SRCREV_mergo=3D"14fe2b165b83359196f820886a2b24f2771729e9"
> >>  SRC_URI +=3D "git://
> github.com/darccio/mergo;name=3Dmergo;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/imdario/mergo
> <http://github.com/darccio/mergo;name=3Dmergo;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/imdario/mergo>
> "
> >>
> >> +#       github.com/containerd/log v0.1.0
> >> +# [1] git ls-remote https://github.com/containerd/log
> 0fc1e28871fdf2786e2cc51bbe4133db6547a199
> >> +SRCREV_log=3D"0fc1e28871fdf2786e2cc51bbe4133db6547a199"
> >> +SRC_URI +=3D "git://
> github.com/containerd/log;name=3Dlog;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/log
> <http://github.com/containerd/log;name=3Dlog;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/=
containerd/log>
> "
> >> +
> >>  #       github.com/google/gnostic v0.5.7-v3refs
> >>  # [1] git ls-remote https://github.com/google/gnostic
> b49832d97d25b6a41cbe34ea12257924a934eeee
> >>  SRCREV_gnostic=3D"b49832d97d25b6a41cbe34ea12257924a934eeee"
> >>  SRC_URI +=3D "git://
> github.com/google/gnostic;name=3Dgnostic;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/gnost=
ic
> <http://github.com/google/gnostic;name=3Dgnostic;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/google/gnostic>
> "
> >>
> >> -#       github.com/laurazard/godog v0.0.0-20220922095256-4c4b17abdae7
> >> -# [1] git ls-remote https://github.com/laurazard/godog
> 4c4b17abdae7fd4f9d35cfe391ca65d172b092e3
> >> -SRCREV_godog=3D"4c4b17abdae7fd4f9d35cfe391ca65d172b092e3"
> >> -SRC_URI +=3D "git://
> github.com/laurazard/godog;name=3Dgodog;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/laurazard/god=
og
> <http://github.com/laurazard/godog;name=3Dgodog;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/laurazard/godog>
> "
> >> +#       github.com/davecgh/go-spew v1.1.1
> >> +# [1] git ls-remote https://github.com/davecgh/go-spew
> 8991bc29aa16c548c550c7ff78260e27b9ab7c73
> >> +SRCREV_go-spew=3D"8991bc29aa16c548c550c7ff78260e27b9ab7c73"
> >> +SRC_URI +=3D "git://
> github.com/davecgh/go-spew;name=3Dgo-spew;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/davecgh/go-=
spew
> <http://github.com/davecgh/go-spew;name=3Dgo-spew;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github=
.com/davecgh/go-spew>
> "
> >>
> >>  #       github.com/docker/go-units v0.5.0
> >>  # [1] git ls-remote https://github.com/docker/go-units
> e682442797b36348f8e1f98defdbf32bac0b6c6f
> >> @@ -328,11 +293,6 @@ SRC_URI +=3D "git://
> github.com/docker/go-units;name=3Dgo-units;protocol=3Dhttps;nobran
> >>  SRCREV_logrus=3D"d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd"
> >>  SRC_URI +=3D "git://
> github.com/sirupsen/logrus;name=3Dlogrus;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/sirupsen/log=
rus
> <http://github.com/sirupsen/logrus;name=3Dlogrus;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/sirupsen/logrus>
> "
> >>
> >> -#       github.com/davecgh/go-spew v1.1.1
> >> -# [1] git ls-remote https://github.com/davecgh/go-spew
> 8991bc29aa16c548c550c7ff78260e27b9ab7c73
> >> -SRCREV_go-spew=3D"8991bc29aa16c548c550c7ff78260e27b9ab7c73"
> >> -SRC_URI +=3D "git://
> github.com/davecgh/go-spew;name=3Dgo-spew;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/davecgh/go-=
spew
> <http://github.com/davecgh/go-spew;name=3Dgo-spew;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github=
.com/davecgh/go-spew>
> "
> >> -
> >>  #       github.com/go-openapi/swag v0.19.14
> >>  # [1] git ls-remote https://github.com/go-openapi/swag
> c78fa6719bc3d4b977d19a09064feda1c07571af
> >>  SRCREV_swag=3D"c78fa6719bc3d4b977d19a09064feda1c07571af"
> >> @@ -368,19 +328,14 @@ SRC_URI +=3D "git://
> github.com/moby/spdystream;name=3Dspdystream;protocol=3Dhttps;nobr
> >>  SRCREV_signal=3D"b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5"
> >>  SRC_URI +=3D "git://
> github.com/moby/sys;name=3Dsignal;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/signal
> <http://github.com/moby/sys;name=3Dsignal;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/mob=
y/sys/signal>
> "
> >>
> >> -#       github.com/subosito/gotenv v1.4.1
> >> -# [1] git ls-remote https://github.com/subosito/gotenv
> d94fdbe829d24b31d6ac30b6beb28b6420c1778a
> >> -SRCREV_gotenv=3D"d94fdbe829d24b31d6ac30b6beb28b6420c1778a"
> >> -SRC_URI +=3D "git://
> github.com/subosito/gotenv;name=3Dgotenv;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/subosito/got=
env
> <http://github.com/subosito/gotenv;name=3Dgotenv;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/subosito/gotenv>
> "
> >> -
> >> -#       google.golang.org/genproto v0.0.0-20230526161137-0005af68ea54
> >> -# [1] git ls-remote https://github.com/googleapis/go-genproto
> 0005af68ea5476a8b99ce94ab83ae4aaac864963
> >> -SRCREV_genproto=3D"0005af68ea5476a8b99ce94ab83ae4aaac864963"
> >> +#       google.golang.org/genproto v0.0.0-20230822172742-b8732ec3820d
> >> +# [1] git ls-remote https://github.com/googleapis/go-genproto
> b8732ec3820db4bd1e4eda89392b7728e81bd825
> >> +SRCREV_genproto=3D"b8732ec3820db4bd1e4eda89392b7728e81bd825"
> >>  SRC_URI +=3D "git://
> github.com/googleapis/go-genproto;name=3Dgenproto;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.=
org/genproto
> <http://github.com/googleapis/go-genproto;name=3Dgenproto;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/google.golang.org/genproto>
> "
> >>
> >> -#       google.golang.org/protobuf v1.30.0
> >> -# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go
> f221882bfb484564f1714ae05f197dea2c76898d
> >>
> -SRCREV_google.golang.org-protobuf=3D"f221882bfb484564f1714ae05f197dea2c7=
6898d"
> >> +#       google.golang.org/protobuf v1.31.0
> >> +# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go
> 68463f0e96c93bc19ef36ccd3adfe690bfdb568c
> >>
> +SRCREV_google.golang.org-protobuf=3D"68463f0e96c93bc19ef36ccd3adfe690bfd=
b568c"
> >>  SRC_URI +=3D "git://
> github.com/protocolbuffers/protobuf-go;name=3Dgoogle.golang.org-protobuf;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/google.golang.org/protobuf
> <http://github.com/protocolbuffers/protobuf-go;name=3Dgoogle.golang.org-p=
rotobuf;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/google.golang.org/protobuf>
> "
> >>
> >>  #       github.com/stretchr/testify v1.8.4
> >> @@ -388,11 +343,6 @@ SRC_URI +=3D "git://
> github.com/protocolbuffers/protobuf-go;name=3Dgoogle.golang.org-
> >>  SRCREV_testify=3D"f97607b89807936ac4ff96748d766cf4b9711f78"
> >>  SRC_URI +=3D "git://
> github.com/stretchr/testify;name=3Dtestify;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/stretchr/t=
estify
> <http://github.com/stretchr/testify;name=3Dtestify;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/githu=
b.com/stretchr/testify>
> "
> >>
> >> -#       github.com/cloudflare/cfssl v1.6.4
> >> -# [1] git ls-remote https://github.com/cloudflare/cfssl
> b4d0d877cac528f63db39dfb62d5c96cd3a32a0b
> >> -SRCREV_cfssl=3D"b4d0d877cac528f63db39dfb62d5c96cd3a32a0b"
> >> -SRC_URI +=3D "git://
> github.com/cloudflare/cfssl;name=3Dcfssl;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cloudflare/c=
fssl
> <http://github.com/cloudflare/cfssl;name=3Dcfssl;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/cloudflare/cfssl>
> "
> >> -
> >>  #       github.com/josharian/intern v1.0.0
> >>  # [1] git ls-remote https://github.com/josharian/intern
> 8e6ff32b3e7c0b018c43953085fe2ac330fe9acd
> >>  SRCREV_intern=3D"8e6ff32b3e7c0b018c43953085fe2ac330fe9acd"
> >> @@ -448,6 +398,11 @@ SRC_URI +=3D "git://
> github.com/open-telemetry/opentelemetry-go;name=3Dsdk;protocol=3Dh
> >>  SRCREV_go-ansiterm=3D"d185dfc1b5a126116ea5a19e148e29d16b4574c9"
> >>  SRC_URI +=3D "git://
> github.com/Azure/go-ansiterm;name=3Dgo-ansiterm;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure=
/go-ansiterm
> <http://github.com/Azure/go-ansiterm;name=3Dgo-ansiterm;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/=
github.com/Azure/go-ansiterm>
> "
> >>
> >> +#       github.com/Microsoft/hcsshim v0.11.1
> >> +# [1] git ls-remote https://github.com/microsoft/hcsshim
> 641f8b8a2314aba7ee58223e28d330fbcd66e3c2
> >> +SRCREV_hcsshim=3D"641f8b8a2314aba7ee58223e28d330fbcd66e3c2"
> >> +SRC_URI +=3D "git://
> github.com/microsoft/hcsshim;name=3Dhcsshim;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Microsoft=
/hcsshim
> <http://github.com/microsoft/hcsshim;name=3Dhcsshim;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gith=
ub.com/Microsoft/hcsshim>
> "
> >> +
> >>  #       github.com/aws/aws-sdk-go-v2 v1.17.6
> >>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2
> 18bff5e44f4c2c140feaf54b2dd92140630c7e50
> >>  SRCREV_aws-sdk-go-v2=3D"18bff5e44f4c2c140feaf54b2dd92140630c7e50"
> >> @@ -508,21 +463,11 @@ SRC_URI +=3D "git://
> github.com/microsoft/go-winio;name=3Dgo-winio;protocol=3Dhttps;nob
> >>  SRCREV_console=3D"b5cb846c9186d67bcae3ce3c324e47cd317d9527"
> >>  SRC_URI +=3D "git://
> github.com/containerd/console;name=3Dconsole;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containe=
rd/console
> <http://github.com/containerd/console;name=3Dconsole;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/git=
hub.com/containerd/console>
> "
> >>
> >> -#       github.com/bugsnag/bugsnag-go v1.5.0
> >> -# [1] git ls-remote https://github.com/bugsnag/bugsnag-go
> d5b63da7e1f93d83e3980e5ab2bf33179bad7b2a
> >> -SRCREV_bugsnag-go=3D"d5b63da7e1f93d83e3980e5ab2bf33179bad7b2a"
> >> -SRC_URI +=3D "git://
> github.com/bugsnag/bugsnag-go;name=3Dbugsnag-go;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/bugsn=
ag/bugsnag-go
> <http://github.com/bugsnag/bugsnag-go;name=3Dbugsnag-go;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/=
github.com/bugsnag/bugsnag-go>
> "
> >> -
> >>  #       github.com/fvbommel/sortorder v1.0.2
> >>  # [1] git ls-remote https://github.com/fvbommel/sortorder
> 26fad50c6b32a3064c09ed089865c16f2f3615f6
> >>  SRCREV_sortorder=3D"26fad50c6b32a3064c09ed089865c16f2f3615f6"
> >>  SRC_URI +=3D "git://
> github.com/fvbommel/sortorder;name=3Dsortorder;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fvbom=
mel/sortorder
> <http://github.com/fvbommel/sortorder;name=3Dsortorder;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/g=
ithub.com/fvbommel/sortorder>
> "
> >>
> >> -#       github.com/hashicorp/go-memdb v1.3.2
> >> -# [1] git ls-remote https://github.com/hashicorp/go-memdb
> 542a5804dedaaddf1a0cad8b6a7b0b3fcf438776
> >> -SRCREV_go-memdb=3D"542a5804dedaaddf1a0cad8b6a7b0b3fcf438776"
> >> -SRC_URI +=3D "git://
> github.com/hashicorp/go-memdb;name=3Dgo-memdb;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashi=
corp/go-memdb
> <http://github.com/hashicorp/go-memdb;name=3Dgo-memdb;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gi=
thub.com/hashicorp/go-memdb>
> "
> >> -
> >>  #       github.com/klauspost/compress v1.16.5
> >>  # [1] git ls-remote https://github.com/klauspost/compress
> ed6feffc3bb26797dc2a376516b16611046cdecd
> >>  SRCREV_compress=3D"ed6feffc3bb26797dc2a376516b16611046cdecd"
> >> @@ -588,9 +533,9 @@ SRC_URI +=3D "git://
> github.com/distribution/distribution;name=3Ddistribution;protoco
> >>  SRCREV_sequential=3D"b22ba8a69b306f0b4adbbe2a529457e6283ed9f7"
> >>  SRC_URI +=3D "git://
> github.com/moby/sys;name=3Dsequential;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/sequen=
tial
> <http://github.com/moby/sys;name=3Dsequential;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/moby/sys/sequential>
> "
> >>
> >> -#       github.com/opencontainers/runc v1.1.7
> >> -# [1] git ls-remote https://github.com/opencontainers/runc
> 860f061b76bb4fc671f0f9e900f7d80ff93d4eb7
> >> -SRCREV_runc=3D"860f061b76bb4fc671f0f9e900f7d80ff93d4eb7"
> >> +#       github.com/opencontainers/runc v1.1.9
> >> +# [1] git ls-remote https://github.com/opencontainers/runc
> ccaecfcbc907d70a7aa870a6650887b901b25b82
> >> +SRCREV_runc=3D"ccaecfcbc907d70a7aa870a6650887b901b25b82"
> >>  SRC_URI +=3D "git://
> github.com/opencontainers/runc;name=3Drunc;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontai=
ners/runc
> <http://github.com/opencontainers/runc;name=3Drunc;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/githu=
b.com/opencontainers/runc>
> "
> >>
> >>  #       github.com/shibumi/go-pathspec v1.3.0
> >> @@ -613,21 +558,11 @@ SRC_URI +=3D "git://
> github.com/docker/cli-docs-tool;name=3Dcli-docs-tool;protocol=3Dht
> >>  SRCREV_go-version=3D"78d058c5618891f74d604bd15356fca690b64d8a"
> >>  SRC_URI +=3D "git://
> github.com/hashicorp/go-version;name=3Dgo-version;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/has=
hicorp/go-version
> <http://github.com/hashicorp/go-version;name=3Dgo-version;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/github.com/hashicorp/go-version>
> "
> >>
> >> -#       github.com/hashicorp/golang-lru v0.5.4
> >> -# [1] git ls-remote https://github.com/hashicorp/golang-lru
> 14eae340515388ca95aa8e7b86f0de668e981f54
> >> -SRCREV_golang-lru=3D"14eae340515388ca95aa8e7b86f0de668e981f54"
> >> -SRC_URI +=3D "git://
> github.com/hashicorp/golang-lru;name=3Dgolang-lru;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/has=
hicorp/golang-lru
> <http://github.com/hashicorp/golang-lru;name=3Dgolang-lru;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/github.com/hashicorp/golang-lru>
> "
> >> -
> >>  #       github.com/modern-go/concurrent
> v0.0.0-20180306012644-bacd9c7ef1dd
> >>  # [1] git ls-remote https://github.com/modern-go/concurrent
> bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94
> >>  SRCREV_concurrent=3D"bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
> >>  SRC_URI +=3D "git://
> github.com/modern-go/concurrent;name=3Dconcurrent;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mod=
ern-go/concurrent
> <http://github.com/modern-go/concurrent;name=3Dconcurrent;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/github.com/modern-go/concurrent>
> "
> >>
> >> -#       github.com/pelletier/go-toml/v2 v2.0.5
> >> -# [1] git ls-remote https://github.com/pelletier/go-toml
> 942841787a7d70422e4d8bc7d0be28ab911402df
> >> -SRCREV_go-toml-v2=3D"942841787a7d70422e4d8bc7d0be28ab911402df"
> >> -SRC_URI +=3D "git://
> github.com/pelletier/go-toml;name=3Dgo-toml-v2;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pelle=
tier/go-toml/v2
> <http://github.com/pelletier/go-toml;name=3Dgo-toml-v2;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/g=
ithub.com/pelletier/go-toml/v2>
> "
> >> -
> >>  #       github.com/xeipuuv/gojsonschema v1.2.0
> >>  # [1] git ls-remote https://github.com/xeipuuv/gojsonschema
> 82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927
> >>  SRCREV_gojsonschema=3D"82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927"
> >> @@ -643,9 +578,9 @@ SRC_URI +=3D "git://
> github.com/open-telemetry/opentelemetry-go;name=3Dmetric;protoco
> >>  SRCREV_v2=3D"fa37277e6394c29db7bcc94062cb30cd7785a126"
> >>  SRC_URI +=3D "git://
> github.com/AlecAivazis/survey;name=3Dv2;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AlecAivazis/s=
urvey/v2
> <http://github.com/AlecAivazis/survey;name=3Dv2;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/AlecAivazis/survey/v2>
> "
> >>
> >> -#       github.com/containerd/containerd v1.7.3
> >> -# [1] git ls-remote https://github.com/containerd/containerd
> 7880925980b188f4c97b462f709d0db8e8962aff
> >> -SRCREV_containerd=3D"7880925980b188f4c97b462f709d0db8e8962aff"
> >> +#       github.com/containerd/containerd v1.7.7
> >> +# [1] git ls-remote https://github.com/containerd/containerd
> 8c087663b0233f6e6e2f4515cee61d49f14746a8
> >> +SRCREV_containerd=3D"8c087663b0233f6e6e2f4515cee61d49f14746a8"
> >>  SRC_URI +=3D "git://
> github.com/containerd/containerd;name=3Dcontainerd;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/co=
ntainerd/containerd
> <http://github.com/containerd/containerd;name=3Dcontainerd;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fet=
ch/github.com/containerd/containerd>
> "
> >>
> >>  #       github.com/docker/go-connections v0.4.0
> >> @@ -658,9 +593,9 @@ SRC_URI +=3D "git://
> github.com/docker/go-connections;name=3Dgo-connections;protocol=3D
> >>  SRCREV_semver-v3=3D"e06051f8fcc4c8b4a4990c337b9862a2448722e5"
> >>  SRC_URI +=3D "git://
> github.com/Masterminds/semver;name=3Dsemver-v3;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Maste=
rminds/semver/v3
> <http://github.com/Masterminds/semver;name=3Dsemver-v3;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/g=
ithub.com/Masterminds/semver/v3>
> "
> >>
> >> -#       github.com/containerd/continuity v0.4.1
> >> -# [1] git ls-remote https://github.com/containerd/continuity
> 25762ef7c27a37645197ed6d1d708e55a230e35d
> >> -SRCREV_continuity=3D"25762ef7c27a37645197ed6d1d708e55a230e35d"
> >> +#       github.com/containerd/continuity v0.4.2
> >> +# [1] git ls-remote https://github.com/containerd/continuity
> 77a2d47a6668b82465fdf6cb749fe3a2aa2c9743
> >> +SRCREV_continuity=3D"77a2d47a6668b82465fdf6cb749fe3a2aa2c9743"
> >>  SRC_URI +=3D "git://
> github.com/containerd/continuity;name=3Dcontinuity;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/co=
ntainerd/continuity
> <http://github.com/containerd/continuity;name=3Dcontinuity;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fet=
ch/github.com/containerd/continuity>
> "
> >>
> >>  #       github.com/containerd/typeurl/v2 v2.1.1
> >> @@ -668,16 +603,16 @@ SRC_URI +=3D "git://
> github.com/containerd/continuity;name=3Dcontinuity;protocol=3Dhttp
> >>  SRCREV_typeurl-v2=3D"7ef6316b771f959cbb208b229e3423a466947df3"
> >>  SRC_URI +=3D "git://
> github.com/containerd/typeurl;name=3Dtypeurl-v2;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/conta=
inerd/typeurl/v2
> <http://github.com/containerd/typeurl;name=3Dtypeurl-v2;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/=
github.com/containerd/typeurl/v2>
> "
> >>
> >> -#       github.com/magiconair/properties v1.8.6
> >> -# [1] git ls-remote https://github.com/magiconair/properties
> 869a5592420f4ff6ebf74500b5c658b29d973172
> >> -SRCREV_properties=3D"869a5592420f4ff6ebf74500b5c658b29d973172"
> >> -SRC_URI +=3D "git://
> github.com/magiconair/properties;name=3Dproperties;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ma=
giconair/properties
> <http://github.com/magiconair/properties;name=3Dproperties;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fet=
ch/github.com/magiconair/properties>
> "
> >> -
> >>  #       github.com/xeipuuv/gojsonpointer
> v0.0.0-20190905194746-02993c407bfb
> >>  # [1] git ls-remote https://github.com/xeipuuv/gojsonpointer
> 02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb
> >>  SRCREV_gojsonpointer=3D"02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb"
> >>  SRC_URI +=3D "git://
> github.com/xeipuuv/gojsonpointer;name=3Dgojsonpointer;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/xeipuuv/gojsonpointer
> <http://github.com/xeipuuv/gojsonpointer;name=3Dgojsonpointer;protocol=3D=
https;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.=
fetch/github.com/xeipuuv/gojsonpointer>
> "
> >>
> >> +#       github.com/distribution/reference v0.5.0
> >> +# [1] git ls-remote https://github.com/distribution/reference
> 49c28499d219290c3226822e9cfcd4ede6d75379
> >> +SRCREV_reference=3D"49c28499d219290c3226822e9cfcd4ede6d75379"
> >> +SRC_URI +=3D "git://
> github.com/distribution/reference;name=3Dreference;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/di=
stribution/reference
> <http://github.com/distribution/reference;name=3Dreference;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fet=
ch/github.com/distribution/reference>
> "
> >> +
> >>  #       github.com/mitchellh/mapstructure v1.5.0
> >>  # [1] git ls-remote https://github.com/mitchellh/mapstructure
> ab69d8d93410fce4361f4912bb1ff88110a81311
> >>  SRCREV_mapstructure=3D"ab69d8d93410fce4361f4912bb1ff88110a81311"
> >> @@ -693,6 +628,11 @@ SRC_URI +=3D "git://
> github.com/emicklei/go-restful;name=3Dgo-restful-v3;protocol=3Dhtt
> >>  SRCREV_jsonpointer=3D"2446e21cad36eee826e1c2380f0ff747074a2faa"
> >>  SRC_URI +=3D "git://
> github.com/go-openapi/jsonpointer;name=3Djsonpointer;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
go-openapi/jsonpointer
> <http://github.com/go-openapi/jsonpointer;name=3Djsonpointer;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.f=
etch/github.com/go-openapi/jsonpointer>
> "
> >>
> >> +#       github.com/hashicorp/go-cleanhttp v0.5.2
> >> +# [1] git ls-remote https://github.com/hashicorp/go-cleanhttp
> 6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2
> >> +SRCREV_go-cleanhttp=3D"6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2"
> >> +SRC_URI +=3D "git://
> github.com/hashicorp/go-cleanhttp;name=3Dgo-cleanhttp;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/hashicorp/go-cleanhttp
> <http://github.com/hashicorp/go-cleanhttp;name=3Dgo-cleanhttp;protocol=3D=
https;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.=
fetch/github.com/hashicorp/go-cleanhttp>
> "
> >> +
> >>  #       github.com/in-toto/in-toto-golang v0.5.0
> >>  # [1] git ls-remote https://github.com/in-toto/in-toto-golang
> ec599036d27ebaca3e8c03559d3f8fd5fe429dfe
> >>  SRCREV_in-toto-golang=3D"ec599036d27ebaca3e8c03559d3f8fd5fe429dfe"
> >> @@ -703,9 +643,9 @@ SRC_URI +=3D "git://
> github.com/in-toto/in-toto-golang;name=3Din-toto-golang;protocol
> >>  SRCREV_go-shellquote=3D"95032a82bc518f77982ea72343cc1ade730072f0"
> >>  SRC_URI +=3D "git://
> github.com/kballard/go-shellquote;name=3Dgo-shellquote;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/kballard/go-shellquote
> <http://github.com/kballard/go-shellquote;name=3Dgo-shellquote;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/kballard/go-shellquote>
> "
> >>
> >> -#       github.com/compose-spec/compose-go v1.18.3
> >> -# [1] git ls-remote https://github.com/compose-spec/compose-go
> c6eecc55b95f952b6d6406adcd297499d11a300b
> >> -SRCREV_compose-go=3D"c6eecc55b95f952b6d6406adcd297499d11a300b"
> >> +#       github.com/compose-spec/compose-go v1.20.2
> >> +# [1] git ls-remote https://github.com/compose-spec/compose-go
> e390b9774ca100e1d75c8bc075054502783b48b8
> >> +SRCREV_compose-go=3D"e390b9774ca100e1d75c8bc075054502783b48b8"
> >>  SRC_URI +=3D "git://
> github.com/compose-spec/compose-go;name=3Dcompose-go;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
compose-spec/compose-go
> <http://github.com/compose-spec/compose-go;name=3Dcompose-go;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.f=
etch/github.com/compose-spec/compose-go>
> "
> >>
> >>  #       github.com/hashicorp/go-multierror v1.1.1
> >> @@ -713,21 +653,11 @@ SRC_URI +=3D "git://
> github.com/compose-spec/compose-go;name=3Dcompose-go;protocol=3Dht
> >>  SRCREV_go-multierror=3D"9974e9ec57696378079ecc3accd3d6f29401b3a0"
> >>  SRC_URI +=3D "git://
> github.com/hashicorp/go-multierror;name=3Dgo-multierror;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/hashicorp/go-multierror
> <http://github.com/hashicorp/go-multierror;name=3Dgo-multierror;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/hashicorp/go-multierror>
> "
> >>
> >> -#       github.com/cucumber/gherkin-go/v19 v19.0.3
> >> -# [1] git ls-remote https://github.com/cucumber/gherkin-go
> 11029f28bd1bc215fa57275b576f2b237b7c2b07
> >> -SRCREV_v19=3D"11029f28bd1bc215fa57275b576f2b237b7c2b07"
> >> -SRC_URI +=3D "git://
> github.com/cucumber/gherkin-go;name=3Dv19;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cucumber/gh=
erkin-go/v19
> <http://github.com/cucumber/gherkin-go;name=3Dv19;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github=
.com/cucumber/gherkin-go/v19>
> "
> >> -
> >>  #       github.com/prometheus/client_model v0.3.0
> >>  # [1] git ls-remote https://github.com/prometheus/client_model
> 63fb9822ca3ba7a4ba5184071fb8f2ea000a99ef
> >>  SRCREV_client_model=3D"63fb9822ca3ba7a4ba5184071fb8f2ea000a99ef"
> >>  SRC_URI +=3D "git://
> github.com/prometheus/client_model;name=3Dclient_model;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/prometheus/client_model
> <http://github.com/prometheus/client_model;name=3Dclient_model;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/prometheus/client_model>
> "
> >>
> >> -#       github.com/spf13/jwalterweatherman v1.1.0
> >> -# [1] git ls-remote https://github.com/spf13/jwalterweatherman
> 94f6ae3ed3bceceafa716478c5fbf8d29ca601a1
> >> -SRCREV_jwalterweatherman=3D"94f6ae3ed3bceceafa716478c5fbf8d29ca601a1"
> >> -SRC_URI +=3D "git://
> github.com/spf13/jwalterweatherman;name=3Djwalterweatherman;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/spf13/jwalterweatherman
> <http://github.com/spf13/jwalterweatherman;name=3Djwalterweatherman;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/v=
endor.fetch/github.com/spf13/jwalterweatherman>
> "
> >> -
> >>  #       github.com/xeipuuv/gojsonreference
> v0.0.0-20180127040603-bd5ef7bd5415
> >>  # [1] git ls-remote https://github.com/xeipuuv/gojsonreference
> bd5ef7bd5415a7ac448318e64f11a24cd21e594b
> >>  SRCREV_gojsonreference=3D"bd5ef7bd5415a7ac448318e64f11a24cd21e594b"
> >> @@ -743,11 +673,6 @@ SRC_URI +=3D "git://
> github.com/opencontainers/go-digest;name=3Dgo-digest;protocol=3Dht
> >>  SRCREV_config=3D"18bff5e44f4c2c140feaf54b2dd92140630c7e50"
> >>  SRC_URI +=3D "git://
> github.com/aws/aws-sdk-go-v2;name=3Dconfig;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sd=
k-go-v2/config
> <http://github.com/aws/aws-sdk-go-v2;name=3Dconfig;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/githu=
b.com/aws/aws-sdk-go-v2/config>
> "
> >>
> >> -#       github.com/cucumber/messages-go/v16 v16.0.1
> >> -# [1] git ls-remote https://github.com/cucumber/messages-go
> 1848e9bfc84e8c1674c4d9ded0bdbfc23c458b28
> >> -SRCREV_v16=3D"1848e9bfc84e8c1674c4d9ded0bdbfc23c458b28"
> >> -SRC_URI +=3D "git://
> github.com/cucumber/messages-go;name=3Dv16;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cucumber/m=
essages-go/v16
> <http://github.com/cucumber/messages-go;name=3Dv16;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/githu=
b.com/cucumber/messages-go/v16>
> "
> >> -
> >>  #       github.com/go-openapi/jsonreference v0.20.0
> >>  # [1] git ls-remote https://github.com/go-openapi/jsonreference
> c5db5582e080fbeae80be42f42881230a8caebf6
> >>  SRCREV_jsonreference=3D"c5db5582e080fbeae80be42f42881230a8caebf6"
> >> @@ -758,9 +683,9 @@ SRC_URI +=3D "git://
> github.com/go-openapi/jsonreference;name=3Djsonreference;protoco
> >>  SRCREV_client_golang=3D"254e5468413f19fb75cdad45f5ddc0b8c975188c"
> >>  SRC_URI +=3D "git://
> github.com/prometheus/client_golang;name=3Dclient_golang;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/prometheus/client_golang
> <http://github.com/prometheus/client_golang;name=3Dclient_golang;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/prometheus/client_golang>
> "
> >>
> >> -#       github.com/opencontainers/image-spec v1.1.0-rc4
> >> -# [1] git ls-remote https://github.com/opencontainers/image-spec
> 82e8329f7eb6df5c62924f2792d285ba276ae876
> >> -SRCREV_image-spec=3D"82e8329f7eb6df5c62924f2792d285ba276ae876"
> >> +#       github.com/opencontainers/image-spec v1.1.0-rc5
> >> +# [1] git ls-remote https://github.com/opencontainers/image-spec
> 1e54f0195ce54b4a1a2ecbac8eab7686d91d3080
> >> +SRCREV_image-spec=3D"1e54f0195ce54b4a1a2ecbac8eab7686d91d3080"
> >>  SRC_URI +=3D "git://
> github.com/opencontainers/image-spec;name=3Dimage-spec;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/opencontainers/image-spec
> <http://github.com/opencontainers/image-spec;name=3Dimage-spec;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/opencontainers/image-spec>
> "
> >>
> >>  #       github.com/theupdateframework/notary v0.7.0
> >> @@ -768,9 +693,9 @@ SRC_URI +=3D "git://
> github.com/opencontainers/image-spec;name=3Dimage-spec;protocol=3D
> >>  SRCREV_notary=3D"b0b6bfdd4933081e8d5ae026b24e8337311dd598"
> >>  SRC_URI +=3D "git://
> github.com/notaryproject/notary;name=3Dnotary;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/theup=
dateframework/notary
> <http://github.com/notaryproject/notary;name=3Dnotary;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gi=
thub.com/theupdateframework/notary>
> "
> >>
> >> -#       github.com/AdaLogics/go-fuzz-headers
> v0.0.0-20230106234847-43070de90fa1
> >> -# [1] git ls-remote https://github.com/AdaLogics/go-fuzz-headers
> 43070de90fa134c9ea55cd6de4308a2ae59658d3
> >> -SRCREV_go-fuzz-headers=3D"43070de90fa134c9ea55cd6de4308a2ae59658d3"
> >> +#       github.com/AdaLogics/go-fuzz-headers
> v0.0.0-20230811130428-ced1acdcaa24
> >> +# [1] git ls-remote https://github.com/AdaLogics/go-fuzz-headers
> ced1acdcaa24dc39c01b039fc37576c395f506cf
> >> +SRCREV_go-fuzz-headers=3D"ced1acdcaa24dc39c01b039fc37576c395f506cf"
> >>  SRC_URI +=3D "git://
> github.com/AdaLogics/go-fuzz-headers;name=3Dgo-fuzz-headers;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/AdaLogics/go-fuzz-headers
> <http://github.com/AdaLogics/go-fuzz-headers;name=3Dgo-fuzz-headers;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/v=
endor.fetch/github.com/AdaLogics/go-fuzz-headers>
> "
> >>
> >>  #       github.com/inconshreveable/mousetrap v1.1.0
> >> @@ -783,21 +708,6 @@ SRC_URI +=3D "git://
> github.com/inconshreveable/mousetrap;name=3Dmousetrap;protocol=3Dh
> >>
> SRCREV_structured-merge-diff-v4=3D"26781d0c10bfdbd7d66b18d8be83985f623df9=
f8"
> >>  SRC_URI +=3D "git://
> github.com/kubernetes-sigs/structured-merge-diff;name=3Dstructured-merge-=
diff-v4;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/imp=
ort/vendor.fetch/sigs.k8s.io/structured-merge-diff/v4
> <http://github.com/kubernetes-sigs/structured-merge-diff;name=3Dstructure=
d-merge-diff-v4;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$=
%7BBP%7D/src/import/vendor.fetch/sigs.k8s.io/structured-merge-diff/v4>
> "
> >>
> >> -#       github.com/cyphar/filepath-securejoin v0.2.3
> >> -# [1] git ls-remote https://github.com/cyphar/filepath-securejoin
> 8f267f5ea675a20a2cb5e91011d063721f53bf79
> >> -SRCREV_filepath-securejoin=3D"8f267f5ea675a20a2cb5e91011d063721f53bf7=
9"
> >> -SRC_URI +=3D "git://
> github.com/cyphar/filepath-securejoin;name=3Dfilepath-securejoin;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/cyphar/filepath-securejoin
> <http://github.com/cyphar/filepath-securejoin;name=3Dfilepath-securejoin;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/imp=
ort/vendor.fetch/github.com/cyphar/filepath-securejoin>
> "
> >> -
> >> -#       github.com/distribution/distribution/v3
> v3.0.0-20230601133803-97b1d649c493
> >> -# [1] git ls-remote https://github.com/distribution/distribution
> 97b1d649c4938d0f608d96454d6a8326b1f96acd
> >> -SRCREV_v3=3D"97b1d649c4938d0f608d96454d6a8326b1f96acd"
> >> -SRC_URI +=3D "git://
> github.com/distribution/distribution;name=3Dv3;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/distr=
ibution/distribution/v3
> <http://github.com/distribution/distribution;name=3Dv3;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/g=
ithub.com/distribution/distribution/v3>
> "
> >> -
> >> -#       github.com/hashicorp/go-immutable-radix v1.3.1
> >> -# [1] git ls-remote https://github.com/hashicorp/go-immutable-radix
> 49d1d02c49a783de548d1ba8ae8fde466a20b9e6
> >> -SRCREV_go-immutable-radix=3D"49d1d02c49a783de548d1ba8ae8fde466a20b9e6=
"
> >> -SRC_URI +=3D "git://
> github.com/hashicorp/go-immutable-radix;name=3Dgo-immutable-radix;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/hashicorp/go-immutable-radix
> <http://github.com/hashicorp/go-immutable-radix;name=3Dgo-immutable-radix=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/im=
port/vendor.fetch/github.com/hashicorp/go-immutable-radix>
> "
> >> -
> >>  #       github.com/aws/aws-sdk-go-v2/credentials v1.13.16
> >>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2
> 18bff5e44f4c2c140feaf54b2dd92140630c7e50
> >>  SRCREV_credentials=3D"18bff5e44f4c2c140feaf54b2dd92140630c7e50"
> >> @@ -823,14 +733,14 @@ SRC_URI +=3D "git://
> github.com/aws/aws-sdk-go-v2;name=3Dini;protocol=3Dhttps;nobranch=3D
> >>  SRCREV_grpc-gateway-v2=3D"0197faf8b072910084edd1209aa2ac51833b895c"
> >>  SRC_URI +=3D "git://
> github.com/grpc-ecosystem/grpc-gateway;name=3Dgrpc-gateway-v2;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/grpc-ecosystem/grpc-gateway/v2
> <http://github.com/grpc-ecosystem/grpc-gateway;name=3Dgrpc-gateway-v2;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import=
/vendor.fetch/github.com/grpc-ecosystem/grpc-gateway/v2>
> "
> >>
> >> -#       google.golang.org/genproto/googleapis/api
> v0.0.0-20230525234035-dd9d682886f9
> >> -# [1] git ls-remote https://github.com/googleapis/go-genproto
> dd9d682886f99d242574cd3eaea438ce7ea66399
> >> -SRCREV_api=3D"dd9d682886f99d242574cd3eaea438ce7ea66399"
> >> +#       google.golang.org/genproto/googleapis/api
> v0.0.0-20230822172742-b8732ec3820d
> >> +# [1] git ls-remote https://github.com/googleapis/go-genproto
> b8732ec3820db4bd1e4eda89392b7728e81bd825
> >> +SRCREV_api=3D"b8732ec3820db4bd1e4eda89392b7728e81bd825"
> >>  SRC_URI +=3D "git://
> github.com/googleapis/go-genproto;name=3Dapi;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/g=
enproto/googleapis/api
> <http://github.com/googleapis/go-genproto;name=3Dapi;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/goo=
gle.golang.org/genproto/googleapis/api>
> "
> >>
> >> -#       google.golang.org/genproto/googleapis/rpc
> v0.0.0-20230525234030-28d5490b6b19
> >> -# [1] git ls-remote https://github.com/googleapis/go-genproto
> 28d5490b6b19cce1ebbc6ab55ca8637bd35b3486
> >> -SRCREV_rpc=3D"28d5490b6b19cce1ebbc6ab55ca8637bd35b3486"
> >> +#       google.golang.org/genproto/googleapis/rpc
> v0.0.0-20230822172742-b8732ec3820d
> >> +# [1] git ls-remote https://github.com/googleapis/go-genproto
> b8732ec3820db4bd1e4eda89392b7728e81bd825
> >> +SRCREV_rpc=3D"b8732ec3820db4bd1e4eda89392b7728e81bd825"
> >>  SRC_URI +=3D "git://
> github.com/googleapis/go-genproto;name=3Drpc;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/g=
enproto/googleapis/rpc
> <http://github.com/googleapis/go-genproto;name=3Drpc;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/goo=
gle.golang.org/genproto/googleapis/rpc>
> "
> >>
> >>  #       github.com/docker/docker-credential-helpers v0.7.0
> >> --
> >> 2.44.0
> >>
> >>
> >>
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8596):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8596
> > Mute This Topic: https://lists.yoctoproject.org/mt/104628874/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000fa9d13061275ca8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu (quarta=
, 28/02/2024 =C3=A0(s) 18:57):<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Wed, Feb 28, 2024 at 1:47=E2=80=AFPM Jose Quaresma &lt;<a=
 href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gm=
ail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; The recipe on meta-virt main-next fails to build with go-1.21 and I ha=
ve updated it with:<br>
&gt; ./meta-virtualization/scripts/oe-go-mod-autogen.py --repo <a href=3D"h=
ttps://github.com/docker/compose" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/docker/compose</a> --rev v2.23.3<br>
&gt;<br>
<br>
My intent is to wait as long as possible on these recipes, since<br>
obviously, I&#39;m aware of what the issues are with go 1.2.x, even then,<b=
r>
I&#39;ll be doing multiple recipes versus upgrading what is there to leave<=
br>
the layer in a forward looking state if 1.21+ doesn&#39;t merge into core.<=
br>
<br>
So for now, I won&#39;t be grabbing the bump.<br></blockquote><div><br></di=
v><div>I have sent the updates for 1.21 and 1.22 to oe-core with RFC.</div>=
<div>I know it&#39;s already too late but it was the best I could do.<br></=
div><div><br></div><div></div><div>No problem with not merging this patch, =
the patch is just to let you know.</div><div><br></div><div>Jose</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Bruce<br>
<br>
&gt; Jose<br>
&gt;<br>
&gt; Jose Quaresma via <a href=3D"http://lists.yoctoproject.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.yoctoproject.org</a> &lt;quaresma.jose=3D<=
a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank">gmail.=
com@lists.yoctoproject.org</a>&gt; escreveu (quarta, 28/02/2024 =C3=A0(s) 1=
8:44):<br>
&gt;&gt;<br>
&gt;&gt; - c665c53c bump buildx to v0.12.0 and adapt code to changes<br>
&gt;&gt; - a1aceba6 Merge pull request #11215 from docker/dependabot/go_mod=
ules/<a href=3D"http://github.com/compose-spec/compose-go-1.20.2" rel=3D"no=
referrer" target=3D"_blank">github.com/compose-spec/compose-go-1.20.2</a><b=
r>
&gt;&gt; - a39cf75e build(deps): bump <a href=3D"http://github.com/compose-=
spec/compose-go" rel=3D"noreferrer" target=3D"_blank">github.com/compose-sp=
ec/compose-go</a><br>
&gt;&gt; - 5b0dcc5a Merge pull request #11214 from docker/dependabot/go_mod=
ules/<a href=3D"http://github.com/spf13/cobra-1.8.0" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/spf13/cobra-1.8.0</a><br>
&gt;&gt; - 46ba9c99 build(deps): bump <a href=3D"http://github.com/spf13/co=
bra" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/cobra</a> from 1=
.7.0 to 1.8.0<br>
&gt;&gt; - 1148b676 Merge pull request #11142 from docker/dependabot/go_mod=
ules/<a href=3D"http://github.com/docker/cli-24.0.7incompatible" rel=3D"nor=
eferrer" target=3D"_blank">github.com/docker/cli-24.0.7incompatible</a><br>
&gt;&gt; - 5c5d30c6 build(deps): bump <a href=3D"http://github.com/docker/c=
li" rel=3D"noreferrer" target=3D"_blank">github.com/docker/cli</a><br>
&gt;&gt; - 2068ecee Merge pull request #11143 from docker/dependabot/go_mod=
ules/<a href=3D"http://github.com/docker/docker-24.0.7incompatible" rel=3D"=
noreferrer" target=3D"_blank">github.com/docker/docker-24.0.7incompatible</=
a><br>
&gt;&gt; - 36fa8d4e build(deps): bump <a href=3D"http://github.com/docker/d=
ocker" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a><br=
>
&gt;&gt; - 69985b8b Merge pull request #11112 from docker/dependabot/go_mod=
ules/<a href=3D"http://github.com/moby/buildkit-0.12.3" rel=3D"noreferrer" =
target=3D"_blank">github.com/moby/buildkit-0.12.3</a><br>
&gt;&gt; - 2384635e build(deps): bump <a href=3D"http://github.com/moby/bui=
ldkit" rel=3D"noreferrer" target=3D"_blank">github.com/moby/buildkit</a> fr=
om 0.12.2 to 0.12.3<br>
&gt;&gt; - 587dba11 Merge pull request #11213 from glours/watch-force-build=
-at-startup<br>
&gt;&gt; - 2ba5e4c1 in watch mode force pull policy to build for services w=
ith both build and develop attributes This default behaviour will force a r=
ebuild of the service images at watch process startup and be sure container=
s will be in sync with the local source code<br>
&gt;&gt; - b1a26dac Assume /src/pkg/compose/testdata absolute workingdir to=
 make tests reproducible<br>
&gt;&gt; - 0ab21a20 Merge pull request #11211 from ndeloof/Services<br>
&gt;&gt; - 5e77ae92 avoir use of []types.ServiceConfig<br>
&gt;&gt; - f5572201 identify services to build and don&#39;t display &#39;b=
uilding&#39; if none<br>
&gt;&gt; - 8e1b3236 fix --remove-orphans not to consider disabled services =
as orphaned<br>
&gt;&gt; - a1b7bee0 Merge pull request #11206 from ndeloof/check_runtime<br=
>
&gt;&gt; - 7cb1f8ba introduce RuntimeVersion for code to check container ru=
ntime supports required features<br>
&gt;&gt; - cb01186c push also consider build.tags<br>
&gt;&gt; - efea084d Merge pull request #11192 from ulyssessouza/exclude-tes=
ts-context<br>
&gt;&gt; - 9c4efbdd Strip project prefix from docker-compose up output<br>
&gt;&gt; - 8ea7c9e0 Make it context aware and add test skipping options<br>
&gt;&gt; - c1694360 render quiet after filtering applied<br>
&gt;&gt; - 254a94b0 bump golang to version 1.21.4<br>
&gt;&gt; - cf608fa9 bump compose-go to v1.20.1<br>
&gt;&gt; - 426377a4 reject compose file using `secrets|configs.driver or te=
mplate_driver`<br>
&gt;&gt; - 43c3f545 Merge pull request #11180 from ulyssessouza/skip-flaky-=
tests<br>
&gt;&gt; - 493f6c80 skips flaky e2e tests on watch and attach<br>
&gt;&gt; - c1a9ffa0 Merge pull request #11171 from szampardi/main<br>
&gt;&gt; - 646a8fc0 fix docker/compose#11170 add newline in cmd/compose/bui=
ld.go fmt.Fprint<br>
&gt;&gt; - 2945532f fix --pull documentation<br>
&gt;&gt; - e5cd265a improve watch configuration logging Add action associat=
ed to each managed path<br>
&gt;&gt; - d646d757 lint<br>
&gt;&gt; - 71237ef6 do not resolve cache dir until remote resource is in us=
e<br>
&gt;&gt; - 0d905a89 add a copyright notice with original author<br>
&gt;&gt; - b847c7f5 implement runtime file selection<br>
&gt;&gt; - 5e3d8f67 re-implement cache folder detection<br>
&gt;&gt; - 67279088 introduce --resolve-image-digests for publish to seal s=
ervice images by digest<br>
&gt;&gt; - 5661fd1b Merge pull request #11149 from aevesdocker/ENGDOCS-1764=
<br>
&gt;&gt; - 4cd61957 fix build<br>
&gt;&gt; - 0d4cbbdb fix<br>
&gt;&gt; - 9631a49d ENGDOCS-1764<br>
&gt;&gt; - 328ca3f2 add docs upstream validation workflow<br>
&gt;&gt; - e1bbfc63 build(deps): bump <a href=3D"http://go.uber.org/goleak"=
 rel=3D"noreferrer" target=3D"_blank">go.uber.org/goleak</a> from 1.2.1 to =
1.3.0<br>
&gt;&gt; - 616bba0a linter errors fixed<br>
&gt;&gt; - ee6e3c2a NetworkList to NetworkInspect for ID search<br>
&gt;&gt; - c7e31a3c Squashing feature branch commits in order to add signof=
f message.<br>
&gt;&gt; - 704a9fd3 Use project.ServiceNames() if no service specified in h=
ash<br>
&gt;&gt; - d9e0e42d Add branch configuration for pull_request trigger<br>
&gt;&gt; - c48e3c4a Initial codeql.yml commit<br>
&gt;&gt; - dd0803db fix SIGTERM support to stop/kill stack<br>
&gt;&gt; - 39008c53 align with OCI artifact best practices<br>
&gt;&gt; - 6ab41d62 Merge pull request #11060 from Juneezee/refactor/redund=
ant-len-check<br>
&gt;&gt; - 6c345b37 refactor(cmd/compose/run): remove redundant `len` check=
<br>
&gt;&gt; - b8773ad1 Merge pull request #11110 from ndeloof/wait_missing<br>
&gt;&gt; - 1ffa194e fail start if depependency is missing<br>
&gt;&gt; - b9298101 check that the pull policy provided is a valid one or i=
s not missing when --pull is used<br>
&gt;&gt; - af87f106 Merge pull request #11108 from ndeloof/down-services<br=
>
&gt;&gt; - 5e1d3f2b Merge pull request #11051 from ndeloof/warn_remote_disa=
bled<br>
&gt;&gt; - 3d0207eb remove uncessary return value of pullComposeFiles funct=
ion<br>
&gt;&gt; - 16a7c209 enable profile when down is ran with explicit service n=
ames<br>
&gt;&gt; - 818bc3c3 add sync+restart action to watch attribute<br>
&gt;&gt; - cf3e686d Merge pull request #11078 from docker/dependabot/go_mod=
ules/<a href=3D"http://github.com/containerd/containerd-1.7.7" rel=3D"noref=
errer" target=3D"_blank">github.com/containerd/containerd-1.7.7</a><br>
&gt;&gt; - 38bc6d5d build(deps): bump <a href=3D"http://github.com/containe=
rd/containerd" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/c=
ontainerd</a> from 1.7.6 to 1.7.7<br>
&gt;&gt; - 4a2d4c44 Merge pull request #11083 from docker/dependabot/go_mod=
ules/<a href=3D"http://github.com/google/go-cmp-0.6.0" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/google/go-cmp-0.6.0</a><br>
&gt;&gt; - 0b6ce6ee build(deps): bump <a href=3D"http://github.com/google/g=
o-cmp" rel=3D"noreferrer" target=3D"_blank">github.com/google/go-cmp</a> fr=
om 0.5.9 to 0.6.0<br>
&gt;&gt; - 034458da Merge pull request #11105 from docker/dependabot/go_mod=
ules/<a href=3D"http://google.golang.org/grpc-1.59.0" rel=3D"noreferrer" ta=
rget=3D"_blank">google.golang.org/grpc-1.59.0</a><br>
&gt;&gt; - ae16bbbf build(deps): bump <a href=3D"http://google.golang.org/g=
rpc" rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> from 1=
.58.2 to 1.59.0<br>
&gt;&gt; - eb5f01ba Merge pull request #11068 from docker/dependabot/go_mod=
ules/<a href=3D"http://golang.org/x/sync-0.4.0" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/sync-0.4.0</a><br>
&gt;&gt; - d13ad1f9 build(deps): bump <a href=3D"http://golang.org/x/sync" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x/sync</a> from 0.3.0 to 0.=
4.0<br>
&gt;&gt; - 9b4d577c remove refrecence docs generation<br>
&gt;&gt; - b30978fb Merge pull request #11076 from glours/remove-cucumber<b=
r>
&gt;&gt; - 14b43c1a remove cucumber tests as we haven&#39;t added new ones =
for a while<br>
&gt;&gt; - 9dd081b9 add support of COMPOSE_ENV_FILES env variable to pass a=
 list of env files<br>
&gt;&gt; - 2c0b0232 add dry-run support for publish command<br>
&gt;&gt; - 599e4b24 extract method to reduce cyclomatic complexity<br>
&gt;&gt; - fe8c2780 warn user remote resource is disabled<br>
&gt;&gt; - a345515f Don&#39;t delete dependent services<br>
&gt;&gt; - 8967df7a Apply platform before hashing<br>
&gt;&gt; - 4f694919 deps: remove deprecated <a href=3D"http://github.com/pk=
g/errors" rel=3D"noreferrer" target=3D"_blank">github.com/pkg/errors</a><br=
>
&gt;&gt; - 6ecab957 Include image name in error message<br>
&gt;&gt; - 12e0ac89 pkg/compose/publish: use empty config descriptor mediaT=
ype<br>
&gt;&gt; - a6b7d785 pkg/remote/oci: check artifactType instead of config.me=
diaType<br>
&gt;&gt; - 991901f2 pkg/remote/oci: refer to the manifest as manifest<br>
&gt;&gt; - bd74a926 Merge pull request #11047 from glours/update-watch-warn=
ing-section<br>
&gt;&gt; - 2d971fc9 update the watch warning message when no services with =
a develop section<br>
&gt;&gt; - 78f33619 ci: enable verbose output for e2e tests (#11045)<br>
&gt;&gt; - 44d21280 truncate command by default, introduce --no-trunc flag =
to get the full command<br>
&gt;&gt; - cd743d17 Merge pull request #11036 from docker/dependabot/go_mod=
ules/<a href=3D"http://google.golang.org/grpc-1.58.2" rel=3D"noreferrer" ta=
rget=3D"_blank">google.golang.org/grpc-1.58.2</a><br>
&gt;&gt; - ff2ff18c build(deps): bump <a href=3D"http://google.golang.org/g=
rpc" rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> from 1=
.58.1 to 1.58.2<br>
&gt;&gt; - bd32ed14 Merge pull request #11025 from ndeloof/SkipResolveEnvir=
onment<br>
&gt;&gt; - ab81db5b config --xx don&#39;t need `env_file` being parsed<br>
&gt;&gt; - 52a641bf Merge pull request #11021 from glours/move-watch-to-mai=
n-cmd<br>
&gt;&gt; - 75f5c07d Merge pull request #11023 from glours/fix-watch-e2e-tes=
t-cleanup<br>
&gt;&gt; - 61c8be11 remove --timeout=3D0 flag to cleanup function of watch =
e2e test compose down command need the watch process to be killed to succee=
d<br>
&gt;&gt; - 6be5f300 move watch from alpha to main command<br>
&gt;&gt; - 421a6b05 Merge pull request #11031 from ndeloof/TestWatch<br>
&gt;&gt; - c34c306c TestWatch to use new=C2=A0 `develop` section<br>
&gt;&gt; - 5ca35c88 implement publish<br>
&gt;&gt; - 805541be watch: use official `develop` section (#11026)<br>
&gt;&gt; - d322ad91 Merge pull request #11027 from docker/dependabot/go_mod=
ules/<a href=3D"http://github.com/opencontainers/image-spec-1.1.0-rc5" rel=
=3D"noreferrer" target=3D"_blank">github.com/opencontainers/image-spec-1.1.=
0-rc5</a><br>
&gt;&gt; - 8f489d6d build(deps): bump <a href=3D"http://github.com/opencont=
ainers/image-spec" rel=3D"noreferrer" target=3D"_blank">github.com/opencont=
ainers/image-spec</a><br>
&gt;&gt; - a214a715 Merge pull request #11017 from docker/dependabot/go_mod=
ules/<a href=3D"http://github.com/moby/buildkit-0.12.2" rel=3D"noreferrer" =
target=3D"_blank">github.com/moby/buildkit-0.12.2</a><br>
&gt;&gt; - 9ea8fbc6 build(deps): bump <a href=3D"http://github.com/moby/bui=
ldkit" rel=3D"noreferrer" target=3D"_blank">github.com/moby/buildkit</a> fr=
om 0.12.1 to 0.12.2<br>
&gt;&gt; - 062fa755 Merge pull request #11020 from docker/dependabot/go_mod=
ules/gotest.tools/v3-3.5.1<br>
&gt;&gt; - 76f150e4 build(deps): bump gotest.tools/v3 from 3.5.0 to 3.5.1<b=
r>
&gt;&gt; - d45d943e Merge pull request #11019 from docker/dependabot/go_mod=
ules/<a href=3D"http://google.golang.org/grpc-1.58.1" rel=3D"noreferrer" ta=
rget=3D"_blank">google.golang.org/grpc-1.58.1</a><br>
&gt;&gt; - f447c809 build(deps): bump <a href=3D"http://google.golang.org/g=
rpc" rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> from 1=
.58.0 to 1.58.1<br>
&gt;&gt; - 722796ca Merge pull request #11016 from docker/dependabot/go_mod=
ules/<a href=3D"http://github.com/containerd/containerd-1.7.6" rel=3D"noref=
errer" target=3D"_blank">github.com/containerd/containerd-1.7.6</a><br>
&gt;&gt; - 4587d4ba build(deps): bump <a href=3D"http://github.com/containe=
rd/containerd" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/c=
ontainerd</a> from 1.7.3 to 1.7.6<br>
&gt;&gt; - a697a069 introduce pull --missing flag to only pull images not p=
resent in cache<br>
&gt;&gt; - 8af49ff3 resolve service reference into container based on obser=
ved state<br>
&gt;&gt; - f6e31dbc don&#39;t rely on depends_on to resolve volume_from, be=
tter use observed state<br>
&gt;&gt; - e19232e8 Merge pull request #11000 from thaJeztah/update_golang_=
1.21.1<br>
&gt;&gt; - 6d5eb6fd update to go1.21.1<br>
&gt;&gt; - 9d7e0ad6 correct scale error messages formatting<br>
&gt;&gt; - 1a98a70b add scale command<br>
&gt;&gt; - 19bbb12f ci: tweak restricted imports in linter (#10992)<br>
&gt;&gt; - 7a134578 deps: upgrade Moby to v24.0.6 and gRPC to v1.58.0 (#109=
91)<br>
&gt;&gt; - 13115468 cli: fix `--build` flag for `create` (#10982)<br>
&gt;&gt; - e1aa4f77 otel: add args &amp; flags to cli traces (#10974)<br>
&gt;&gt; - d7b0b2bd watch: build &amp; launch the project at start (#10957)=
<br>
&gt;&gt; - e0f39ebb pull OCI remote resource<br>
&gt;&gt; - c9d54f09 introduce publish (alpha) command<br>
&gt;&gt; - aeb835a5 Merge pull request #10966 from kumarlokesh/patch-1<br>
&gt;&gt; - 52e54ef9 doc: updated README.md to remove broken link<br>
&gt;&gt; - 203bce88 Merge pull request #10954 from thaJeztah/swap_reference=
<br>
&gt;&gt; - f4f2e934 migrate to <a href=3D"http://github.com/distribution/re=
ference" rel=3D"noreferrer" target=3D"_blank">github.com/distribution/refer=
ence</a><br>
&gt;&gt; - 32c3d0a3 Enable service explicitly requested to be restarted<br>
&gt;&gt; - 1fdbcb62 build: pass BuildOptions around explicitly &amp; fix mu=
lti-platform issues<br>
&gt;&gt; - 407a0d5b up: fix various race/deadlock conditions on exit (#1093=
4)<br>
&gt;&gt; - d0dfb848 Merge pull request #10953 from thaJeztah/drop_uuid<br>
&gt;&gt; - 8caa6f1f pkg/api: replace uuid for basic random id<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@f=
oundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../docker-compose/<a href=3D"http://docker-compose_git.bb" =
rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;&gt;=C2=A0 .../docker-compose/files/modules.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 119 +++---<br>
&gt;&gt;=C2=A0 .../docker-compose/relocation.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 38 +-<br>
&gt;&gt;=C2=A0 recipes-containers/docker-compose/src_uri.inc | 348 +++++++-=
----------<br>
&gt;&gt;=C2=A0 4 files changed, 182 insertions(+), 327 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-containers/docker-compose/<a href=3D"http://d=
ocker-compose_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_g=
it.bb</a> b/recipes-containers/docker-compose/<a href=3D"http://docker-comp=
ose_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a><=
br>
&gt;&gt; index b7745f2..8154cc5 100644<br>
&gt;&gt; --- a/recipes-containers/docker-compose/<a href=3D"http://docker-c=
ompose_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</=
a><br>
&gt;&gt; +++ b/recipes-containers/docker-compose/<a href=3D"http://docker-c=
ompose_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</=
a><br>
&gt;&gt; @@ -9,7 +9,7 @@ DEPENDS =3D &quot; \<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # Specify the first two important SRCREVs as the format<br>
&gt;&gt;=C2=A0 SRCREV_FORMAT=3D&quot;compose_survey&quot;<br>
&gt;&gt; -SRCREV_compose =3D &quot;d6f842b042d2f2926901305336527b3eaadf067a=
&quot;<br>
&gt;&gt; +SRCREV_compose =3D &quot;c665c53cc1eb633a819fcaa9b47d77597b55d0eb=
&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/docker/=
compose;name=3Dcompose;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/docker/compose;name=3Dcompose;branch=3Dmain;pro=
tocol=3Dhttps</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/import/LIC=
ENSE;md5=3D175792518e4ac015ab6696d16c4f60<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 GO_IMPORT =3D &quot;import&quot;<br>
&gt;&gt;<br>
&gt;&gt; -PV =3D &quot;v2.21.0&quot;<br>
&gt;&gt; +PV =3D &quot;v2.23.3&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 COMPOSE_PKG =3D &quot;<a href=3D"http://github.com/docker/co=
mpose/v2" rel=3D"noreferrer" target=3D"_blank">github.com/docker/compose/v2=
</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-containers/docker-compose/files/modules.txt b=
/recipes-containers/docker-compose/files/modules.txt<br>
&gt;&gt; index d287d12..c8219da 100644<br>
&gt;&gt; --- a/recipes-containers/docker-compose/files/modules.txt<br>
&gt;&gt; +++ b/recipes-containers/docker-compose/files/modules.txt<br>
&gt;&gt; @@ -2,27 +2,25 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/Microsoft/go-winio" rel=3D"no=
referrer" target=3D"_blank">github.com/Microsoft/go-winio</a> v0.6.1<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/adrg/xdg" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/adrg/xdg</a> v0.4.0<br>
&gt;&gt; -## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/buger/goterm" rel=3D"noreferr=
er" target=3D"_blank">github.com/buger/goterm</a> v1.0.4<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/compose-spec/compose-go" rel=3D"no=
referrer" target=3D"_blank">github.com/compose-spec/compose-go</a> v1.18.3<=
br>
&gt;&gt; +# <a href=3D"http://github.com/compose-spec/compose-go" rel=3D"no=
referrer" target=3D"_blank">github.com/compose-spec/compose-go</a> v1.20.2<=
br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/containerd/console" rel=3D"no=
referrer" target=3D"_blank">github.com/containerd/console</a> v1.0.3<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/containerd/containerd" rel=3D"nore=
ferrer" target=3D"_blank">github.com/containerd/containerd</a> v1.7.3<br>
&gt;&gt; +# <a href=3D"http://github.com/containerd/containerd" rel=3D"nore=
ferrer" target=3D"_blank">github.com/containerd/containerd</a> v1.7.7<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/cucumber/godog" rel=3D"noreferrer"=
 target=3D"_blank">github.com/cucumber/godog</a> v0.0.0-00010101000000-0000=
00000000<br>
&gt;&gt; +# <a href=3D"http://github.com/davecgh/go-spew" rel=3D"noreferrer=
" target=3D"_blank">github.com/davecgh/go-spew</a> v1.1.1<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/distribution/distribution/v3" rel=
=3D"noreferrer" target=3D"_blank">github.com/distribution/distribution/v3</=
a> v3.0.0-20230601133803-97b1d649c493<br>
&gt;&gt; +# <a href=3D"http://github.com/distribution/reference" rel=3D"nor=
eferrer" target=3D"_blank">github.com/distribution/reference</a> v0.5.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/docker/buildx" rel=3D"noreferrer" =
target=3D"_blank">github.com/docker/buildx</a> v0.11.2<br>
&gt;&gt; +# <a href=3D"http://github.com/docker/buildx" rel=3D"noreferrer" =
target=3D"_blank">github.com/docker/buildx</a> v0.12.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/docker/cli" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/docker/cli</a> v24.0.5+incompatible<br>
&gt;&gt; +# <a href=3D"http://github.com/docker/cli" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/docker/cli</a> v24.0.7+incompatible<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/docker/cli-docs-tool" rel=3D"=
noreferrer" target=3D"_blank">github.com/docker/cli-docs-tool</a> v0.6.0<br=
>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/docker/docker" rel=3D"noreferrer" =
target=3D"_blank">github.com/docker/docker</a> v24.0.5+incompatible<br>
&gt;&gt; +# <a href=3D"http://github.com/docker/docker" rel=3D"noreferrer" =
target=3D"_blank">github.com/docker/docker</a> v24.0.7+incompatible<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/docker/go-connections" rel=3D=
"noreferrer" target=3D"_blank">github.com/docker/go-connections</a> v0.4.0<=
br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; @@ -32,6 +30,8 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/golang/mock" rel=3D"noreferre=
r" target=3D"_blank">github.com/golang/mock</a> v1.6.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; +# <a href=3D"http://github.com/google/go-cmp" rel=3D"noreferrer" =
target=3D"_blank">github.com/google/go-cmp</a> v0.6.0<br>
&gt;&gt; +## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/hashicorp/go-multierror" rel=
=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-multierror</a> v1=
.1.1<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/hashicorp/go-version" rel=3D"=
noreferrer" target=3D"_blank">github.com/hashicorp/go-version</a> v1.6.0<br=
>
&gt;&gt; @@ -42,7 +42,7 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/mitchellh/mapstructure" rel=
=3D"noreferrer" target=3D"_blank">github.com/mitchellh/mapstructure</a> v1.=
5.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/moby/buildkit" rel=3D"noreferrer" =
target=3D"_blank">github.com/moby/buildkit</a> v0.12.1<br>
&gt;&gt; +# <a href=3D"http://github.com/moby/buildkit" rel=3D"noreferrer" =
target=3D"_blank">github.com/moby/buildkit</a> v0.13.0-beta1.0.202310231143=
02-d5c1d785b042<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/moby/patternmatcher" rel=3D"n=
oreferrer" target=3D"_blank">github.com/moby/patternmatcher</a> v0.6.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; @@ -52,13 +52,13 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/opencontainers/go-digest" rel=
=3D"noreferrer" target=3D"_blank">github.com/opencontainers/go-digest</a> v=
1.0.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/opencontainers/image-spec" rel=3D"=
noreferrer" target=3D"_blank">github.com/opencontainers/image-spec</a> v1.1=
.0-rc4<br>
&gt;&gt; +# <a href=3D"http://github.com/opencontainers/image-spec" rel=3D"=
noreferrer" target=3D"_blank">github.com/opencontainers/image-spec</a> v1.1=
.0-rc5<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/pkg/errors" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/pkg/errors</a> v0.9.1<br>
&gt;&gt; +# <a href=3D"http://github.com/otiai10/copy" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/otiai10/copy</a> v1.14.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/sirupsen/logrus" rel=3D"noref=
errer" target=3D"_blank">github.com/sirupsen/logrus</a> v1.9.3<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/spf13/cobra" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/spf13/cobra</a> v1.7.0<br>
&gt;&gt; +# <a href=3D"http://github.com/spf13/cobra" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/spf13/cobra</a> v1.8.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/spf13/pflag" rel=3D"noreferre=
r" target=3D"_blank">github.com/spf13/pflag</a> v1.0.5<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; @@ -78,22 +78,26 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://go.opentelemetry.io/otel/trace" rel=3D"n=
oreferrer" target=3D"_blank">go.opentelemetry.io/otel/trace</a> v1.14.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://go.uber.org/goleak" rel=3D"noreferrer" target=
=3D"_blank">go.uber.org/goleak</a> v1.2.1<br>
&gt;&gt; +# <a href=3D"http://go.uber.org/goleak" rel=3D"noreferrer" target=
=3D"_blank">go.uber.org/goleak</a> v1.3.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://golang.org/x/sync" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/sync</a> v0.3.0<br>
&gt;&gt; +# <a href=3D"http://golang.org/x/exp" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/exp</a> v0.0.0-20230713183714-613f0c0eb8a1<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://google.golang.org/grpc" rel=3D"noreferrer" ta=
rget=3D"_blank">google.golang.org/grpc</a> v1.57.0<br>
&gt;&gt; +# <a href=3D"http://golang.org/x/sync" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/sync</a> v0.5.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://gopkg.in/yaml.v2" rel=3D"noreferrer" target=
=3D"_blank">gopkg.in/yaml.v2</a> v2.4.0<br>
&gt;&gt; +# <a href=3D"http://golang.org/x/sys" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/sys</a> v0.14.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# gotest.tools/v3 v3.5.0<br>
&gt;&gt; +# <a href=3D"http://google.golang.org/grpc" rel=3D"noreferrer" ta=
rget=3D"_blank">google.golang.org/grpc</a> v1.59.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/AdaLogics/go-fuzz-headers" rel=3D"=
noreferrer" target=3D"_blank">github.com/AdaLogics/go-fuzz-headers</a> v0.0=
.0-20230106234847-43070de90fa1<br>
&gt;&gt; +# gotest.tools/v3 v3.5.1<br>
&gt;&gt; +## explicit<br>
&gt;&gt; +# <a href=3D"http://github.com/AdaLogics/go-fuzz-headers" rel=3D"=
noreferrer" target=3D"_blank">github.com/AdaLogics/go-fuzz-headers</a> v0.0=
.0-20230811130428-ced1acdcaa24<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/Azure/go-ansiterm" rel=3D"nor=
eferrer" target=3D"_blank">github.com/Azure/go-ansiterm</a> v0.0.0-20210617=
225240-d185dfc1b5a1<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/Masterminds/semver/v3" rel=3D=
"noreferrer" target=3D"_blank">github.com/Masterminds/semver/v3</a> v3.2.1<=
br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; +# <a href=3D"http://github.com/Microsoft/hcsshim" rel=3D"noreferr=
er" target=3D"_blank">github.com/Microsoft/hcsshim</a> v0.11.1<br>
&gt;&gt; +## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/aws/aws-sdk-go-v2" rel=3D"nor=
eferrer" target=3D"_blank">github.com/aws/aws-sdk-go-v2</a> v1.17.6<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/aws/aws-sdk-go-v2/config" rel=
=3D"noreferrer" target=3D"_blank">github.com/aws/aws-sdk-go-v2/config</a> v=
1.18.16<br>
&gt;&gt; @@ -120,26 +124,16 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/beorn7/perks" rel=3D"noreferr=
er" target=3D"_blank">github.com/beorn7/perks</a> v1.0.1<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/bugsnag/bugsnag-go" rel=3D"norefer=
rer" target=3D"_blank">github.com/bugsnag/bugsnag-go</a> v1.5.0<br>
&gt;&gt; -## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/cenkalti/backoff/v4" rel=3D"n=
oreferrer" target=3D"_blank">github.com/cenkalti/backoff/v4</a> v4.2.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/cespare/xxhash/v2" rel=3D"nor=
eferrer" target=3D"_blank">github.com/cespare/xxhash/v2</a> v2.2.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/cloudflare/cfssl" rel=3D"noreferre=
r" target=3D"_blank">github.com/cloudflare/cfssl</a> v1.6.4<br>
&gt;&gt; +# <a href=3D"http://github.com/containerd/continuity" rel=3D"nore=
ferrer" target=3D"_blank">github.com/containerd/continuity</a> v0.4.2<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/containerd/continuity" rel=3D"nore=
ferrer" target=3D"_blank">github.com/containerd/continuity</a> v0.4.1<br>
&gt;&gt; +# <a href=3D"http://github.com/containerd/log" rel=3D"noreferrer"=
 target=3D"_blank">github.com/containerd/log</a> v0.1.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/containerd/typeurl/v2" rel=3D=
"noreferrer" target=3D"_blank">github.com/containerd/typeurl/v2</a> v2.1.1<=
br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/cucumber/gherkin-go/v19" rel=3D"no=
referrer" target=3D"_blank">github.com/cucumber/gherkin-go/v19</a> v19.0.3<=
br>
&gt;&gt; -## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/cucumber/messages-go/v16" rel=3D"n=
oreferrer" target=3D"_blank">github.com/cucumber/messages-go/v16</a> v16.0.=
1<br>
&gt;&gt; -## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/cyphar/filepath-securejoin" rel=3D=
"noreferrer" target=3D"_blank">github.com/cyphar/filepath-securejoin</a> v0=
.2.3<br>
&gt;&gt; -## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/davecgh/go-spew" rel=3D"noreferrer=
" target=3D"_blank">github.com/davecgh/go-spew</a> v1.1.1<br>
&gt;&gt; -## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/docker/distribution" rel=3D"n=
oreferrer" target=3D"_blank">github.com/docker/distribution</a> v2.8.2+inco=
mpatible<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/docker/docker-credential-help=
ers" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker-credenti=
al-helpers</a> v0.7.0<br>
&gt;&gt; @@ -166,8 +160,6 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/gofrs/flock" rel=3D"noreferre=
r" target=3D"_blank">github.com/gofrs/flock</a> v0.8.1<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/gofrs/uuid" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/gofrs/uuid</a> v4.2.0+incompatible<br>
&gt;&gt; -## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/gogo/googleapis" rel=3D"noref=
errer" target=3D"_blank">github.com/gogo/googleapis</a> v1.4.1<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/gogo/protobuf" rel=3D"norefer=
rer" target=3D"_blank">github.com/gogo/protobuf</a> v1.3.2<br>
&gt;&gt; @@ -176,8 +168,6 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/google/gnostic" rel=3D"norefe=
rrer" target=3D"_blank">github.com/google/gnostic</a> v0.5.7-v3refs<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/google/go-cmp" rel=3D"noreferrer" =
target=3D"_blank">github.com/google/go-cmp</a> v0.5.9<br>
&gt;&gt; -## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/google/gofuzz" rel=3D"norefer=
rer" target=3D"_blank">github.com/google/gofuzz</a> v1.2.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/google/shlex" rel=3D"noreferr=
er" target=3D"_blank">github.com/google/shlex</a> v0.0.0-20191202100458-e7a=
fc7fbc510<br>
&gt;&gt; @@ -190,13 +180,7 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/hashicorp/errwrap" rel=3D"nor=
eferrer" target=3D"_blank">github.com/hashicorp/errwrap</a> v1.1.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/hashicorp/go-immutable-radix" rel=
=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-immutable-radix</=
a> v1.3.1<br>
&gt;&gt; -## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/hashicorp/go-memdb" rel=3D"norefer=
rer" target=3D"_blank">github.com/hashicorp/go-memdb</a> v1.3.2<br>
&gt;&gt; -## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/hashicorp/golang-lru" rel=3D"noref=
errer" target=3D"_blank">github.com/hashicorp/golang-lru</a> v0.5.4<br>
&gt;&gt; -## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/hashicorp/hcl" rel=3D"noreferrer" =
target=3D"_blank">github.com/hashicorp/hcl</a> v1.0.0<br>
&gt;&gt; +# <a href=3D"http://github.com/hashicorp/go-cleanhttp" rel=3D"nor=
eferrer" target=3D"_blank">github.com/hashicorp/go-cleanhttp</a> v0.5.2<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/imdario/mergo" rel=3D"norefer=
rer" target=3D"_blank">github.com/imdario/mergo</a> v0.3.16<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; @@ -204,8 +188,6 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/inconshreveable/mousetrap" re=
l=3D"noreferrer" target=3D"_blank">github.com/inconshreveable/mousetrap</a>=
 v1.1.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/jinzhu/gorm" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/jinzhu/gorm</a> v1.9.11<br>
&gt;&gt; -## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/josharian/intern" rel=3D"nore=
ferrer" target=3D"_blank">github.com/josharian/intern</a> v1.0.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/json-iterator/go" rel=3D"nore=
ferrer" target=3D"_blank">github.com/json-iterator/go</a> v1.1.12<br>
&gt;&gt; @@ -214,10 +196,6 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/klauspost/compress" rel=3D"no=
referrer" target=3D"_blank">github.com/klauspost/compress</a> v1.16.5<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/kr/pretty" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/kr/pretty</a> v0.3.0<br>
&gt;&gt; -## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/magiconair/properties" rel=3D"nore=
ferrer" target=3D"_blank">github.com/magiconair/properties</a> v1.8.6<br>
&gt;&gt; -## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/mailru/easyjson" rel=3D"noref=
errer" target=3D"_blank">github.com/mailru/easyjson</a> v0.7.6<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/mattn/go-colorable" rel=3D"no=
referrer" target=3D"_blank">github.com/mattn/go-colorable</a> v0.1.13<br>
&gt;&gt; @@ -250,11 +228,11 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/munnerz/goautoneg" rel=3D"nor=
eferrer" target=3D"_blank">github.com/munnerz/goautoneg</a> v0.0.0-20191010=
083416-a7dc8b61c822<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/opencontainers/runc" rel=3D"norefe=
rrer" target=3D"_blank">github.com/opencontainers/runc</a> v1.1.7<br>
&gt;&gt; +# <a href=3D"http://github.com/opencontainers/runc" rel=3D"norefe=
rrer" target=3D"_blank">github.com/opencontainers/runc</a> v1.1.9<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/pelletier/go-toml" rel=3D"nor=
eferrer" target=3D"_blank">github.com/pelletier/go-toml</a> v1.9.5<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/pelletier/go-toml/v2" rel=3D"noref=
errer" target=3D"_blank">github.com/pelletier/go-toml/v2</a> v2.0.5<br>
&gt;&gt; +# <a href=3D"http://github.com/pkg/errors" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/pkg/errors</a> v0.9.1<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/pmezard/go-difflib" rel=3D"no=
referrer" target=3D"_blank">github.com/pmezard/go-difflib</a> v1.0.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; @@ -274,14 +252,6 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/shibumi/go-pathspec" rel=3D"n=
oreferrer" target=3D"_blank">github.com/shibumi/go-pathspec</a> v1.3.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/spf13/afero" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/spf13/afero</a> v1.9.2<br>
&gt;&gt; -## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/spf13/cast" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/spf13/cast</a> v1.5.0<br>
&gt;&gt; -## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/spf13/jwalterweatherman" rel=3D"no=
referrer" target=3D"_blank">github.com/spf13/jwalterweatherman</a> v1.1.0<b=
r>
&gt;&gt; -## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/subosito/gotenv" rel=3D"noreferrer=
" target=3D"_blank">github.com/subosito/gotenv</a> v1.4.1<br>
&gt;&gt; -## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/tonistiigi/fsutil" rel=3D"nor=
eferrer" target=3D"_blank">github.com/tonistiigi/fsutil</a> v0.0.0-20230629=
203738-36ef4d8c0dbb<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/tonistiigi/units" rel=3D"nore=
ferrer" target=3D"_blank">github.com/tonistiigi/units</a> v0.0.0-2018071122=
0420-6950e57a87ea<br>
&gt;&gt; @@ -294,8 +264,6 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://github.com/xeipuuv/gojsonschema" rel=3D"=
noreferrer" target=3D"_blank">github.com/xeipuuv/gojsonschema</a> v1.2.0<br=
>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/zmap/zcrypto" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/zmap/zcrypto</a> v0.0.0-20220605182715-4dfcec6e=
9a8c<br>
&gt;&gt; -## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://go.opentelemetry.io/contrib/instrumentat=
ion/google.golang.org/grpc/otelgrpc" rel=3D"noreferrer" target=3D"_blank">g=
o.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc<=
/a> v0.40.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://go.opentelemetry.io/contrib/instrumentat=
ion/net/http/httptrace/otelhttptrace" rel=3D"noreferrer" target=3D"_blank">=
go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrac=
e</a> v0.40.0<br>
&gt;&gt; @@ -310,21 +278,17 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://go.opentelemetry.io/proto/otlp" rel=3D"n=
oreferrer" target=3D"_blank">go.opentelemetry.io/proto/otlp</a> v0.19.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://golang.org/x/crypto" rel=3D"noreferrer" targe=
t=3D"_blank">golang.org/x/crypto</a> v0.7.0<br>
&gt;&gt; -## explicit<br>
&gt;&gt; -# <a href=3D"http://golang.org/x/exp" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/exp</a> v0.0.0-20230713183714-613f0c0eb8a1<br>
&gt;&gt; +# <a href=3D"http://golang.org/x/crypto" rel=3D"noreferrer" targe=
t=3D"_blank">golang.org/x/crypto</a> v0.14.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://golang.org/x/mod" rel=3D"noreferrer" tar=
get=3D"_blank">golang.org/x/mod</a> v0.11.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://golang.org/x/net" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/net</a> v0.9.0<br>
&gt;&gt; +# <a href=3D"http://golang.org/x/net" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/net</a> v0.17.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://golang.org/x/oauth2" rel=3D"noreferrer" targe=
t=3D"_blank">golang.org/x/oauth2</a> v0.7.0<br>
&gt;&gt; +# <a href=3D"http://golang.org/x/oauth2" rel=3D"noreferrer" targe=
t=3D"_blank">golang.org/x/oauth2</a> v0.11.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://golang.org/x/sys" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/sys</a> v0.7.0<br>
&gt;&gt; +# <a href=3D"http://golang.org/x/term" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/term</a> v0.13.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://golang.org/x/term" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/term</a> v0.7.0<br>
&gt;&gt; -## explicit<br>
&gt;&gt; -# <a href=3D"http://golang.org/x/text" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/text</a> v0.9.0<br>
&gt;&gt; +# <a href=3D"http://golang.org/x/text" rel=3D"noreferrer" target=
=3D"_blank">golang.org/x/text</a> v0.13.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://golang.org/x/time" rel=3D"noreferrer" ta=
rget=3D"_blank">golang.org/x/time</a> v0.3.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; @@ -332,25 +296,25 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://google.golang.org/appengine" rel=3D"nore=
ferrer" target=3D"_blank">google.golang.org/appengine</a> v1.6.7<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://google.golang.org/genproto" rel=3D"noreferrer=
" target=3D"_blank">google.golang.org/genproto</a> v0.0.0-20230526161137-00=
05af68ea54<br>
&gt;&gt; +# <a href=3D"http://google.golang.org/genproto" rel=3D"noreferrer=
" target=3D"_blank">google.golang.org/genproto</a> v0.0.0-20230822172742-b8=
732ec3820d<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://google.golang.org/genproto/googleapis/api" re=
l=3D"noreferrer" target=3D"_blank">google.golang.org/genproto/googleapis/ap=
i</a> v0.0.0-20230525234035-dd9d682886f9<br>
&gt;&gt; +# <a href=3D"http://google.golang.org/genproto/googleapis/api" re=
l=3D"noreferrer" target=3D"_blank">google.golang.org/genproto/googleapis/ap=
i</a> v0.0.0-20230822172742-b8732ec3820d<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://google.golang.org/genproto/googleapis/rpc" re=
l=3D"noreferrer" target=3D"_blank">google.golang.org/genproto/googleapis/rp=
c</a> v0.0.0-20230525234030-28d5490b6b19<br>
&gt;&gt; +# <a href=3D"http://google.golang.org/genproto/googleapis/rpc" re=
l=3D"noreferrer" target=3D"_blank">google.golang.org/genproto/googleapis/rp=
c</a> v0.0.0-20230822172742-b8732ec3820d<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://google.golang.org/protobuf" rel=3D"noreferrer=
" target=3D"_blank">google.golang.org/protobuf</a> v1.30.0<br>
&gt;&gt; +# <a href=3D"http://google.golang.org/protobuf" rel=3D"noreferrer=
" target=3D"_blank">google.golang.org/protobuf</a> v1.31.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://gopkg.in/inf.v0" rel=3D"noreferrer" targ=
et=3D"_blank">gopkg.in/inf.v0</a> v0.9.1<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://gopkg.in/ini.v1" rel=3D"noreferrer" target=3D=
"_blank">gopkg.in/ini.v1</a> v1.67.0<br>
&gt;&gt; +# <a href=3D"http://gopkg.in/yaml.v2" rel=3D"noreferrer" target=
=3D"_blank">gopkg.in/yaml.v2</a> v2.4.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://gopkg.in/yaml.v3" rel=3D"noreferrer" tar=
get=3D"_blank">gopkg.in/yaml.v3</a> v3.0.1<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://k8s.io/api" rel=3D"noreferrer" target=3D"_bla=
nk">k8s.io/api</a> v0.26.2<br>
&gt;&gt; +# <a href=3D"http://k8s.io/api" rel=3D"noreferrer" target=3D"_bla=
nk">k8s.io/api</a> v0.26.7<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://k8s.io/apimachinery" rel=3D"noreferrer" targe=
t=3D"_blank">k8s.io/apimachinery</a> v0.26.2<br>
&gt;&gt; +# <a href=3D"http://k8s.io/apimachinery" rel=3D"noreferrer" targe=
t=3D"_blank">k8s.io/apimachinery</a> v0.26.7<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://k8s.io/client-go" rel=3D"noreferrer" target=
=3D"_blank">k8s.io/client-go</a> v0.26.2<br>
&gt;&gt; +# <a href=3D"http://k8s.io/client-go" rel=3D"noreferrer" target=
=3D"_blank">k8s.io/client-go</a> v0.26.7<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://k8s.io/klog/v2" rel=3D"noreferrer" targe=
t=3D"_blank">k8s.io/klog/v2</a> v2.90.1<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; @@ -364,4 +328,3 @@<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt;=C2=A0 # <a href=3D"http://sigs.k8s.io/yaml" rel=3D"noreferrer" tar=
get=3D"_blank">sigs.k8s.io/yaml</a> v1.3.0<br>
&gt;&gt;=C2=A0 ## explicit<br>
&gt;&gt; -# <a href=3D"http://github.com/cucumber/godog" rel=3D"noreferrer"=
 target=3D"_blank">github.com/cucumber/godog</a> =3D&gt; <a href=3D"http://=
github.com/laurazard/godog" rel=3D"noreferrer" target=3D"_blank">github.com=
/laurazard/godog</a> v0.0.0-20220922095256-4c4b17abdae7<br>
&gt;&gt; diff --git a/recipes-containers/docker-compose/relocation.inc b/re=
cipes-containers/docker-compose/relocation.inc<br>
&gt;&gt; index 9e6eacf..daa5be2 100644<br>
&gt;&gt; --- a/recipes-containers/docker-compose/relocation.inc<br>
&gt;&gt; +++ b/recipes-containers/docker-compose/relocation.inc<br>
&gt;&gt; @@ -3,12 +3,11 @@ export sites=3D&quot;<a href=3D"http://k8s.io/ap=
i:k8s.io/api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.io/=
api:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k=
8s.io/klog/v2:k8s.io/klog/v2:force" rel=3D"noreferrer" target=3D"_blank">k8=
s.io/klog/v2:k8s.io/klog/v2:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gotest.tools/v3:got=
est.tools/v3:force \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
opkg.in/inf.v0:gopkg.in/inf.v0:force" rel=3D"noreferrer" target=3D"_blank">=
gopkg.in/inf.v0:gopkg.in/inf.v0:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.=
in/ini.v1:gopkg.in/ini.v1:force" rel=3D"noreferrer" target=3D"_blank">gopkg=
.in/ini.v1:gopkg.in/ini.v1:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.=
in/yaml.v2:gopkg.in/yaml.v2:force" rel=3D"noreferrer" target=3D"_blank">gop=
kg.in/yaml.v2:gopkg.in/yaml.v2:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
olang.org/x/exp:golang.org/x/exp:force" rel=3D"noreferrer" target=3D"_blank=
">golang.org/x/exp:golang.org/x/exp:force</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang=
.org/x/sys:golang.org/x/sys:force" rel=3D"noreferrer" target=3D"_blank">gol=
ang.org/x/sys:golang.org/x/sys:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
olang.org/x/mod:golang.org/x/mod:force" rel=3D"noreferrer" target=3D"_blank=
">golang.org/x/mod:golang.org/x/mod:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
olang.org/x/net:golang.org/x/net:force" rel=3D"noreferrer" target=3D"_blank=
">golang.org/x/net:golang.org/x/net:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang=
.org/x/sys:golang.org/x/sys:force" rel=3D"noreferrer" target=3D"_blank">gol=
ang.org/x/sys:golang.org/x/sys:force</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.=
in/yaml.v2:gopkg.in/yaml.v2:force" rel=3D"noreferrer" target=3D"_blank">gop=
kg.in/yaml.v2:gopkg.in/yaml.v2:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
opkg.in/yaml.v3:gopkg.in/yaml.v3:force" rel=3D"noreferrer" target=3D"_blank=
">gopkg.in/yaml.v3:gopkg.in/yaml.v3:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k=
8s.io/client-go:k8s.io/client-go:force" rel=3D"noreferrer" target=3D"_blank=
">k8s.io/client-go:k8s.io/client-go:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://s=
igs.k8s.io/json:sigs.k8s.io/json:force" rel=3D"noreferrer" target=3D"_blank=
">sigs.k8s.io/json:sigs.k8s.io/json:force</a> \<br>
&gt;&gt; @@ -19,63 +18,54 @@ export sites=3D&quot;<a href=3D"http://k8s.io/=
api:k8s.io/api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.i=
o/api:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
olang.org/x/time:golang.org/x/time:force" rel=3D"noreferrer" target=3D"_bla=
nk">golang.org/x/time:golang.org/x/time:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
o.uber.org/goleak:go.uber.org/goleak:force" rel=3D"noreferrer" target=3D"_b=
lank">go.uber.org/goleak:go.uber.org/goleak:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
olang.org/x/tools:golang.org/x/tools:force" rel=3D"noreferrer" target=3D"_b=
lank">golang.org/x/tools:golang.org/x/tools:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/adrg/xdg:github.com/adrg/xdg:force" rel=3D"noreferrer" target=3D"_blan=
k">github.com/adrg/xdg:github.com/adrg/xdg:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
olang.org/x/crypto:golang.org/x/crypto:force" rel=3D"noreferrer" target=3D"=
_blank">golang.org/x/crypto:golang.org/x/crypto:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
olang.org/x/oauth2:golang.org/x/oauth2:force" rel=3D"noreferrer" target=3D"=
_blank">golang.org/x/oauth2:golang.org/x/oauth2:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k=
8s.io/apimachinery:k8s.io/apimachinery:force" rel=3D"noreferrer" target=3D"=
_blank">k8s.io/apimachinery:k8s.io/apimachinery:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k=
8s.io/kube-openapi:k8s.io/kube-openapi:force" rel=3D"noreferrer" target=3D"=
_blank">k8s.io/kube-openapi:k8s.io/kube-openapi:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/moby/term:github.com/moby/term:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/moby/term:github.com/moby/term:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/docker/go:github.com/docker/go:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/docker/go:github.com/docker/go:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/kr/pretty:github.com/kr/pretty:force" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/kr/pretty:github.com/kr/pretty:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/docker/cli:github.com/docker/cli:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/docker/cli:github.com/docker/cli:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/pkg/errors:github.com/pkg/errors:force" rel=3D"noreferrer" target=3D"_=
blank">github.com/pkg/errors:github.com/pkg/errors:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/gofrs/uuid:github.com/gofrs/uuid:force" rel=3D"noreferrer" target=3D"_=
blank">github.com/gofrs/uuid:github.com/gofrs/uuid:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/mgutz/ansi:github.com/mgutz/ansi:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/mgutz/ansi:github.com/mgutz/ansi:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/spf13/cast:github.com/spf13/cast:force" rel=3D"noreferrer" target=3D"_=
blank">github.com/spf13/cast:github.com/spf13/cast:force</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/pkg/errors:github.com/pkg/errors:force" rel=3D"noreferrer" target=3D"_=
blank">github.com/pkg/errors:github.com/pkg/errors:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/golang/mock:github.com/golang/mock:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/golang/mock:github.com/golang/mock:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/spf13/cobra:github.com/spf13/cobra:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/spf13/cobra:github.com/spf13/cobra:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/spf13/pflag:github.com/spf13/pflag:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/spf13/pflag:github.com/spf13/pflag:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
oogle.golang.org/grpc:google.golang.org/grpc:force" rel=3D"noreferrer" targ=
et=3D"_blank">google.golang.org/grpc:google.golang.org/grpc:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/gofrs/flock:github.com/gofrs/flock:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/gofrs/flock:github.com/gofrs/flock:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/gorilla/mux:github.com/gorilla/mux:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/gorilla/mux:github.com/gorilla/mux:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/jinzhu/gorm:github.com/jinzhu/gorm:force" rel=3D"noreferrer" target=3D=
"_blank">github.com/jinzhu/gorm:github.com/jinzhu/gorm:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/moby/locker:github.com/moby/locker:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/moby/locker:github.com/moby/locker:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/rivo/uniseg:github.com/rivo/uniseg:force" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/rivo/uniseg:github.com/rivo/uniseg:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/spf13/afero:github.com/spf13/afero:force" rel=3D"noreferrer" target=3D=
"_blank">github.com/spf13/afero:github.com/spf13/afero:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/buger/goterm:github.com/buger/goterm:force" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/buger/goterm:github.com/buger/goterm:force</a> \=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/morikuni/aec:github.com/morikuni/aec:force" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/morikuni/aec:github.com/morikuni/aec:force</a> \=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/otiai10/copy:github.com/otiai10/copy:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/otiai10/copy:github.com/otiai10/copy:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/beorn7/perks:github.com/beorn7/perks:force" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/beorn7/perks:github.com/beorn7/perks:force</a> \=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/go-logr/logr:github.com/go-logr/logr:force" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/go-logr/logr:github.com/go-logr/logr:force</a> \=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/go-logr/stdr:github.com/go-logr/stdr:force" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/go-logr/stdr:github.com/go-logr/stdr:force</a> \=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/google/shlex:github.com/google/shlex:force" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/google/shlex:github.com/google/shlex:force</a> \=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/miekg/pkcs11:github.com/miekg/pkcs11:force" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/miekg/pkcs11:github.com/miekg/pkcs11:force</a> \=
<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/zmap/zcrypto:github.com/zmap/zcrypto:force" rel=3D"noreferrer" target=
=3D"_blank">github.com/zmap/zcrypto:github.com/zmap/zcrypto:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/docker/buildx:github.com/docker/buildx:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/docker/buildx:github.com/docker/buildx:force</=
a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/docker/docker:github.com/docker/docker:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/docker/docker:github.com/docker/docker:force</=
a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/google/go-cmp:github.com/google/go-cmp:force" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/google/go-cmp:github.com/google/go-cmp:force</a> \<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/moby/buildkit:github.com/moby/buildkit:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/moby/buildkit:github.com/moby/buildkit:force</=
a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
o.opentelemetry.io/otel:go.opentelemetry.io/otel:force" rel=3D"noreferrer" =
target=3D"_blank">go.opentelemetry.io/otel:go.opentelemetry.io/otel:force</=
a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/aws/smithy-go:github.com/aws/smithy-go:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/aws/smithy-go:github.com/aws/smithy-go:force</=
a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/gogo/protobuf:github.com/gogo/protobuf:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/gogo/protobuf:github.com/gogo/protobuf:force</=
a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/google/go-cmp:github.com/google/go-cmp:force" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/google/go-cmp:github.com/google/go-cmp:force</a> \<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/google/gofuzz:github.com/google/gofuzz:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/google/gofuzz:github.com/google/gofuzz:force</=
a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/hashicorp/hcl:github.com/hashicorp/hcl:force" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/hashicorp/hcl:github.com/hashicorp/hcl:force</a> \<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/imdario/mergo:github.com/imdario/mergo:force" rel=3D"noreferrer" =
target=3D"_blank">github.com/imdario/mergo:github.com/imdario/mergo:force</=
a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/containerd/log:github.com/containerd/log:force" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/containerd/log:github.com/containerd/log:force</a=
> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/google/gnostic:github.com/google/gnostic:force" rel=3D"noreferrer=
" target=3D"_blank">github.com/google/gnostic:github.com/google/gnostic:for=
ce</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/cucumber/godog:github.com/laurazard/godog:force" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/cucumber/godog:github.com/laurazard/godog:force<=
/a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/davecgh/go-spew:github.com/davecgh/go-spew:force" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/davecgh/go-spew:github.com/davecgh/go-spew:forc=
e</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/docker/go-units:github.com/docker/go-units:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/docker/go-units:github.com/docker/go-units=
:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/sirupsen/logrus:github.com/sirupsen/logrus:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/sirupsen/logrus:github.com/sirupsen/logrus=
:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/davecgh/go-spew:github.com/davecgh/go-spew:force" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/davecgh/go-spew:github.com/davecgh/go-spew:forc=
e</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/go-openapi/swag:github.com/go-openapi/swag:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/go-openapi/swag:github.com/go-openapi/swag=
:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/gogo/googleapis:github.com/gogo/googleapis:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/gogo/googleapis:github.com/gogo/googleapis=
:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/golang/protobuf:github.com/golang/protobuf:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/golang/protobuf:github.com/golang/protobuf=
:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/mailru/easyjson:github.com/mailru/easyjson:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/mailru/easyjson:github.com/mailru/easyjson=
:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/mattn/go-isatty:github.com/mattn/go-isatty:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/mattn/go-isatty:github.com/mattn/go-isatty=
:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/moby/spdystream:github.com/moby/spdystream:force" rel=3D"noreferr=
er" target=3D"_blank">github.com/moby/spdystream:github.com/moby/spdystream=
:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/subosito/gotenv:github.com/subosito/gotenv:force" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/subosito/gotenv:github.com/subosito/gotenv:forc=
e</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
oogle.golang.org/genproto:google.golang.org/genproto:force" rel=3D"noreferr=
er" target=3D"_blank">google.golang.org/genproto:google.golang.org/genproto=
:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
oogle.golang.org/protobuf:google.golang.org/protobuf:force" rel=3D"noreferr=
er" target=3D"_blank">google.golang.org/protobuf:google.golang.org/protobuf=
:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/stretchr/testify:github.com/stretchr/testify:force" rel=3D"norefe=
rrer" target=3D"_blank">github.com/stretchr/testify:github.com/stretchr/tes=
tify:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/cloudflare/cfssl:github.com/cloudflare/cfssl:force" rel=3D"noreferrer"=
 target=3D"_blank">github.com/cloudflare/cfssl:github.com/cloudflare/cfssl:=
force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/josharian/intern:github.com/josharian/intern:force" rel=3D"norefe=
rrer" target=3D"_blank">github.com/josharian/intern:github.com/josharian/in=
tern:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/json-iterator/go:github.com/json-iterator/go:force" rel=3D"norefe=
rrer" target=3D"_blank">github.com/json-iterator/go:github.com/json-iterato=
r/go:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/serialx/hashring:github.com/serialx/hashring:force" rel=3D"norefe=
rrer" target=3D"_blank">github.com/serialx/hashring:github.com/serialx/hash=
ring:force</a> \<br>
&gt;&gt; @@ -85,6 +75,7 @@ export sites=3D&quot;<a href=3D"http://k8s.io/ap=
i:k8s.io/api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.io/=
api:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/fsnotify/fsevents:github.com/fsnotify/fsevents:force" rel=3D"nore=
ferrer" target=3D"_blank">github.com/fsnotify/fsevents:github.com/fsnotify/=
fsevents:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/tilt-dev/fsnotify:github.com/tilt-dev/fsnotify:force" rel=3D"nore=
ferrer" target=3D"_blank">github.com/tilt-dev/fsnotify:github.com/tilt-dev/=
fsnotify:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm:force" rel=3D"nore=
ferrer" target=3D"_blank">github.com/Azure/go-ansiterm:github.com/Azure/go-=
ansiterm:force</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/Microsoft/hcsshim:github.com/Microsoft/hcsshim:force" rel=3D"noreferre=
r" target=3D"_blank">github.com/Microsoft/hcsshim:github.com/Microsoft/hcss=
him:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/aws/aws-sdk-go-v2:github.com/aws/aws-sdk-go-v2:force" rel=3D"nore=
ferrer" target=3D"_blank">github.com/aws/aws-sdk-go-v2:github.com/aws/aws-s=
dk-go-v2:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2:force" rel=3D"nore=
ferrer" target=3D"_blank">github.com/cespare/xxhash/v2:github.com/cespare/x=
xhash/v2:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/docker/go-metrics:github.com/docker/go-metrics:force" rel=3D"nore=
ferrer" target=3D"_blank">github.com/docker/go-metrics:github.com/docker/go=
-metrics:force</a> \<br>
&gt;&gt; @@ -97,9 +88,7 @@ export sites=3D&quot;<a href=3D"http://k8s.io/ap=
i:k8s.io/api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.io/=
api:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/tonistiigi/fsutil:github.com/tonistiigi/fsutil:force" rel=3D"nore=
ferrer" target=3D"_blank">github.com/tonistiigi/fsutil:github.com/tonistiig=
i/fsutil:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/Microsoft/go-winio:github.com/Microsoft/go-winio:force" rel=3D"no=
referrer" target=3D"_blank">github.com/Microsoft/go-winio:github.com/Micros=
oft/go-winio:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/containerd/console:github.com/containerd/console:force" rel=3D"no=
referrer" target=3D"_blank">github.com/containerd/console:github.com/contai=
nerd/console:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/bugsnag/bugsnag-go:github.com/bugsnag/bugsnag-go:force" rel=3D"norefer=
rer" target=3D"_blank">github.com/bugsnag/bugsnag-go:github.com/bugsnag/bug=
snag-go:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/fvbommel/sortorder:github.com/fvbommel/sortorder:force" rel=3D"no=
referrer" target=3D"_blank">github.com/fvbommel/sortorder:github.com/fvbomm=
el/sortorder:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/hashicorp/go-memdb:github.com/hashicorp/go-memdb:force" rel=3D"norefer=
rer" target=3D"_blank">github.com/hashicorp/go-memdb:github.com/hashicorp/g=
o-memdb:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/klauspost/compress:github.com/klauspost/compress:force" rel=3D"no=
referrer" target=3D"_blank">github.com/klauspost/compress:github.com/klausp=
ost/compress:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/mattn/go-colorable:github.com/mattn/go-colorable:force" rel=3D"no=
referrer" target=3D"_blank">github.com/mattn/go-colorable:github.com/mattn/=
go-colorable:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/mattn/go-runewidth:github.com/mattn/go-runewidth:force" rel=3D"no=
referrer" target=3D"_blank">github.com/mattn/go-runewidth:github.com/mattn/=
go-runewidth:force</a> \<br>
&gt;&gt; @@ -116,10 +105,8 @@ export sites=3D&quot;<a href=3D"http://k8s.io=
/api:k8s.io/api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.=
io/api:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/shibumi/go-pathspec:github.com/shibumi/go-pathspec:force" rel=3D"=
noreferrer" target=3D"_blank">github.com/shibumi/go-pathspec:github.com/shi=
bumi/go-pathspec:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/docker/cli-docs-tool:github.com/docker/cli-docs-tool:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/docker/cli-docs-tool:github.co=
m/docker/cli-docs-tool:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/hashicorp/go-version:github.com/hashicorp/go-version:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-version:github.co=
m/hashicorp/go-version:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/hashicorp/golang-lru:github.com/hashicorp/golang-lru:force" rel=3D"nor=
eferrer" target=3D"_blank">github.com/hashicorp/golang-lru:github.com/hashi=
corp/golang-lru:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/moby/sys/symlink:github.com/moby/sys/symlink/symlink:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/moby/sys/symlink:github.com/mo=
by/sys/symlink/symlink:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/modern-go/concurrent:github.com/modern-go/concurrent:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/modern-go/concurrent:github.co=
m/modern-go/concurrent:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/pelletier/go-toml/v2:github.com/pelletier/go-toml/v2:force" rel=3D"nor=
eferrer" target=3D"_blank">github.com/pelletier/go-toml/v2:github.com/pelle=
tier/go-toml/v2:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/xeipuuv/gojsonschema:github.com/xeipuuv/gojsonschema:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/xeipuuv/gojsonschema:github.co=
m/xeipuuv/gojsonschema:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/AlecAivazis/survey/v2:github.com/AlecAivazis/survey/v2:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/AlecAivazis/survey/v2:github.c=
om/AlecAivazis/survey/v2:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/containerd/containerd:github.com/containerd/containerd:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/containerd/containerd:github.c=
om/containerd/containerd:force</a> \<br>
&gt;&gt; @@ -127,25 +114,23 @@ export sites=3D&quot;<a href=3D"http://k8s.i=
o/api:k8s.io/api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s=
.io/api:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/Masterminds/semver/v3:github.com/Masterminds/semver/v3:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/Masterminds/semver/v3:github.c=
om/Masterminds/semver/v3:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/containerd/continuity:github.com/containerd/continuity:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/containerd/continuity:github.c=
om/containerd/continuity:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/containerd/typeurl/v2:github.com/containerd/typeurl/v2:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/containerd/typeurl/v2:github.c=
om/containerd/typeurl/v2:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/magiconair/properties:github.com/magiconair/properties:force" rel=3D"n=
oreferrer" target=3D"_blank">github.com/magiconair/properties:github.com/ma=
giconair/properties:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/xeipuuv/gojsonpointer:github.com/xeipuuv/gojsonpointer:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/xeipuuv/gojsonpointer:github.c=
om/xeipuuv/gojsonpointer:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
o.opentelemetry.io/proto/otlp:go.opentelemetry.io/proto/otlp/otlp:force" re=
l=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/proto/otlp:go.opente=
lemetry.io/proto/otlp/otlp:force</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/distribution/reference:github.com/distribution/reference:force" rel=3D=
"noreferrer" target=3D"_blank">github.com/distribution/reference:github.com=
/distribution/reference:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/mitchellh/mapstructure:github.com/mitchellh/mapstructure:force" r=
el=3D"noreferrer" target=3D"_blank">github.com/mitchellh/mapstructure:githu=
b.com/mitchellh/mapstructure:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
o.opentelemetry.io/otel/trace:go.opentelemetry.io/otel/trace/trace:force" r=
el=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel/trace:go.opent=
elemetry.io/otel/trace/trace:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/emicklei/go-restful/v3:github.com/emicklei/go-restful/v3:force" r=
el=3D"noreferrer" target=3D"_blank">github.com/emicklei/go-restful/v3:githu=
b.com/emicklei/go-restful/v3:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/go-openapi/jsonpointer:github.com/go-openapi/jsonpointer:force" r=
el=3D"noreferrer" target=3D"_blank">github.com/go-openapi/jsonpointer:githu=
b.com/go-openapi/jsonpointer:force</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cleanhttp:force" rel=3D=
"noreferrer" target=3D"_blank">github.com/hashicorp/go-cleanhttp:github.com=
/hashicorp/go-cleanhttp:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/in-toto/in-toto-golang:github.com/in-toto/in-toto-golang:force" r=
el=3D"noreferrer" target=3D"_blank">github.com/in-toto/in-toto-golang:githu=
b.com/in-toto/in-toto-golang:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/kballard/go-shellquote:github.com/kballard/go-shellquote:force" r=
el=3D"noreferrer" target=3D"_blank">github.com/kballard/go-shellquote:githu=
b.com/kballard/go-shellquote:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/compose-spec/compose-go:github.com/compose-spec/compose-go:force"=
 rel=3D"noreferrer" target=3D"_blank">github.com/compose-spec/compose-go:gi=
thub.com/compose-spec/compose-go:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/hashicorp/go-multierror:github.com/hashicorp/go-multierror:force"=
 rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-multierror:gi=
thub.com/hashicorp/go-multierror:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/cucumber/gherkin-go/v19:github.com/cucumber/gherkin-go/v19:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/cucumber/gherkin-go/v19:github=
.com/cucumber/gherkin-go/v19:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/moby/sys/mountinfo:github.com/moby/sys/mountinfo/mountinfo:force"=
 rel=3D"noreferrer" target=3D"_blank">github.com/moby/sys/mountinfo:github.=
com/moby/sys/mountinfo/mountinfo:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/prometheus/client_model:github.com/prometheus/client_model:force"=
 rel=3D"noreferrer" target=3D"_blank">github.com/prometheus/client_model:gi=
thub.com/prometheus/client_model:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/spf13/jwalterweatherman:github.com/spf13/jwalterweatherman:force" rel=
=3D"noreferrer" target=3D"_blank">github.com/spf13/jwalterweatherman:github=
.com/spf13/jwalterweatherman:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/xeipuuv/gojsonreference:github.com/xeipuuv/gojsonreference:force"=
 rel=3D"noreferrer" target=3D"_blank">github.com/xeipuuv/gojsonreference:gi=
thub.com/xeipuuv/gojsonreference:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
o.opentelemetry.io/otel/metric:go.opentelemetry.io/otel/metric/metric:force=
" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel/metric:go.o=
pentelemetry.io/otel/metric/metric:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/opencontainers/go-digest:github.com/opencontainers/go-digest:forc=
e" rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers/go-digest=
:github.com/opencontainers/go-digest:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/cucumber/messages-go/v16:github.com/cucumber/messages-go/v16:force" re=
l=3D"noreferrer" target=3D"_blank">github.com/cucumber/messages-go/v16:gith=
ub.com/cucumber/messages-go/v16:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/go-openapi/jsonreference:github.com/go-openapi/jsonreference:forc=
e" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/jsonreference=
:github.com/go-openapi/jsonreference:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/prometheus/client_golang:github.com/prometheus/client_golang:forc=
e" rel=3D"noreferrer" target=3D"_blank">github.com/prometheus/client_golang=
:github.com/prometheus/client_golang:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/moby/sys/sequential:github.com/moby/sys/sequential/sequential:for=
ce" rel=3D"noreferrer" target=3D"_blank">github.com/moby/sys/sequential:git=
hub.com/moby/sys/sequential/sequential:force</a> \<br>
&gt;&gt; @@ -154,10 +139,7 @@ export sites=3D&quot;<a href=3D"http://k8s.io=
/api:k8s.io/api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.=
io/api:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/AdaLogics/go-fuzz-headers:github.com/AdaLogics/go-fuzz-headers:fo=
rce" rel=3D"noreferrer" target=3D"_blank">github.com/AdaLogics/go-fuzz-head=
ers:github.com/AdaLogics/go-fuzz-headers:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/inconshreveable/mousetrap:github.com/inconshreveable/mousetrap:fo=
rce" rel=3D"noreferrer" target=3D"_blank">github.com/inconshreveable/mouset=
rap:github.com/inconshreveable/mousetrap:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://s=
igs.k8s.io/structured-merge-diff/v4:sigs.k8s.io/structured-merge-diff/v4:fo=
rce" rel=3D"noreferrer" target=3D"_blank">sigs.k8s.io/structured-merge-diff=
/v4:sigs.k8s.io/structured-merge-diff/v4:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/cyphar/filepath-securejoin:github.com/cyphar/filepath-securejoin:force=
" rel=3D"noreferrer" target=3D"_blank">github.com/cyphar/filepath-securejoi=
n:github.com/cyphar/filepath-securejoin:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/aws/aws-sdk-go-v2/config:github.com/aws/aws-sdk-go-v2/config/conf=
ig:force" rel=3D"noreferrer" target=3D"_blank">github.com/aws/aws-sdk-go-v2=
/config:github.com/aws/aws-sdk-go-v2/config/config:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/distribution/distribution/v3:github.com/distribution/distribution/v3:f=
orce" rel=3D"noreferrer" target=3D"_blank">github.com/distribution/distribu=
tion/v3:github.com/distribution/distribution/v3:force</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github=
.com/hashicorp/go-immutable-radix:github.com/hashicorp/go-immutable-radix:f=
orce" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-immutabl=
e-radix:github.com/hashicorp/go-immutable-radix:force</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/grpc-ecosystem/grpc-gateway/v2:github.com/grpc-ecosystem/grpc-gat=
eway/v2:force" rel=3D"noreferrer" target=3D"_blank">github.com/grpc-ecosyst=
em/grpc-gateway/v2:github.com/grpc-ecosystem/grpc-gateway/v2:force</a> \<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/docker/docker-credential-helpers:github.com/docker/docker-credent=
ial-helpers:force" rel=3D"noreferrer" target=3D"_blank">github.com/docker/d=
ocker-credential-helpers:github.com/docker/docker-credential-helpers:force<=
/a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://g=
ithub.com/grpc-ecosystem/go-grpc-middleware:github.com/grpc-ecosystem/go-gr=
pc-middleware:force" rel=3D"noreferrer" target=3D"_blank">github.com/grpc-e=
cosystem/go-grpc-middleware:github.com/grpc-ecosystem/go-grpc-middleware:fo=
rce</a> \<br>
&gt;&gt; diff --git a/recipes-containers/docker-compose/src_uri.inc b/recip=
es-containers/docker-compose/src_uri.inc<br>
&gt;&gt; index 8897c9c..32a16b3 100644<br>
&gt;&gt; --- a/recipes-containers/docker-compose/src_uri.inc<br>
&gt;&gt; +++ b/recipes-containers/docker-compose/src_uri.inc<br>
&gt;&gt; @@ -1,6 +1,6 @@<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/api" rel=3D"=
noreferrer" target=3D"_blank">k8s.io/api</a> v0.26.2<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/kubernetes/api"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/kubernetes/api</a>=
 1528256abbdf8ff2510112b28a6aacd239789a36<br>
&gt;&gt; -SRCREV_k8s.io-api=3D&quot;1528256abbdf8ff2510112b28a6aacd239789a3=
6&quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/api" rel=3D"=
noreferrer" target=3D"_blank">k8s.io/api</a> v0.26.7<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/kubernetes/api"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/kubernetes/api</a>=
 145ce6cdaea22991c53ba9c7ee7aabae5181cb3e<br>
&gt;&gt; +SRCREV_k8s.io-api=3D&quot;145ce6cdaea22991c53ba9c7ee7aabae5181cb3=
e&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kubern=
etes/api;name=3Dk8s.io-api;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BW=
ORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/k8s.io/api" rel=3D"noreferrer" =
target=3D"_blank">github.com/kubernetes/api;name=3Dk8s.io-api;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.=
io/api</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/utils" =
rel=3D"noreferrer" target=3D"_blank">k8s.io/utils</a> v0.0.0-20230220204549=
-a5ecb0141aa5<br>
&gt;&gt; @@ -13,54 +13,49 @@ SRC_URI +=3D &quot;git://<a href=3D"http://git=
hub.com/kubernetes/utils;name=3Dutils;protocol=3Dhttps;nobranch" rel=3D"nor=
eferrer" target=3D"_blank">github.com/kubernetes/utils;name=3Dutils;protoco=
l=3Dhttps;nobranch</a><br>
&gt;&gt;=C2=A0 SRCREV_klog-v2=3D&quot;d7fc50528570f8276de46570f916682257821=
e22&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kubern=
etes/klog;name=3Dklog-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWOR=
KDIR%7D/$%7BBP%7D/src/import/vendor.fetch/k8s.io/klog/v2" rel=3D"noreferrer=
" target=3D"_blank">github.com/kubernetes/klog;name=3Dklog-v2;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.=
io/klog/v2</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0gotest.tools/v3 v3.5.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/gotestyourself/=
gotest.tools" rel=3D"noreferrer" target=3D"_blank">https://github.com/gotes=
tyourself/gotest.tools</a> a80f057529047c44e1a85d0d017b200787e537e0<br>
&gt;&gt; -SRCREV_gotest.tools-v3=3D&quot;a80f057529047c44e1a85d0d017b200787=
e537e0&quot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/gotestyours=
elf/gotest.tools;name=3Dgotest.tools-v3;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gotest.tools/v3" r=
el=3D"noreferrer" target=3D"_blank">github.com/gotestyourself/gotest.tools;=
name=3Dgotest.tools-v3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR=
}/${BP}/src/import/vendor.fetch/gotest.tools/v3</a>&quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0gotest.tools/v3 v3.5.1<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/gotestyourself/=
gotest.tools" rel=3D"noreferrer" target=3D"_blank">https://github.com/gotes=
tyourself/gotest.tools</a> 81cea1abc596b025bf2573c7fdf97740512e4c6c<br>
&gt;&gt; +SRCREV_v3=3D&quot;81cea1abc596b025bf2573c7fdf97740512e4c6c&quot;<=
br>
&gt;&gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/gotestyours=
elf/gotest.tools;name=3Dv3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BW=
ORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gotest.tools/v3" rel=3D"norefer=
rer" target=3D"_blank">github.com/gotestyourself/gotest.tools;name=3Dv3;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/gotest.tools/v3</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/inf.v=
0" rel=3D"noreferrer" target=3D"_blank">gopkg.in/inf.v0</a> v0.9.1<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/go-inf/inf=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/go-inf/inf</a> d2=
d2541c53f18d2a059457998ce2876cc8e67cbf<br>
&gt;&gt;=C2=A0 SRCREV_inf.v0=3D&quot;d2d2541c53f18d2a059457998ce2876cc8e67c=
bf&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/go-inf=
/inf;name=3Dinf.v0;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in/inf.v0" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/go-inf/inf;name=3Dinf.v0;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/inf.v0=
</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/ini.v1" re=
l=3D"noreferrer" target=3D"_blank">gopkg.in/ini.v1</a> v1.67.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/go-ini/ini" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/go-ini/ini</a> b2f570e=
5b5b844226bbefe6fb521d891f529a951<br>
&gt;&gt; -SRCREV_ini.v1=3D&quot;b2f570e5b5b844226bbefe6fb521d891f529a951&qu=
ot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/go-ini/ini;=
name=3Dini.v1;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7=
BBP%7D/src/import/vendor.fetch/gopkg.in/ini.v1" rel=3D"noreferrer" target=
=3D"_blank">github.com/go-ini/ini;name=3Dini.v1;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ini.v1<=
/a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/yaml.v2" r=
el=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v2</a> v2.4.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/go-yaml/yaml" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/go-yaml/yaml</a> 764=
9d4548cb53a614db133b2a8ac1f31859dda8c<br>
&gt;&gt; -SRCREV_yaml.v2=3D&quot;7649d4548cb53a614db133b2a8ac1f31859dda8c&q=
uot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/go-yaml/yam=
l;name=3Dyaml.v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/gopkg.in/yaml.v2" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml=
.v2</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/e=
xp" rel=3D"noreferrer" target=3D"_blank">golang.org/x/exp</a> v0.0.0-202307=
13183714-613f0c0eb8a1<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://go.googlesource.com/e=
xp" rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/exp</a=
> 613f0c0eb8a17a98ecdb096a7f9f7d5053c1c963<br>
&gt;&gt;=C2=A0 SRCREV_exp=3D&quot;613f0c0eb8a17a98ecdb096a7f9f7d5053c1c963&=
quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.c=
om/exp;name=3Dexp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/exp" rel=3D"noreferrer" tar=
get=3D"_blank">go.googlesource.com/exp;name=3Dexp;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/exp=
</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/sys" r=
el=3D"noreferrer" target=3D"_blank">golang.org/x/sys</a> v0.14.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://go.googlesource.com/sys" r=
el=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/sys</a> cb3=
78ae1ff8cd45e69d4f172df8370bc844e1f86<br>
&gt;&gt; +SRCREV_sys=3D&quot;cb378ae1ff8cd45e69d4f172df8370bc844e1f86&quot;=
<br>
&gt;&gt; +SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sy=
s;name=3Dsys;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/golang.org/x/sys" rel=3D"noreferrer" target=
=3D"_blank">go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys</a=
>&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/m=
od" rel=3D"noreferrer" target=3D"_blank">golang.org/x/mod</a> v0.11.0<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://go.googlesource.com/m=
od" rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/mod</a=
> 62c7e578f1a7275d934c99dd48715525bd52b17e<br>
&gt;&gt;=C2=A0 SRCREV_mod=3D&quot;62c7e578f1a7275d934c99dd48715525bd52b17e&=
quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.c=
om/mod;name=3Dmod;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/mod" rel=3D"noreferrer" tar=
get=3D"_blank">go.googlesource.com/mod;name=3Dmod;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/mod=
</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/net" r=
el=3D"noreferrer" target=3D"_blank">golang.org/x/net</a> v0.9.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://go.googlesource.com/net" r=
el=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/net</a> 694=
cff8668bac64e0864b552bffc280cd27f21b1<br>
&gt;&gt; -SRCREV_net=3D&quot;694cff8668bac64e0864b552bffc280cd27f21b1&quot;=
<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/net" r=
el=3D"noreferrer" target=3D"_blank">golang.org/x/net</a> v0.17.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://go.googlesource.com/net" r=
el=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/net</a> b22=
5e7ca6dde1ef5a5ae5ce922861bda011cfabd<br>
&gt;&gt; +SRCREV_net=3D&quot;b225e7ca6dde1ef5a5ae5ce922861bda011cfabd&quot;=
<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.c=
om/net;name=3Dnet;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/net" rel=3D"noreferrer" tar=
get=3D"_blank">go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/net=
</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/sys" r=
el=3D"noreferrer" target=3D"_blank">golang.org/x/sys</a> v0.7.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://go.googlesource.com/sys" r=
el=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/sys</a> 648=
40c112d2335ed9874114aed48f946e778a769<br>
&gt;&gt; -SRCREV_sys=3D&quot;64840c112d2335ed9874114aed48f946e778a769&quot;=
<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sy=
s;name=3Dsys;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/golang.org/x/sys" rel=3D"noreferrer" target=
=3D"_blank">go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys</a=
>&quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/yaml.v2" r=
el=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v2</a> v2.4.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/go-yaml/yaml" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/go-yaml/yaml</a> 764=
9d4548cb53a614db133b2a8ac1f31859dda8c<br>
&gt;&gt; +SRCREV_yaml.v2=3D&quot;7649d4548cb53a614db133b2a8ac1f31859dda8c&q=
uot;<br>
&gt;&gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/go-yaml/yam=
l;name=3Dyaml.v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/gopkg.in/yaml.v2" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml=
.v2</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/yaml.=
v3" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v3</a> v3.0.1<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/go-yaml/ya=
ml" rel=3D"noreferrer" target=3D"_blank">https://github.com/go-yaml/yaml</a=
> f6f7691b1fdeb513f56608cd2c32c51f8194bf51<br>
&gt;&gt;=C2=A0 SRCREV_yaml.v3=3D&quot;f6f7691b1fdeb513f56608cd2c32c51f8194b=
f51&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/go-yam=
l/yaml;name=3Dyaml.v3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDI=
R%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in/yaml.v3" rel=3D"noreferrer"=
 target=3D"_blank">github.com/go-yaml/yaml;name=3Dyaml.v3;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in=
/yaml.v3</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/client-go" r=
el=3D"noreferrer" target=3D"_blank">k8s.io/client-go</a> v0.26.2<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/kubernetes/clie=
nt-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/kubernetes/c=
lient-go</a> 620cb60675340a9ca825fd5082b0d500f9b62e90<br>
&gt;&gt; -SRCREV_client-go=3D&quot;620cb60675340a9ca825fd5082b0d500f9b62e90=
&quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/client-go" r=
el=3D"noreferrer" target=3D"_blank">k8s.io/client-go</a> v0.26.7<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/kubernetes/clie=
nt-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/kubernetes/c=
lient-go</a> 30088cdd7e8d70b3000586d4e9e42e50684359ca<br>
&gt;&gt; +SRCREV_client-go=3D&quot;30088cdd7e8d70b3000586d4e9e42e50684359ca=
&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kubern=
etes/client-go;name=3Dclient-go;protocol=3Dhttps;nobranch=3D1;destsuffix=3D=
$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/k8s.io/client-go" rel=3D"n=
oreferrer" target=3D"_blank">github.com/kubernetes/client-go;name=3Dclient-=
go;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/k8s.io/client-go</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://sigs.k8s.io/js=
on" rel=3D"noreferrer" target=3D"_blank">sigs.k8s.io/json</a> v0.0.0-202207=
13155537-f223a00ba0e2<br>
&gt;&gt; @@ -73,19 +68,19 @@ SRC_URI +=3D &quot;git://<a href=3D"http://git=
hub.com/kubernetes-sigs/json;name=3Djson;protocol=3Dhttps;nobra" rel=3D"nor=
eferrer" target=3D"_blank">github.com/kubernetes-sigs/json;name=3Djson;prot=
ocol=3Dhttps;nobra</a><br>
&gt;&gt;=C2=A0 SRCREV_yaml=3D&quot;9535b3b1e2893fe44efb37c5c9f5665e245d786a=
&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kubern=
etes-sigs/yaml;name=3Dyaml;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BW=
ORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/sigs.k8s.io/yaml" rel=3D"norefe=
rrer" target=3D"_blank">github.com/kubernetes-sigs/yaml;name=3Dyaml;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/sigs.k8s.io/yaml</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/sync" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x/sync</a> v0.3.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://go.googlesource.com/sync" =
rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/sync</a> 9=
3782cc822b6b554cb7df40332fd010f0473cbc8<br>
&gt;&gt; -SRCREV_sync=3D&quot;93782cc822b6b554cb7df40332fd010f0473cbc8&quot=
;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/sync" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x/sync</a> v0.5.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://go.googlesource.com/sync" =
rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/sync</a> 1=
0739b037d369c748d671b216356d7e04ce68da1<br>
&gt;&gt; +SRCREV_sync=3D&quot;10739b037d369c748d671b216356d7e04ce68da1&quot=
;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.c=
om/sync;name=3Dsync;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%=
7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/sync" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/=
x/sync</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/term" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x/term</a> v0.7.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://go.googlesource.com/term" =
rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/term</a> 7=
ae6be6d0150527c2c41e70586b9ade6a972a186<br>
&gt;&gt; -SRCREV_x-term=3D&quot;7ae6be6d0150527c2c41e70586b9ade6a972a186&qu=
ot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/term" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x/term</a> v0.13.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://go.googlesource.com/term" =
rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/term</a> e=
a6303ae752eaacd897fec4b7534b74c56e1d787<br>
&gt;&gt; +SRCREV_x-term=3D&quot;ea6303ae752eaacd897fec4b7534b74c56e1d787&qu=
ot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.c=
om/term;name=3Dx-term;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDI=
R%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/term" rel=3D"noreferrer=
" target=3D"_blank">go.googlesource.com/term;name=3Dx-term;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.=
org/x/term</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/text" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> v0.9.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://go.googlesource.com/text" =
rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/text</a> 4=
8e4a4a957429d31328a685863b594ca9a06b552<br>
&gt;&gt; -SRCREV_text=3D&quot;48e4a4a957429d31328a685863b594ca9a06b552&quot=
;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/text" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> v0.13.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://go.googlesource.com/text" =
rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/text</a> f=
488e191e67ed95a5b9b7b39024e5a5f5f1ffd02<br>
&gt;&gt; +SRCREV_text=3D&quot;f488e191e67ed95a5b9b7b39024e5a5f5f1ffd02&quot=
;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.c=
om/text;name=3Dtext;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%=
7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/text" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/=
x/text</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/t=
ime" rel=3D"noreferrer" target=3D"_blank">golang.org/x/time</a> v0.3.0<br>
&gt;&gt; @@ -93,9 +88,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://go.go=
oglesource.com/text;name=3Dtext;protocol=3Dhttps;nobranch=3D1;d" rel=3D"nor=
eferrer" target=3D"_blank">go.googlesource.com/text;name=3Dtext;protocol=3D=
https;nobranch=3D1;d</a><br>
&gt;&gt;=C2=A0 SRCREV_time=3D&quot;2c09566ef13fb5556401ddff3c53c3dbc2a42dac=
&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.c=
om/time;name=3Dtime;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%=
7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/time" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/time;name=3Dtime;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/=
x/time</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.uber.org/goleak"=
 rel=3D"noreferrer" target=3D"_blank">go.uber.org/goleak</a> v1.2.1<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/uber-go/goleak"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/uber-go/goleak</a>=
 83c7e126390f1508ca9cb8e87d70849b55181104<br>
&gt;&gt; -SRCREV_goleak=3D&quot;83c7e126390f1508ca9cb8e87d70849b55181104&qu=
ot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.uber.org/goleak"=
 rel=3D"noreferrer" target=3D"_blank">go.uber.org/goleak</a> v1.3.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/uber-go/goleak"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/uber-go/goleak</a>=
 31095c657c34bba405a8d480db27989aa5f60b9c<br>
&gt;&gt; +SRCREV_goleak=3D&quot;31095c657c34bba405a8d480db27989aa5f60b9c&qu=
ot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/uber-g=
o/goleak;name=3Dgoleak;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKD=
IR%7D/$%7BBP%7D/src/import/vendor.fetch/go.uber.org/goleak" rel=3D"noreferr=
er" target=3D"_blank">github.com/uber-go/goleak;name=3Dgoleak;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.u=
ber.org/goleak</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/t=
ools" rel=3D"noreferrer" target=3D"_blank">golang.org/x/tools</a> v0.7.0<br=
>
&gt;&gt; @@ -103,24 +98,19 @@ SRC_URI +=3D &quot;git://<a href=3D"http://gi=
thub.com/uber-go/goleak;name=3Dgoleak;protocol=3Dhttps;nobranch=3D" rel=3D"=
noreferrer" target=3D"_blank">github.com/uber-go/goleak;name=3Dgoleak;proto=
col=3Dhttps;nobranch=3D</a><br>
&gt;&gt;=C2=A0 SRCREV_tools=3D&quot;031fc75960d487b0b15db12fb328676236a3a39=
c&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.c=
om/tools;name=3Dtools;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDI=
R%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/tools" rel=3D"noreferre=
r" target=3D"_blank">go.googlesource.com/tools;name=3Dtools;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang=
.org/x/tools</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/adrg/xdg=
" rel=3D"noreferrer" target=3D"_blank">github.com/adrg/xdg</a> v0.4.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/adrg/xdg" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/adrg/xdg</a> 4ec40e24f=
0cf1039f93c773f2984decdea9719b5<br>
&gt;&gt; -SRCREV_xdg=3D&quot;4ec40e24f0cf1039f93c773f2984decdea9719b5&quot;=
<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/adrg/xdg;na=
me=3Dxdg;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7=
D/src/import/vendor.fetch/github.com/adrg/xdg" rel=3D"noreferrer" target=3D=
"_blank">github.com/adrg/xdg;name=3Dxdg;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/adrg/xdg</a>&qu=
ot;<br>
&gt;&gt; -<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/crypto=
" rel=3D"noreferrer" target=3D"_blank">golang.org/x/crypto</a> v0.7.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://go.googlesource.com/crypto=
" rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/crypto</=
a> 776e461a4e6d8b372a43c72122c5c28cfc40dca2<br>
&gt;&gt; -SRCREV_crypto=3D&quot;776e461a4e6d8b372a43c72122c5c28cfc40dca2&qu=
ot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/crypto=
" rel=3D"noreferrer" target=3D"_blank">golang.org/x/crypto</a> v0.14.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://go.googlesource.com/crypto=
" rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/crypto</=
a> e3cc52e598e302f8c613a645bb7231264d8ec995<br>
&gt;&gt; +SRCREV_crypto=3D&quot;e3cc52e598e302f8c613a645bb7231264d8ec995&qu=
ot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.c=
om/crypto;name=3Dcrypto;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORK=
DIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/crypto" rel=3D"norefe=
rrer" target=3D"_blank">go.googlesource.com/crypto;name=3Dcrypto;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/golang.org/x/crypto</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/oauth2=
" rel=3D"noreferrer" target=3D"_blank">golang.org/x/oauth2</a> v0.7.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://go.googlesource.com/oauth2=
" rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/oauth2</=
a> 36075149c5b89480def496c735b8a1ba5fc63218<br>
&gt;&gt; -SRCREV_oauth2=3D&quot;36075149c5b89480def496c735b8a1ba5fc63218&qu=
ot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/oauth2=
" rel=3D"noreferrer" target=3D"_blank">golang.org/x/oauth2</a> v0.11.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://go.googlesource.com/oauth2=
" rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/oauth2</=
a> 2e4a4e2bfb69ca7609cb423438c55caa131431c1<br>
&gt;&gt; +SRCREV_oauth2=3D&quot;2e4a4e2bfb69ca7609cb423438c55caa131431c1&qu=
ot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.c=
om/oauth2;name=3Doauth2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORK=
DIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/oauth2" rel=3D"norefe=
rrer" target=3D"_blank">go.googlesource.com/oauth2;name=3Doauth2;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/golang.org/x/oauth2</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/apimachinery=
" rel=3D"noreferrer" target=3D"_blank">k8s.io/apimachinery</a> v0.26.2<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/kubernetes/apim=
achinery" rel=3D"noreferrer" target=3D"_blank">https://github.com/kubernete=
s/apimachinery</a> 53ecdf01b997ca93c7db7615dfe7b27ad8391983<br>
&gt;&gt; -SRCREV_apimachinery=3D&quot;53ecdf01b997ca93c7db7615dfe7b27ad8391=
983&quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/apimachinery=
" rel=3D"noreferrer" target=3D"_blank">k8s.io/apimachinery</a> v0.26.7<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/kubernetes/apim=
achinery" rel=3D"noreferrer" target=3D"_blank">https://github.com/kubernete=
s/apimachinery</a> dd46389197a396927dadb194ae5fc9dbebeb5a31<br>
&gt;&gt; +SRCREV_apimachinery=3D&quot;dd46389197a396927dadb194ae5fc9dbebeb5=
a31&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kubern=
etes/apimachinery;name=3Dapimachinery;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/k8s.io/apimachinery"=
 rel=3D"noreferrer" target=3D"_blank">github.com/kubernetes/apimachinery;na=
me=3Dapimachinery;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${B=
P}/src/import/vendor.fetch/k8s.io/apimachinery</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.io/kube-op=
enapi" rel=3D"noreferrer" target=3D"_blank">k8s.io/kube-openapi</a> v0.0.0-=
20221012153701-172d655c2280<br>
&gt;&gt; @@ -138,44 +128,29 @@ SRC_URI +=3D &quot;git://<a href=3D"http://g=
ithub.com/moby/term;name=3Dterm;protocol=3Dhttps;nobranch=3D1;dests" rel=3D=
"noreferrer" target=3D"_blank">github.com/moby/term;name=3Dterm;protocol=3D=
https;nobranch=3D1;dests</a><br>
&gt;&gt;=C2=A0 SRCREV_go=3D&quot;d30aec9fd63c35133f8f79c3412ad91a3b08be06&q=
uot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/docker=
/go;name=3Dgo;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7=
BBP%7D/src/import/vendor.fetch/github.com/docker/go" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/docker/go;name=3Dgo;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go=
</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/kr/prett=
y" rel=3D"noreferrer" target=3D"_blank">github.com/kr/pretty</a> v0.3.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/kr/pretty" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/kr/pretty</a> a883a842=
2cd235c67c6c4fdcb7bbb022143e10b1<br>
&gt;&gt; -SRCREV_pretty=3D&quot;a883a8422cd235c67c6c4fdcb7bbb022143e10b1&qu=
ot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kr/pretty;n=
ame=3Dpretty;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/kr/pretty" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/kr/pretty;name=3Dpretty;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kr/pr=
etty</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/c=
li" rel=3D"noreferrer" target=3D"_blank">github.com/docker/cli</a> v24.0.5+=
incompatible<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/docker/cli" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/docker/cli</a> ced0996=
60009713e0e845eeb754e6050dbaa45d0<br>
&gt;&gt; -SRCREV_cli=3D&quot;ced099660009713e0e845eeb754e6050dbaa45d0&quot;=
<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/c=
li" rel=3D"noreferrer" target=3D"_blank">github.com/docker/cli</a> v24.0.7+=
incompatible<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/docker/cli" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/docker/cli</a> afdd53b=
4e341be38d2056a42113b938559bb1d94<br>
&gt;&gt; +SRCREV_cli=3D&quot;afdd53b4e341be38d2056a42113b938559bb1d94&quot;=
<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/docker=
/cli;name=3Dcli;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$=
%7BBP%7D/src/import/vendor.fetch/github.com/docker/cli" rel=3D"noreferrer" =
target=3D"_blank">github.com/docker/cli;name=3Dcli;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/dock=
er/cli</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/pkg/erro=
rs" rel=3D"noreferrer" target=3D"_blank">github.com/pkg/errors</a> v0.9.1<b=
r>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/pkg/errors" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/pkg/errors</a> 614d223=
910a179a466c1767a985424175c39b465<br>
&gt;&gt; -SRCREV_errors=3D&quot;614d223910a179a466c1767a985424175c39b465&qu=
ot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/pkg/errors;=
name=3Derrors;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7=
BBP%7D/src/import/vendor.fetch/github.com/pkg/errors" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg=
/errors</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/gofrs/uu=
id" rel=3D"noreferrer" target=3D"_blank">github.com/gofrs/uuid</a> v4.2.0+i=
ncompatible<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/gofrs/uuid" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/gofrs/uuid</a> 0c84a43=
ce25087b7041833685982950a65630d28<br>
&gt;&gt; -SRCREV_uuid=3D&quot;0c84a43ce25087b7041833685982950a65630d28&quot=
;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/gofrs/uuid;=
name=3Duuid;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BB=
P%7D/src/import/vendor.fetch/github.com/gofrs/uuid" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/gofrs/uuid;name=3Duuid;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gofrs=
/uuid</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mgu=
tz/ansi" rel=3D"noreferrer" target=3D"_blank">github.com/mgutz/ansi</a> v0.=
0.0-20170206155736-9520e82c474b<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/mgutz/ansi=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/mgutz/ansi</a> 95=
20e82c474b0a04dd04f8a40959027271bab992<br>
&gt;&gt;=C2=A0 SRCREV_ansi=3D&quot;9520e82c474b0a04dd04f8a40959027271bab992=
&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/mgutz/=
ansi;name=3Dansi;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/github.com/mgutz/ansi" rel=3D"noreferrer"=
 target=3D"_blank">github.com/mgutz/ansi;name=3Dansi;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mg=
utz/ansi</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf13/ca=
st" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/cast</a> v1.5.0<b=
r>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/spf13/cast" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/spf13/cast</a> 2b0eb0f=
724e320b655240e331aef36d1175986c2<br>
&gt;&gt; -SRCREV_cast=3D&quot;2b0eb0f724e320b655240e331aef36d1175986c2&quot=
;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/spf13/cast;=
name=3Dcast;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BB=
P%7D/src/import/vendor.fetch/github.com/spf13/cast" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/spf13/cast;name=3Dcast;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13=
/cast</a>&quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/pkg/erro=
rs" rel=3D"noreferrer" target=3D"_blank">github.com/pkg/errors</a> v0.9.1<b=
r>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/pkg/errors" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/pkg/errors</a> 614d223=
910a179a466c1767a985424175c39b465<br>
&gt;&gt; +SRCREV_errors=3D&quot;614d223910a179a466c1767a985424175c39b465&qu=
ot;<br>
&gt;&gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/pkg/errors;=
name=3Derrors;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7=
BBP%7D/src/import/vendor.fetch/github.com/pkg/errors" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg=
/errors</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/gol=
ang/mock" rel=3D"noreferrer" target=3D"_blank">github.com/golang/mock</a> v=
1.6.0<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/golang/moc=
k" rel=3D"noreferrer" target=3D"_blank">https://github.com/golang/mock</a> =
aba2ff9a6844d5e3289e8472d3217d5b3090f083<br>
&gt;&gt;=C2=A0 SRCREV_mock=3D&quot;aba2ff9a6844d5e3289e8472d3217d5b3090f083=
&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/golang=
/mock;name=3Dmock;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/github.com/golang/mock" rel=3D"noreferre=
r" target=3D"_blank">github.com/golang/mock;name=3Dmock;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/golang/mock</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf13/co=
bra" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/cobra</a> v1.7.0=
<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/spf13/cobra" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/spf13/cobra</a> 4dd4b=
25de38418174a6e859e8a32eaccca32dccc<br>
&gt;&gt; -SRCREV_cobra=3D&quot;4dd4b25de38418174a6e859e8a32eaccca32dccc&quo=
t;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf13/co=
bra" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/cobra</a> v1.8.0=
<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/spf13/cobra" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/spf13/cobra</a> a0a6a=
e020bb3899ff0276067863e50523f897370<br>
&gt;&gt; +SRCREV_cobra=3D&quot;a0a6ae020bb3899ff0276067863e50523f897370&quo=
t;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/spf13/=
cobra;name=3Dcobra;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/github.com/spf13/cobra" rel=3D"noreferr=
er" target=3D"_blank">github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/spf13/cobra</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf=
13/pflag" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/pflag</a> v=
1.0.5<br>
&gt;&gt; @@ -183,9 +158,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://git=
hub.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps;nobranch=3D1;de" rel=3D"n=
oreferrer" target=3D"_blank">github.com/spf13/cobra;name=3Dcobra;protocol=
=3Dhttps;nobranch=3D1;de</a><br>
&gt;&gt;=C2=A0 SRCREV_pflag=3D&quot;2e9d26c8c37aae03e3f9d4e90b7116f5accb7ca=
b&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/spf13/=
pflag;name=3Dpflag;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/github.com/spf13/pflag" rel=3D"noreferr=
er" target=3D"_blank">github.com/spf13/pflag;name=3Dpflag;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/spf13/pflag</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/g=
rpc" rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> v1.57.=
0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/grpc/grpc-go" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/grpc/grpc-go</a> 87b=
f02ad24f6cc071d2553eb5d62332194bba1fe<br>
&gt;&gt; -SRCREV_grpc=3D&quot;87bf02ad24f6cc071d2553eb5d62332194bba1fe&quot=
;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/g=
rpc" rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> v1.59.=
0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/grpc/grpc-go" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/grpc/grpc-go</a> 776=
5221f4bf6104973db7946d56936cf838cad46<br>
&gt;&gt; +SRCREV_grpc=3D&quot;7765221f4bf6104973db7946d56936cf838cad46&quot=
;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/grpc/g=
rpc-go;name=3Dgrpc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/google.golang.org/grpc" rel=3D"noreferr=
er" target=3D"_blank">github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.g=
olang.org/grpc</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/gof=
rs/flock" rel=3D"noreferrer" target=3D"_blank">github.com/gofrs/flock</a> v=
0.8.1<br>
&gt;&gt; @@ -198,11 +173,6 @@ SRC_URI +=3D &quot;git://<a href=3D"http://gi=
thub.com/gofrs/flock;name=3Dflock;protocol=3Dhttps;nobranch=3D1;de" rel=3D"=
noreferrer" target=3D"_blank">github.com/gofrs/flock;name=3Dflock;protocol=
=3Dhttps;nobranch=3D1;de</a><br>
&gt;&gt;=C2=A0 SRCREV_mux=3D&quot;98cb6bf42e086f6af920b965c38cacc07402d51b&=
quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/gorill=
a/mux;name=3Dmux;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/github.com/gorilla/mux" rel=3D"noreferrer=
" target=3D"_blank">github.com/gorilla/mux;name=3Dmux;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/g=
orilla/mux</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/jinzhu/g=
orm" rel=3D"noreferrer" target=3D"_blank">github.com/jinzhu/gorm</a> v1.9.1=
1<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/jinzhu/gorm" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/jinzhu/gorm</a> 81c17=
a7e2529c59efc4e74c5b32c1fb71fb12fa2<br>
&gt;&gt; -SRCREV_gorm=3D&quot;81c17a7e2529c59efc4e74c5b32c1fb71fb12fa2&quot=
;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/jinzhu/gorm=
;name=3Dgorm;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/jinzhu/gorm" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/jinzhu/gorm;name=3Dgorm;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jinz=
hu/gorm</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mob=
y/locker" rel=3D"noreferrer" target=3D"_blank">github.com/moby/locker</a> v=
1.0.1<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/moby/locke=
r" rel=3D"noreferrer" target=3D"_blank">https://github.com/moby/locker</a> =
281af2d563954745bea9d1487c965f24d30742fe<br>
&gt;&gt;=C2=A0 SRCREV_locker=3D&quot;281af2d563954745bea9d1487c965f24d30742=
fe&quot;<br>
&gt;&gt; @@ -213,11 +183,6 @@ SRC_URI +=3D &quot;git://<a href=3D"http://gi=
thub.com/moby/locker;name=3Dlocker;protocol=3Dhttps;nobranch=3D1;d" rel=3D"=
noreferrer" target=3D"_blank">github.com/moby/locker;name=3Dlocker;protocol=
=3Dhttps;nobranch=3D1;d</a><br>
&gt;&gt;=C2=A0 SRCREV_uniseg=3D&quot;75711fccf6a3e85bc74c241e2dddd06a9bc9e5=
3d&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/rivo/u=
niseg;name=3Duniseg;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%=
7D/$%7BBP%7D/src/import/vendor.fetch/github.com/rivo/uniseg" rel=3D"norefer=
rer" target=3D"_blank">github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/rivo/uniseg</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf13/af=
ero" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/afero</a> v1.9.2=
<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/spf13/afero" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/spf13/afero</a> 2a70f=
2bb2db1524bf2aa3ca0cfebefa8d6367b7b<br>
&gt;&gt; -SRCREV_afero=3D&quot;2a70f2bb2db1524bf2aa3ca0cfebefa8d6367b7b&quo=
t;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/spf13/afero=
;name=3Dafero;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7=
BBP%7D/src/import/vendor.fetch/github.com/spf13/afero" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/spf13/afero;name=3Dafero;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/sp=
f13/afero</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/bug=
er/goterm" rel=3D"noreferrer" target=3D"_blank">github.com/buger/goterm</a>=
 v1.0.4<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/buger/gote=
rm" rel=3D"noreferrer" target=3D"_blank">https://github.com/buger/goterm</a=
> a73545aae7d693f786ce4cc687460efca4845f31<br>
&gt;&gt;=C2=A0 SRCREV_goterm=3D&quot;a73545aae7d693f786ce4cc687460efca4845f=
31&quot;<br>
&gt;&gt; @@ -228,6 +193,11 @@ SRC_URI +=3D &quot;git://<a href=3D"http://gi=
thub.com/buger/goterm;name=3Dgoterm;protocol=3Dhttps;nobranch=3D1" rel=3D"n=
oreferrer" target=3D"_blank">github.com/buger/goterm;name=3Dgoterm;protocol=
=3Dhttps;nobranch=3D1</a>;<br>
&gt;&gt;=C2=A0 SRCREV_aec=3D&quot;39771216ff4c63d11f5e604076f9c45e8be1067b&=
quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/moriku=
ni/aec;name=3Daec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/github.com/morikuni/aec" rel=3D"noreferr=
er" target=3D"_blank">github.com/morikuni/aec;name=3Daec;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/morikuni/aec</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/otiai10/=
copy" rel=3D"noreferrer" target=3D"_blank">github.com/otiai10/copy</a> v1.1=
4.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/otiai10/copy" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/otiai10/copy</a> fba=
066acb0eb6e25d510073787741c0a8b31bf1e<br>
&gt;&gt; +SRCREV_copy=3D&quot;fba066acb0eb6e25d510073787741c0a8b31bf1e&quot=
;<br>
&gt;&gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/otiai10/cop=
y;name=3Dcopy;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7=
BBP%7D/src/import/vendor.fetch/github.com/otiai10/copy" rel=3D"noreferrer" =
target=3D"_blank">github.com/otiai10/copy;name=3Dcopy;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/o=
tiai10/copy</a>&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/beo=
rn7/perks" rel=3D"noreferrer" target=3D"_blank">github.com/beorn7/perks</a>=
 v1.0.1<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/beorn7/per=
ks" rel=3D"noreferrer" target=3D"_blank">https://github.com/beorn7/perks</a=
> 37c8de3658fcb183f997c4e13e8337516ab753e6<br>
&gt;&gt;=C2=A0 SRCREV_perks=3D&quot;37c8de3658fcb183f997c4e13e8337516ab753e=
6&quot;<br>
&gt;&gt; @@ -253,24 +223,24 @@ SRC_URI +=3D &quot;git://<a href=3D"http://g=
ithub.com/google/shlex;name=3Dshlex;protocol=3Dhttps;nobranch=3D1;d" rel=3D=
"noreferrer" target=3D"_blank">github.com/google/shlex;name=3Dshlex;protoco=
l=3Dhttps;nobranch=3D1;d</a><br>
&gt;&gt;=C2=A0 SRCREV_pkcs11=3D&quot;f3481918a208bd212aa995a41f92d786eb418a=
7d&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/miekg/=
pkcs11;name=3Dpkcs11;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR=
%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/miekg/pkcs11" rel=3D"noref=
errer" target=3D"_blank">github.com/miekg/pkcs11;name=3Dpkcs11;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/miekg/pkcs11</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/zmap/zcr=
ypto" rel=3D"noreferrer" target=3D"_blank">github.com/zmap/zcrypto</a> v0.0=
.0-20220605182715-4dfcec6e9a8c<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/zmap/zcrypto" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/zmap/zcrypto</a> 4df=
cec6e9a8c2014f73dd584e64dc797129d77b8<br>
&gt;&gt; -SRCREV_zcrypto=3D&quot;4dfcec6e9a8c2014f73dd584e64dc797129d77b8&q=
uot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/zmap/zcrypt=
o;name=3Dzcrypto;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/github.com/zmap/zcrypto" rel=3D"noreferre=
r" target=3D"_blank">github.com/zmap/zcrypto;name=3Dzcrypto;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/zmap/zcrypto</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/b=
uildx" rel=3D"noreferrer" target=3D"_blank">github.com/docker/buildx</a> v0=
.11.2<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/docker/buildx" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/docker/buildx</a> 9=
872040b6626fb7d87ef7296fd5b832e8cc2ad17<br>
&gt;&gt; -SRCREV_buildx=3D&quot;9872040b6626fb7d87ef7296fd5b832e8cc2ad17&qu=
ot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/b=
uildx" rel=3D"noreferrer" target=3D"_blank">github.com/docker/buildx</a> v0=
.12.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/docker/buildx" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/docker/buildx</a> 5=
42e5d810e4a1a155684f5f3c5bd7e797632a12f<br>
&gt;&gt; +SRCREV_buildx=3D&quot;542e5d810e4a1a155684f5f3c5bd7e797632a12f&qu=
ot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/docker=
/buildx;name=3Dbuildx;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDI=
R%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/docker/buildx" rel=3D"nor=
eferrer" target=3D"_blank">github.com/docker/buildx;name=3Dbuildx;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/docker/buildx</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/d=
ocker" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v2=
4.0.5+incompatible<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/moby/moby" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/moby/moby</a> a61e2b4c=
9c5f7c241aeb37f389b4444aee26bea4<br>
&gt;&gt; -SRCREV_docker=3D&quot;a61e2b4c9c5f7c241aeb37f389b4444aee26bea4&qu=
ot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/docker/d=
ocker" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> v2=
4.0.7+incompatible<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/moby/moby" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/moby/moby</a> 311b9ff0=
aa93aa55880e1e5f8871c4fb69583426<br>
&gt;&gt; +SRCREV_docker=3D&quot;311b9ff0aa93aa55880e1e5f8871c4fb69583426&qu=
ot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/moby/m=
oby;name=3Ddocker;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/github.com/docker/docker" rel=3D"norefer=
rer" target=3D"_blank">github.com/moby/moby;name=3Ddocker;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/docker/docker</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/moby/bui=
ldkit" rel=3D"noreferrer" target=3D"_blank">github.com/moby/buildkit</a> v0=
.12.1<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/moby/buildkit" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/moby/buildkit</a> b=
b857a0d49f45aa0ce9cd554b78d4075553e20f9<br>
&gt;&gt; -SRCREV_buildkit=3D&quot;bb857a0d49f45aa0ce9cd554b78d4075553e20f9&=
quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/google/g=
o-cmp" rel=3D"noreferrer" target=3D"_blank">github.com/google/go-cmp</a> v0=
.6.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/google/go-cmp" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/google/go-cmp</a> c=
3ad8435e7bef96af35732bc0789e5a2278c6d5f<br>
&gt;&gt; +SRCREV_go-cmp=3D&quot;c3ad8435e7bef96af35732bc0789e5a2278c6d5f&qu=
ot;<br>
&gt;&gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google/go-c=
mp;name=3Dgo-cmp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/github.com/google/go-cmp" rel=3D"noreferr=
er" target=3D"_blank">github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/google/go-cmp</a>&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/moby/bui=
ldkit" rel=3D"noreferrer" target=3D"_blank">github.com/moby/buildkit</a> v0=
.13.0-beta1.0.20231023114302-d5c1d785b042<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/moby/buildkit" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/moby/buildkit</a> d=
5c1d785b042cf834a05b08b73479d55b6acb533<br>
&gt;&gt; +SRCREV_buildkit=3D&quot;d5c1d785b042cf834a05b08b73479d55b6acb533&=
quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/moby/b=
uildkit;name=3Dbuildkit;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORK=
DIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/moby/buildkit" rel=3D"n=
oreferrer" target=3D"_blank">github.com/moby/buildkit;name=3Dbuildkit;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/moby/buildkit</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.opentelemet=
ry.io/otel" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel</=
a> v1.14.0<br>
&gt;&gt; @@ -288,35 +258,30 @@ SRC_URI +=3D &quot;git://<a href=3D"http://g=
ithub.com/aws/smithy-go;name=3Dsmithy-go;protocol=3Dhttps;nobranc" rel=3D"n=
oreferrer" target=3D"_blank">github.com/aws/smithy-go;name=3Dsmithy-go;prot=
ocol=3Dhttps;nobranc</a><br>
&gt;&gt;=C2=A0 SRCREV_protobuf=3D&quot;b03c65ea87cdc3521ede29f62fe3ce239267=
c1bc&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/gogo/p=
rotobuf;name=3Dprotobuf;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORK=
DIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/gogo/protobuf" rel=3D"n=
oreferrer" target=3D"_blank">github.com/gogo/protobuf;name=3Dprotobuf;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/gogo/protobuf</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/google/g=
o-cmp" rel=3D"noreferrer" target=3D"_blank">github.com/google/go-cmp</a> v0=
.5.9<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/google/go-cmp" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/google/go-cmp</a> a=
97318bf6562f2ed2632c5f985db51b1bc5bdcd0<br>
&gt;&gt; -SRCREV_go-cmp=3D&quot;a97318bf6562f2ed2632c5f985db51b1bc5bdcd0&qu=
ot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google/go-c=
mp;name=3Dgo-cmp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/github.com/google/go-cmp" rel=3D"noreferr=
er" target=3D"_blank">github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/google/go-cmp</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/goo=
gle/gofuzz" rel=3D"noreferrer" target=3D"_blank">github.com/google/gofuzz</=
a> v1.2.0<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/google/gof=
uzz" rel=3D"noreferrer" target=3D"_blank">https://github.com/google/gofuzz<=
/a> 379e164120fbc98885a8f494b5aa41ba94f64c56<br>
&gt;&gt;=C2=A0 SRCREV_gofuzz=3D&quot;379e164120fbc98885a8f494b5aa41ba94f64c=
56&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google=
/gofuzz;name=3Dgofuzz;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDI=
R%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/google/gofuzz" rel=3D"nor=
eferrer" target=3D"_blank">github.com/google/gofuzz;name=3Dgofuzz;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/google/gofuzz</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hashicor=
p/hcl" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/hcl</a> v1=
.0.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/hashicorp/hcl" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/hashicorp/hcl</a> 8=
cb6e5b959231cc1119e43259c4a608f9c51a241<br>
&gt;&gt; -SRCREV_hcl=3D&quot;8cb6e5b959231cc1119e43259c4a608f9c51a241&quot;=
<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/h=
cl;name=3Dhcl;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7=
BBP%7D/src/import/vendor.fetch/github.com/hashicorp/hcl" rel=3D"noreferrer"=
 target=3D"_blank">github.com/hashicorp/hcl;name=3Dhcl;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
hashicorp/hcl</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/imd=
ario/mergo" rel=3D"noreferrer" target=3D"_blank">github.com/imdario/mergo</=
a> v0.3.16<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/darccio/me=
rgo" rel=3D"noreferrer" target=3D"_blank">https://github.com/darccio/mergo<=
/a> 14fe2b165b83359196f820886a2b24f2771729e9<br>
&gt;&gt;=C2=A0 SRCREV_mergo=3D&quot;14fe2b165b83359196f820886a2b24f2771729e=
9&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/darcci=
o/mergo;name=3Dmergo;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR=
%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/imdario/mergo" rel=3D"nore=
ferrer" target=3D"_blank">github.com/darccio/mergo;name=3Dmergo;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/imdario/mergo</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/containe=
rd/log" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/log</a> =
v0.1.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/containerd/log"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/containerd/log</a>=
 0fc1e28871fdf2786e2cc51bbe4133db6547a199<br>
&gt;&gt; +SRCREV_log=3D&quot;0fc1e28871fdf2786e2cc51bbe4133db6547a199&quot;=
<br>
&gt;&gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/containerd/=
log;name=3Dlog;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/github.com/containerd/log" rel=3D"noreferre=
r" target=3D"_blank">github.com/containerd/log;name=3Dlog;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/containerd/log</a>&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/goo=
gle/gnostic" rel=3D"noreferrer" target=3D"_blank">github.com/google/gnostic=
</a> v0.5.7-v3refs<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/google/gno=
stic" rel=3D"noreferrer" target=3D"_blank">https://github.com/google/gnosti=
c</a> b49832d97d25b6a41cbe34ea12257924a934eeee<br>
&gt;&gt;=C2=A0 SRCREV_gnostic=3D&quot;b49832d97d25b6a41cbe34ea12257924a934e=
eee&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google=
/gnostic;name=3Dgnostic;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORK=
DIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/google/gnostic" rel=3D"=
noreferrer" target=3D"_blank">github.com/google/gnostic;name=3Dgnostic;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/google/gnostic</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/laurazar=
d/godog" rel=3D"noreferrer" target=3D"_blank">github.com/laurazard/godog</a=
> v0.0.0-20220922095256-4c4b17abdae7<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/laurazard/godog=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/laurazard/godog</=
a> 4c4b17abdae7fd4f9d35cfe391ca65d172b092e3<br>
&gt;&gt; -SRCREV_godog=3D&quot;4c4b17abdae7fd4f9d35cfe391ca65d172b092e3&quo=
t;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/laurazard/g=
odog;name=3Dgodog;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/github.com/laurazard/godog" rel=3D"noref=
errer" target=3D"_blank">github.com/laurazard/godog;name=3Dgodog;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/laurazard/godog</a>&quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/davecgh/=
go-spew" rel=3D"noreferrer" target=3D"_blank">github.com/davecgh/go-spew</a=
> v1.1.1<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/davecgh/go-spew=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/davecgh/go-spew</=
a> 8991bc29aa16c548c550c7ff78260e27b9ab7c73<br>
&gt;&gt; +SRCREV_go-spew=3D&quot;8991bc29aa16c548c550c7ff78260e27b9ab7c73&q=
uot;<br>
&gt;&gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/davecgh/go-=
spew;name=3Dgo-spew;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%=
7D/$%7BBP%7D/src/import/vendor.fetch/github.com/davecgh/go-spew" rel=3D"nor=
eferrer" target=3D"_blank">github.com/davecgh/go-spew;name=3Dgo-spew;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/davecgh/go-spew</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/doc=
ker/go-units" rel=3D"noreferrer" target=3D"_blank">github.com/docker/go-uni=
ts</a> v0.5.0<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/docker/go-=
units" rel=3D"noreferrer" target=3D"_blank">https://github.com/docker/go-un=
its</a> e682442797b36348f8e1f98defdbf32bac0b6c6f<br>
&gt;&gt; @@ -328,11 +293,6 @@ SRC_URI +=3D &quot;git://<a href=3D"http://gi=
thub.com/docker/go-units;name=3Dgo-units;protocol=3Dhttps;nobran" rel=3D"no=
referrer" target=3D"_blank">github.com/docker/go-units;name=3Dgo-units;prot=
ocol=3Dhttps;nobran</a><br>
&gt;&gt;=C2=A0 SRCREV_logrus=3D&quot;d40e25cd45ed9c6b2b66e6b97573a0413e4c23=
bd&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/sirups=
en/logrus;name=3Dlogrus;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORK=
DIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/sirupsen/logrus" rel=3D=
"noreferrer" target=3D"_blank">github.com/sirupsen/logrus;name=3Dlogrus;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/sirupsen/logrus</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/davecgh/=
go-spew" rel=3D"noreferrer" target=3D"_blank">github.com/davecgh/go-spew</a=
> v1.1.1<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/davecgh/go-spew=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/davecgh/go-spew</=
a> 8991bc29aa16c548c550c7ff78260e27b9ab7c73<br>
&gt;&gt; -SRCREV_go-spew=3D&quot;8991bc29aa16c548c550c7ff78260e27b9ab7c73&q=
uot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/davecgh/go-=
spew;name=3Dgo-spew;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%=
7D/$%7BBP%7D/src/import/vendor.fetch/github.com/davecgh/go-spew" rel=3D"nor=
eferrer" target=3D"_blank">github.com/davecgh/go-spew;name=3Dgo-spew;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/davecgh/go-spew</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/go-=
openapi/swag" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/sw=
ag</a> v0.19.14<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/go-openapi=
/swag" rel=3D"noreferrer" target=3D"_blank">https://github.com/go-openapi/s=
wag</a> c78fa6719bc3d4b977d19a09064feda1c07571af<br>
&gt;&gt;=C2=A0 SRCREV_swag=3D&quot;c78fa6719bc3d4b977d19a09064feda1c07571af=
&quot;<br>
&gt;&gt; @@ -368,19 +328,14 @@ SRC_URI +=3D &quot;git://<a href=3D"http://g=
ithub.com/moby/spdystream;name=3Dspdystream;protocol=3Dhttps;nobr" rel=3D"n=
oreferrer" target=3D"_blank">github.com/moby/spdystream;name=3Dspdystream;p=
rotocol=3Dhttps;nobr</a><br>
&gt;&gt;=C2=A0 SRCREV_signal=3D&quot;b8d8fabf1fa5cf0de7c1a1729145eee854ea31=
f5&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/moby/s=
ys;name=3Dsignal;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/github.com/moby/sys/signal" rel=3D"norefe=
rrer" target=3D"_blank">github.com/moby/sys;name=3Dsignal;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/moby/sys/signal</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/subosito=
/gotenv" rel=3D"noreferrer" target=3D"_blank">github.com/subosito/gotenv</a=
> v1.4.1<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/subosito/gotenv=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/subosito/gotenv</=
a> d94fdbe829d24b31d6ac30b6beb28b6420c1778a<br>
&gt;&gt; -SRCREV_gotenv=3D&quot;d94fdbe829d24b31d6ac30b6beb28b6420c1778a&qu=
ot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/subosito/go=
tenv;name=3Dgotenv;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/github.com/subosito/gotenv" rel=3D"nore=
ferrer" target=3D"_blank">github.com/subosito/gotenv;name=3Dgotenv;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/subosito/gotenv</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/g=
enproto" rel=3D"noreferrer" target=3D"_blank">google.golang.org/genproto</a=
> v0.0.0-20230526161137-0005af68ea54<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/googleapis/go-g=
enproto" rel=3D"noreferrer" target=3D"_blank">https://github.com/googleapis=
/go-genproto</a> 0005af68ea5476a8b99ce94ab83ae4aaac864963<br>
&gt;&gt; -SRCREV_genproto=3D&quot;0005af68ea5476a8b99ce94ab83ae4aaac864963&=
quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/g=
enproto" rel=3D"noreferrer" target=3D"_blank">google.golang.org/genproto</a=
> v0.0.0-20230822172742-b8732ec3820d<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/googleapis/go-g=
enproto" rel=3D"noreferrer" target=3D"_blank">https://github.com/googleapis=
/go-genproto</a> b8732ec3820db4bd1e4eda89392b7728e81bd825<br>
&gt;&gt; +SRCREV_genproto=3D&quot;b8732ec3820db4bd1e4eda89392b7728e81bd825&=
quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google=
apis/go-genproto;name=3Dgenproto;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/google.golang.org/genpr=
oto" rel=3D"noreferrer" target=3D"_blank">github.com/googleapis/go-genproto=
;name=3Dgenproto;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP=
}/src/import/vendor.fetch/google.golang.org/genproto</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/p=
rotobuf" rel=3D"noreferrer" target=3D"_blank">google.golang.org/protobuf</a=
> v1.30.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/protocolbuffers=
/protobuf-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/proto=
colbuffers/protobuf-go</a> f221882bfb484564f1714ae05f197dea2c76898d<br>
&gt;&gt; -SRCREV_google.golang.org-protobuf=3D&quot;f221882bfb484564f1714ae=
05f197dea2c76898d&quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/p=
rotobuf" rel=3D"noreferrer" target=3D"_blank">google.golang.org/protobuf</a=
> v1.31.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/protocolbuffers=
/protobuf-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/proto=
colbuffers/protobuf-go</a> 68463f0e96c93bc19ef36ccd3adfe690bfdb568c<br>
&gt;&gt; +SRCREV_google.golang.org-protobuf=3D&quot;68463f0e96c93bc19ef36cc=
d3adfe690bfdb568c&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/protoc=
olbuffers/protobuf-go;name=3Dgoogle.golang.org-protobuf;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/go=
ogle.golang.org/protobuf" rel=3D"noreferrer" target=3D"_blank">github.com/p=
rotocolbuffers/protobuf-go;name=3Dgoogle.golang.org-protobuf;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/googl=
e.golang.org/protobuf</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/str=
etchr/testify" rel=3D"noreferrer" target=3D"_blank">github.com/stretchr/tes=
tify</a> v1.8.4<br>
&gt;&gt; @@ -388,11 +343,6 @@ SRC_URI +=3D &quot;git://<a href=3D"http://gi=
thub.com/protocolbuffers/protobuf-go;name=3Dgoogle.golang.org-" rel=3D"nore=
ferrer" target=3D"_blank">github.com/protocolbuffers/protobuf-go;name=3Dgoo=
gle.golang.org-</a><br>
&gt;&gt;=C2=A0 SRCREV_testify=3D&quot;f97607b89807936ac4ff96748d766cf4b9711=
f78&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/stretc=
hr/testify;name=3Dtestify;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWO=
RKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/stretchr/testify" rel=
=3D"noreferrer" target=3D"_blank">github.com/stretchr/testify;name=3Dtestif=
y;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/stretchr/testify</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cloudfla=
re/cfssl" rel=3D"noreferrer" target=3D"_blank">github.com/cloudflare/cfssl<=
/a> v1.6.4<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/cloudflare/cfss=
l" rel=3D"noreferrer" target=3D"_blank">https://github.com/cloudflare/cfssl=
</a> b4d0d877cac528f63db39dfb62d5c96cd3a32a0b<br>
&gt;&gt; -SRCREV_cfssl=3D&quot;b4d0d877cac528f63db39dfb62d5c96cd3a32a0b&quo=
t;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/cloudflare/=
cfssl;name=3Dcfssl;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/github.com/cloudflare/cfssl" rel=3D"nor=
eferrer" target=3D"_blank">github.com/cloudflare/cfssl;name=3Dcfssl;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/cloudflare/cfssl</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/jos=
harian/intern" rel=3D"noreferrer" target=3D"_blank">github.com/josharian/in=
tern</a> v1.0.0<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/josharian/=
intern" rel=3D"noreferrer" target=3D"_blank">https://github.com/josharian/i=
ntern</a> 8e6ff32b3e7c0b018c43953085fe2ac330fe9acd<br>
&gt;&gt;=C2=A0 SRCREV_intern=3D&quot;8e6ff32b3e7c0b018c43953085fe2ac330fe9a=
cd&quot;<br>
&gt;&gt; @@ -448,6 +398,11 @@ SRC_URI +=3D &quot;git://<a href=3D"http://gi=
thub.com/open-telemetry/opentelemetry-go;name=3Dsdk;protocol=3Dh" rel=3D"no=
referrer" target=3D"_blank">github.com/open-telemetry/opentelemetry-go;name=
=3Dsdk;protocol=3Dh</a><br>
&gt;&gt;=C2=A0 SRCREV_go-ansiterm=3D&quot;d185dfc1b5a126116ea5a19e148e29d16=
b4574c9&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/Azure/=
go-ansiterm;name=3Dgo-ansiterm;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$=
%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/Azure/go-ansiter=
m" rel=3D"noreferrer" target=3D"_blank">github.com/Azure/go-ansiterm;name=
=3Dgo-ansiterm;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/=
src/import/vendor.fetch/github.com/Azure/go-ansiterm</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/Microsof=
t/hcsshim" rel=3D"noreferrer" target=3D"_blank">github.com/Microsoft/hcsshi=
m</a> v0.11.1<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/microsoft/hcssh=
im" rel=3D"noreferrer" target=3D"_blank">https://github.com/microsoft/hcssh=
im</a> 641f8b8a2314aba7ee58223e28d330fbcd66e3c2<br>
&gt;&gt; +SRCREV_hcsshim=3D&quot;641f8b8a2314aba7ee58223e28d330fbcd66e3c2&q=
uot;<br>
&gt;&gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/microsoft/h=
csshim;name=3Dhcsshim;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDI=
R%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/Microsoft/hcsshim" rel=3D=
"noreferrer" target=3D"_blank">github.com/microsoft/hcsshim;name=3Dhcsshim;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/Microsoft/hcsshim</a>&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/aws=
/aws-sdk-go-v2" rel=3D"noreferrer" target=3D"_blank">github.com/aws/aws-sdk=
-go-v2</a> v1.17.6<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/aws/aws-sd=
k-go-v2" rel=3D"noreferrer" target=3D"_blank">https://github.com/aws/aws-sd=
k-go-v2</a> 18bff5e44f4c2c140feaf54b2dd92140630c7e50<br>
&gt;&gt;=C2=A0 SRCREV_aws-sdk-go-v2=3D&quot;18bff5e44f4c2c140feaf54b2dd9214=
0630c7e50&quot;<br>
&gt;&gt; @@ -508,21 +463,11 @@ SRC_URI +=3D &quot;git://<a href=3D"http://g=
ithub.com/microsoft/go-winio;name=3Dgo-winio;protocol=3Dhttps;nob" rel=3D"n=
oreferrer" target=3D"_blank">github.com/microsoft/go-winio;name=3Dgo-winio;=
protocol=3Dhttps;nob</a><br>
&gt;&gt;=C2=A0 SRCREV_console=3D&quot;b5cb846c9186d67bcae3ce3c324e47cd317d9=
527&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/contai=
nerd/console;name=3Dconsole;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7B=
WORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/containerd/console"=
 rel=3D"noreferrer" target=3D"_blank">github.com/containerd/console;name=3D=
console;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/imp=
ort/vendor.fetch/github.com/containerd/console</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/bugsnag/=
bugsnag-go" rel=3D"noreferrer" target=3D"_blank">github.com/bugsnag/bugsnag=
-go</a> v1.5.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/bugsnag/bugsnag=
-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/bugsnag/bugsna=
g-go</a> d5b63da7e1f93d83e3980e5ab2bf33179bad7b2a<br>
&gt;&gt; -SRCREV_bugsnag-go=3D&quot;d5b63da7e1f93d83e3980e5ab2bf33179bad7b2=
a&quot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/bugsnag/bug=
snag-go;name=3Dbugsnag-go;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWO=
RKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/bugsnag/bugsnag-go" r=
el=3D"noreferrer" target=3D"_blank">github.com/bugsnag/bugsnag-go;name=3Dbu=
gsnag-go;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/im=
port/vendor.fetch/github.com/bugsnag/bugsnag-go</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/fvb=
ommel/sortorder" rel=3D"noreferrer" target=3D"_blank">github.com/fvbommel/s=
ortorder</a> v1.0.2<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/fvbommel/s=
ortorder" rel=3D"noreferrer" target=3D"_blank">https://github.com/fvbommel/=
sortorder</a> 26fad50c6b32a3064c09ed089865c16f2f3615f6<br>
&gt;&gt;=C2=A0 SRCREV_sortorder=3D&quot;26fad50c6b32a3064c09ed089865c16f2f3=
615f6&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/fvbomm=
el/sortorder;name=3Dsortorder;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%=
7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/fvbommel/sortorde=
r" rel=3D"noreferrer" target=3D"_blank">github.com/fvbommel/sortorder;name=
=3Dsortorder;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/sr=
c/import/vendor.fetch/github.com/fvbommel/sortorder</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hashicor=
p/go-memdb" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-me=
mdb</a> v1.3.2<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/hashicorp/go-me=
mdb" rel=3D"noreferrer" target=3D"_blank">https://github.com/hashicorp/go-m=
emdb</a> 542a5804dedaaddf1a0cad8b6a7b0b3fcf438776<br>
&gt;&gt; -SRCREV_go-memdb=3D&quot;542a5804dedaaddf1a0cad8b6a7b0b3fcf438776&=
quot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/g=
o-memdb;name=3Dgo-memdb;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORK=
DIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/hashicorp/go-memdb" rel=
=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-memdb;name=3Dgo-m=
emdb;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/github.com/hashicorp/go-memdb</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/kla=
uspost/compress" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/=
compress</a> v1.16.5<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/klauspost/=
compress" rel=3D"noreferrer" target=3D"_blank">https://github.com/klauspost=
/compress</a> ed6feffc3bb26797dc2a376516b16611046cdecd<br>
&gt;&gt;=C2=A0 SRCREV_compress=3D&quot;ed6feffc3bb26797dc2a376516b16611046c=
decd&quot;<br>
&gt;&gt; @@ -588,9 +533,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://git=
hub.com/distribution/distribution;name=3Ddistribution;protoco" rel=3D"noref=
errer" target=3D"_blank">github.com/distribution/distribution;name=3Ddistri=
bution;protoco</a><br>
&gt;&gt;=C2=A0 SRCREV_sequential=3D&quot;b22ba8a69b306f0b4adbbe2a529457e628=
3ed9f7&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/moby/s=
ys;name=3Dsequential;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR=
%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/moby/sys/sequential" rel=
=3D"noreferrer" target=3D"_blank">github.com/moby/sys;name=3Dsequential;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/moby/sys/sequential</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/opencont=
ainers/runc" rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers=
/runc</a> v1.1.7<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/opencontainers/=
runc" rel=3D"noreferrer" target=3D"_blank">https://github.com/opencontainer=
s/runc</a> 860f061b76bb4fc671f0f9e900f7d80ff93d4eb7<br>
&gt;&gt; -SRCREV_runc=3D&quot;860f061b76bb4fc671f0f9e900f7d80ff93d4eb7&quot=
;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/opencont=
ainers/runc" rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers=
/runc</a> v1.1.9<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/opencontainers/=
runc" rel=3D"noreferrer" target=3D"_blank">https://github.com/opencontainer=
s/runc</a> ccaecfcbc907d70a7aa870a6650887b901b25b82<br>
&gt;&gt; +SRCREV_runc=3D&quot;ccaecfcbc907d70a7aa870a6650887b901b25b82&quot=
;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/openco=
ntainers/runc;name=3Drunc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWO=
RKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/opencontainers/runc" =
rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers/runc;name=3D=
runc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/github.com/opencontainers/runc</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/shi=
bumi/go-pathspec" rel=3D"noreferrer" target=3D"_blank">github.com/shibumi/g=
o-pathspec</a> v1.3.0<br>
&gt;&gt; @@ -613,21 +558,11 @@ SRC_URI +=3D &quot;git://<a href=3D"http://g=
ithub.com/docker/cli-docs-tool;name=3Dcli-docs-tool;protocol=3Dht" rel=3D"n=
oreferrer" target=3D"_blank">github.com/docker/cli-docs-tool;name=3Dcli-doc=
s-tool;protocol=3Dht</a><br>
&gt;&gt;=C2=A0 SRCREV_go-version=3D&quot;78d058c5618891f74d604bd15356fca690=
b64d8a&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashic=
orp/go-version;name=3Dgo-version;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/hashicorp/go=
-version" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-vers=
ion;name=3Dgo-version;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}=
/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-version</a>&quot;<br=
>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hashicor=
p/golang-lru" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/gol=
ang-lru</a> v0.5.4<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/hashicorp/golan=
g-lru" rel=3D"noreferrer" target=3D"_blank">https://github.com/hashicorp/go=
lang-lru</a> 14eae340515388ca95aa8e7b86f0de668e981f54<br>
&gt;&gt; -SRCREV_golang-lru=3D&quot;14eae340515388ca95aa8e7b86f0de668e981f5=
4&quot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/g=
olang-lru;name=3Dgolang-lru;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7B=
WORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/hashicorp/golang-lr=
u" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/golang-lru;nam=
e=3Dgolang-lru;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/=
src/import/vendor.fetch/github.com/hashicorp/golang-lru</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mod=
ern-go/concurrent" rel=3D"noreferrer" target=3D"_blank">github.com/modern-g=
o/concurrent</a> v0.0.0-20180306012644-bacd9c7ef1dd<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/modern-go/=
concurrent" rel=3D"noreferrer" target=3D"_blank">https://github.com/modern-=
go/concurrent</a> bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94<br>
&gt;&gt;=C2=A0 SRCREV_concurrent=3D&quot;bacd9c7ef1dd9b15be4a9909b8ac7a4e31=
3eec94&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/modern=
-go/concurrent;name=3Dconcurrent;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/modern-go/co=
ncurrent" rel=3D"noreferrer" target=3D"_blank">github.com/modern-go/concurr=
ent;name=3Dconcurrent;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}=
/${BP}/src/import/vendor.fetch/github.com/modern-go/concurrent</a>&quot;<br=
>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/pelletie=
r/go-toml/v2" rel=3D"noreferrer" target=3D"_blank">github.com/pelletier/go-=
toml/v2</a> v2.0.5<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/pelletier/go-to=
ml" rel=3D"noreferrer" target=3D"_blank">https://github.com/pelletier/go-to=
ml</a> 942841787a7d70422e4d8bc7d0be28ab911402df<br>
&gt;&gt; -SRCREV_go-toml-v2=3D&quot;942841787a7d70422e4d8bc7d0be28ab911402d=
f&quot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/pelletier/g=
o-toml;name=3Dgo-toml-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWOR=
KDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/pelletier/go-toml/v2" =
rel=3D"noreferrer" target=3D"_blank">github.com/pelletier/go-toml;name=3Dgo=
-toml-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/im=
port/vendor.fetch/github.com/pelletier/go-toml/v2</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/xei=
puuv/gojsonschema" rel=3D"noreferrer" target=3D"_blank">github.com/xeipuuv/=
gojsonschema</a> v1.2.0<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/xeipuuv/go=
jsonschema" rel=3D"noreferrer" target=3D"_blank">https://github.com/xeipuuv=
/gojsonschema</a> 82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927<br>
&gt;&gt;=C2=A0 SRCREV_gojsonschema=3D&quot;82fcdeb203eb6ab2a67d0a623d9c19e5=
e5a64927&quot;<br>
&gt;&gt; @@ -643,9 +578,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://git=
hub.com/open-telemetry/opentelemetry-go;name=3Dmetric;protoco" rel=3D"noref=
errer" target=3D"_blank">github.com/open-telemetry/opentelemetry-go;name=3D=
metric;protoco</a><br>
&gt;&gt;=C2=A0 SRCREV_v2=3D&quot;fa37277e6394c29db7bcc94062cb30cd7785a126&q=
uot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/AlecAi=
vazis/survey;name=3Dv2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKD=
IR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/AlecAivazis/survey/v2" r=
el=3D"noreferrer" target=3D"_blank">github.com/AlecAivazis/survey;name=3Dv2=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/AlecAivazis/survey/v2</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/containe=
rd/containerd" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/c=
ontainerd</a> v1.7.3<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/containerd/cont=
ainerd" rel=3D"noreferrer" target=3D"_blank">https://github.com/containerd/=
containerd</a> 7880925980b188f4c97b462f709d0db8e8962aff<br>
&gt;&gt; -SRCREV_containerd=3D&quot;7880925980b188f4c97b462f709d0db8e8962af=
f&quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/containe=
rd/containerd" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/c=
ontainerd</a> v1.7.7<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/containerd/cont=
ainerd" rel=3D"noreferrer" target=3D"_blank">https://github.com/containerd/=
containerd</a> 8c087663b0233f6e6e2f4515cee61d49f14746a8<br>
&gt;&gt; +SRCREV_containerd=3D&quot;8c087663b0233f6e6e2f4515cee61d49f14746a=
8&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/contai=
nerd/containerd;name=3Dcontainerd;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/containerd/c=
ontainerd" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/conta=
inerd;name=3Dcontainerd;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDI=
R}/${BP}/src/import/vendor.fetch/github.com/containerd/containerd</a>&quot;=
<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/doc=
ker/go-connections" rel=3D"noreferrer" target=3D"_blank">github.com/docker/=
go-connections</a> v0.4.0<br>
&gt;&gt; @@ -658,9 +593,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://git=
hub.com/docker/go-connections;name=3Dgo-connections;protocol=3D" rel=3D"nor=
eferrer" target=3D"_blank">github.com/docker/go-connections;name=3Dgo-conne=
ctions;protocol=3D</a><br>
&gt;&gt;=C2=A0 SRCREV_semver-v3=3D&quot;e06051f8fcc4c8b4a4990c337b9862a2448=
722e5&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/Master=
minds/semver;name=3Dsemver-v3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%=
7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/Masterminds/semve=
r/v3" rel=3D"noreferrer" target=3D"_blank">github.com/Masterminds/semver;na=
me=3Dsemver-v3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/=
src/import/vendor.fetch/github.com/Masterminds/semver/v3</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/containe=
rd/continuity" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/c=
ontinuity</a> v0.4.1<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/containerd/cont=
inuity" rel=3D"noreferrer" target=3D"_blank">https://github.com/containerd/=
continuity</a> 25762ef7c27a37645197ed6d1d708e55a230e35d<br>
&gt;&gt; -SRCREV_continuity=3D&quot;25762ef7c27a37645197ed6d1d708e55a230e35=
d&quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/containe=
rd/continuity" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/c=
ontinuity</a> v0.4.2<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/containerd/cont=
inuity" rel=3D"noreferrer" target=3D"_blank">https://github.com/containerd/=
continuity</a> 77a2d47a6668b82465fdf6cb749fe3a2aa2c9743<br>
&gt;&gt; +SRCREV_continuity=3D&quot;77a2d47a6668b82465fdf6cb749fe3a2aa2c974=
3&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/contai=
nerd/continuity;name=3Dcontinuity;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/containerd/c=
ontinuity" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/conti=
nuity;name=3Dcontinuity;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDI=
R}/${BP}/src/import/vendor.fetch/github.com/containerd/continuity</a>&quot;=
<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/con=
tainerd/typeurl/v2" rel=3D"noreferrer" target=3D"_blank">github.com/contain=
erd/typeurl/v2</a> v2.1.1<br>
&gt;&gt; @@ -668,16 +603,16 @@ SRC_URI +=3D &quot;git://<a href=3D"http://g=
ithub.com/containerd/continuity;name=3Dcontinuity;protocol=3Dhttp" rel=3D"n=
oreferrer" target=3D"_blank">github.com/containerd/continuity;name=3Dcontin=
uity;protocol=3Dhttp</a><br>
&gt;&gt;=C2=A0 SRCREV_typeurl-v2=3D&quot;7ef6316b771f959cbb208b229e3423a466=
947df3&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/contai=
nerd/typeurl;name=3Dtypeurl-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$=
%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/containerd/typeu=
rl/v2" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/typeurl;n=
ame=3Dtypeurl-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP=
}/src/import/vendor.fetch/github.com/containerd/typeurl/v2</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/magicona=
ir/properties" rel=3D"noreferrer" target=3D"_blank">github.com/magiconair/p=
roperties</a> v1.8.6<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/magiconair/prop=
erties" rel=3D"noreferrer" target=3D"_blank">https://github.com/magiconair/=
properties</a> 869a5592420f4ff6ebf74500b5c658b29d973172<br>
&gt;&gt; -SRCREV_properties=3D&quot;869a5592420f4ff6ebf74500b5c658b29d97317=
2&quot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/magiconair/=
properties;name=3Dproperties;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7=
BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/magiconair/propert=
ies" rel=3D"noreferrer" target=3D"_blank">github.com/magiconair/properties;=
name=3Dproperties;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${B=
P}/src/import/vendor.fetch/github.com/magiconair/properties</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/xei=
puuv/gojsonpointer" rel=3D"noreferrer" target=3D"_blank">github.com/xeipuuv=
/gojsonpointer</a> v0.0.0-20190905194746-02993c407bfb<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/xeipuuv/go=
jsonpointer" rel=3D"noreferrer" target=3D"_blank">https://github.com/xeipuu=
v/gojsonpointer</a> 02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb<br>
&gt;&gt;=C2=A0 SRCREV_gojsonpointer=3D&quot;02993c407bfbf5f6dae44c4f4b1cf6a=
39b5fc5bb&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/xeipuu=
v/gojsonpointer;name=3Dgojsonpointer;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/xeipuuv/go=
jsonpointer" rel=3D"noreferrer" target=3D"_blank">github.com/xeipuuv/gojson=
pointer;name=3Dgojsonpointer;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${W=
ORKDIR}/${BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonpointer</a>&=
quot;<br>
&gt;&gt;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/distribu=
tion/reference" rel=3D"noreferrer" target=3D"_blank">github.com/distributio=
n/reference</a> v0.5.0<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/distribution/re=
ference" rel=3D"noreferrer" target=3D"_blank">https://github.com/distributi=
on/reference</a> 49c28499d219290c3226822e9cfcd4ede6d75379<br>
&gt;&gt; +SRCREV_reference=3D&quot;49c28499d219290c3226822e9cfcd4ede6d75379=
&quot;<br>
&gt;&gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/distributio=
n/reference;name=3Dreference;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7=
BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/distribution/refer=
ence" rel=3D"noreferrer" target=3D"_blank">github.com/distribution/referenc=
e;name=3Dreference;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${=
BP}/src/import/vendor.fetch/github.com/distribution/reference</a>&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mit=
chellh/mapstructure" rel=3D"noreferrer" target=3D"_blank">github.com/mitche=
llh/mapstructure</a> v1.5.0<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/mitchellh/=
mapstructure" rel=3D"noreferrer" target=3D"_blank">https://github.com/mitch=
ellh/mapstructure</a> ab69d8d93410fce4361f4912bb1ff88110a81311<br>
&gt;&gt;=C2=A0 SRCREV_mapstructure=3D&quot;ab69d8d93410fce4361f4912bb1ff881=
10a81311&quot;<br>
&gt;&gt; @@ -693,6 +628,11 @@ SRC_URI +=3D &quot;git://<a href=3D"http://gi=
thub.com/emicklei/go-restful;name=3Dgo-restful-v3;protocol=3Dhtt" rel=3D"no=
referrer" target=3D"_blank">github.com/emicklei/go-restful;name=3Dgo-restfu=
l-v3;protocol=3Dhtt</a><br>
&gt;&gt;=C2=A0 SRCREV_jsonpointer=3D&quot;2446e21cad36eee826e1c2380f0ff7470=
74a2faa&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/go-ope=
napi/jsonpointer;name=3Djsonpointer;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/go-openapi/=
jsonpointer" rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/jso=
npointer;name=3Djsonpointer;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WO=
RKDIR}/${BP}/src/import/vendor.fetch/github.com/go-openapi/jsonpointer</a>&=
quot;<br>
&gt;&gt;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hashicor=
p/go-cleanhttp" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/g=
o-cleanhttp</a> v0.5.2<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/hashicorp/go-cl=
eanhttp" rel=3D"noreferrer" target=3D"_blank">https://github.com/hashicorp/=
go-cleanhttp</a> 6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2<br>
&gt;&gt; +SRCREV_go-cleanhttp=3D&quot;6d9e2ac5d828e5f8594b97f88c4bde14a67bb=
6d2&quot;<br>
&gt;&gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/g=
o-cleanhttp;name=3Dgo-cleanhttp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D=
$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/hashicorp/go-cl=
eanhttp" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-clean=
http;name=3Dgo-cleanhttp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKD=
IR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-cleanhttp</a>&quo=
t;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/in-=
toto/in-toto-golang" rel=3D"noreferrer" target=3D"_blank">github.com/in-tot=
o/in-toto-golang</a> v0.5.0<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/in-toto/in=
-toto-golang" rel=3D"noreferrer" target=3D"_blank">https://github.com/in-to=
to/in-toto-golang</a> ec599036d27ebaca3e8c03559d3f8fd5fe429dfe<br>
&gt;&gt;=C2=A0 SRCREV_in-toto-golang=3D&quot;ec599036d27ebaca3e8c03559d3f8f=
d5fe429dfe&quot;<br>
&gt;&gt; @@ -703,9 +643,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://git=
hub.com/in-toto/in-toto-golang;name=3Din-toto-golang;protocol" rel=3D"noref=
errer" target=3D"_blank">github.com/in-toto/in-toto-golang;name=3Din-toto-g=
olang;protocol</a><br>
&gt;&gt;=C2=A0 SRCREV_go-shellquote=3D&quot;95032a82bc518f77982ea72343cc1ad=
e730072f0&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kballa=
rd/go-shellquote;name=3Dgo-shellquote;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/kballard/=
go-shellquote" rel=3D"noreferrer" target=3D"_blank">github.com/kballard/go-=
shellquote;name=3Dgo-shellquote;protocol=3Dhttps;nobranch=3D1;destsuffix=3D=
${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kballard/go-shellquote<=
/a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/compose-=
spec/compose-go" rel=3D"noreferrer" target=3D"_blank">github.com/compose-sp=
ec/compose-go</a> v1.18.3<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/compose-spec/co=
mpose-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/compose-s=
pec/compose-go</a> c6eecc55b95f952b6d6406adcd297499d11a300b<br>
&gt;&gt; -SRCREV_compose-go=3D&quot;c6eecc55b95f952b6d6406adcd297499d11a300=
b&quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/compose-=
spec/compose-go" rel=3D"noreferrer" target=3D"_blank">github.com/compose-sp=
ec/compose-go</a> v1.20.2<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/compose-spec/co=
mpose-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/compose-s=
pec/compose-go</a> e390b9774ca100e1d75c8bc075054502783b48b8<br>
&gt;&gt; +SRCREV_compose-go=3D&quot;e390b9774ca100e1d75c8bc075054502783b48b=
8&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/compos=
e-spec/compose-go;name=3Dcompose-go;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/compose-spe=
c/compose-go" rel=3D"noreferrer" target=3D"_blank">github.com/compose-spec/=
compose-go;name=3Dcompose-go;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${W=
ORKDIR}/${BP}/src/import/vendor.fetch/github.com/compose-spec/compose-go</a=
>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/has=
hicorp/go-multierror" rel=3D"noreferrer" target=3D"_blank">github.com/hashi=
corp/go-multierror</a> v1.1.1<br>
&gt;&gt; @@ -713,21 +653,11 @@ SRC_URI +=3D &quot;git://<a href=3D"http://g=
ithub.com/compose-spec/compose-go;name=3Dcompose-go;protocol=3Dht" rel=3D"n=
oreferrer" target=3D"_blank">github.com/compose-spec/compose-go;name=3Dcomp=
ose-go;protocol=3Dht</a><br>
&gt;&gt;=C2=A0 SRCREV_go-multierror=3D&quot;9974e9ec57696378079ecc3accd3d6f=
29401b3a0&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashic=
orp/go-multierror;name=3Dgo-multierror;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/hashicor=
p/go-multierror" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/=
go-multierror;name=3Dgo-multierror;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-multier=
ror</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cucumber=
/gherkin-go/v19" rel=3D"noreferrer" target=3D"_blank">github.com/cucumber/g=
herkin-go/v19</a> v19.0.3<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/cucumber/gherki=
n-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/cucumber/gher=
kin-go</a> 11029f28bd1bc215fa57275b576f2b237b7c2b07<br>
&gt;&gt; -SRCREV_v19=3D&quot;11029f28bd1bc215fa57275b576f2b237b7c2b07&quot;=
<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/cucumber/gh=
erkin-go;name=3Dv19;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%=
7D/$%7BBP%7D/src/import/vendor.fetch/github.com/cucumber/gherkin-go/v19" re=
l=3D"noreferrer" target=3D"_blank">github.com/cucumber/gherkin-go;name=3Dv1=
9;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/cucumber/gherkin-go/v19</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/pro=
metheus/client_model" rel=3D"noreferrer" target=3D"_blank">github.com/prome=
theus/client_model</a> v0.3.0<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/prometheus=
/client_model" rel=3D"noreferrer" target=3D"_blank">https://github.com/prom=
etheus/client_model</a> 63fb9822ca3ba7a4ba5184071fb8f2ea000a99ef<br>
&gt;&gt;=C2=A0 SRCREV_client_model=3D&quot;63fb9822ca3ba7a4ba5184071fb8f2ea=
000a99ef&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/promet=
heus/client_model;name=3Dclient_model;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/prometheu=
s/client_model" rel=3D"noreferrer" target=3D"_blank">github.com/prometheus/=
client_model;name=3Dclient_model;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/client_mo=
del</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/spf13/jw=
alterweatherman" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/jwal=
terweatherman</a> v1.1.0<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/spf13/jwalterwe=
atherman" rel=3D"noreferrer" target=3D"_blank">https://github.com/spf13/jwa=
lterweatherman</a> 94f6ae3ed3bceceafa716478c5fbf8d29ca601a1<br>
&gt;&gt; -SRCREV_jwalterweatherman=3D&quot;94f6ae3ed3bceceafa716478c5fbf8d2=
9ca601a1&quot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/spf13/jwalt=
erweatherman;name=3Djwalterweatherman;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/spf13/jwa=
lterweatherman" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/jwalt=
erweatherman;name=3Djwalterweatherman;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/jwalterweat=
herman</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/xei=
puuv/gojsonreference" rel=3D"noreferrer" target=3D"_blank">github.com/xeipu=
uv/gojsonreference</a> v0.0.0-20180127040603-bd5ef7bd5415<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/xeipuuv/go=
jsonreference" rel=3D"noreferrer" target=3D"_blank">https://github.com/xeip=
uuv/gojsonreference</a> bd5ef7bd5415a7ac448318e64f11a24cd21e594b<br>
&gt;&gt;=C2=A0 SRCREV_gojsonreference=3D&quot;bd5ef7bd5415a7ac448318e64f11a=
24cd21e594b&quot;<br>
&gt;&gt; @@ -743,11 +673,6 @@ SRC_URI +=3D &quot;git://<a href=3D"http://gi=
thub.com/opencontainers/go-digest;name=3Dgo-digest;protocol=3Dht" rel=3D"no=
referrer" target=3D"_blank">github.com/opencontainers/go-digest;name=3Dgo-d=
igest;protocol=3Dht</a><br>
&gt;&gt;=C2=A0 SRCREV_config=3D&quot;18bff5e44f4c2c140feaf54b2dd92140630c7e=
50&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/aws/aw=
s-sdk-go-v2;name=3Dconfig;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWO=
RKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2/con=
fig" rel=3D"noreferrer" target=3D"_blank">github.com/aws/aws-sdk-go-v2;name=
=3Dconfig;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/i=
mport/vendor.fetch/github.com/aws/aws-sdk-go-v2/config</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cucumber=
/messages-go/v16" rel=3D"noreferrer" target=3D"_blank">github.com/cucumber/=
messages-go/v16</a> v16.0.1<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/cucumber/messag=
es-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/cucumber/mes=
sages-go</a> 1848e9bfc84e8c1674c4d9ded0bdbfc23c458b28<br>
&gt;&gt; -SRCREV_v16=3D&quot;1848e9bfc84e8c1674c4d9ded0bdbfc23c458b28&quot;=
<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/cucumber/me=
ssages-go;name=3Dv16;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR=
%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/cucumber/messages-go/v16" =
rel=3D"noreferrer" target=3D"_blank">github.com/cucumber/messages-go;name=
=3Dv16;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impo=
rt/vendor.fetch/github.com/cucumber/messages-go/v16</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/go-=
openapi/jsonreference" rel=3D"noreferrer" target=3D"_blank">github.com/go-o=
penapi/jsonreference</a> v0.20.0<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/go-openapi=
/jsonreference" rel=3D"noreferrer" target=3D"_blank">https://github.com/go-=
openapi/jsonreference</a> c5db5582e080fbeae80be42f42881230a8caebf6<br>
&gt;&gt;=C2=A0 SRCREV_jsonreference=3D&quot;c5db5582e080fbeae80be42f4288123=
0a8caebf6&quot;<br>
&gt;&gt; @@ -758,9 +683,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://git=
hub.com/go-openapi/jsonreference;name=3Djsonreference;protoco" rel=3D"noref=
errer" target=3D"_blank">github.com/go-openapi/jsonreference;name=3Djsonref=
erence;protoco</a><br>
&gt;&gt;=C2=A0 SRCREV_client_golang=3D&quot;254e5468413f19fb75cdad45f5ddc0b=
8c975188c&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/promet=
heus/client_golang;name=3Dclient_golang;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/prometh=
eus/client_golang" rel=3D"noreferrer" target=3D"_blank">github.com/promethe=
us/client_golang;name=3Dclient_golang;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/client=
_golang</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/opencont=
ainers/image-spec" rel=3D"noreferrer" target=3D"_blank">github.com/opencont=
ainers/image-spec</a> v1.1.0-rc4<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/opencontainers/=
image-spec" rel=3D"noreferrer" target=3D"_blank">https://github.com/opencon=
tainers/image-spec</a> 82e8329f7eb6df5c62924f2792d285ba276ae876<br>
&gt;&gt; -SRCREV_image-spec=3D&quot;82e8329f7eb6df5c62924f2792d285ba276ae87=
6&quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/opencont=
ainers/image-spec" rel=3D"noreferrer" target=3D"_blank">github.com/opencont=
ainers/image-spec</a> v1.1.0-rc5<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/opencontainers/=
image-spec" rel=3D"noreferrer" target=3D"_blank">https://github.com/opencon=
tainers/image-spec</a> 1e54f0195ce54b4a1a2ecbac8eab7686d91d3080<br>
&gt;&gt; +SRCREV_image-spec=3D&quot;1e54f0195ce54b4a1a2ecbac8eab7686d91d308=
0&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/openco=
ntainers/image-spec;name=3Dimage-spec;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/openconta=
iners/image-spec" rel=3D"noreferrer" target=3D"_blank">github.com/openconta=
iners/image-spec;name=3Dimage-spec;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/image=
-spec</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/the=
updateframework/notary" rel=3D"noreferrer" target=3D"_blank">github.com/the=
updateframework/notary</a> v0.7.0<br>
&gt;&gt; @@ -768,9 +693,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://git=
hub.com/opencontainers/image-spec;name=3Dimage-spec;protocol=3D" rel=3D"nor=
eferrer" target=3D"_blank">github.com/opencontainers/image-spec;name=3Dimag=
e-spec;protocol=3D</a><br>
&gt;&gt;=C2=A0 SRCREV_notary=3D&quot;b0b6bfdd4933081e8d5ae026b24e8337311dd5=
98&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/notary=
project/notary;name=3Dnotary;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7=
BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/theupdateframework=
/notary" rel=3D"noreferrer" target=3D"_blank">github.com/notaryproject/nota=
ry;name=3Dnotary;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP=
}/src/import/vendor.fetch/github.com/theupdateframework/notary</a>&quot;<br=
>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/AdaLogic=
s/go-fuzz-headers" rel=3D"noreferrer" target=3D"_blank">github.com/AdaLogic=
s/go-fuzz-headers</a> v0.0.0-20230106234847-43070de90fa1<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/AdaLogics/go-fu=
zz-headers" rel=3D"noreferrer" target=3D"_blank">https://github.com/AdaLogi=
cs/go-fuzz-headers</a> 43070de90fa134c9ea55cd6de4308a2ae59658d3<br>
&gt;&gt; -SRCREV_go-fuzz-headers=3D&quot;43070de90fa134c9ea55cd6de4308a2ae5=
9658d3&quot;<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/AdaLogic=
s/go-fuzz-headers" rel=3D"noreferrer" target=3D"_blank">github.com/AdaLogic=
s/go-fuzz-headers</a> v0.0.0-20230811130428-ced1acdcaa24<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/AdaLogics/go-fu=
zz-headers" rel=3D"noreferrer" target=3D"_blank">https://github.com/AdaLogi=
cs/go-fuzz-headers</a> ced1acdcaa24dc39c01b039fc37576c395f506cf<br>
&gt;&gt; +SRCREV_go-fuzz-headers=3D&quot;ced1acdcaa24dc39c01b039fc37576c395=
f506cf&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/AdaLog=
ics/go-fuzz-headers;name=3Dgo-fuzz-headers;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/AdaL=
ogics/go-fuzz-headers" rel=3D"noreferrer" target=3D"_blank">github.com/AdaL=
ogics/go-fuzz-headers;name=3Dgo-fuzz-headers;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AdaLogics/=
go-fuzz-headers</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/inc=
onshreveable/mousetrap" rel=3D"noreferrer" target=3D"_blank">github.com/inc=
onshreveable/mousetrap</a> v1.1.0<br>
&gt;&gt; @@ -783,21 +708,6 @@ SRC_URI +=3D &quot;git://<a href=3D"http://gi=
thub.com/inconshreveable/mousetrap;name=3Dmousetrap;protocol=3Dh" rel=3D"no=
referrer" target=3D"_blank">github.com/inconshreveable/mousetrap;name=3Dmou=
setrap;protocol=3Dh</a><br>
&gt;&gt;=C2=A0 SRCREV_structured-merge-diff-v4=3D&quot;26781d0c10bfdbd7d66b=
18d8be83985f623df9f8&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kubern=
etes-sigs/structured-merge-diff;name=3Dstructured-merge-diff-v4;protocol=3D=
https;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.=
fetch/sigs.k8s.io/structured-merge-diff/v4" rel=3D"noreferrer" target=3D"_b=
lank">github.com/kubernetes-sigs/structured-merge-diff;name=3Dstructured-me=
rge-diff-v4;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src=
/import/vendor.fetch/sigs.k8s.io/structured-merge-diff/v4</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cyphar/f=
ilepath-securejoin" rel=3D"noreferrer" target=3D"_blank">github.com/cyphar/=
filepath-securejoin</a> v0.2.3<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/cyphar/filepath=
-securejoin" rel=3D"noreferrer" target=3D"_blank">https://github.com/cyphar=
/filepath-securejoin</a> 8f267f5ea675a20a2cb5e91011d063721f53bf79<br>
&gt;&gt; -SRCREV_filepath-securejoin=3D&quot;8f267f5ea675a20a2cb5e91011d063=
721f53bf79&quot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/cyphar/file=
path-securejoin;name=3Dfilepath-securejoin;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/cyph=
ar/filepath-securejoin" rel=3D"noreferrer" target=3D"_blank">github.com/cyp=
har/filepath-securejoin;name=3Dfilepath-securejoin;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cyph=
ar/filepath-securejoin</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/distribu=
tion/distribution/v3" rel=3D"noreferrer" target=3D"_blank">github.com/distr=
ibution/distribution/v3</a> v3.0.0-20230601133803-97b1d649c493<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/distribution/di=
stribution" rel=3D"noreferrer" target=3D"_blank">https://github.com/distrib=
ution/distribution</a> 97b1d649c4938d0f608d96454d6a8326b1f96acd<br>
&gt;&gt; -SRCREV_v3=3D&quot;97b1d649c4938d0f608d96454d6a8326b1f96acd&quot;<=
br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/distributio=
n/distribution;name=3Dv3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWOR=
KDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/distribution/distribut=
ion/v3" rel=3D"noreferrer" target=3D"_blank">github.com/distribution/distri=
bution;name=3Dv3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP=
}/src/import/vendor.fetch/github.com/distribution/distribution/v3</a>&quot;=
<br>
&gt;&gt; -<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hashicor=
p/go-immutable-radix" rel=3D"noreferrer" target=3D"_blank">github.com/hashi=
corp/go-immutable-radix</a> v1.3.1<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/hashicorp/go-im=
mutable-radix" rel=3D"noreferrer" target=3D"_blank">https://github.com/hash=
icorp/go-immutable-radix</a> 49d1d02c49a783de548d1ba8ae8fde466a20b9e6<br>
&gt;&gt; -SRCREV_go-immutable-radix=3D&quot;49d1d02c49a783de548d1ba8ae8fde4=
66a20b9e6&quot;<br>
&gt;&gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/g=
o-immutable-radix;name=3Dgo-immutable-radix;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/has=
hicorp/go-immutable-radix" rel=3D"noreferrer" target=3D"_blank">github.com/=
hashicorp/go-immutable-radix;name=3Dgo-immutable-radix;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
hashicorp/go-immutable-radix</a>&quot;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/aws=
/aws-sdk-go-v2/credentials" rel=3D"noreferrer" target=3D"_blank">github.com=
/aws/aws-sdk-go-v2/credentials</a> v1.13.16<br>
&gt;&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://github.com/aws/aws-sd=
k-go-v2" rel=3D"noreferrer" target=3D"_blank">https://github.com/aws/aws-sd=
k-go-v2</a> 18bff5e44f4c2c140feaf54b2dd92140630c7e50<br>
&gt;&gt;=C2=A0 SRCREV_credentials=3D&quot;18bff5e44f4c2c140feaf54b2dd921406=
30c7e50&quot;<br>
&gt;&gt; @@ -823,14 +733,14 @@ SRC_URI +=3D &quot;git://<a href=3D"http://g=
ithub.com/aws/aws-sdk-go-v2;name=3Dini;protocol=3Dhttps;nobranch=3D" rel=3D=
"noreferrer" target=3D"_blank">github.com/aws/aws-sdk-go-v2;name=3Dini;prot=
ocol=3Dhttps;nobranch=3D</a><br>
&gt;&gt;=C2=A0 SRCREV_grpc-gateway-v2=3D&quot;0197faf8b072910084edd1209aa2a=
c51833b895c&quot;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/grpc-e=
cosystem/grpc-gateway;name=3Dgrpc-gateway-v2;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/gr=
pc-ecosystem/grpc-gateway/v2" rel=3D"noreferrer" target=3D"_blank">github.c=
om/grpc-ecosystem/grpc-gateway;name=3Dgrpc-gateway-v2;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/g=
rpc-ecosystem/grpc-gateway/v2</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/g=
enproto/googleapis/api" rel=3D"noreferrer" target=3D"_blank">google.golang.=
org/genproto/googleapis/api</a> v0.0.0-20230525234035-dd9d682886f9<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/googleapis/go-g=
enproto" rel=3D"noreferrer" target=3D"_blank">https://github.com/googleapis=
/go-genproto</a> dd9d682886f99d242574cd3eaea438ce7ea66399<br>
&gt;&gt; -SRCREV_api=3D&quot;dd9d682886f99d242574cd3eaea438ce7ea66399&quot;=
<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/g=
enproto/googleapis/api" rel=3D"noreferrer" target=3D"_blank">google.golang.=
org/genproto/googleapis/api</a> v0.0.0-20230822172742-b8732ec3820d<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/googleapis/go-g=
enproto" rel=3D"noreferrer" target=3D"_blank">https://github.com/googleapis=
/go-genproto</a> b8732ec3820db4bd1e4eda89392b7728e81bd825<br>
&gt;&gt; +SRCREV_api=3D&quot;b8732ec3820db4bd1e4eda89392b7728e81bd825&quot;=
<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google=
apis/go-genproto;name=3Dapi;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7B=
WORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/google.golang.org/genproto/goo=
gleapis/api" rel=3D"noreferrer" target=3D"_blank">github.com/googleapis/go-=
genproto;name=3Dapi;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/$=
{BP}/src/import/vendor.fetch/google.golang.org/genproto/googleapis/api</a>&=
quot;<br>
&gt;&gt;<br>
&gt;&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/g=
enproto/googleapis/rpc" rel=3D"noreferrer" target=3D"_blank">google.golang.=
org/genproto/googleapis/rpc</a> v0.0.0-20230525234030-28d5490b6b19<br>
&gt;&gt; -# [1] git ls-remote <a href=3D"https://github.com/googleapis/go-g=
enproto" rel=3D"noreferrer" target=3D"_blank">https://github.com/googleapis=
/go-genproto</a> 28d5490b6b19cce1ebbc6ab55ca8637bd35b3486<br>
&gt;&gt; -SRCREV_rpc=3D&quot;28d5490b6b19cce1ebbc6ab55ca8637bd35b3486&quot;=
<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/g=
enproto/googleapis/rpc" rel=3D"noreferrer" target=3D"_blank">google.golang.=
org/genproto/googleapis/rpc</a> v0.0.0-20230822172742-b8732ec3820d<br>
&gt;&gt; +# [1] git ls-remote <a href=3D"https://github.com/googleapis/go-g=
enproto" rel=3D"noreferrer" target=3D"_blank">https://github.com/googleapis=
/go-genproto</a> b8732ec3820db4bd1e4eda89392b7728e81bd825<br>
&gt;&gt; +SRCREV_rpc=3D&quot;b8732ec3820db4bd1e4eda89392b7728e81bd825&quot;=
<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google=
apis/go-genproto;name=3Drpc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7B=
WORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/google.golang.org/genproto/goo=
gleapis/rpc" rel=3D"noreferrer" target=3D"_blank">github.com/googleapis/go-=
genproto;name=3Drpc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/$=
{BP}/src/import/vendor.fetch/google.golang.org/genproto/googleapis/rpc</a>&=
quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/doc=
ker/docker-credential-helpers" rel=3D"noreferrer" target=3D"_blank">github.=
com/docker/docker-credential-helpers</a> v0.7.0<br>
&gt;&gt; --<br>
&gt;&gt; 2.44.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8596): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8596" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/8596</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10462887=
4/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/104628874/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000fa9d13061275ca8a--

