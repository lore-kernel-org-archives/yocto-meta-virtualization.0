Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0593CC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:05:42 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.32760.1743019535240242182
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 13:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EijQmhCB;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so292902a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Mar 2025 13:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743019535; x=1743624335; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mDLIw8E3R7u40MmpRfhqG5eQGCxWtnXjMXKak/Do3Go=;
        b=EijQmhCBMqRXq014Pc2POmbrMdf/9GJzMltvTTgGzEhY062fwMZ49oFsAKkOKpJHuf
         NV+A3eXcIVfbrZ4vQ5bVED6V/GZAMNF2VFrToRvmMriVXxJJn9W1ux4zjneNSag1QJ+q
         ZF00BtnII2Tqvh0msjl3XmVlmZPqsB70nxnrse8FUp8h+IxMHiFPBaa0q8UTdHm2cZyR
         ijb7FkW205Td4vlfLkpd8v6sGukJ5P7FNQ5GDSxek2MkKe5cKkaWZLTUOLsysYKFbvCV
         TqIVfnOyC5K4KjP22Z1k2JjzaFq/Kcf8Fl/nl49NQwIiH9E+hCh4B6qi2YhzTbki085f
         hwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743019535; x=1743624335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDLIw8E3R7u40MmpRfhqG5eQGCxWtnXjMXKak/Do3Go=;
        b=e6uCMIGcrLuMPDdyRu4B/Ge7w6pCVFc1MRGq5yIAcyvWYzXSGv1K/0pe12DSquRMRz
         baBw3dfjZgtFb0vQkHqS3FCWSkq3PsxF+P8WMVE9sl1EzeEAu6io2ZdeoY7H1TlIPnWt
         qfC3bV8vTbc1hnr0SqlTAd7xQBFSJlYmSfeMglIG1qB9DuQ5cwC7X9eCTlP2YqpoI/2W
         qF11hn8M3svnWIKxXUsRQaaGxWXl1AF89BRQXm2bG7I+Ekw3taH87Zpgw/m2hQhWAtlh
         yjDIkxCpK55GI2p+dqvI781lk9/cjFNY+yeIrhs7goNVtY93nTfySHz7caO/W8i+RaOB
         wQ4w==
X-Gm-Message-State: AOJu0YxboTG0YVqwPb/3SJna+mnFcQ4a0hkCalnMO7RMYOG+wVm7VN1n
	0BoP0RdFm+cbvueMAmbim8RpI86CzRpReI1/uGbyhzNqtO/tp5yYiJ00DgFbxfVLQn6vPOaC9FY
	yAcPdYddqB7zQh9InWs/WlXYWzHo=
X-Gm-Gg: ASbGncsNGnGHlmyaotPFuW/Tuuxt7UiZOrPO7gaXzNN3XbX+QmIXCSoexpDGQz/o8s0
	fzdaiwhfN5/2Nrxkzqtwee2hGkwiuUyxaYXBEpM7u4QL4Rf1D79qpja2jfXrGm4yqJ0IsZYfDvM
	aGjNCCZHjA8pDmINvVVzVEUOXFWA==
X-Google-Smtp-Source: AGHT+IEqqAqfz8C9wSRtzcTg2egyxt0SeU0TFHonPCxTy4IPzfRQnXuGNMl9Vi6f99YNxcMku/6orzZO2WR/pNO5JDw=
X-Received: by 2002:a17:90b:2e51:b0:2fe:6942:370e with SMTP id
 98e67ed59e1d1-303a7c5e6d9mr1505004a91.7.1743019534214; Wed, 26 Mar 2025
 13:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250326195009.757247-1-praveen.kumar@windriver.com> <20250326195009.757247-3-praveen.kumar@windriver.com>
In-Reply-To: <20250326195009.757247-3-praveen.kumar@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 26 Mar 2025 16:05:22 -0400
X-Gm-Features: AQ5f1JptxS6NHsiDO8D0hMv8TrVBDuUWcJSXbTmWitcvPOBd5xKBAoBvU_DBg38
Message-ID: <CADkTA4OmZXHHpkBb2LA7-6z=SmaV2g5LWf0z=6yS=vKTLG7znQ@mail.gmail.com>
Subject: Re: [meta-virtualization][scarthgap][PATCH 3/3] buildah: upgrade
 1.34.3 -> 1.35.5
To: praveen.kumar@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002c6e6f0631445ceb"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Mar 2025 20:05:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9177

--0000000000002c6e6f0631445ceb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 3:50=E2=80=AFPM Praveen Kumar via lists.yoctoprojec=
t.org
<praveen.kumar=3Dwindriver.com@lists.yoctoproject.org> wrote:

> This upgrade fixes:
> CVE-2024-11218
> CVE-2024-3727
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> https://github.com/containers/buildah/releases?q=3D1.35.5


Links to changelogs are not useful, they can't be searched when looking at
the git history.

That being said,  this isn't an upgrade we can do in a released branch.
Only 3rd digit upgrades are "stable".

Bruce


>
> Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> ---
>  ...SecureJoin-when-forming-userns-paths.patch | 155 +++++++++---------
>  recipes-containers/buildah/buildah_git.bb     |   8 +-
>  2 files changed, 84 insertions(+), 79 deletions(-)
>
> diff --git
> a/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-when-=
forming-userns-paths.patch
> b/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-when-=
forming-userns-paths.patch
> index 73040e82..25f15715 100644
> ---
> a/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-when-=
forming-userns-paths.patch
> +++
> b/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-when-=
forming-userns-paths.patch
> @@ -23,16 +23,17 @@ CVE: CVE-2024-9676
>  Upstream-Status: Backport [854570c44c219c2b92b03b36b7a2069a32e2c08a]
>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
>  ---
> - userns.go             | 92 ++++++++++++++++++++++++++++++-------------
> - userns_unsupported.go | 14 +++++++
> - 2 files changed, 79 insertions(+), 27 deletions(-)
> - create mode 100644 userns_unsupported.go
> + .../github.com/containers/storage/userns.go   | 97 +++++++++++++------
> + .../containers/storage/userns_unsupported.go  | 14 +++
> + 2 files changed, 83 insertions(+), 28 deletions(-)
> + create mode 100644 vendor/
> github.com/containers/storage/userns_unsupported.go
>
> -diff --git a/userns.go b/userns.go
> -index 32ae830be..2c855da7c 100644
> ---- a/userns.go
> -+++ b/userns.go
> +diff --git a/vendor/github.com/containers/storage/userns.go b/vendor/
> github.com/containers/storage/userns.go
> +index 57120731b..086f8336b 100644
> +--- a/vendor/github.com/containers/storage/userns.go
> ++++ b/vendor/github.com/containers/storage/userns.go
>  @@ -1,18 +1,21 @@
>  +//go:build linux
>  +
> @@ -50,36 +51,37 @@ index 32ae830be..2c855da7c 100644
>         "github.com/containers/storage/pkg/unshare"
>         "github.com/containers/storage/types"
>  +      securejoin "github.com/cyphar/filepath-securejoin"
> -       libcontainerUser "github.com/opencontainers/runc/libcontainer/use=
r
> "
> +       libcontainerUser "github.com/moby/sys/user"
>         "github.com/sirupsen/logrus"
>  +      "golang.org/x/sys/unix"
>   )
>
>   // getAdditionalSubIDs looks up the additional IDs configured for
> -@@ -85,40 +88,59 @@ const nobodyUser =3D 65534
> +@@ -85,40 +88,62 @@ const nobodyUser =3D 65534
>   // parseMountedFiles returns the maximum UID and GID found in the
> /etc/passwd and
>   // /etc/group files.
>   func parseMountedFiles(containerMount, passwdFile, groupFile string)
> uint32 {
> -+      var (
> -+              passwd *os.File
> -+              group  *os.File
> -+              size   int
> -+              err    error
> -+      )
> ++       var (
> ++               passwd *os.File
> ++               group  *os.File
> ++               size   int
> ++               err    error
> ++       )
>         if passwdFile =3D=3D "" {
>  -              passwdFile =3D filepath.Join(containerMount, "etc/passwd"=
)
>  -      }
>  -      if groupFile =3D=3D "" {
>  -              groupFile =3D filepath.Join(groupFile, "etc/group")
> -+              passwd, err =3D secureOpen(containerMount, "/etc/passwd")
> -+      } else {
> -+              // User-specified override from a volume. Will not be in
> -+              // container root.
> -+              passwd, err =3D os.Open(passwdFile)
> -       }
> +-      }
>  -
>  -      size :=3D 0
> --
> ++              passwd, err =3D secureOpen(containerMount, "/etc/passwd")
> ++      } else {
> ++                // User-specified override from a volume. Will not be i=
n
> ++                // container root.
> ++                passwd, err =3D os.Open(passwdFile)
> ++        }
> +
>  -      users, err :=3D libcontainerUser.ParsePasswdFile(passwdFile)
>         if err =3D=3D nil {
>  -              for _, u :=3D range users {
> @@ -93,34 +95,36 @@ index 32ae830be..2c855da7c 100644
>  -                      }
>  -                      if u.Gid > size && u.Gid !=3D nobodyUser {
>  -                              size =3D u.Gid
> -+              defer passwd.Close()
>  +
> -+              users, err :=3D libcontainerUser.ParsePasswd(passwd)
> -+              if err =3D=3D nil {
> -+                      for _, u :=3D range users {
> -+                              // Skip the "nobody" user otherwise we en=
d
> up with 65536
> -+                              // ids with most images
> -+                              if u.Name =3D=3D "nobody" || u.Name =3D=
=3D
> "nogroup" {
> -+                                      continue
> -+                              }
> -+                              if u.Uid > size && u.Uid !=3D nobodyUser =
{
> -+                                      size =3D u.Uid + 1
> -+                              }
> -+                              if u.Gid > size && u.Gid !=3D nobodyUser =
{
> -+                                      size =3D u.Gid + 1
> -+                              }
> ++               defer passwd.Close()
> ++
> ++               users, err :=3D libcontainerUser.ParsePasswd(passwd)
> ++               if err =3D=3D nil {
> ++                       for _, u :=3D range users {
> ++                               // Skip the "nobody" user otherwise we
> end up with 65536
> ++                               // ids with most images
> ++                               if u.Name =3D=3D "nobody" || u.Name =3D=
=3D
> "nogroup" {
> ++                                       continue
> ++                               }
> ++                               if u.Uid > size && u.Uid !=3D nobodyUser=
 {
> ++                                       size =3D u.Uid + 1
> ++                               }
> ++                               if u.Gid > size && u.Gid !=3D nobodyUser=
 {
> ++                                       size =3D u.Gid + 1
> ++                               }
> ++
>                         }
>                 }
>         }
> -
> +-
>  -      groups, err :=3D libcontainerUser.ParseGroupFile(groupFile)
> -+      if groupFile =3D=3D "" {
> -+              group, err =3D secureOpen(containerMount, "/etc/group")
> -+      } else {
> -+              // User-specified override from a volume. Will not be in
> -+              // container root.
> -+              group, err =3D os.Open(groupFile)
> -+      }
> ++       if groupFile =3D=3D "" {
> ++               group, err =3D secureOpen(containerMount, "/etc/group")
> ++       } else {
> ++               // User-specified override from a volume. Will not be in
> ++               // container root.
> ++               group, err =3D os.Open(groupFile)
> ++       }
>         if err =3D=3D nil {
>  -              for _, g :=3D range groups {
>  -                      if g.Name =3D=3D "nobody" {
> @@ -128,60 +132,61 @@ index 32ae830be..2c855da7c 100644
>  -                      }
>  -                      if g.Gid > size && g.Gid !=3D nobodyUser {
>  -                              size =3D g.Gid
> -+              defer group.Close()
> ++               defer group.Close()
> ++
> ++               groups, err :=3D libcontainerUser.ParseGroup(group)
> ++               if err =3D=3D nil {
> ++                       for _, g :=3D range groups {
> ++                               if g.Name =3D=3D "nobody" || g.Name =3D=
=3D
> "nogroup" {
> ++                                       continue
> ++                               }
> ++                               if g.Gid > size && g.Gid !=3D nobodyUser=
 {
> ++                                       size =3D g.Gid + 1
> ++                               }
>  +
> -+              groups, err :=3D libcontainerUser.ParseGroup(group)
> -+              if err =3D=3D nil {
> -+                      for _, g :=3D range groups {
> -+                              if g.Name =3D=3D "nobody" || g.Name =3D=
=3D
> "nogroup" {
> -+                                      continue
> -+                              }
> -+                              if g.Gid > size && g.Gid !=3D nobodyUser =
{
> -+                                      size =3D g.Gid + 1
> -+                              }
>                         }
>                 }
>         }
> -@@ -309,3 +331,19 @@ func getAutoUserNSIDMappings(
> +@@ -309,3 +334,19 @@ func getAutoUserNSIDMappings(
>         gidMap :=3D append(availableGIDs.zip(requestedContainerGIDs),
> additionalGIDMappings...)
>         return uidMap, gidMap, nil
>   }
>  +
>  +// Securely open (read-only) a file in a container mount.
>  +func secureOpen(containerMount, file string) (*os.File, error) {
> -+      filePath, err :=3D securejoin.SecureJoin(containerMount, file)
> -+      if err !=3D nil {
> -+              return nil, err
> -+      }
> ++       filePath, err :=3D securejoin.SecureJoin(containerMount, file)
> ++       if err !=3D nil {
> ++               return nil, err
> ++       }
>  +
> -+      flags :=3D unix.O_PATH | unix.O_CLOEXEC | unix.O_RDONLY
> -+      fileHandle, err :=3D os.OpenFile(filePath, flags, 0)
> -+      if err !=3D nil {
> -+              return nil, err
> -+      }
> ++       flags :=3D unix.O_PATH | unix.O_CLOEXEC | unix.O_RDONLY
> ++       fileHandle, err :=3D os.OpenFile(filePath, flags, 0)
> ++       if err !=3D nil {
> ++               return nil, err
> ++       }
>  +
> -+      return fileHandle, nil
> ++       return fileHandle, nil
>  +}
> -diff --git a/userns_unsupported.go b/userns_unsupported.go
> +diff --git a/vendor/github.com/containers/storage/userns_unsupported.go
> b/vendor/github.com/containers/storage/userns_unsupported.go
>  new file mode 100644
> -index 000000000..e37c18fe4
> +index 000000000..3905bd3ce
>  --- /dev/null
> -+++ b/userns_unsupported.go
> ++++ b/vendor/github.com/containers/storage/userns_unsupported.go
>  @@ -0,0 +1,14 @@
>  +//go:build !linux
>  +
>  +package storage
>  +
>  +import (
> -+      "errors"
> ++       "errors"
>  +
> -+      "github.com/containers/storage/pkg/idtools"
> -+      "github.com/containers/storage/types"
> ++       "github.com/containers/storage/pkg/idtools"
> ++       "github.com/containers/storage/types"
>  +)
>  +
>  +func (s *store) getAutoUserNS(_ *types.AutoUserNsOptions, _ *Image, _
> rwLayerStore, _ []roLayerStore) ([]idtools.IDMap, []idtools.IDMap, error)=
 {
> -+      return nil, nil, errors.New("user namespaces are not supported on
> this platform")
> ++       return nil, nil, errors.New("user namespaces are not supported o=
n
> this platform")
>  +}
>  --
> -2.25.1
> +2.40.0
>
> diff --git a/recipes-containers/buildah/buildah_git.bb
> b/recipes-containers/buildah/buildah_git.bb
> index 288a1cb0..fd2503fe 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://src/
> github.com/containers/buildah/LICENSE;md5=3De3fc50a
>
>  S =3D "${WORKDIR}/git"
>
> -BUILDAH_VERSION =3D "1.34.3"
> +BUILDAH_VERSION =3D "1.35.5"
>
>  PV =3D "${BUILDAH_VERSION}"
>
> @@ -28,12 +28,12 @@ GO_WORKDIR =3D "${GO_INSTALL}"
>  GOBUILDFLAGS +=3D "-mod vendor"
>
>  SRCREV_FORMAT =3D "buildah_storage"
> -SRCREV_buildah =3D "2db756331014a4f355507df47d2622d05532da1f"
> +SRCREV_buildah =3D "df0b92073ee9d34c1f86e03b4ffb17ec25e514e4"
>  SRCREV_storage =3D "246ba3062e8b551026aef2708eee747014ce5c52"
>
>  SRC_URI =3D " \
> -    git://
> github.com/containers/buildah;branch=3Drelease-1.34;name=3Dbuildah;protoc=
ol=3Dhttps
> \
> -
> file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;pat=
chdir=3Dsrc/
> github.com/containers/buildah/vendor/github.com/containers/storage \
> +    git://
> github.com/containers/buildah;branch=3Drelease-1.35;name=3Dbuildah;protoc=
ol=3Dhttps
> \
> +
> file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;pat=
chdir=3Dsrc/
> github.com/containers/buildah/ \
>      "
>
>  DEPENDS =3D "libdevmapper btrfs-tools gpgme"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9176):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9176
> Mute This Topic: https://lists.yoctoproject.org/mt/111924201/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000002c6e6f0631445ceb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 26, 2025 at 3:50=
=E2=80=AFPM Praveen Kumar via <a href=3D"http://lists.yoctoproject.org">lis=
ts.yoctoproject.org</a> &lt;praveen.kumar=3D<a href=3D"mailto:windriver.com=
@lists.yoctoproject.org">windriver.com@lists.yoctoproject.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This upgrade f=
ixes:<br>
CVE-2024-11218<br>
CVE-2024-3727<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<a href=3D"https://github.com/containers/buildah/releases?q=3D1.35.5" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/containers/buildah/rel=
eases?q=3D1.35.5</a></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">Links to changelogs are not useful, they c=
an&#39;t be searched when looking at the git history.</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">That being said,=C2=A0 this isn&#39;t an upgra=
de we can do in a released branch. Only 3rd digit upgrades=C2=A0are &quot;s=
table&quot;.</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Signed-off-by: Praveen Kumar &lt;<a href=3D"mailto:praveen.kumar@windriver.=
com" target=3D"_blank">praveen.kumar@windriver.com</a>&gt;<br>
---<br>
=C2=A0...SecureJoin-when-forming-userns-paths.patch | 155 +++++++++--------=
-<br>
=C2=A0recipes-containers/buildah/<a href=3D"http://buildah_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">buildah_git.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A08 +-<br>
=C2=A02 files changed, 84 insertions(+), 79 deletions(-)<br>
<br>
diff --git a/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJ=
oin-when-forming-userns-paths.patch b/recipes-containers/buildah/buildah/00=
01-Use-securejoin.SecureJoin-when-forming-userns-paths.patch<br>
index 73040e82..25f15715 100644<br>
--- a/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-whe=
n-forming-userns-paths.patch<br>
+++ b/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-whe=
n-forming-userns-paths.patch<br>
@@ -23,16 +23,17 @@ CVE: CVE-2024-9676<br>
=C2=A0Upstream-Status: Backport [854570c44c219c2b92b03b36b7a2069a32e2c08a]<=
br>
<br>
=C2=A0Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" t=
arget=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
+Signed-off-by: Praveen Kumar &lt;<a href=3D"mailto:praveen.kumar@windriver=
.com" target=3D"_blank">praveen.kumar@windriver.com</a>&gt;<br>
=C2=A0---<br>
- userns.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 92 +++++++++++=
+++++++++++++++++++-------------<br>
- userns_unsupported.go | 14 +++++++<br>
- 2 files changed, 79 insertions(+), 27 deletions(-)<br>
- create mode 100644 userns_unsupported.go<br>
+ .../<a href=3D"http://github.com/containers/storage/userns.go" rel=3D"nor=
eferrer" target=3D"_blank">github.com/containers/storage/userns.go</a>=C2=
=A0 =C2=A0| 97 +++++++++++++------<br>
+ .../containers/storage/userns_unsupported.go=C2=A0 | 14 +++<br>
+ 2 files changed, 83 insertions(+), 28 deletions(-)<br>
+ create mode 100644 vendor/<a href=3D"http://github.com/containers/storage=
/userns_unsupported.go" rel=3D"noreferrer" target=3D"_blank">github.com/con=
tainers/storage/userns_unsupported.go</a><br>
<br>
-diff --git a/userns.go b/userns.go<br>
-index 32ae830be..2c855da7c 100644<br>
---- a/userns.go<br>
-+++ b/userns.go<br>
+diff --git a/vendor/<a href=3D"http://github.com/containers/storage/userns=
.go" rel=3D"noreferrer" target=3D"_blank">github.com/containers/storage/use=
rns.go</a> b/vendor/<a href=3D"http://github.com/containers/storage/userns.=
go" rel=3D"noreferrer" target=3D"_blank">github.com/containers/storage/user=
ns.go</a><br>
+index 57120731b..086f8336b 100644<br>
+--- a/vendor/<a href=3D"http://github.com/containers/storage/userns.go" re=
l=3D"noreferrer" target=3D"_blank">github.com/containers/storage/userns.go<=
/a><br>
++++ b/vendor/<a href=3D"http://github.com/containers/storage/userns.go" re=
l=3D"noreferrer" target=3D"_blank">github.com/containers/storage/userns.go<=
/a><br>
=C2=A0@@ -1,18 +1,21 @@<br>
=C2=A0+//go:build linux<br>
=C2=A0+<br>
@@ -50,36 +51,37 @@ index 32ae830be..2c855da7c 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://github.com/containers/s=
torage/pkg/unshare" rel=3D"noreferrer" target=3D"_blank">github.com/contain=
ers/storage/pkg/unshare</a>&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://github.com/containers/s=
torage/types" rel=3D"noreferrer" target=3D"_blank">github.com/containers/st=
orage/types</a>&quot;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 securejoin &quot;<a href=3D"http://github.com/c=
yphar/filepath-securejoin" rel=3D"noreferrer" target=3D"_blank">github.com/=
cyphar/filepath-securejoin</a>&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libcontainerUser &quot;<a href=3D"http://github=
.com/opencontainers/runc/libcontainer/user" rel=3D"noreferrer" target=3D"_b=
lank">github.com/opencontainers/runc/libcontainer/user</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libcontainerUser &quot;<a href=3D"http://github=
.com/moby/sys/user" rel=3D"noreferrer" target=3D"_blank">github.com/moby/sy=
s/user</a>&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://github.com/sirupsen/log=
rus" rel=3D"noreferrer" target=3D"_blank">github.com/sirupsen/logrus</a>&qu=
ot;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://golang.org/x/sys/unix" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x/sys/unix</a>&quot;<br>
=C2=A0 )<br>
<br>
=C2=A0 // getAdditionalSubIDs looks up the additional IDs configured for<br=
>
-@@ -85,40 +88,59 @@ const nobodyUser =3D 65534<br>
+@@ -85,40 +88,62 @@ const nobodyUser =3D 65534<br>
=C2=A0 // parseMountedFiles returns the maximum UID and GID found in the /e=
tc/passwd and<br>
=C2=A0 // /etc/group files.<br>
=C2=A0 func parseMountedFiles(containerMount, passwdFile, groupFile string)=
 uint32 {<br>
-+=C2=A0 =C2=A0 =C2=A0 var (<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 passwd *os.File<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 group=C2=A0 *os.File<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size=C2=A0 =C2=A0int<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err=C2=A0 =C2=A0 error<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0var (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0passwd *os.File<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0group=C2=A0 *os.Fi=
le<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size=C2=A0 =C2=A0i=
nt<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err=C2=A0 =C2=A0 e=
rror<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if passwdFile =3D=3D &quot;&quot; {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 passwdFile =3D file=
path.Join(containerMount, &quot;etc/passwd&quot;)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 if groupFile =3D=3D &quot;&quot; {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 groupFile =3D filep=
ath.Join(groupFile, &quot;etc/group&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 passwd, err =3D secureOp=
en(containerMount, &quot;/etc/passwd&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // User-specified overri=
de from a volume. Will not be in<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // container root.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 passwd, err =3D os.Open(=
passwdFile)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0-<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 size :=3D 0<br>
--<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 passwd, err =3D secureOp=
en(containerMount, &quot;/etc/passwd&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // User-specified=
 override from a volume. Will not be in<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // container root=
.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 passwd, err =3D o=
s.Open(passwdFile)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 users, err :=3D libcontainerUser.ParsePasswdFil=
e(passwdFile)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if err =3D=3D nil {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for _, u :=3D range=
 users {<br>
@@ -93,34 +95,36 @@ index 32ae830be..2c855da7c 100644<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if u.Gid &gt; size &amp;&amp; u.Gid !=3D nobodyUser {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D u.Gid<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defer passwd.Close()<br>
=C2=A0+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 users, err :=3D libconta=
inerUser.ParsePasswd(passwd)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err =3D=3D nil {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for _, u :=3D range users {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Skip the &quot;nobody&quot; user otherwi=
se we end up with 65536<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // ids with most images<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if u.Name =3D=3D &quot;nobody&quot; || u.Na=
me =3D=3D &quot;nogroup&quot; {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if u.Uid &gt; size &amp;&amp; u.Uid !=3D no=
bodyUser {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D u.Uid =
+ 1<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if u.Gid &gt; size &amp;&amp; u.Gid !=3D no=
bodyUser {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D u.Gid =
+ 1<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defer passwd.Close=
()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0users, err :=3D li=
bcontainerUser.ParsePasswd(passwd)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if err =3D=3D nil =
{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0for _, u :=3D range users {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Skip the &quot;nobody&quot; user o=
therwise we end up with 65536<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// ids with most images<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if u.Name =3D=3D &quot;nobody&quot; |=
| u.Name =3D=3D &quot;nogroup&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if u.Uid &gt; size &amp;&amp; u.Uid !=
=3D nobodyUser {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D =
u.Uid + 1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if u.Gid &gt; size &amp;&amp; u.Gid !=
=3D nobodyUser {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D =
u.Gid + 1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
- <br>
+-<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 groups, err :=3D libcontainerUser.ParseGroupFil=
e(groupFile)<br>
-+=C2=A0 =C2=A0 =C2=A0 if groupFile =3D=3D &quot;&quot; {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 group, err =3D secureOpe=
n(containerMount, &quot;/etc/group&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // User-specified overri=
de from a volume. Will not be in<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // container root.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 group, err =3D os.Open(g=
roupFile)<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0if groupFile =3D=3D &quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0group, err =3D sec=
ureOpen(containerMount, &quot;/etc/group&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// User-specified =
override from a volume. Will not be in<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// container root.=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0group, err =3D os.=
Open(groupFile)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if err =3D=3D nil {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for _, g :=3D range=
 groups {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if g.Name =3D=3D &quot;nobody&quot; {<br>
@@ -128,60 +132,61 @@ index 32ae830be..2c855da7c 100644<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if g.Gid &gt; size &amp;&amp; g.Gid !=3D nobodyUser {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D g.Gid<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defer group.Close()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defer group.Close(=
)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0groups, err :=3D l=
ibcontainerUser.ParseGroup(group)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if err =3D=3D nil =
{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0for _, g :=3D range groups {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if g.Name =3D=3D &quot;nobody&quot; |=
| g.Name =3D=3D &quot;nogroup&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if g.Gid &gt; size &amp;&amp; g.Gid !=
=3D nobodyUser {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D =
g.Gid + 1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 groups, err :=3D libcont=
ainerUser.ParseGroup(group)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err =3D=3D nil {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for _, g :=3D range groups {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if g.Name =3D=3D &quot;nobody&quot; || g.Na=
me =3D=3D &quot;nogroup&quot; {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if g.Gid &gt; size &amp;&amp; g.Gid !=3D no=
bodyUser {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D g.Gid =
+ 1<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-@@ -309,3 +331,19 @@ func getAutoUserNSIDMappings(<br>
+@@ -309,3 +334,19 @@ func getAutoUserNSIDMappings(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gidMap :=3D append(availableGIDs.zip(requestedC=
ontainerGIDs), additionalGIDMappings...)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return uidMap, gidMap, nil<br>
=C2=A0 }<br>
=C2=A0+<br>
=C2=A0+// Securely open (read-only) a file in a container mount.<br>
=C2=A0+func secureOpen(containerMount, file string) (*os.File, error) {<br>
-+=C2=A0 =C2=A0 =C2=A0 filePath, err :=3D securejoin.SecureJoin(containerMo=
unt, file)<br>
-+=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nil, err<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0filePath, err :=3D securejoin.SecureJoin(conta=
inerMount, file)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, err<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0+<br>
-+=C2=A0 =C2=A0 =C2=A0 flags :=3D unix.O_PATH | unix.O_CLOEXEC | unix.O_RDO=
NLY<br>
-+=C2=A0 =C2=A0 =C2=A0 fileHandle, err :=3D os.OpenFile(filePath, flags, 0)=
<br>
-+=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nil, err<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0flags :=3D unix.O_PATH | unix.O_CLOEXEC | unix=
.O_RDONLY<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0fileHandle, err :=3D os.OpenFile(filePath, fla=
gs, 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, err<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0+<br>
-+=C2=A0 =C2=A0 =C2=A0 return fileHandle, nil<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0return fileHandle, nil<br>
=C2=A0+}<br>
-diff --git a/userns_unsupported.go b/userns_unsupported.go<br>
+diff --git a/vendor/<a href=3D"http://github.com/containers/storage/userns=
_unsupported.go" rel=3D"noreferrer" target=3D"_blank">github.com/containers=
/storage/userns_unsupported.go</a> b/vendor/<a href=3D"http://github.com/co=
ntainers/storage/userns_unsupported.go" rel=3D"noreferrer" target=3D"_blank=
">github.com/containers/storage/userns_unsupported.go</a><br>
=C2=A0new file mode 100644<br>
-index 000000000..e37c18fe4<br>
+index 000000000..3905bd3ce<br>
=C2=A0--- /dev/null<br>
-+++ b/userns_unsupported.go<br>
++++ b/vendor/<a href=3D"http://github.com/containers/storage/userns_unsupp=
orted.go" rel=3D"noreferrer" target=3D"_blank">github.com/containers/storag=
e/userns_unsupported.go</a><br>
=C2=A0@@ -0,0 +1,14 @@<br>
=C2=A0+//go:build !linux<br>
=C2=A0+<br>
=C2=A0+package storage<br>
=C2=A0+<br>
=C2=A0+import (<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;errors&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;errors&quot;<br>
=C2=A0+<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://github.com/containers/storag=
e/pkg/idtools" rel=3D"noreferrer" target=3D"_blank">github.com/containers/s=
torage/pkg/idtools</a>&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://github.com/containers/storag=
e/types" rel=3D"noreferrer" target=3D"_blank">github.com/containers/storage=
/types</a>&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://github.com/containers/=
storage/pkg/idtools" rel=3D"noreferrer" target=3D"_blank">github.com/contai=
ners/storage/pkg/idtools</a>&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://github.com/containers/=
storage/types" rel=3D"noreferrer" target=3D"_blank">github.com/containers/s=
torage/types</a>&quot;<br>
=C2=A0+)<br>
=C2=A0+<br>
=C2=A0+func (s *store) getAutoUserNS(_ *types.AutoUserNsOptions, _ *Image, =
_ rwLayerStore, _ []roLayerStore) ([]idtools.IDMap, []idtools.IDMap, error)=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 return nil, nil, errors.New(&quot;user namespaces ar=
e not supported on this platform&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, nil, errors.New(&quot;user namespa=
ces are not supported on this platform&quot;)<br>
=C2=A0+}<br>
=C2=A0-- <br>
-2.25.1<br>
+2.40.0<br>
<br>
diff --git a/recipes-containers/buildah/<a href=3D"http://buildah_git.bb" r=
el=3D"noreferrer" target=3D"_blank">buildah_git.bb</a> b/recipes-containers=
/buildah/<a href=3D"http://buildah_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">buildah_git.bb</a><br>
index 288a1cb0..fd2503fe 100644<br>
--- a/recipes-containers/buildah/<a href=3D"http://buildah_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">buildah_git.bb</a><br>
+++ b/recipes-containers/buildah/<a href=3D"http://buildah_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">buildah_git.bb</a><br>
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/<a href=3D"http://git=
hub.com/containers/buildah/LICENSE;md5=3De3fc50a" rel=3D"noreferrer" target=
=3D"_blank">github.com/containers/buildah/LICENSE;md5=3De3fc50a</a><br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-BUILDAH_VERSION =3D &quot;1.34.3&quot;<br>
+BUILDAH_VERSION =3D &quot;1.35.5&quot;<br>
<br>
=C2=A0PV =3D &quot;${BUILDAH_VERSION}&quot;<br>
<br>
@@ -28,12 +28,12 @@ GO_WORKDIR =3D &quot;${GO_INSTALL}&quot;<br>
=C2=A0GOBUILDFLAGS +=3D &quot;-mod vendor&quot;<br>
<br>
=C2=A0SRCREV_FORMAT =3D &quot;buildah_storage&quot;<br>
-SRCREV_buildah =3D &quot;2db756331014a4f355507df47d2622d05532da1f&quot;<br=
>
+SRCREV_buildah =3D &quot;df0b92073ee9d34c1f86e03b4ffb17ec25e514e4&quot;<br=
>
=C2=A0SRCREV_storage =3D &quot;246ba3062e8b551026aef2708eee747014ce5c52&quo=
t;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://github.com/containers/buildah;branch=
=3Drelease-1.34;name=3Dbuildah;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/containers/buildah;branch=3Drelease-1.34;name=3Dbuil=
dah;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 file://0001-Use-securejoin.SecureJoin-when-forming-userns-pa=
ths.patch;patchdir=3Dsrc/<a href=3D"http://github.com/containers/buildah/ve=
ndor/github.com/containers/storage" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/containers/buildah/vendor/github.com/containers/storage</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/containers/buildah;branch=
=3Drelease-1.35;name=3Dbuildah;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/containers/buildah;branch=3Drelease-1.35;name=3Dbuil=
dah;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 file://0001-Use-securejoin.SecureJoin-when-forming-userns-pa=
ths.patch;patchdir=3Dsrc/<a href=3D"http://github.com/containers/buildah/" =
rel=3D"noreferrer" target=3D"_blank">github.com/containers/buildah/</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;libdevmapper btrfs-tools gpgme&quot;<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9176): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9176" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9176</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111924201/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111924201/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000002c6e6f0631445ceb--

