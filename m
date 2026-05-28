Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B3ACD5BC9
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 03:00:27 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3019.1779937223961747861
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 May 2026 20:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LZ0h6Ah8;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36aa4ae1f11so2731492a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 27 May 2026 20:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779937223; cv=none;
        d=google.com; s=arc-20240605;
        b=JlwgjVpbXMTSyzLzmZk+bkh6KflMuaugi5XWR9h5RlOHTmxYPWTpb+ZTqDTkHpCJ4L
         WSRVGIpgDxKdWY16x+HNGjIkR7OLg0//snvAr8TH6+Qg8+d0M0Mg1FJOER2AMIJuoi+C
         GgoZjspo0gXbH4OA07HMk7T6RRBxYIIkXO+bHnWueTzvMwJlLOQfdISLIEZLbMW40o2f
         MgR3S4CYUy63rbUkdEm6Amt49hBilDj9v222cFs/sFxSSgsZme2MTUe4XvrtUHcmP8WE
         ll/BLyp1RkfFm4b+Sw7oD4ZBHPFmJaoUIX6WtkUBOYIFEemXmiGMe+k6yH0SQHxsf5Rl
         ACsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=leeCToDMTFHJmpJ6KmuuESJ6MlZJ6AJ9ccNwPq1LQRA=;
        fh=pU9DFGcYQr9vPKX7UOxTp7uAQ1VgBn1i7EamYHKK2uI=;
        b=avG3G0IpaR1GPf2N7zC6obm9XDnfDHsxjHvOv83HJc8xioJSBsaJcObwx3g23foKRl
         URy8kM7aVCD9R5BmTaK+lmwutwKe9CzyrHhUQp5TI1ocHUHyJzXQF0rpc0xSvhJufPec
         pUzKSfNJ1K+6W1+MXpJQSKY8R4so/vN26jGLhsAkToZvEasb1m/IQBPcCd36BdB+VIWG
         Fjf/U/r3t5kvGNpiOH/79si2hErTmuBwH5BpUKxvvxO69DQaAJ+9vcw3rQ/nKjpENG6l
         Ebb7yZjkTl3zsvwWDVrKPH//wJujGFj9P4X+OVc9qf/ewbVH4qokgd8k/Hje+1fFnRGn
         iVmg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779937223; x=1780542023; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=leeCToDMTFHJmpJ6KmuuESJ6MlZJ6AJ9ccNwPq1LQRA=;
        b=LZ0h6Ah83uIfCVJ3W/i9qoYfAG7R2MpFu1U6Vxxaisy8G90LHPrt1JugwOAabiybMz
         zWM0htadXsllbtz3it1vfUJSAnrp0EQPmIbhNH1HUZW/4kIlTCe4d6KouTzOXZgrkYFo
         /+oL0rCbfSk3L8StYExYU6bUcyS9cTU5JNTw3lfIRkTp4UZ0hmLDYJ9KMDrb1gDQouxD
         CK53CadRBxkNEfhlFDdkhW6SDbxYHC5pkI3qEiq7718hurEIwWqvqTUWTAHdMS8jCz8q
         NvM+GKRc1YnhENYJtsUNPx0L4MVmmHu/WoTmJgEXJv4IStO263lLJjd2LYMnRWFBHpMy
         1AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779937223; x=1780542023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leeCToDMTFHJmpJ6KmuuESJ6MlZJ6AJ9ccNwPq1LQRA=;
        b=K67IiNamQCDxqDjL0ZOfgVVeqlLRk8d9S10R8bWDEHzMqgaSd2/qepPtT1PiBue7EY
         oEbzA7oPrTXSfJ46q7q+91HHqfVHa/N9nUP3fK6/GQvNkhbahcAeiwLmJY7ddtyTzupu
         HdY9aGJMseI3A66SSTdLlfWE8nnHgc66GnQqnwErUe2Rs+f1eW2zrQ8D1IzVa9WFACsv
         cwdPZxsgplZrUX67YbPqmgBpkvGrgXRA/Er0BJ2hMM284N6PHjQ6Rz8SyUQs84EZMtdZ
         0u9KfbATlnAXuRN4bYdMZEIxh6qznzaCZCnBhVXu9lKoX7IhF1rkrrOtVONdGoW2Mp/d
         6DKg==
X-Gm-Message-State: AOJu0Yxl8NPp9+lARit2/NT/g35kcctL9spP1p4mDaSeXTBSQETQHJJ8
	4AbCzfONZrfUsHxTPQY76E1z4MuUwnEh7nAPHysFwYcH98iUxJm6TokM0IpHeiocVtGDfjazpeT
	SiO5iRkNIQoxpDXrbbAA0af/RmHP26ho=
X-Gm-Gg: Acq92OH1q9NfJgnaYv6F2fRB8uOqVX0zK0AZivYTBEc0v8PsnGEUfszBwuCXhv948Nv
	keL/dle9WOn0j3lOOTe5DlkieMSSk7G983wGTWB92R0LIM8hlrPP/WSdAkukIUyG/qv3FNYoeAa
	dP/Bq2E9LpMovbE7UMDDpO2SGgwwEdR8V9NulGCLyWLIr5srIsa6Q7YlCakXRAL6Q+Mm5O5TQCi
	uB9D+CXUD/UEnKJr3Bqq6iDkeZwMlkSjX8BeXR+It08cRoV5x1ZqlRl9aEGbTUNTs35fMivPF91
	YeGk5yf4zur6bapOLX+oy23FrCBMht3sm7NCQExG2lIRDJk6lCoTjU9WMBDLD5N9enn4fbF6EU4
	o+M7EyrW8ZrFYNGueKGNgJYneXiCdp7O1Culm
X-Received: by 2002:a17:90b:4b08:b0:36b:88c4:46f0 with SMTP id
 98e67ed59e1d1-36b88c447b2mr1217309a91.14.1779937222750; Wed, 27 May 2026
 20:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260525130321.3963861-1-zhixiong.chi@windriver.com>
 <CADkTA4O0vb_-QPTjCDN=FNsSm9ApyKQ+ZqJvj27PmhvsLwWZKA@mail.gmail.com> <ce7a9642-232d-4b80-af71-8eebc2e02809@windriver.com>
In-Reply-To: <ce7a9642-232d-4b80-af71-8eebc2e02809@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 27 May 2026 23:00:11 -0400
X-Gm-Features: AVHnY4IASPnNjaraaf6x0yU8IRvDI20dl3yN1Ryzc5cJWwXa74_CrV-7UfJ24z4
Message-ID: <CADkTA4Nc-H5Jij2b4-jtME2EFxJJimaJOqi30e=4-H1tBCYT8A@mail.gmail.com>
Subject: Re: [meta-virtualization][wrynose][PATCH] crun: upgrade to 1.27.1
To: "Chi, Zhixiong" <zhixiong.chi@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e277690652d7ed87"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 May 2026 03:00:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9819

--000000000000e277690652d7ed87
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 10:08=E2=80=AFPM Chi, Zhixiong <zhixiong.chi@windri=
ver.com>
wrote:

>
> On 5/25/26 21:08, Bruce Ashfield wrote:
>
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
>
> On Mon, May 25, 2026 at 9:03=E2=80=AFAM Zhixiong Chi via lists.yoctoproje=
ct.org
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8Ev=
Q!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xt=
YSCkhX7RHkrOX0GynnmDg$>
> <zhixiong.chi=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
>> Bumping crun to version v1.27.1, which comprises the following commits:
>>
>>     3ec076b3 NEWS: tag 1.27.1
>>     60b2e8f8 tests, podman: pin to 5.8
>>     3010d29d tests: fix failure in user namespace
>>     d6ffa244 krun: remove unused variable
>>     1c5c2f7d linux: pass correct propagation to get_bind_mount
>>     d97461f0 tests: add regression test for idmapped mount leak
>>     59cfa8b8 Revert "linux: skip redundant MS_PRIVATE propagation mounts=
"
>>     f1b70c0b tests: add subcgroup cleanup test
>>     6177dd86 cgroup: fix recursive cgroup cleanup consuming caller's fd
>>     6c58b0c6 fix -Wdiscarded-qualifiers warnings
>>     acb904c6 krun: Build passt argv based on nitro variant
>>     8199cbb2 krun: implement support for passt networking
>>     7c2500df krun: ignore RAM configurations below 128MB
>>     23f7d9f0 krun: consolidate configuration in configure_vm
>>     04c19ac6 krun: process the vm configuration earlier
>>     81c21e0d handlers: add new hook to close fds
>>     d8813f3d .codespellrc: ignore passt
>>     94d7f641 utils: fix apparmor profile not applied in user namespaces
>>     805e6a44 libcrun: skip cgroup filesystem type check when cgroups are
>> disabled
>>     4c530d43 libcrun: fall back to bind mount for /dev/console on
>> read-only file systems
>>     a718a92c NEWS: tag 1.27
>>     6220914d nix: generate git-version.h in buildPhase
>>     9553f8b8 exec: strengthen -u value validation
>>     1bd7f424 exec: fix CVE-2026-30892
>>     5699da29 nix: fix zlib cross-compilation for s390x
>>     237f8100 nix: remove global overlay to eliminate rebuild cascade
>>     b37594dc release: use path: flake ref to avoid libgit2 safe.director=
y
>> <https://urldefense.com/v3/__http://safe.directory__;!!AjveYdw8EvQ!cnA8q=
qQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7=
RHkrOX255E1T9Q$>
>>     aaa6056c release: seed /nix from container image when empty
>>     c4e3fd22 linux: set MS_PRIVATE on detached mounts from
>> get_bind_mount()
>>     360621a3 Revert "container: skip sigaction reset in unblock_signals
>> for the run path"
>>     5d1b0284 nix: migrate to flakes
>>     246a3367 nix: generate git-version.h in buildPhase
>>     3e9986bc nix: bump nixos/nix image from 2.24.9 to 2.34.2
>>     094c97f3 nix: update
>>     195f664f seccomp_notify: tighten crun_make_error input
>>     1d76be72 seccomp: tighten crun_make_error input
>>     62d3e852 container: tighten crun_make_error input
>>     254a8a75 linux: use open_tree+mount_setattr for device mounts
>>     2d6f4c0e linux: use open_tree+move_mount for masked paths
>>     45e62ce5 linux: use open_tree+mount_setattr for readonly paths
>>     f53aa376 linux: use mount_setattr for readonly remounts in
>> finalize_mounts
>>     2dae2238 linux: skip redundant MS_PRIVATE propagation mounts
>>     38e17199 container: skip sigaction reset in unblock_signals for the
>> run path
>>     4b66d8f0 cgroup: skip enable_controllers when joined via
>> CLONE_INTO_CGROUP
>>     a59b186b linux: validate run.oci.mount_context_type annotation value
>>     16bd4e48 utils: do not use errno after success
>>
>> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>> ---
>>  recipes-containers/crun/crun_git.bb
>> <https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQT=
A9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHk=
rOX1s4OHFmA$>
>> | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-containers/crun/crun_git.bb
>> <https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQT=
A9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHk=
rOX1s4OHFmA$>
>> b/recipes-containers/crun/crun_git.bb
>> <https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQT=
A9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHk=
rOX1s4OHFmA$>
>> index d2f7b63b..f4e489d5 100644
>> --- a/recipes-containers/crun/crun_git.bb
>> <https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQT=
A9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHk=
rOX1s4OHFmA$>
>> +++ b/recipes-containers/crun/crun_git.bb
>> <https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQT=
A9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHk=
rOX1s4OHFmA$>
>> @@ -3,7 +3,7 @@ LICENSE =3D "GPL-2.0-only"
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263"
>>  PRIORITY =3D "optional"
>>
>> -SRCREV_crun =3D "393509db566bedea037d1599c5a58b896f5d3b01"
>> +SRCREV_crun =3D "3ec076b3b6714ec2f1a10533cf18d5605a6de637"
>>  SRCREV_libocispec =3D "8b07b619df73a113f7721f1c7ce24f2572b04cea"
>>  SRCREV_ispec =3D "a4c6ade7bb82b316d45391f572727a63e268b252"
>>  SRCREV_rspec =3D "6f7b71c2d216403715f7364ac88dec88d9da989c"
>> @@ -19,7 +19,7 @@ SRC_URI =3D "git://
>> github.com/containers/crun.git;branch=3Dmain;name=3Dcrun;protocol=3Dh
>> <https://urldefense.com/v3/__http://github.com/containers/crun.git;branc=
h=3Dmain;name=3Dcrun;protocol=3Dh__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4=
BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1a1kPdAw$>
>>
>> file://0002-libocispec-fix-array-items-parsing.patch;patchdir=3Dlibocisp=
ec
>> \
>>            "
>>
>> -PV =3D "1.26.0+git"
>> +PV =3D "1.27.1+git"
>>
>
> I know I had mentioned that updates could be sent to released branches,
> but these
> simply won't be applied to that branch
>
> bugfix only updates, or individual patches only.
>
> master will continue to receive updates on a roughly monthly cadence.
>
> Bruce
>
> Hi Bruce,
>
> As you know, the current SRCREV is inlcuded in tag 1.27, it's between 1.2=
6
> and 1.27 changed by the last patch upgrading patch.
>
> $ git clone https://github.com/containers/crun.git
> $ cd crun
> $ git tag --contain 393509db566bedea037d1599c5a58b896f5d3b01
> 1.27
> 1.27.1
>
> and I know you have declared it in the patch comment as the version
> "1.26-160-g393509db".
>
> So in this patch, it's not a upgrading from 1.26 to 1.27 in the strict
> sense, perhaps we can regard it from 1.27 to 1.27.1 and most of these
> commits were bugfix.
>
> Could you please think about it again?
>

Thanks for digging into this =E2=80=94 appreciate the careful look. I think=
 there's
a subtle gap in the reasoning though, and I want to walk through it
because it matters for how we frame these bumps.

As you know (I'm including a bit of detail here that isn't news to anyone,
I'm just walking through the logic in case I have it wrong)

git tag --contains and git describe answer different questions:

- git tag --contains C asks "which tags have C as an ancestor?". The
answer naturally grows over time as new tags get cut. A given commit
"becomes" listed under 1.27, then 1.27.1, then 1.28, and so on =E2=80=94 bu=
t
the commit itself hasn't changed; the tag landscape around it has.

- git describe C asks "what was the latest released version when this
commit was made?". That's stable. For 393509db it's
1.26-160-g393509db =E2=80=94 meaning "1.26 plus 160 commits of unreleased
work on the way to whatever comes next". When I bumped to it, 1.27
didn't yet exist; the 1.27 tag was placed afterward, on a descendant
commit.

Recipe SRCREV pins are an identity claim about a state =E2=80=94 they captu=
re
what the project considered itself to be at that point. If we used the
tag --contains view, the same commit would equally count as "really
1.27", "really 1.27.1", and "really 1.28" depending on when you ran
the query, which makes "what version is this?" depend on what gets
released later. That's why I lean on git describe for these =E2=80=94 it gi=
ves
a fixed answer regardless of when you ask.

So from where I sit, this bump moves us from a state in the 1.26 line
(one tag behind 1.27 at the time it was made) to a state in the 1.27
line, which is a minor-version cross and gets handled under stable-branch
rules accordingly =E2=80=94 even if most of the intervening commits are bug
fixes.

That being said, if you can show me an audit of all the commits on
top of 1.26 -> 1.27 are 100% bug fixes, then I'd much rather do the
version bump versus taking them all as patches in the recipe.

Hope that helps explain the pushback; happy to keep talking it through
if I'm missing something.

Bruce

Thanks.
>
>
>
>
>>
>>  inherit autotools-brokensep pkgconfig features_check
>>
>> --
>> 2.53.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9809):
>> https://lists.yoctoproject.org/g/meta-virtualization/message/9809
>> <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-virtu=
alization/message/9809__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_w=
WjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX0a4U_SOg$>
>> Mute This Topic: https://lists.yoctoproject.org/mt/119480093/1050810
>> <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/119480093=
/1050810__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA=
2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX2Gur5Ahg$>
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
>> <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-virtu=
alization/unsub__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTT=
RYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX2IP739BA$>
>> [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000e277690652d7ed87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 26, 2026 at 10:08=
=E2=80=AFPM Chi, Zhixiong &lt;<a href=3D"mailto:zhixiong.chi@windriver.com"=
>zhixiong.chi@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><u></u>

 =20
  <div style=3D"padding-bottom:1px">
    <p><br>
    </p>
    <div>On 5/25/26 21:08, Bruce Ashfield wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <strong>
      </strong>
      <div style=3D"border:1pt solid rgb(156,101,0);padding:2pt;background:=
rgb(252,252,3)"><strong><u></u><span style=3D"font-size:11pt;color:rgb(0,0,=
0)">CAUTION: This email
              comes from a non Wind River email account!</span><u></u></str=
ong><br>
        <u></u><span style=3D"font-size:10pt;color:rgb(0,0,0)">Do not click=
 links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        <u></u></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div style=3D"font-size:small"><br>
            </div>
          </div>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 25, 2026 at
              9:03=E2=80=AFAM Zhixiong Chi via
              <a href=3D"https://urldefense.com/v3/__http://lists.yoctoproj=
ect.org__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2=
cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX0GynnmDg$" target=3D"_blank">
                lists.yoctoproject.org</a> &lt;zhixiong.chi=3D<a href=3D"ma=
ilto:windriver.com@lists.yoctoproject.org" target=3D"_blank">windriver.com@=
lists.yoctoproject.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              Bumping crun to version v1.27.1, which comprises the
              following commits:<br>
              <br>
              =C2=A0 =C2=A0 3ec076b3 NEWS: tag 1.27.1<br>
              =C2=A0 =C2=A0 60b2e8f8 tests, podman: pin to 5.8<br>
              =C2=A0 =C2=A0 3010d29d tests: fix failure in user namespace<b=
r>
              =C2=A0 =C2=A0 d6ffa244 krun: remove unused variable<br>
              =C2=A0 =C2=A0 1c5c2f7d linux: pass correct propagation to
              get_bind_mount<br>
              =C2=A0 =C2=A0 d97461f0 tests: add regression test for idmappe=
d mount
              leak<br>
              =C2=A0 =C2=A0 59cfa8b8 Revert &quot;linux: skip redundant MS_=
PRIVATE
              propagation mounts&quot;<br>
              =C2=A0 =C2=A0 f1b70c0b tests: add subcgroup cleanup test<br>
              =C2=A0 =C2=A0 6177dd86 cgroup: fix recursive cgroup cleanup
              consuming caller&#39;s fd<br>
              =C2=A0 =C2=A0 6c58b0c6 fix -Wdiscarded-qualifiers warnings<br=
>
              =C2=A0 =C2=A0 acb904c6 krun: Build passt argv based on nitro =
variant<br>
              =C2=A0 =C2=A0 8199cbb2 krun: implement support for passt netw=
orking<br>
              =C2=A0 =C2=A0 7c2500df krun: ignore RAM configurations below =
128MB<br>
              =C2=A0 =C2=A0 23f7d9f0 krun: consolidate configuration in
              configure_vm<br>
              =C2=A0 =C2=A0 04c19ac6 krun: process the vm configuration ear=
lier<br>
              =C2=A0 =C2=A0 81c21e0d handlers: add new hook to close fds<br=
>
              =C2=A0 =C2=A0 d8813f3d .codespellrc: ignore passt<br>
              =C2=A0 =C2=A0 94d7f641 utils: fix apparmor profile not applie=
d in
              user namespaces<br>
              =C2=A0 =C2=A0 805e6a44 libcrun: skip cgroup filesystem type c=
heck
              when cgroups are disabled<br>
              =C2=A0 =C2=A0 4c530d43 libcrun: fall back to bind mount for
              /dev/console on read-only file systems<br>
              =C2=A0 =C2=A0 a718a92c NEWS: tag 1.27<br>
              =C2=A0 =C2=A0 6220914d nix: generate git-version.h in buildPh=
ase<br>
              =C2=A0 =C2=A0 9553f8b8 exec: strengthen -u value validation<b=
r>
              =C2=A0 =C2=A0 1bd7f424 exec: fix CVE-2026-30892<br>
              =C2=A0 =C2=A0 5699da29 nix: fix zlib cross-compilation for s3=
90x<br>
              =C2=A0 =C2=A0 237f8100 nix: remove global overlay to eliminat=
e
              rebuild cascade<br>
              =C2=A0 =C2=A0 b37594dc release: use path: flake ref to avoid =
libgit2
              <a href=3D"https://urldefense.com/v3/__http://safe.directory_=
_;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76Wb=
jWOFd_BshZp9xtYSCkhX7RHkrOX255E1T9Q$" target=3D"_blank">
                safe.directory</a><br>
              =C2=A0 =C2=A0 aaa6056c release: seed /nix from container imag=
e when
              empty<br>
              =C2=A0 =C2=A0 c4e3fd22 linux: set MS_PRIVATE on detached moun=
ts from
              get_bind_mount()<br>
              =C2=A0 =C2=A0 360621a3 Revert &quot;container: skip sigaction=
 reset in
              unblock_signals for the run path&quot;<br>
              =C2=A0 =C2=A0 5d1b0284 nix: migrate to flakes<br>
              =C2=A0 =C2=A0 246a3367 nix: generate git-version.h in buildPh=
ase<br>
              =C2=A0 =C2=A0 3e9986bc nix: bump nixos/nix image from 2.24.9 =
to
              2.34.2<br>
              =C2=A0 =C2=A0 094c97f3 nix: update<br>
              =C2=A0 =C2=A0 195f664f seccomp_notify: tighten crun_make_erro=
r input<br>
              =C2=A0 =C2=A0 1d76be72 seccomp: tighten crun_make_error input=
<br>
              =C2=A0 =C2=A0 62d3e852 container: tighten crun_make_error inp=
ut<br>
              =C2=A0 =C2=A0 254a8a75 linux: use open_tree+mount_setattr for=
 device
              mounts<br>
              =C2=A0 =C2=A0 2d6f4c0e linux: use open_tree+move_mount for ma=
sked
              paths<br>
              =C2=A0 =C2=A0 45e62ce5 linux: use open_tree+mount_setattr for
              readonly paths<br>
              =C2=A0 =C2=A0 f53aa376 linux: use mount_setattr for readonly
              remounts in finalize_mounts<br>
              =C2=A0 =C2=A0 2dae2238 linux: skip redundant MS_PRIVATE propa=
gation
              mounts<br>
              =C2=A0 =C2=A0 38e17199 container: skip sigaction reset in
              unblock_signals for the run path<br>
              =C2=A0 =C2=A0 4b66d8f0 cgroup: skip enable_controllers when j=
oined
              via CLONE_INTO_CGROUP<br>
              =C2=A0 =C2=A0 a59b186b linux: validate run.oci.mount_context_=
type
              annotation value<br>
              =C2=A0 =C2=A0 16bd4e48 utils: do not use errno after success<=
br>
              <br>
              Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.ch=
i@windriver.com" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt;<br>
              ---<br>
              =C2=A0recipes-containers/crun/<a href=3D"https://urldefense.c=
om/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatP=
SL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1s4OHFmA$" rel=3D"nor=
eferrer" target=3D"_blank">crun_git.bb</a>
              | 4 ++--<br>
              =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/recipes-containers/crun/<a href=3D"https://urlde=
fense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4=
BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1s4OHFmA$" rel=
=3D"noreferrer" target=3D"_blank">crun_git.bb</a>
              b/recipes-containers/crun/<a href=3D"https://urldefense.com/v=
3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_w=
WjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1s4OHFmA$" rel=3D"norefer=
rer" target=3D"_blank">crun_git.bb</a><br>
              index d2f7b63b..f4e489d5 100644<br>
              --- a/recipes-containers/crun/<a href=3D"https://urldefense.c=
om/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatP=
SL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1s4OHFmA$" rel=3D"nor=
eferrer" target=3D"_blank">crun_git.bb</a><br>
              +++ b/recipes-containers/crun/<a href=3D"https://urldefense.c=
om/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatP=
SL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1s4OHFmA$" rel=3D"nor=
eferrer" target=3D"_blank">crun_git.bb</a><br>
              @@ -3,7 +3,7 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
              =C2=A0LIC_FILES_CHKSUM =3D
              <a>&quot;file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3&quot;</a><br>
              =C2=A0PRIORITY =3D &quot;optional&quot;<br>
              <br>
              -SRCREV_crun =3D &quot;393509db566bedea037d1599c5a58b896f5d3b=
01&quot;<br>
              +SRCREV_crun =3D &quot;3ec076b3b6714ec2f1a10533cf18d5605a6de6=
37&quot;<br>
              =C2=A0SRCREV_libocispec =3D
              &quot;8b07b619df73a113f7721f1c7ce24f2572b04cea&quot;<br>
              =C2=A0SRCREV_ispec =3D &quot;a4c6ade7bb82b316d45391f572727a63=
e268b252&quot;<br>
              =C2=A0SRCREV_rspec =3D &quot;6f7b71c2d216403715f7364ac88dec88=
d9da989c&quot;<br>
              @@ -19,7 +19,7 @@ SRC_URI =3D &quot;git://<a href=3D"https://=
urldefense.com/v3/__http://github.com/containers/crun.git;branch=3Dmain;nam=
e=3Dcrun;protocol=3Dh__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wW=
jwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1a1kPdAw$" rel=3D"noreferr=
er" target=3D"_blank">github.com/containers/crun.git;branch=3Dmain;name=3Dc=
run;protocol=3Dh</a><br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              <a>file://0002-libocispec-fix-array-items-parsing.patch;patch=
dir=3Dlibocispec</a>
              \<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
              <br>
              -PV =3D &quot;1.26.0+git&quot;<br>
              +PV =3D &quot;1.27.1+git&quot;<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div style=3D"font-size:small">I know
                I had mentioned that updates could be sent to released
                branches, but these</div>
              <div style=3D"font-size:small">simply
                won&#39;t be applied to that branch</div>
              <div style=3D"font-size:small"><br>
              </div>
              <div style=3D"font-size:small">bugfix
                only updates, or individual patches only.</div>
              <div style=3D"font-size:small"><br>
              </div>
              <div style=3D"font-size:small">master
                will continue to receive updates on a roughly monthly
                cadence.</div>
              <div style=3D"font-size:small"><br>
              </div>
              <div style=3D"font-size:small">Bruce</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Hi Bruce,</p>
    <p>As you know, the current SRCREV is inlcuded in tag 1.27, it&#39;s
      between 1.26 and 1.27 changed by the last patch upgrading patch. <br>
    </p>
    <p>$ git clone <a href=3D"https://github.com/containers/crun.git" targe=
t=3D"_blank">https://github.com/containers/crun.git</a><br>
      $ cd crun<br>
      $ git tag --contain 393509db566bedea037d1599c5a58b896f5d3b01<br>
      1.27<br>
      1.27.1<br>
    </p>
    <p>and I know you have declared it in the patch comment as the
      version &quot;1.26-160-g393509db&quot;.</p>
    <p>So in this patch, it&#39;s not a upgrading from 1.26 to 1.27 in the
      strict sense, perhaps we can regard it from 1.27 to 1.27.1 and
      most of these commits were bugfix.</p>
    <p>Could you please think about it again?</p></div></blockquote><div><b=
r></div><div>Thanks for digging into this =E2=80=94 appreciate the careful =
look. I think there&#39;s</div><div>a subtle gap in the reasoning though, a=
nd I want to walk through it<br>because it matters for how we frame these b=
umps.<br><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">As you know (I&#39;m including a bit of detail here that isn&#39;t news=
 to anyone,</div><div class=3D"gmail_default" style=3D"font-size:small">I&#=
39;m just walking through the logic in case I have it wrong)</div><br></div=
><div>git tag --contains and git describe answer different questions:<br><b=
r></div><div>- git tag --contains C asks &quot;which tags have C as an ance=
stor?&quot;. The<br>answer naturally grows over time as new tags get cut. A=
 given commit<br>&quot;becomes&quot; listed under 1.27, then 1.27.1, then 1=
.28, and so on =E2=80=94 but<br>the commit itself hasn&#39;t changed; the t=
ag landscape around it has.<br><br></div><div>- git describe C asks &quot;w=
hat was the latest released version when this<br>commit was made?&quot;. Th=
at&#39;s stable. For 393509db it&#39;s<br>1.26-160-g393509db =E2=80=94 mean=
ing &quot;1.26 plus 160 commits of unreleased<br>work on the way to whateve=
r comes next&quot;. When I bumped to it, 1.27<br>didn&#39;t yet exist; the =
1.27 tag was placed afterward, on a descendant<br>commit.<br><br><span clas=
s=3D"gmail_default" style=3D"font-size:small">R</span>ecipe SRCREV pins are=
 an identity claim about a state =E2=80=94 they capture<br>what the project=
 considered itself to be at that point. If we used the<br>tag --contains vi=
ew, the same commit would equally count as &quot;really<br>1.27&quot;, &quo=
t;really 1.27.1&quot;, and &quot;really 1.28&quot; depending on when you ra=
n<br>the query, which makes &quot;what version is this?&quot; depend on wha=
t gets<br>released later. That&#39;s why I lean on git describe for these =
=E2=80=94 it gives<br>a fixed answer regardless of when you ask.<br><br></d=
iv><div>So from where I sit, this bump moves us from a state in the 1.26 li=
ne<br>(one tag behind 1.27 at the time it was made) to a state in the 1.27<=
br>line, which is a minor-version cross and gets handled under stable-branc=
h<br>rules accordingly =E2=80=94 even if most of the intervening commits ar=
e bug<br>fixes.</div><div><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">That being said, if you can show me an audit of all the com=
mits on</div><div class=3D"gmail_default" style=3D"font-size:small">top of =
1.26 -&gt; 1.27 are 100% bug fixes, then I&#39;d much rather do the</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">version bump versus ta=
king them all as patches in the recipe.</div><div><br></div><div>Hope that =
helps explain the pushback; happy to keep talking it<span class=3D"gmail_de=
fault" style=3D"font-size:small">=C2=A0</span>through</div><div>if I&#39;m =
missing something.</div><div><br><div class=3D"gmail_default" style=3D"font=
-size:small">Bruce</div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div style=3D"padding-bottom:1px">
    <p>Thanks.<br>
    </p>
    <blockquote type=3D"cite">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote">
            <div>
              <br>
            </div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              =C2=A0inherit autotools-brokensep pkgconfig features_check<br=
>
              <br>
              -- <br>
              2.53.0<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#9809): <a href=3D"https://urldefense.com/=
v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/9809__;!!=
AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOF=
d_BshZp9xtYSCkhX7RHkrOX0a4U_SOg$" rel=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/message/9809</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.yoctoproject.org/mt/119480093/1050810__;!!AjveYdw8EvQ!cnA8qqQTA9nQ=
EfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX2=
Gur5Ahg$" rel=3D"noreferrer" target=3D"_blank">
                https://lists.yoctoproject.org/mt/119480093/1050810</a><br>
              Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@li=
sts.yoctoproject.org" target=3D"_blank">
                meta-virtualization+owner@lists.yoctoproject.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!cnA8qqQTA=
9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkr=
OX2IP739BA$" rel=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follo=
w
            the NULL pointer, for chaos and madness await thee at its
            end<br>
            - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </div>
  <u></u><u></u>

</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000e277690652d7ed87--

