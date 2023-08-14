Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6518DC001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 19:00:55 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.116262.1692039651015711030
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 12:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GE8hMaHs;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31768ce2e81so4185509f8f.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692039649; x=1692644449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v1nysO2/26dr3wrUD9pTaAeoXq2dtUTyDNtD+E3TaAs=;
        b=GE8hMaHs58eiG3VnfupMdgnSyS6fX/SqxvNDimGlPSsbC1vy5Qv9jiyR07vSXmJz47
         x2I5pjClEGsNa+skX+tEw/pwsO/l22gYVUR9JxGlXJylgQ04YDCrFwwWTfLygaSi38ks
         xuU3P0/ZV33cAd4RFLy3x23ln9OVYF5dZSsDICDMyAW0JkHB+jlq6JRZwPOhFuya1c7c
         HYiEUZaVbrw8tPLwwND0qybrTU2jpbhEpV9UH3efEPgwNNE9wjKgBLmH/oEAr56XcTqJ
         fdb85UA47qb+9dqSPrPSSgfkpL6qEkR9pAiUYB3+8cqJdhJao+eHrv9B7sa4kbzj4rUK
         RxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692039649; x=1692644449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1nysO2/26dr3wrUD9pTaAeoXq2dtUTyDNtD+E3TaAs=;
        b=JgrKA5Q8Ico/DDOLPDzPFH6nS4i6duYhKdUrda22FuB4pVZgKkdujWBYDDGVpNUHvt
         duu/YbyPv4gmupObCpdKaUcTgnEcSFPhKWbTAt185BfZPNR6PtnHHrywgmmhjTEszwB2
         BzEoak5KOCZrubAPa6p+VBrX7SC82qYzL22mNFnhDrpTh0UuDuadnt0l+10p+K2g2q23
         DF+46/hK+wKec/Sc0Cyl5dvUgLZ3ReuiJp0vUlzIkAcx3Fm4+lIUk2HrQ2hA9WRelMta
         vZfFhkmvzv0TTJ5ZJOhUEQpxhtGekbvR6Rk7fG4KFXovyYJ5Gs6kpVG9FwzUBNz/u3DZ
         mSkQ==
X-Gm-Message-State: AOJu0YzH0sd7hcsY3XVMKW6GxYtvSYQ382XoJ8h5RObiSAwE7p/H5iq4
	qyYteazWGtp55QZvxj0+PLWfEdRYzTe4YwG0Dis=
X-Google-Smtp-Source: AGHT+IF10X72GbH3th/44UyFvwIyeiUnlUqZMSU/3vJacJjqMxqF06pTNJHyHLuXycHe5WRNDS9LtU+fFEsERfjF5Zw=
X-Received: by 2002:adf:fd50:0:b0:311:1dba:ca65 with SMTP id
 h16-20020adffd50000000b003111dbaca65mr7064306wrs.51.1692039648854; Mon, 14
 Aug 2023 12:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230814151356.1001953-1-Martin.Jansa@gmail.com> <177B48E707B1FD85.12117@lists.yoctoproject.org>
In-Reply-To: <177B48E707B1FD85.12117@lists.yoctoproject.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Aug 2023 21:00:32 +0200
Message-ID: <CA+chaQei9w4MDNhZPojhKXf=Tx-DTt2PE0UapJ3eis5eciTnDw@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone][RFC][PATCHv2] docker: update to
 v20.10.25 + 58 commits to fix compatibility with go currently in kirkstone
To: Martin.Jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000374a5f0602e6aeef"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 19:00:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8190

--000000000000374a5f0602e6aeef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 5:17=E2=80=AFPM Martin Jansa via lists.yoctoproject=
.org
<Martin.Jansa=3Dgmail.com@lists.yoctoproject.org> wrote:

> RFC, because I've only build tested this in kirkstone, waiting for whole
> image to build to test it in runtime
>

Passed minimal sanity check on rpi4-64:


>
> On Mon, Aug 14, 2023 at 5:14=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com>
> wrote:
>
>> * since this backport:
>>   https://lists.openembedded.org/g/openembedded-core/message/185082
>>   landed in kirkstone:
>>
>> https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&id=
=3D5dc74138649ab7a2c0158a43225dc7a8fd732355
>>
>>   docker cannot access network and fails with:
>>   "http: invalid Host header"
>>
>>   update to latest commit in 20.10 branch, because latest tag v20.10.25
>>   have the fix yet:
>>   https://github.com/moby/moby/compare/v20.10.21...v20.10.25
>>
>>   so we need couple more commits from upstream:
>>
>> https://github.com/moby/moby/compare/v20.10.25...791d8ab87747169b4cbfcdf=
2fd57c81952bae6d5
>>
>>   Adjust the go version revert which was here since the upgrade to
>> v20.10.21:
>>
>> https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dkirkstone&i=
d=3D927537108bcf2b98859512ce3eae59a73439994d
>>
>>   and add another revert for the go upgrades from upstream for this olde=
r
>>   patch to apply.
>>
>> * update cli to latest in 20.10 branch as well:
>>
>> https://github.com/docker/cli/compare/baeda1f82a10204ec5708d5fbba130ad76=
cfee49..911449ca245308472a3d34a7f1a98b918e65c8c3
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  recipes-containers/docker/docker-ce_git.bb    |  27 ++--
>>  recipes-containers/docker/docker-moby_git.bb  |  29 ++--
>>  ...rt-go-updates-from-1.19.12-to-1.18.7.patch | 144 ++++++++++++++++++
>>  ...t-go-updates-from-1.18.7-to-1.17.13.patch} |  35 ++---
>>  ...avoid-using-strings.Cut-from-go-1.18.patch |  32 ++++
>>  5 files changed, 218 insertions(+), 49 deletions(-)
>>  create mode 100644
>> recipes-containers/docker/files/0001-Revert-go-updates-from-1.19.12-to-1=
.18.7.patch
>>  rename recipes-containers/docker/files/{0001-revert-go-1.8-update.patch
>> =3D> 0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch} (97%)
>>  create mode 100644
>> recipes-containers/docker/files/0003-builder.go-avoid-using-strings.Cut-=
from-go-1.18.patch
>>
>> diff --git a/recipes-containers/docker/docker-ce_git.bb
>> b/recipes-containers/docker/docker-ce_git.bb
>> index a41e83a..76ac41e 100644
>> --- a/recipes-containers/docker/docker-ce_git.bb
>> +++ b/recipes-containers/docker/docker-ce_git.bb
>> @@ -33,18 +33,20 @@ DESCRIPTION =3D "Linux container runtime \
>>
>>  SRCREV_docker =3D "3056208812eb5e792fa99736c9167d1e10f4ab49"
>>  SRCREV_libnetwork =3D "dcdf8f176d1e13ad719e913e796fb698d846de98"
>> -SRCREV_cli =3D "baeda1f82a10204ec5708d5fbba130ad76cfee49"
>> +SRCREV_cli =3D "911449ca245308472a3d34a7f1a98b918e65c8c3"
>>  SRCREV_FORMAT =3D "docker_libnetwork"
>>  SRC_URI =3D "\
>> -       git://
>> github.com/docker/docker.git;branch=3D20.10;name=3Ddocker;protocol=3Dhtt=
ps \
>> -       git://
>> github.com/docker/libnetwork.git;branch=3Dmaster;name=3Dlibnetwork;dests=
uffix=3Dgit/libnetwork;protocol=3Dhttps
>> \
>> -       git://
>> github.com/docker/cli;branch=3D20.10;name=3Dcli;destsuffix=3Dgit/cli;pro=
tocol=3Dhttps
>> \
>> -       file://0001-libnetwork-use-GO-instead-of-go.patch \
>> -       file://docker.init \
>> -        file://0001-dynbinary-use-go-cross-compiler.patch \
>> -
>> file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
>> -    file://0001-revert-go-1.8-update.patch;patchdir=3Dsrc/import \
>> -       "
>> +    git://
>> github.com/docker/docker.git;branch=3D20.10;name=3Ddocker;protocol=3Dhtt=
ps \
>> +    git://
>> github.com/docker/libnetwork.git;branch=3Dmaster;name=3Dlibnetwork;dests=
uffix=3Dgit/libnetwork;protocol=3Dhttps
>> \
>> +    git://
>> github.com/docker/cli;branch=3D20.10;name=3Dcli;destsuffix=3Dgit/cli;pro=
tocol=3Dhttps
>> \
>> +    file://0001-libnetwork-use-GO-instead-of-go.patch \
>> +    file://docker.init \
>> +    file://0001-dynbinary-use-go-cross-compiler.patch \
>> +    file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
>> +
>> file://0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch;patchdir=3Dsr=
c/import
>> \
>> +
>> file://0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch;patchdir=3Dsr=
c/import
>> \
>> +
>> file://0003-builder.go-avoid-using-strings.Cut-from-go-1.18.patch;patchd=
ir=3Dsrc/import
>> \
>> +"
>>
>>  DOCKER_COMMIT =3D "${SRCREV_docker}"
>>
>> @@ -54,7 +56,10 @@ require docker.inc
>>  LICENSE =3D "Apache-2.0"
>>  LIC_FILES_CHKSUM =3D
>> "file://src/import/LICENSE;md5=3D4859e97a9c7780e77972d989f0823f28"
>>
>> -DOCKER_VERSION =3D "20.10.21-ce"
>> +# 58 commits after v20.10.25 to include the fixes for go compatibility
>> after
>> +# https://lists.openembedded.org/g/openembedded-core/message/185082
>> +#
>> https://github.com/moby/moby/compare/v20.10.25...791d8ab87747169b4cbfcdf=
2fd57c81952bae6d5
>> +DOCKER_VERSION =3D "20.10.25-ce"
>>  PV =3D "${DOCKER_VERSION}+git${SRCREV_docker}"
>>
>>  CVE_PRODUCT =3D "docker mobyproject:moby"
>> diff --git a/recipes-containers/docker/docker-moby_git.bb
>> b/recipes-containers/docker/docker-moby_git.bb
>> index b048208..5f8de07 100644
>> --- a/recipes-containers/docker/docker-moby_git.bb
>> +++ b/recipes-containers/docker/docker-moby_git.bb
>> @@ -34,20 +34,22 @@ DESCRIPTION =3D "Linux container runtime \
>>  #   - The common components of this recipe and docker-ce do need to be
>> moved
>>  #     to a docker.inc recipe
>>
>> -SRCREV_moby =3D "3056208812eb5e792fa99736c9167d1e10f4ab49"
>> +SRCREV_moby =3D "791d8ab87747169b4cbfcdf2fd57c81952bae6d5"
>>  SRCREV_libnetwork =3D "dcdf8f176d1e13ad719e913e796fb698d846de98"
>> -SRCREV_cli =3D "baeda1f82a10204ec5708d5fbba130ad76cfee49"
>> +SRCREV_cli =3D "911449ca245308472a3d34a7f1a98b918e65c8c3"
>>  SRCREV_FORMAT =3D "moby_libnetwork"
>>  SRC_URI =3D "\
>> -       git://
>> github.com/moby/moby.git;branch=3D20.10;name=3Dmoby;protocol=3Dhttps \
>> -       git://
>> github.com/docker/libnetwork.git;branch=3Dmaster;name=3Dlibnetwork;dests=
uffix=3Dgit/libnetwork;protocol=3Dhttps
>> \
>> -       git://
>> github.com/docker/cli;branch=3D20.10;name=3Dcli;destsuffix=3Dgit/cli;pro=
tocol=3Dhttps
>> \
>> -       file://docker.init \
>> -       file://0001-libnetwork-use-GO-instead-of-go.patch \
>> -
>> file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
>> -        file://0001-dynbinary-use-go-cross-compiler.patch \
>> -    file://0001-revert-go-1.8-update.patch;patchdir=3Dsrc/import \
>> -       "
>> +    git://github.com/moby/moby.git;branch=3D20.10;name=3Dmoby;protocol=
=3Dhttps
>> \
>> +    git://
>> github.com/docker/libnetwork.git;branch=3Dmaster;name=3Dlibnetwork;dests=
uffix=3Dgit/libnetwork;protocol=3Dhttps
>> \
>> +    git://
>> github.com/docker/cli;branch=3D20.10;name=3Dcli;destsuffix=3Dgit/cli;pro=
tocol=3Dhttps
>> \
>> +    file://docker.init \
>> +    file://0001-libnetwork-use-GO-instead-of-go.patch \
>> +    file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
>> +    file://0001-dynbinary-use-go-cross-compiler.patch \
>> +
>> file://0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch;patchdir=3Dsr=
c/import
>> \
>> +
>> file://0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch;patchdir=3Dsr=
c/import
>> \
>> +
>> file://0003-builder.go-avoid-using-strings.Cut-from-go-1.18.patch;patchd=
ir=3Dsrc/import
>> \
>> +"
>>
>>  DOCKER_COMMIT =3D "${SRCREV_moby}"
>>
>> @@ -57,7 +59,10 @@ require docker.inc
>>  LICENSE =3D "Apache-2.0"
>>  LIC_FILES_CHKSUM =3D
>> "file://src/import/LICENSE;md5=3D4859e97a9c7780e77972d989f0823f28"
>>
>> -DOCKER_VERSION =3D "20.10.21"
>> +# 58 commits after v20.10.25 to include the fixes for go compatibility
>> after
>> +# https://lists.openembedded.org/g/openembedded-core/message/185082
>> +#
>> https://github.com/moby/moby/compare/v20.10.25...791d8ab87747169b4cbfcdf=
2fd57c81952bae6d5
>> +DOCKER_VERSION =3D "20.10.25"
>>  PV =3D "${DOCKER_VERSION}+git${SRCREV_moby}"
>>
>>  CVE_PRODUCT =3D "docker mobyproject:moby"
>> diff --git
>> a/recipes-containers/docker/files/0001-Revert-go-updates-from-1.19.12-to=
-1.18.7.patch
>> b/recipes-containers/docker/files/0001-Revert-go-updates-from-1.19.12-to=
-1.18.7.patch
>> new file mode 100644
>> index 0000000..2a3f3b9
>> --- /dev/null
>> +++
>> b/recipes-containers/docker/files/0001-Revert-go-updates-from-1.19.12-to=
-1.18.7.patch
>> @@ -0,0 +1,144 @@
>> +From 2cc349a336cd3cb4fa33554216a99dbce3879d29 Mon Sep 17 00:00:00 2001
>> +From: Martin Jansa <Martin.Jansa@gmail.com>
>> +Date: Mon, 14 Aug 2023 16:02:30 +0200
>> +Subject: [PATCH] Revert go updates from 1.19.12 to 1.18.7
>> +
>> +To continue using 1.17 version as implemented for some reason in:
>> +
>> https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dkirkstone&i=
d=3D927537108bcf2b98859512ce3eae59a73439994d
>> +with 0001-revert-go-1.8-update.patch
>> +
>> +Revert "update to go1.19.12"
>> +This reverts commit c42d7c7f6d0dccfe5d85f0126da2c8ec77573616.
>> +Revert "[20.10] update go to go1.19.11"
>> +This reverts commit 43fe787c232c54b53bda21301bbf3a463c4e4056.
>> +Revert "[20.10] update go to go1.19.10"
>> +This reverts commit 99f10dec91409c4f6ed2c4867638f4e5ea678f0a.
>> +Revert "Dockerfile: temporarily skip CRIU stage"
>> +This reverts commit af0477880cc8c0197517c0bc8de0cbd6cb9bd9a9.
>> +Revert "[20.10] update go to go1.19.9"
>> +This reverts commit 7f91a52b8969f5604fdca36ee30475cc9600be5b.
>> +Revert "[20.10] update go to go1.19.8"
>> +This reverts commit a09b3e9cf9de906438a6300760754fcb087f166a.
>> +Revert "update to go1.19.7"
>> +This reverts commit 9aa5d55a8ba8725133a6fbb5ac98d1fab341fdc7.
>> +Revert "update to go1.19.6"
>> +This reverts commit 98c9e3f43833bf87c21e02aca77c75c7a475ecd6.
>> +Revert "update to go1.19.5"
>> +This reverts commit 5b48f300dd0c6a2bbfc942408bc7e3fbc39609f0.
>> +Revert "update to go1.19.4"
>> +This reverts commit 82b0ac1166cc553e2757c5d490ce69078064ef6e.
>> +Revert "Update to Go 1.19.3 to address CVE-2022-41716"
>> +This reverts commit 4701ca9f719f5386d2ca2417b566b5950aa8a929.
>> +Revert "Update to go 1.19.2 to address CVE-2022-2879, CVE-2022-2880,
>> CVE-2022-41715"
>> +This reverts commit 1c8c16524f94ae69eb33c5c9000e87615ce973a6.
>> +Revert "Update to go 1.19.1 to address CVE-2022-27664, CVE-2022-32190"
>> +This reverts commit 6cc1ef32a28e7e6e74383d4775bd178d36495181.
>> +Revert "update to golang 1.19"
>> +This reverts commit 5091f13a5d027b785084028aedb03beb5b0bd9a6.
>> +Revert "Dockerfile: configure code dir as "safe" directory"
>> +This reverts commit 0312e468da5c99267654d5c6b62785e29ffe6e0d.
>> +Revert "[20.10] update to go1.18.10"
>> +This reverts commit 625903f3fda862c69492256016b386628954b3a4.
>> +Revert "[20.10] update gotestsum to v1.8.2"
>> +This reverts commit edca413033cea5252f69bfc740e9450e5d0a0ef9.
>> +Revert "[20.10] update to go1.18.9"
>> +This reverts commit f8b0d77bfe109c5248ba6eb6c6db7f32e99a2e75.
>> +Revert "[20.10] update to Go 1.18.8 to address CVE-2022-41716"
>> +This reverts commit 0211f9e44dba888fa62dc2ba59ea573ad70e9708.
>> +
>> +Upstream-Status: Inapropriate
>> +---
>> + Dockerfile                                  | 12 ++----------
>> + Dockerfile.e2e                              |  2 +-
>> + Dockerfile.simple                           |  2 +-
>> + Dockerfile.windows                          |  4 ++--
>> + hack/dockerfile/install/gotestsum.installer |  2 +-
>> + 5 files changed, 7 insertions(+), 15 deletions(-)
>> +
>> +diff --git a/Dockerfile b/Dockerfile
>> +index 4ee4d8dd2c..9472c512a6 100644
>> +--- a/Dockerfile
>> ++++ b/Dockerfile
>> +@@ -3,7 +3,7 @@
>> + ARG CROSS=3D"false"
>> + ARG SYSTEMD=3D"false"
>> + # IMPORTANT: When updating this please note that stdlib archive/tar pk=
g
>> is vendored
>> +-ARG GO_VERSION=3D1.19.12
>> ++ARG GO_VERSION=3D1.18.7
>> + ARG DEBIAN_FRONTEND=3Dnoninteractive
>> + ARG VPNKIT_VERSION=3D0.5.0
>> + ARG DOCKER_BUILDTAGS=3D"apparmor seccomp"
>> +@@ -267,9 +267,6 @@ RUN ln -sfv /go/src/github.com/docker/docker/.bashr=
c
>> ~/.bashrc
>> + RUN echo "source /usr/share/bash-completion/bash_completion" >>
>> /etc/bash.bashrc
>> + RUN ln -s /usr/local/completion/bash/docker
>> /etc/bash_completion.d/docker
>> + RUN ldconfig
>> +-# Set dev environment as safe git directory to prevent "dubious
>> ownership" errors
>> +-# when bind-mounting the source into the dev-container. See
>> https://github.com/moby/moby/pull/44930
>> +-RUN <https://github.com/moby/moby/pull/44930+-RUN> git config --global
>> --add safe.directory $GOPATH/src/github.com/docker/docker
>> + # This should only install packages that are specifically needed for
>> the dev environment and nothing else
>> + # Do you really need to add another package here? Can it be done in a
>> different build stage?
>> + RUN
>> --mount=3Dtype=3Dcache,sharing=3Dlocked,id=3Dmoby-dev-aptlib,target=3D/v=
ar/lib/apt \
>> +@@ -316,12 +313,7 @@ COPY --from=3Dswagger       /build/ /usr/local/bin=
/
>> + COPY --from=3Dtomlv         /build/ /usr/local/bin/
>> + COPY --from=3Dtini          /build/ /usr/local/bin/
>> + COPY --from=3Dregistry      /build/ /usr/local/bin/
>> +-
>> +-# Skip the CRIU stage for now, as the opensuse package repository is
>> sometimes
>> +-# unstable, and we're currently not using it in CI.
>> +-#
>> +-# FIXME(thaJeztah): re-enable this stage when
>> https://github.com/moby/moby/issues/38963 is resolved (see
>> https://github.com/moby/moby/pull/38984)
>> +-# COPY --from=3Dcriu          /build/ /usr/local/
>> ++COPY --from=3Dcriu          /build/ /usr/local/
>> + COPY --from=3Dvndr          /build/ /usr/local/bin/
>> + COPY --from=3Dgotestsum     /build/ /usr/local/bin/
>> + COPY --from=3Dgolangci_lint /build/ /usr/local/bin/
>> +diff --git a/Dockerfile.e2e b/Dockerfile.e2e
>> +index 31f836fc16..f92bec85b0 100644
>> +--- a/Dockerfile.e2e
>> ++++ b/Dockerfile.e2e
>> +@@ -1,4 +1,4 @@
>> +-ARG GO_VERSION=3D1.19.12
>> ++ARG GO_VERSION=3D1.18.7
>> +
>> + FROM golang:${GO_VERSION}-alpine AS base
>> + ENV GO111MODULE=3Doff
>> +diff --git a/Dockerfile.simple b/Dockerfile.simple
>> +index af5fc13c25..8aa6d7ff94 100644
>> +--- a/Dockerfile.simple
>> ++++ b/Dockerfile.simple
>> +@@ -5,7 +5,7 @@
>> +
>> + # This represents the bare minimum required to build and test Docker.
>> +
>> +-ARG GO_VERSION=3D1.19.12
>> ++ARG GO_VERSION=3D1.18.7
>> +
>> + FROM golang:${GO_VERSION}-buster
>> + ENV GO111MODULE=3Doff
>> +diff --git a/Dockerfile.windows b/Dockerfile.windows
>> +index 7c2fe66389..6f8242decc 100644
>> +--- a/Dockerfile.windows
>> ++++ b/Dockerfile.windows
>> +@@ -165,8 +165,8 @@ FROM microsoft/windowsservercore
>> + # Use PowerShell as the default shell
>> + SHELL ["powershell", "-Command", "$ErrorActionPreference =3D 'Stop';
>> $ProgressPreference =3D 'SilentlyContinue';"]
>> +
>> +-ARG GO_VERSION=3D1.19.12
>> +-ARG GOTESTSUM_VERSION=3Dv1.8.2
>> ++ARG GO_VERSION=3D1.18.7
>> ++ARG GOTESTSUM_VERSION=3Dv1.7.0
>> +
>> + # Environment variable notes:
>> + #  - GO_VERSION must be consistent with 'Dockerfile' used by Linux.
>> +diff --git a/hack/dockerfile/install/gotestsum.installer
>> b/hack/dockerfile/install/gotestsum.installer
>> +index 8e88fec77b..5024179958 100755
>> +--- a/hack/dockerfile/install/gotestsum.installer
>> ++++ b/hack/dockerfile/install/gotestsum.installer
>> +@@ -1,6 +1,6 @@
>> + #!/bin/sh
>> +
>> +-: ${GOTESTSUM_VERSION:=3Dv1.8.2}
>> ++: ${GOTESTSUM_VERSION:=3Dv1.7.0}
>> +
>> + install_gotestsum() (
>> +       set -e
>> diff --git
>> a/recipes-containers/docker/files/0001-revert-go-1.8-update.patch
>> b/recipes-containers/docker/files/0002-Revert-go-updates-from-1.18.7-to-=
1.17.13.patch
>> similarity index 97%
>> rename from
>> recipes-containers/docker/files/0001-revert-go-1.8-update.patch
>> rename to
>> recipes-containers/docker/files/0002-Revert-go-updates-from-1.18.7-to-1.=
17.13.patch
>> index 0298c31..7cacccb 100644
>> --- a/recipes-containers/docker/files/0001-revert-go-1.8-update.patch
>> +++
>> b/recipes-containers/docker/files/0002-Revert-go-updates-from-1.18.7-to-=
1.17.13.patch
>> @@ -1,8 +1,7 @@
>>  From 575302e9c6567b8547b308b2b0c6a07b27e3be3b Mon Sep 17 00:00:00 2001
>>  From: Adrian Freihofer <adrian.freihofer@siemens.com>
>>  Date: Sun, 4 Dec 2022 18:02:54 +0100
>> -Subject: [PATCH] Revert "Merge pull request #43976 from
>> - thaJeztah/20.10_backport_bump_golang_1.18"
>> +Subject: [PATCH] Revert go updates from 1.18.7 to 1.17.13
>>
>>  Upstream-Status: Inapropriate
>>
>> @@ -25,12 +24,11 @@ changes made to
>> 32debe0986f4516bfe17bf9122447f0c735e61b4.
>>   vendor/archive/tar/reader_test.go     |  30 +++---
>>   vendor/archive/tar/stat_actime1.go    |   1 +
>>   vendor/archive/tar/stat_actime2.go    |   1 +
>> - vendor/archive/tar/stat_unix.go       |   1 +
>>   vendor/archive/tar/strconv.go         |  43 +++++---
>>   vendor/archive/tar/tar_test.go        |   2 +-
>>   vendor/archive/tar/writer.go          |  89 ++++++++---------
>>   vendor/archive/tar/writer_test.go     |  24 +++--
>> - 18 files changed, 251 insertions(+), 312 deletions(-)
>> + 17 files changed, 250 insertions(+), 312 deletions(-)
>>   delete mode 100644 vendor/archive/tar/fuzz_test.go
>>
>>  diff --git a/Dockerfile b/Dockerfile
>> @@ -109,10 +107,10 @@ index c34a5add11..50ed9293c1 100644
>>
>>   var generatedTempl =3D
>> template.Must(template.New("rpc_cient").Funcs(templFuncs).Parse(`
>>  diff --git a/vendor/archive/tar/common.go b/vendor/archive/tar/common.g=
o
>> -index c99b5c1920..c667cfc872 100644
>> +index f6d701d925..8706ede431 100644
>>  --- a/vendor/archive/tar/common.go
>>  +++ b/vendor/archive/tar/common.go
>> -@@ -316,10 +316,10 @@ func invertSparseEntries(src []sparseEntry, size
>> int64) []sparseEntry {
>> +@@ -319,10 +319,10 @@ func invertSparseEntries(src []sparseEntry, size
>> int64) []sparseEntry {
>>   // fileState tracks the number of logical (includes sparse holes) and
>> physical
>>   // (actual in tar archive) bytes remaining for the current file.
>>   //
>> @@ -126,7 +124,7 @@ index c99b5c1920..c667cfc872 100644
>>   }
>>
>>   // allowedFormats determines which formats can be used.
>> -@@ -413,22 +413,22 @@ func (h Header) allowedFormats() (format Format,
>> paxHdrs map[string]string, err
>> +@@ -416,22 +416,22 @@ func (h Header) allowedFormats() (format Format,
>> paxHdrs map[string]string, err
>>
>>         // Check basic fields.
>>         var blk block
>> @@ -165,7 +163,7 @@ index c99b5c1920..c667cfc872 100644
>>
>>         // Check for header-only types.
>>         var whyOnlyPAX, whyOnlyGNU string
>> -@@ -538,7 +538,7 @@ type headerFileInfo struct {
>> +@@ -541,7 +541,7 @@ type headerFileInfo struct {
>>   func (fi headerFileInfo) Size() int64        { return fi.h.Size }
>>   func (fi headerFileInfo) IsDir() bool        { return fi.Mode().IsDir(=
)
>> }
>>   func (fi headerFileInfo) ModTime() time.Time { return fi.h.ModTime }
>> @@ -474,7 +472,7 @@ index e73e0d2609..0000000000
>>  -      })
>>  -}
>>  diff --git a/vendor/archive/tar/reader.go b/vendor/archive/tar/reader.g=
o
>> -index e609c15f27..f645af8016 100644
>> +index 45848304ed..ca32bdea1f 100644
>>  --- a/vendor/archive/tar/reader.go
>>  +++ b/vendor/archive/tar/reader.go
>>  @@ -65,7 +65,7 @@ func (tr *Reader) next() (*Header, error) {
>> @@ -821,20 +819,8 @@ index f76d6be220..5a9a35cbb4 100644
>>
>>   package tar
>>
>> -diff --git a/vendor/archive/tar/stat_unix.go
>> b/vendor/archive/tar/stat_unix.go
>> -index b743c76b8c..4a5bca0312 100644
>> ---- a/vendor/archive/tar/stat_unix.go
>> -+++ b/vendor/archive/tar/stat_unix.go
>> -@@ -3,6 +3,7 @@
>> - // license that can be found in the LICENSE file.
>> -
>> - //go:build aix || linux || darwin || dragonfly || freebsd || openbsd |=
|
>> netbsd || solaris
>> -+// +build aix linux darwin dragonfly freebsd openbsd netbsd solaris
>> -
>> - package tar
>> -
>>  diff --git a/vendor/archive/tar/strconv.go
>> b/vendor/archive/tar/strconv.go
>> -index 275db6f026..f0b61e6dba 100644
>> +index ac3196370e..fde45c9dbf 100644
>>  --- a/vendor/archive/tar/strconv.go
>>  +++ b/vendor/archive/tar/strconv.go
>>  @@ -14,7 +14,7 @@ import (
>> @@ -916,7 +902,7 @@ index 275db6f026..f0b61e6dba 100644
>>
>>         if !validPAXRecord(k, v) {
>>                 return "", "", s, ErrHeader
>> -@@ -314,7 +333,7 @@ func formatPAXRecord(k, v string) (string, error) {
>> +@@ -315,7 +334,7 @@ func formatPAXRecord(k, v string) (string, error) {
>>   // for the PAX version of the USTAR string fields.
>>   // The key must not contain an '=3D' character.
>>   func validPAXRecord(k, v string) bool {
>> @@ -1213,6 +1199,3 @@ index 640264984a..4e709e5cac 100644
>>                                 }
>>                         default:
>>                                 t.Fatalf("test %d.%d, unknown test
>> operation: %T", i, j, tf)
>> ---
>> -2.38.1
>> -
>> diff --git
>> a/recipes-containers/docker/files/0003-builder.go-avoid-using-strings.Cu=
t-from-go-1.18.patch
>> b/recipes-containers/docker/files/0003-builder.go-avoid-using-strings.Cu=
t-from-go-1.18.patch
>> new file mode 100644
>> index 0000000..0574d9e
>> --- /dev/null
>> +++
>> b/recipes-containers/docker/files/0003-builder.go-avoid-using-strings.Cu=
t-from-go-1.18.patch
>> @@ -0,0 +1,32 @@
>> +From 6867fc1f6bd01596c2d3dc7bc07e26fa98965185 Mon Sep 17 00:00:00 2001
>> +From: Martin Jansa <Martin.Jansa@gmail.com>
>> +Date: Mon, 14 Aug 2023 16:41:42 +0200
>> +Subject: [PATCH] builder.go: avoid using strings.Cut from go-1.18
>> +
>> +* we're still using go-1.17
>> +
>> +Upstream-Status: Inapropriate
>> +---
>> + builder/builder-next/builder.go | 7 +++++--
>> + 1 file changed, 5 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/builder/builder-next/builder.go
>> b/builder/builder-next/builder.go
>> +index ee6b9f0fb1..a9bda8c370 100644
>> +--- a/builder/builder-next/builder.go
>> ++++ b/builder/builder-next/builder.go
>> +@@ -555,10 +555,13 @@ func toBuildkitExtraHosts(inp []string,
>> hostGatewayIP net.IP) (string, error) {
>> +       }
>> +       hosts :=3D make([]string, 0, len(inp))
>> +       for _, h :=3D range inp {
>> +-              host, ip, ok :=3D strings.Cut(h, ":")
>> +-              if !ok || host =3D=3D "" || ip =3D=3D "" {
>> ++              parts :=3D strings.Split(h, ":")
>> ++
>> ++              if len(parts) !=3D 2 || parts[0] =3D=3D "" || parts[1] =
=3D=3D "" {
>> +                       return "", errors.Errorf("invalid host %s", h)
>> +               }
>> ++              host :=3D parts[0]
>> ++              ip :=3D parts[1]
>> +               // If the IP Address is a "host-gateway", replace this
>> value with the
>> +               // IP address stored in the daemon level HostGatewayIP
>> config variable.
>> +               if ip =3D=3D opts.HostGatewayName {
>> --
>> 2.41.0
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8189):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8189
> Mute This Topic: https://lists.yoctoproject.org/mt/100738603/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000374a5f0602e6aeef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 14, 2023 at 5:17=E2=80=AF=
PM Martin Jansa via <a href=3D"http://lists.yoctoproject.org">lists.yoctopr=
oject.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.yoctopro=
ject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">RFC, because I&#=
39;ve only build tested this in kirkstone, waiting for whole image to build=
 to test it in runtime</div></blockquote><div><br></div><div>Passed minimal=
 sanity check on rpi4-64:</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, Aug 14, 2023 at 5:14=E2=80=AFPM Martin Jansa &lt;<=
a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">* since this backport:<br>
=C2=A0 <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/185082" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-core/message/185082</a><br>
=C2=A0 landed in kirkstone:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=
=3Dkirkstone&amp;id=3D5dc74138649ab7a2c0158a43225dc7a8fd732355" rel=3D"nore=
ferrer" target=3D"_blank">https://git.openembedded.org/openembedded-core/co=
mmit/?h=3Dkirkstone&amp;id=3D5dc74138649ab7a2c0158a43225dc7a8fd732355</a><b=
r>
<br>
=C2=A0 docker cannot access network and fails with:<br>
=C2=A0 &quot;http: invalid Host header&quot;<br>
<br>
=C2=A0 update to latest commit in 20.10 branch, because latest tag v20.10.2=
5<br>
=C2=A0 have the fix yet:<br>
=C2=A0 <a href=3D"https://github.com/moby/moby/compare/v20.10.21...v20.10.2=
5" rel=3D"noreferrer" target=3D"_blank">https://github.com/moby/moby/compar=
e/v20.10.21...v20.10.25</a><br>
<br>
=C2=A0 so we need couple more commits from upstream:<br>
=C2=A0 <a href=3D"https://github.com/moby/moby/compare/v20.10.25...791d8ab8=
7747169b4cbfcdf2fd57c81952bae6d5" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/moby/moby/compare/v20.10.25...791d8ab87747169b4cbfcdf2fd57c8=
1952bae6d5</a><br>
<br>
=C2=A0 Adjust the go version revert which was here since the upgrade to v20=
.10.21:<br>
=C2=A0 <a href=3D"https://git.yoctoproject.org/meta-virtualization/commit/?=
h=3Dkirkstone&amp;id=3D927537108bcf2b98859512ce3eae59a73439994d" rel=3D"nor=
eferrer" target=3D"_blank">https://git.yoctoproject.org/meta-virtualization=
/commit/?h=3Dkirkstone&amp;id=3D927537108bcf2b98859512ce3eae59a73439994d</a=
><br>
<br>
=C2=A0 and add another revert for the go upgrades from upstream for this ol=
der<br>
=C2=A0 patch to apply.<br>
<br>
* update cli to latest in 20.10 branch as well:<br>
=C2=A0 <a href=3D"https://github.com/docker/cli/compare/baeda1f82a10204ec57=
08d5fbba130ad76cfee49..911449ca245308472a3d34a7f1a98b918e65c8c3" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/docker/cli/compare/baeda1f82a=
10204ec5708d5fbba130ad76cfee49..911449ca245308472a3d34a7f1a98b918e65c8c3</a=
><br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker-ce_git.bb" rel=3D"=
noreferrer" target=3D"_blank">docker-ce_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 27 =
++--<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a>=C2=A0 |=C2=A0 29 +=
+--<br>
=C2=A0...rt-go-updates-from-1.19.12-to-1.18.7.patch | 144 +++++++++++++++++=
+<br>
=C2=A0...t-go-updates-from-1.18.7-to-1.17.13.patch} |=C2=A0 35 ++---<br>
=C2=A0...avoid-using-strings.Cut-from-go-1.18.patch |=C2=A0 32 ++++<br>
=C2=A05 files changed, 218 insertions(+), 49 deletions(-)<br>
=C2=A0create mode 100644 recipes-containers/docker/files/0001-Revert-go-upd=
ates-from-1.19.12-to-1.18.7.patch<br>
=C2=A0rename recipes-containers/docker/files/{0001-revert-go-1.8-update.pat=
ch =3D&gt; 0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch} (97%)<br>
=C2=A0create mode 100644 recipes-containers/docker/files/0003-builder.go-av=
oid-using-strings.Cut-from-go-1.18.patch<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker-ce_git.bb" =
rel=3D"noreferrer" target=3D"_blank">docker-ce_git.bb</a> b/recipes-contain=
ers/docker/<a href=3D"http://docker-ce_git.bb" rel=3D"noreferrer" target=3D=
"_blank">docker-ce_git.bb</a><br>
index a41e83a..76ac41e 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker-ce_git.bb" rel=3D"=
noreferrer" target=3D"_blank">docker-ce_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker-ce_git.bb" rel=3D"=
noreferrer" target=3D"_blank">docker-ce_git.bb</a><br>
@@ -33,18 +33,20 @@ DESCRIPTION =3D &quot;Linux container runtime \<br>
<br>
=C2=A0SRCREV_docker =3D &quot;3056208812eb5e792fa99736c9167d1e10f4ab49&quot=
;<br>
=C2=A0SRCREV_libnetwork =3D &quot;dcdf8f176d1e13ad719e913e796fb698d846de98&=
quot;<br>
-SRCREV_cli =3D &quot;baeda1f82a10204ec5708d5fbba130ad76cfee49&quot;<br>
+SRCREV_cli =3D &quot;911449ca245308472a3d34a7f1a98b918e65c8c3&quot;<br>
=C2=A0SRCREV_FORMAT =3D &quot;docker_libnetwork&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/docker/docke=
r.git;branch=3D20.10;name=3Ddocker;protocol=3Dhttps" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/docker/docker.git;branch=3D20.10;name=3Ddocker;pr=
otocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/docker/libne=
twork.git;branch=3Dmaster;name=3Dlibnetwork;destsuffix=3Dgit/libnetwork;pro=
tocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/docker/libne=
twork.git;branch=3Dmaster;name=3Dlibnetwork;destsuffix=3Dgit/libnetwork;pro=
tocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/docker/cli;b=
ranch=3D20.10;name=3Dcli;destsuffix=3Dgit/cli;protocol=3Dhttps" rel=3D"nore=
ferrer" target=3D"_blank">github.com/docker/cli;branch=3D20.10;name=3Dcli;d=
estsuffix=3Dgit/cli;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-libnetwork-use-GO-instead-of-go.pat=
ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://docker.init \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-dynbinary-use-go-cross-compiler.pa=
tch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cli-use-external-GO111MODULE-and-c=
ross-compiler.patch \<br>
-=C2=A0 =C2=A0 file://0001-revert-go-1.8-update.patch;patchdir=3Dsrc/import=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/docker/docker.git;branch=
=3D20.10;name=3Ddocker;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blan=
k">github.com/docker/docker.git;branch=3D20.10;name=3Ddocker;protocol=3Dhtt=
ps</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/docker/libnetwork.git;bra=
nch=3Dmaster;name=3Dlibnetwork;destsuffix=3Dgit/libnetwork;protocol=3Dhttps=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/libnetwork.git;bra=
nch=3Dmaster;name=3Dlibnetwork;destsuffix=3Dgit/libnetwork;protocol=3Dhttps=
</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/docker/cli;branch=3D20.10=
;name=3Dcli;destsuffix=3Dgit/cli;protocol=3Dhttps" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/docker/cli;branch=3D20.10;name=3Dcli;destsuffix=3Dg=
it/cli;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 file://0001-libnetwork-use-GO-instead-of-go.patch \<br>
+=C2=A0 =C2=A0 file://docker.init \<br>
+=C2=A0 =C2=A0 file://0001-dynbinary-use-go-cross-compiler.patch \<br>
+=C2=A0 =C2=A0 file://0001-cli-use-external-GO111MODULE-and-cross-compiler.=
patch \<br>
+=C2=A0 =C2=A0 file://0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch;p=
atchdir=3Dsrc/import \<br>
+=C2=A0 =C2=A0 file://0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch;p=
atchdir=3Dsrc/import \<br>
+=C2=A0 =C2=A0 file://0003-builder.go-avoid-using-strings.Cut-from-go-1.18.=
patch;patchdir=3Dsrc/import \<br>
+&quot;<br>
<br>
=C2=A0DOCKER_COMMIT =3D &quot;${SRCREV_docker}&quot;<br>
<br>
@@ -54,7 +56,10 @@ require docker.inc<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=3D4859e97a9c=
7780e77972d989f0823f28&quot;<br>
<br>
-DOCKER_VERSION =3D &quot;20.10.21-ce&quot;<br>
+# 58 commits after v20.10.25 to include the fixes for go compatibility aft=
er<br>
+# <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/18=
5082" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g=
/openembedded-core/message/185082</a><br>
+# <a href=3D"https://github.com/moby/moby/compare/v20.10.25...791d8ab87747=
169b4cbfcdf2fd57c81952bae6d5" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/moby/moby/compare/v20.10.25...791d8ab87747169b4cbfcdf2fd57c81952=
bae6d5</a><br>
+DOCKER_VERSION =3D &quot;20.10.25-ce&quot;<br>
=C2=A0PV =3D &quot;${DOCKER_VERSION}+git${SRCREV_docker}&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;docker mobyproject:moby&quot;<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb=
" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a> b/recipes-con=
tainers/docker/<a href=3D"http://docker-moby_git.bb" rel=3D"noreferrer" tar=
get=3D"_blank">docker-moby_git.bb</a><br>
index b048208..5f8de07 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
@@ -34,20 +34,22 @@ DESCRIPTION =3D &quot;Linux container runtime \<br>
=C2=A0#=C2=A0 =C2=A0- The common components of this recipe and docker-ce do=
 need to be moved<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0to a docker.inc recipe<br>
<br>
-SRCREV_moby =3D &quot;3056208812eb5e792fa99736c9167d1e10f4ab49&quot;<br>
+SRCREV_moby =3D &quot;791d8ab87747169b4cbfcdf2fd57c81952bae6d5&quot;<br>
=C2=A0SRCREV_libnetwork =3D &quot;dcdf8f176d1e13ad719e913e796fb698d846de98&=
quot;<br>
-SRCREV_cli =3D &quot;baeda1f82a10204ec5708d5fbba130ad76cfee49&quot;<br>
+SRCREV_cli =3D &quot;911449ca245308472a3d34a7f1a98b918e65c8c3&quot;<br>
=C2=A0SRCREV_FORMAT =3D &quot;moby_libnetwork&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/moby/moby.gi=
t;branch=3D20.10;name=3Dmoby;protocol=3Dhttps" rel=3D"noreferrer" target=3D=
"_blank">github.com/moby/moby.git;branch=3D20.10;name=3Dmoby;protocol=3Dhtt=
ps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/docker/libne=
twork.git;branch=3Dmaster;name=3Dlibnetwork;destsuffix=3Dgit/libnetwork;pro=
tocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/docker/libne=
twork.git;branch=3Dmaster;name=3Dlibnetwork;destsuffix=3Dgit/libnetwork;pro=
tocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/docker/cli;b=
ranch=3D20.10;name=3Dcli;destsuffix=3Dgit/cli;protocol=3Dhttps" rel=3D"nore=
ferrer" target=3D"_blank">github.com/docker/cli;branch=3D20.10;name=3Dcli;d=
estsuffix=3Dgit/cli;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://docker.init \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-libnetwork-use-GO-instead-of-go.pat=
ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cli-use-external-GO111MODULE-and-c=
ross-compiler.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-dynbinary-use-go-cross-compiler.pa=
tch \<br>
-=C2=A0 =C2=A0 file://0001-revert-go-1.8-update.patch;patchdir=3Dsrc/import=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/moby/moby.git;branch=3D20=
.10;name=3Dmoby;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/moby/moby.git;branch=3D20.10;name=3Dmoby;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/docker/libnetwork.git;bra=
nch=3Dmaster;name=3Dlibnetwork;destsuffix=3Dgit/libnetwork;protocol=3Dhttps=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/libnetwork.git;bra=
nch=3Dmaster;name=3Dlibnetwork;destsuffix=3Dgit/libnetwork;protocol=3Dhttps=
</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/docker/cli;branch=3D20.10=
;name=3Dcli;destsuffix=3Dgit/cli;protocol=3Dhttps" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/docker/cli;branch=3D20.10;name=3Dcli;destsuffix=3Dg=
it/cli;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 file://docker.init \<br>
+=C2=A0 =C2=A0 file://0001-libnetwork-use-GO-instead-of-go.patch \<br>
+=C2=A0 =C2=A0 file://0001-cli-use-external-GO111MODULE-and-cross-compiler.=
patch \<br>
+=C2=A0 =C2=A0 file://0001-dynbinary-use-go-cross-compiler.patch \<br>
+=C2=A0 =C2=A0 file://0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch;p=
atchdir=3Dsrc/import \<br>
+=C2=A0 =C2=A0 file://0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch;p=
atchdir=3Dsrc/import \<br>
+=C2=A0 =C2=A0 file://0003-builder.go-avoid-using-strings.Cut-from-go-1.18.=
patch;patchdir=3Dsrc/import \<br>
+&quot;<br>
<br>
=C2=A0DOCKER_COMMIT =3D &quot;${SRCREV_moby}&quot;<br>
<br>
@@ -57,7 +59,10 @@ require docker.inc<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=3D4859e97a9c=
7780e77972d989f0823f28&quot;<br>
<br>
-DOCKER_VERSION =3D &quot;20.10.21&quot;<br>
+# 58 commits after v20.10.25 to include the fixes for go compatibility aft=
er<br>
+# <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/18=
5082" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g=
/openembedded-core/message/185082</a><br>
+# <a href=3D"https://github.com/moby/moby/compare/v20.10.25...791d8ab87747=
169b4cbfcdf2fd57c81952bae6d5" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/moby/moby/compare/v20.10.25...791d8ab87747169b4cbfcdf2fd57c81952=
bae6d5</a><br>
+DOCKER_VERSION =3D &quot;20.10.25&quot;<br>
=C2=A0PV =3D &quot;${DOCKER_VERSION}+git${SRCREV_moby}&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;docker mobyproject:moby&quot;<br>
diff --git a/recipes-containers/docker/files/0001-Revert-go-updates-from-1.=
19.12-to-1.18.7.patch b/recipes-containers/docker/files/0001-Revert-go-upda=
tes-from-1.19.12-to-1.18.7.patch<br>
new file mode 100644<br>
index 0000000..2a3f3b9<br>
--- /dev/null<br>
+++ b/recipes-containers/docker/files/0001-Revert-go-updates-from-1.19.12-t=
o-1.18.7.patch<br>
@@ -0,0 +1,144 @@<br>
+From 2cc349a336cd3cb4fa33554216a99dbce3879d29 Mon Sep 17 00:00:00 2001<br>
+From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D=
"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+Date: Mon, 14 Aug 2023 16:02:30 +0200<br>
+Subject: [PATCH] Revert go updates from 1.19.12 to 1.18.7<br>
+<br>
+To continue using 1.17 version as implemented for some reason in:<br>
+<a href=3D"https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dki=
rkstone&amp;id=3D927537108bcf2b98859512ce3eae59a73439994d" rel=3D"noreferre=
r" target=3D"_blank">https://git.yoctoproject.org/meta-virtualization/commi=
t/?h=3Dkirkstone&amp;id=3D927537108bcf2b98859512ce3eae59a73439994d</a><br>
+with 0001-revert-go-1.8-update.patch<br>
+<br>
+Revert &quot;update to go1.19.12&quot;<br>
+This reverts commit c42d7c7f6d0dccfe5d85f0126da2c8ec77573616.<br>
+Revert &quot;[20.10] update go to go1.19.11&quot;<br>
+This reverts commit 43fe787c232c54b53bda21301bbf3a463c4e4056.<br>
+Revert &quot;[20.10] update go to go1.19.10&quot;<br>
+This reverts commit 99f10dec91409c4f6ed2c4867638f4e5ea678f0a.<br>
+Revert &quot;Dockerfile: temporarily skip CRIU stage&quot;<br>
+This reverts commit af0477880cc8c0197517c0bc8de0cbd6cb9bd9a9.<br>
+Revert &quot;[20.10] update go to go1.19.9&quot;<br>
+This reverts commit 7f91a52b8969f5604fdca36ee30475cc9600be5b.<br>
+Revert &quot;[20.10] update go to go1.19.8&quot;<br>
+This reverts commit a09b3e9cf9de906438a6300760754fcb087f166a.<br>
+Revert &quot;update to go1.19.7&quot;<br>
+This reverts commit 9aa5d55a8ba8725133a6fbb5ac98d1fab341fdc7.<br>
+Revert &quot;update to go1.19.6&quot;<br>
+This reverts commit 98c9e3f43833bf87c21e02aca77c75c7a475ecd6.<br>
+Revert &quot;update to go1.19.5&quot;<br>
+This reverts commit 5b48f300dd0c6a2bbfc942408bc7e3fbc39609f0.<br>
+Revert &quot;update to go1.19.4&quot;<br>
+This reverts commit 82b0ac1166cc553e2757c5d490ce69078064ef6e.<br>
+Revert &quot;Update to Go 1.19.3 to address CVE-2022-41716&quot;<br>
+This reverts commit 4701ca9f719f5386d2ca2417b566b5950aa8a929.<br>
+Revert &quot;Update to go 1.19.2 to address CVE-2022-2879, CVE-2022-2880, =
CVE-2022-41715&quot;<br>
+This reverts commit 1c8c16524f94ae69eb33c5c9000e87615ce973a6.<br>
+Revert &quot;Update to go 1.19.1 to address CVE-2022-27664, CVE-2022-32190=
&quot;<br>
+This reverts commit 6cc1ef32a28e7e6e74383d4775bd178d36495181.<br>
+Revert &quot;update to golang 1.19&quot;<br>
+This reverts commit 5091f13a5d027b785084028aedb03beb5b0bd9a6.<br>
+Revert &quot;Dockerfile: configure code dir as &quot;safe&quot; directory&=
quot;<br>
+This reverts commit 0312e468da5c99267654d5c6b62785e29ffe6e0d.<br>
+Revert &quot;[20.10] update to go1.18.10&quot;<br>
+This reverts commit 625903f3fda862c69492256016b386628954b3a4.<br>
+Revert &quot;[20.10] update gotestsum to v1.8.2&quot;<br>
+This reverts commit edca413033cea5252f69bfc740e9450e5d0a0ef9.<br>
+Revert &quot;[20.10] update to go1.18.9&quot;<br>
+This reverts commit f8b0d77bfe109c5248ba6eb6c6db7f32e99a2e75.<br>
+Revert &quot;[20.10] update to Go 1.18.8 to address CVE-2022-41716&quot;<b=
r>
+This reverts commit 0211f9e44dba888fa62dc2ba59ea573ad70e9708.<br>
+<br>
+Upstream-Status: Inapropriate<br>
+---<br>
+ Dockerfile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++----------<b=
r>
+ Dockerfile.e2e=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
+ Dockerfile.simple=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
+ Dockerfile.windows=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
+ hack/dockerfile/install/gotestsum.installer |=C2=A0 2 +-<br>
+ 5 files changed, 7 insertions(+), 15 deletions(-)<br>
+<br>
+diff --git a/Dockerfile b/Dockerfile<br>
+index 4ee4d8dd2c..9472c512a6 100644<br>
+--- a/Dockerfile<br>
++++ b/Dockerfile<br>
+@@ -3,7 +3,7 @@<br>
+ ARG CROSS=3D&quot;false&quot;<br>
+ ARG SYSTEMD=3D&quot;false&quot;<br>
+ # IMPORTANT: When updating this please note that stdlib archive/tar pkg i=
s vendored<br>
+-ARG GO_VERSION=3D1.19.12<br>
++ARG GO_VERSION=3D1.18.7<br>
+ ARG DEBIAN_FRONTEND=3Dnoninteractive<br>
+ ARG VPNKIT_VERSION=3D0.5.0<br>
+ ARG DOCKER_BUILDTAGS=3D&quot;apparmor seccomp&quot;<br>
+@@ -267,9 +267,6 @@ RUN ln -sfv /go/src/<a href=3D"http://github.com/docke=
r/docker/.bashrc" rel=3D"noreferrer" target=3D"_blank">github.com/docker/do=
cker/.bashrc</a> ~/.bashrc<br>
+ RUN echo &quot;source /usr/share/bash-completion/bash_completion&quot; &g=
t;&gt; /etc/bash.bashrc<br>
+ RUN ln -s /usr/local/completion/bash/docker /etc/bash_completion.d/docker=
<br>
+ RUN ldconfig<br>
+-# Set dev environment as safe git directory to prevent &quot;dubious owne=
rship&quot; errors<br>
+-# when bind-mounting the source into the dev-container. See <a href=3D"ht=
tps://github.com/moby/moby/pull/44930+-RUN" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/moby/moby/pull/44930<br>
+-RUN</a> git config --global --add safe.directory $GOPATH/src/<a href=3D"h=
ttp://github.com/docker/docker" rel=3D"noreferrer" target=3D"_blank">github=
.com/docker/docker</a><br>
+ # This should only install packages that are specifically needed for the =
dev environment and nothing else<br>
+ # Do you really need to add another package here? Can it be done in a dif=
ferent build stage?<br>
+ RUN --mount=3Dtype=3Dcache,sharing=3Dlocked,id=3Dmoby-dev-aptlib,target=
=3D/var/lib/apt \<br>
+@@ -316,12 +313,7 @@ COPY --from=3Dswagger=C2=A0 =C2=A0 =C2=A0 =C2=A0/buil=
d/ /usr/local/bin/<br>
+ COPY --from=3Dtomlv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/build/ /usr/local/b=
in/<br>
+ COPY --from=3Dtini=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /build/ /usr/local/b=
in/<br>
+ COPY --from=3Dregistry=C2=A0 =C2=A0 =C2=A0 /build/ /usr/local/bin/<br>
+-<br>
+-# Skip the CRIU stage for now, as the opensuse package repository is some=
times<br>
+-# unstable, and we&#39;re currently not using it in CI.<br>
+-#<br>
+-# FIXME(thaJeztah): re-enable this stage when <a href=3D"https://github.c=
om/moby/moby/issues/38963" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/moby/moby/issues/38963</a> is resolved (see <a href=3D"https://gith=
ub.com/moby/moby/pull/38984" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/moby/moby/pull/38984</a>)<br>
+-# COPY --from=3Dcriu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /build/ /usr/local=
/<br>
++COPY --from=3Dcriu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /build/ /usr/local/<=
br>
+ COPY --from=3Dvndr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /build/ /usr/local/b=
in/<br>
+ COPY --from=3Dgotestsum=C2=A0 =C2=A0 =C2=A0/build/ /usr/local/bin/<br>
+ COPY --from=3Dgolangci_lint /build/ /usr/local/bin/<br>
+diff --git a/Dockerfile.e2e b/Dockerfile.e2e<br>
+index 31f836fc16..f92bec85b0 100644<br>
+--- a/Dockerfile.e2e<br>
++++ b/Dockerfile.e2e<br>
+@@ -1,4 +1,4 @@<br>
+-ARG GO_VERSION=3D1.19.12<br>
++ARG GO_VERSION=3D1.18.7<br>
+ <br>
+ FROM golang:${GO_VERSION}-alpine AS base<br>
+ ENV GO111MODULE=3Doff<br>
+diff --git a/Dockerfile.simple b/Dockerfile.simple<br>
+index af5fc13c25..8aa6d7ff94 100644<br>
+--- a/Dockerfile.simple<br>
++++ b/Dockerfile.simple<br>
+@@ -5,7 +5,7 @@<br>
+ <br>
+ # This represents the bare minimum required to build and test Docker.<br>
+ <br>
+-ARG GO_VERSION=3D1.19.12<br>
++ARG GO_VERSION=3D1.18.7<br>
+ <br>
+ FROM golang:${GO_VERSION}-buster<br>
+ ENV GO111MODULE=3Doff<br>
+diff --git a/Dockerfile.windows b/Dockerfile.windows<br>
+index 7c2fe66389..6f8242decc 100644<br>
+--- a/Dockerfile.windows<br>
++++ b/Dockerfile.windows<br>
+@@ -165,8 +165,8 @@ FROM microsoft/windowsservercore<br>
+ # Use PowerShell as the default shell<br>
+ SHELL [&quot;powershell&quot;, &quot;-Command&quot;, &quot;$ErrorActionPr=
eference =3D &#39;Stop&#39;; $ProgressPreference =3D &#39;SilentlyContinue&=
#39;;&quot;]<br>
+ <br>
+-ARG GO_VERSION=3D1.19.12<br>
+-ARG GOTESTSUM_VERSION=3Dv1.8.2<br>
++ARG GO_VERSION=3D1.18.7<br>
++ARG GOTESTSUM_VERSION=3Dv1.7.0<br>
+ <br>
+ # Environment variable notes:<br>
+ #=C2=A0 - GO_VERSION must be consistent with &#39;Dockerfile&#39; used by=
 Linux.<br>
+diff --git a/hack/dockerfile/install/gotestsum.installer b/hack/dockerfile=
/install/gotestsum.installer<br>
+index 8e88fec77b..5024179958 100755<br>
+--- a/hack/dockerfile/install/gotestsum.installer<br>
++++ b/hack/dockerfile/install/gotestsum.installer<br>
+@@ -1,6 +1,6 @@<br>
+ #!/bin/sh<br>
+ <br>
+-: ${GOTESTSUM_VERSION:=3Dv1.8.2}<br>
++: ${GOTESTSUM_VERSION:=3Dv1.7.0}<br>
+ <br>
+ install_gotestsum() (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0set -e<br>
diff --git a/recipes-containers/docker/files/0001-revert-go-1.8-update.patc=
h b/recipes-containers/docker/files/0002-Revert-go-updates-from-1.18.7-to-1=
.17.13.patch<br>
similarity index 97%<br>
rename from recipes-containers/docker/files/0001-revert-go-1.8-update.patch=
<br>
rename to recipes-containers/docker/files/0002-Revert-go-updates-from-1.18.=
7-to-1.17.13.patch<br>
index 0298c31..7cacccb 100644<br>
--- a/recipes-containers/docker/files/0001-revert-go-1.8-update.patch<br>
+++ b/recipes-containers/docker/files/0002-Revert-go-updates-from-1.18.7-to=
-1.17.13.patch<br>
@@ -1,8 +1,7 @@<br>
=C2=A0From 575302e9c6567b8547b308b2b0c6a07b27e3be3b Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siemens=
.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
=C2=A0Date: Sun, 4 Dec 2022 18:02:54 +0100<br>
-Subject: [PATCH] Revert &quot;Merge pull request #43976 from<br>
- thaJeztah/20.10_backport_bump_golang_1.18&quot;<br>
+Subject: [PATCH] Revert go updates from 1.18.7 to 1.17.13<br>
<br>
=C2=A0Upstream-Status: Inapropriate<br>
<br>
@@ -25,12 +24,11 @@ changes made to 32debe0986f4516bfe17bf9122447f0c735e61b=
4.<br>
=C2=A0 vendor/archive/tar/reader_test.go=C2=A0 =C2=A0 =C2=A0|=C2=A0 30 +++-=
--<br>
=C2=A0 vendor/archive/tar/stat_actime1.go=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br=
>
=C2=A0 vendor/archive/tar/stat_actime2.go=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br=
>
- vendor/archive/tar/stat_unix.go=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01=
 +<br>
=C2=A0 vendor/archive/tar/strconv.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 43 +++++---<br>
=C2=A0 vendor/archive/tar/tar_test.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0 vendor/archive/tar/writer.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 89 ++++++++---------<br>
=C2=A0 vendor/archive/tar/writer_test.go=C2=A0 =C2=A0 =C2=A0|=C2=A0 24 +++-=
-<br>
- 18 files changed, 251 insertions(+), 312 deletions(-)<br>
+ 17 files changed, 250 insertions(+), 312 deletions(-)<br>
=C2=A0 delete mode 100644 vendor/archive/tar/fuzz_test.go<br>
<br>
=C2=A0diff --git a/Dockerfile b/Dockerfile<br>
@@ -109,10 +107,10 @@ index c34a5add11..50ed9293c1 100644<br>
<br>
=C2=A0 var generatedTempl =3D template.Must(template.New(&quot;rpc_cient&qu=
ot;).Funcs(templFuncs).Parse(`<br>
=C2=A0diff --git a/vendor/archive/tar/common.go b/vendor/archive/tar/common=
.go<br>
-index c99b5c1920..c667cfc872 100644<br>
+index f6d701d925..8706ede431 100644<br>
=C2=A0--- a/vendor/archive/tar/common.go<br>
=C2=A0+++ b/vendor/archive/tar/common.go<br>
-@@ -316,10 +316,10 @@ func invertSparseEntries(src []sparseEntry, size int=
64) []sparseEntry {<br>
+@@ -319,10 +319,10 @@ func invertSparseEntries(src []sparseEntry, size int=
64) []sparseEntry {<br>
=C2=A0 // fileState tracks the number of logical (includes sparse holes) an=
d physical<br>
=C2=A0 // (actual in tar archive) bytes remaining for the current file.<br>
=C2=A0 //<br>
@@ -126,7 +124,7 @@ index c99b5c1920..c667cfc872 100644<br>
=C2=A0 }<br>
<br>
=C2=A0 // allowedFormats determines which formats can be used.<br>
-@@ -413,22 +413,22 @@ func (h Header) allowedFormats() (format Format, pax=
Hdrs map[string]string, err<br>
+@@ -416,22 +416,22 @@ func (h Header) allowedFormats() (format Format, pax=
Hdrs map[string]string, err<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Check basic fields.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 var blk block<br>
@@ -165,7 +163,7 @@ index c99b5c1920..c667cfc872 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Check for header-only types.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 var whyOnlyPAX, whyOnlyGNU string<br>
-@@ -538,7 +538,7 @@ type headerFileInfo struct {<br>
+@@ -541,7 +541,7 @@ type headerFileInfo struct {<br>
=C2=A0 func (fi headerFileInfo) Size() int64=C2=A0 =C2=A0 =C2=A0 =C2=A0 { r=
eturn fi.h.Size }<br>
=C2=A0 func (fi headerFileInfo) IsDir() bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 { r=
eturn fi.Mode().IsDir() }<br>
=C2=A0 func (fi headerFileInfo) ModTime() time.Time { return fi.h.ModTime }=
<br>
@@ -474,7 +472,7 @@ index e73e0d2609..0000000000<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 })<br>
=C2=A0-}<br>
=C2=A0diff --git a/vendor/archive/tar/reader.go b/vendor/archive/tar/reader=
.go<br>
-index e609c15f27..f645af8016 100644<br>
+index 45848304ed..ca32bdea1f 100644<br>
=C2=A0--- a/vendor/archive/tar/reader.go<br>
=C2=A0+++ b/vendor/archive/tar/reader.go<br>
=C2=A0@@ -65,7 +65,7 @@ func (tr *Reader) next() (*Header, error) {<br>
@@ -821,20 +819,8 @@ index f76d6be220..5a9a35cbb4 100644<br>
<br>
=C2=A0 package tar<br>
<br>
-diff --git a/vendor/archive/tar/stat_unix.go b/vendor/archive/tar/stat_uni=
x.go<br>
-index b743c76b8c..4a5bca0312 100644<br>
---- a/vendor/archive/tar/stat_unix.go<br>
-+++ b/vendor/archive/tar/stat_unix.go<br>
-@@ -3,6 +3,7 @@<br>
- // license that can be found in the LICENSE file.<br>
- <br>
- //go:build aix || linux || darwin || dragonfly || freebsd || openbsd || n=
etbsd || solaris<br>
-+// +build aix linux darwin dragonfly freebsd openbsd netbsd solaris<br>
- <br>
- package tar<br>
- <br>
=C2=A0diff --git a/vendor/archive/tar/strconv.go b/vendor/archive/tar/strco=
nv.go<br>
-index 275db6f026..f0b61e6dba 100644<br>
+index ac3196370e..fde45c9dbf 100644<br>
=C2=A0--- a/vendor/archive/tar/strconv.go<br>
=C2=A0+++ b/vendor/archive/tar/strconv.go<br>
=C2=A0@@ -14,7 +14,7 @@ import (<br>
@@ -916,7 +902,7 @@ index 275db6f026..f0b61e6dba 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if !validPAXRecord(k, v) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;=
, &quot;&quot;, s, ErrHeader<br>
-@@ -314,7 +333,7 @@ func formatPAXRecord(k, v string) (string, error) {<br=
>
+@@ -315,7 +334,7 @@ func formatPAXRecord(k, v string) (string, error) {<br=
>
=C2=A0 // for the PAX version of the USTAR string fields.<br>
=C2=A0 // The key must not contain an &#39;=3D&#39; character.<br>
=C2=A0 func validPAXRecord(k, v string) bool {<br>
@@ -1213,6 +1199,3 @@ index 640264984a..4e709e5cac 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;test %d.%d, unknown t=
est operation: %T&quot;, i, j, tf)<br>
--- <br>
-2.38.1<br>
-<br>
diff --git a/recipes-containers/docker/files/0003-builder.go-avoid-using-st=
rings.Cut-from-go-1.18.patch b/recipes-containers/docker/files/0003-builder=
.go-avoid-using-strings.Cut-from-go-1.18.patch<br>
new file mode 100644<br>
index 0000000..0574d9e<br>
--- /dev/null<br>
+++ b/recipes-containers/docker/files/0003-builder.go-avoid-using-strings.C=
ut-from-go-1.18.patch<br>
@@ -0,0 +1,32 @@<br>
+From 6867fc1f6bd01596c2d3dc7bc07e26fa98965185 Mon Sep 17 00:00:00 2001<br>
+From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D=
"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+Date: Mon, 14 Aug 2023 16:41:42 +0200<br>
+Subject: [PATCH] builder.go: avoid using strings.Cut from go-1.18<br>
+<br>
+* we&#39;re still using go-1.17<br>
+<br>
+Upstream-Status: Inapropriate<br>
+---<br>
+ builder/builder-next/builder.go | 7 +++++--<br>
+ 1 file changed, 5 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/builder/builder-next/builder.go b/builder/builder-next/builde=
r.go<br>
+index ee6b9f0fb1..a9bda8c370 100644<br>
+--- a/builder/builder-next/builder.go<br>
++++ b/builder/builder-next/builder.go<br>
+@@ -555,10 +555,13 @@ func toBuildkitExtraHosts(inp []string, hostGatewayI=
P net.IP) (string, error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hosts :=3D make([]string, 0, len(inp))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, h :=3D range inp {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host, ip, ok :=3D string=
s.Cut(h, &quot;:&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if !ok || host =3D=3D &q=
uot;&quot; || ip =3D=3D &quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parts :=3D strings.Split=
(h, &quot;:&quot;)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(parts) !=3D 2 || =
parts[0] =3D=3D &quot;&quot; || parts[1] =3D=3D &quot;&quot; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return &quot;&quot;, errors.Errorf(&quot;invalid host %s&quot;, h=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host :=3D parts[0]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ip :=3D parts[1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// If the IP Addres=
s is a &quot;host-gateway&quot;, replace this value with the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// IP address store=
d in the daemon level HostGatewayIP config variable.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ip =3D=3D opts.H=
ostGatewayName {<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8189): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8189" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8189</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/100738603/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/100738603/3617156</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com=
" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000374a5f0602e6aeef--

