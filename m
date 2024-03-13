Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D738BC54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 12:58:21 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.15994.1710334697168114032
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 05:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cwAMqvR3;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-29c07bbcd1fso629053a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Mar 2024 05:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710334696; x=1710939496; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysB+vEFZ90f5N0fNUhWLG5PJD5vs9GL6F0ebiTdCCUs=;
        b=cwAMqvR3Z0red28DBOF1fQK/zObmq1PO1npLwQn3g0QL/4Atltf4scbj1FqBQHT8hT
         L77WrcZ0Wl+OF/97TKaJvMUWeyESrEGs55qscwVws5TDrVjl7W9ERDduYanyYB8cu5Ko
         PTYvPI5LV+s+73SNMOFCdAlZlgiz5MujpZCuAFukhFzJl2gEp2YkPPB2AtSkGONCP/WS
         FhliE+dZN6DfNDTSE5vj3tA06HHgOue7U4tq+eAxBS/A1jfuYOfjp6HPQMmyWvjVXkrR
         674Z6DTYeNw5HRa9zijBY1x/09bZVTJ1OCMTdlJ5uA6+6rpxwBbSLqrARZMDUnFWNECm
         PO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710334696; x=1710939496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysB+vEFZ90f5N0fNUhWLG5PJD5vs9GL6F0ebiTdCCUs=;
        b=BqRHypArN8m5ml4Rn9HsKgav2njdo092KKUy1sC4+QAaKoJaLjMcYm+NxcWtJSKz0R
         vpldjSU2ISe8wmHuxVgwgneg7t76ZSsTahvoGH8LuKHTIpkiOQzw14Jr69AULrBsoIP8
         uX+60bA0J0OT5x5pws+MIn6jrDReOGcKyYuzdVlaDm8Tiun/pZLSJ3yzYHR/2MuhmPoO
         v0i9YNu4rB3auook0CXp8Ua7NjPhLdYNcundFad0DzvEFq1UCOjvbYlZVwVn/BBIgojJ
         WMOmTak6TY1nQdtdJeNLb65VnsWBA1FJWdDLJ5IMU8MfL6zdf4P566WOrHNLIcMTsbLU
         zdDw==
X-Forwarded-Encrypted: i=1; AJvYcCXnjERBNQymn+z/YZ9JdOE4sg4xP9KIWBSzNnZjlAmIbaXUq50ocTet+XrfYedYB0jcGPgH2IGOvIzGL2KS5dgVo0Kcp6Idsww++olq6eLU3Oqs0muMB2S3p20=
X-Gm-Message-State: AOJu0YwjFsF5ibK1r2JPmNeC+p1Ldq8WxK0WPueyjI4yWA8ESHocCgnM
	qYltLhuf1nyTpNTaXVx4fx5je+bxbV+N78cMZppkwXy4XUzB2C/50MXct9kcI1AdkSKeIEcZDNr
	l5rN5SnDYnWdrK7poO4Ts31zrfmU=
X-Google-Smtp-Source: AGHT+IEf2G7wuGaWIebGhsKsfuFdTz6IiyGPhYyCg4JLnLX8kC2H13zMvmq9SZmDO/tzJNxQtGtVw1q3yzzBaEYIL2E=
X-Received: by 2002:a17:90a:c695:b0:29b:3106:7f24 with SMTP id
 n21-20020a17090ac69500b0029b31067f24mr3094006pjt.37.1710334696258; Wed, 13
 Mar 2024 05:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <17BA0B9342C35A1E.21429@lists.yoctoproject.org>
 <CADkTA4M9w2W+7Cio6x2DBsHf+i6TPtrodVB4p5it_oGbh0bO-w@mail.gmail.com>
 <CANx9H-B2RS3CP6xg+R3QFCYUO0a6NYTzAgjhaJuoWRjw8dq2jA@mail.gmail.com>
 <CADkTA4Nu=+-2Vj16G=v_tMoL+Z+SKOaMSM9VzfD5jkf0XqcUSw@mail.gmail.com>
 <CACMJ4Ga8A-nkYq6BcyWF9Ar9NTKePaqmmkj7ii0wMkS8g1770A@mail.gmail.com>
 <CADkTA4M1_a+E11jTbFQTuxvUaPR=+TE+rNOo4+46B3f4_ed8Bg@mail.gmail.com>
 <17BC4D73EFF2649F.27213@lists.yoctoproject.org> <d5bcf330-2b3e-d5e9-1b49-db88383ea7b4@windriver.com>
In-Reply-To: <d5bcf330-2b3e-d5e9-1b49-db88383ea7b4@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Mar 2024 08:58:04 -0400
Message-ID: <CADkTA4Pt0+KfK-93T-umk=xKs-9y+N7aCAs54TAF=dAGrkJSug@mail.gmail.com>
Subject: Re: [meta-virtualization] ceph upgrade
To: ChenQi <Qi.Chen@windriver.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, Tim Orling <ticotimo@gmail.com>, 
	meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Mar 2024 12:58:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8635

I'll have a closer look at the patch this morning. Cmake is still not
obvious to me, so I'm going to try and reverse engineer how you came
up with the patches!

Christopher: I'm still interested if there's anything that can be
removed from the vendored dependencies that you were looking into.

Bruce

On Wed, Mar 13, 2024 at 7:10=E2=80=AFAM ChenQi <Qi.Chen@windriver.com> wrot=
e:
>
> I found the install and packaging issues easy to fix. So I spend a
> little more time.
> The patch has been sent out.
>
> There are still some package_qa issues as shown below:
>
> WARNING: ceph-18.2.0-r0 do_package_qa: QA Issue: File
> /usr/bin/cephfs-top in package ceph contains reference to TMPDIR
> File /usr/sbin/cephadm in package ceph contains reference to TMPDIR
> [buildpaths]
> ERROR: ceph-18.2.0-r0 do_package_qa: QA Issue: ceph: /usr/bin/cephfs-top
> maximum shebang size exceeded, the maximum size is 128.
> ceph: /usr/sbin/cephadm maximum shebang size exceeded, the maximum size
> is 128. [shebang-size]
> ERROR: ceph-18.2.0-r0 do_package_qa: QA Issue: /usr/bin/cephfs-top
> contained in package ceph requires
> /ala-lpggp72/qichen/Yocto/builds/build-poky/tmp/work/core2-64-poky-linux/=
ceph/18.2.0/recipe-sysroot-native/usr/bin/python3-native/python3,
> but no providers found in RDEPENDS:ceph? [file-rdeps]
> WARNING: ceph-18.2.0-r0 do_package_qa: QA Issue: File
> /usr/lib/python3.12/site-packages/cephfs.cpython-312-x86_64-linux-gnu.so
> in package ceph-python contains reference to TMPDIR
> File
> /usr/lib/python3.12/site-packages/rbd.cpython-312-x86_64-linux-gnu.so in
> package ceph-python contains reference to TMPDIR
> File
> /usr/lib/python3.12/site-packages/rados.cpython-312-x86_64-linux-gnu.so
> in package ceph-python contains reference to TMPDIR
> File
> /usr/lib/python3.12/site-packages/rgw.cpython-312-x86_64-linux-gnu.so in
> package ceph-python contains reference to TMPDIR
> File
> /usr/lib/python3.12/site-packages/ceph_volume-1.0.0-py3.12.egg-info/depen=
dency_links.txt
> in package ceph-python contains reference to TMPDIR [buildpaths]
> ERROR: ceph-18.2.0-r0 do_package_qa: QA Issue: -dev package ceph-dev
> contains non-symlink .so '/usr/lib/libcephsqlite.so' [dev-elf]
> WARNING: ceph-18.2.0-r0 do_package_qa: QA Issue: File
> /usr/lib/python3.12/site-packages/.debug/cephfs.cpython-312-x86_64-linux-=
gnu.so
> in package ceph-dbg contains reference to TMPDIR
> File
> /usr/lib/python3.12/site-packages/.debug/rbd.cpython-312-x86_64-linux-gnu=
.so
> in package ceph-dbg contains reference to TMPDIR
> File
> /usr/lib/python3.12/site-packages/.debug/rados.cpython-312-x86_64-linux-g=
nu.so
> in package ceph-dbg contains reference to TMPDIR
> File
> /usr/lib/python3.12/site-packages/.debug/rgw.cpython-312-x86_64-linux-gnu=
.so
> in package ceph-dbg contains reference to TMPDIR [buildpaths]
> ERROR: ceph-18.2.0-r0 do_package_qa: Fatal QA errors were found, failing
> task.
> ERROR: Logfile of failure stored in:
> /ala-lpggp72/qichen/Yocto/builds/build-poky/tmp/work/core2-64-poky-linux/=
ceph/18.2.0/temp/log.do_package_qa.3746018
> ERROR: Task
> (/ala-lpggp72/qichen/Yocto/poky/meta-virtualization/recipes-extended/ceph=
/ceph_18.2.0.bb:do_package_qa)
> failed with exit code '1'
>
> Regards,
> Qi
>
>
> On 3/13/24 18:51, Chen Qi via lists.yoctoproject.org wrote:
> > Hi Bruce,
> >
> > I looked into this ceph issue this afternoon. Now I can make
> > do_compile pass.
> > There's still some do_install issue, but I really need to head home now=
.
> > I'll send out my patch soon.
> >
> > Regards,
> > Qi
> >
> >
> > On 3/13/24 02:43, Bruce Ashfield via lists.yoctoproject.org wrote:
> >> On Tue, Mar 12, 2024 at 1:58=E2=80=AFPM Christopher Clark
> >> <christopher.w.clark@gmail.com> wrote:
> >>> On Mon, Mar 11, 2024 at 6:56=E2=80=AFPM Bruce Ashfield
> >>> <bruce.ashfield@gmail.com> wrote:
> >>>> On Mon, Mar 11, 2024 at 8:41=E2=80=AFPM Tim Orling <ticotimo@gmail.c=
om> wrote:
> >>>>> On Mon, Mar 11, 2024 at 2:11=E2=80=AFPM Bruce Ashfield
> >>>>> <bruce.ashfield@gmail.com> wrote:
> >>>>>> Hi all,
> >>>>>>
> >>>>>> I'm still looking for help with this.
> >>>>>>
> >>>>>> It's all fine and well that folks have packages that they are
> >>>>>> interested in more than others, but it needs to be more than
> >>>>>> maintainers that step up and fix the niche packages.
> >>>>>>
> >>>>>> I'm still holding the meta-virt master-next -> master push until
> >>>>>> Ceph
> >>>>>> is upgraded and working.
> >>>>>>
> >>>>>> I know absolutely nothing about CMake, so I'm flailing around in t=
he
> >>>>>> build of Ceph and have gotten no further since I last asked for
> >>>>>> help.
> >>>>> Well I did try, but I am no CMake expert nor ceph expert either. I
> >>>>> got stalled on it detecting =E2=80=9Cthrift=E2=80=9D in one of the =
vendored
> >>>>> libraries.
> >>>> I ended up with that as well (just a few minutes ago), I tried setti=
ng
> >>>> some Thrift variables, but it refuses to detect those as well.
> >>>>
> >>>> The errors seem to rotate .. and it isn't even obvious if some are
> >>>> really fatal, or not.
> >>>>
> >>>> Perhaps it just isn't something that cross builds anymore, and I'll
> >>>> just blacklist it with the broken
> >>>> recipe.
> >>>>
> >>>> I'll have one more try with it tomorrow before giving up.
> >>> Hi Bruce, Tim,
> >>>
> >>> I had a look at this yesterday, and I (possibly?) made some progress
> >>> with it but wanted to ask before getting too far with an approach:
> >>> would it be OK to pull out at least some of those vendored components
> >>> into some new separate recipes, so that rebuilding that compile stage
> >>> when it needs it is faster?
> >>>
> >> I'm fine with stripping it down to the bare minimum to be buildable.
> >>
> >> I'd rather have a building (but small) recipe, and then we can see if
> >> there's
> >> demand for more components.
> >>
> >> I was also poking at this today, and I'm still seeing dramatically
> >> different
> >> results when I call compile multiple times .. all the way back to cmak=
e
> >> complaining it can't find the python3 interpreter, which was a problem
> >> I thought I had solved!
> >>
> >> Feel free to grab me on the #meta-virt channel if you have any
> >> interactive
> >> questions.
> >>
> >> Bruce
> >>
> >>> Christopher
> >>>
> >>>
> >>>> Bruce
> >>>>
> >>>>> We can only take so much abuse from upstream ;)
> >>>>>
> >>>>>
> >>>>>> Bruce
> >>>>>>
> >>>>>> On Tue, Mar 5, 2024 at 9:22=E2=80=AFPM Bruce Ashfield via
> >>>>>> lists.yoctoproject.org
> >>>>>> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>>>>>> Hi all,
> >>>>>>>
> >>>>>>> If anyone has experience with Cmake, I could use a hand
> >>>>>>> completing the
> >>>>>>> ceph upgrade that is marked as WIP in master-next.
> >>>>>>>
> >>>>>>> It took me a few hours today, but I managed to get past python3
> >>>>>>> detection issues, but now I'm running into a compiler test failur=
e
> >>>>>>> during the build.
> >>>>>>>
> >>>>>>> To me, it looks like our sysroot isn't being passed, which could =
be
> >>>>>>> related to the toolchain.cmake not being used (since the
> >>>>>>> compiler test
> >>>>>>> is being launched by a sub component).
> >>>>>>>
> >>>>>>> I'm inclined to be stubborn about this, and keep working on getti=
ng
> >>>>>>> the package bumped, as it has missed a few upgrades and is in
> >>>>>>> need of
> >>>>>>> some love.
> >>>>>>>
> >>>>>>> Bruce
> >>>>>>>
> >>>>>>> --
> >>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness
> >>>>>>> await
> >>>>>>> thee at its end
> >>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness
> >>>>>> await
> >>>>>> thee at its end
> >>>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>
> >>>> --
> >>>> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> >>>> thee at its end
> >>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>
> >>>>
> >>>>
> >>
> >>
> >>
> >>
> >>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8632): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8632
> > Mute This Topic: https://lists.yoctoproject.org/mt/104759213/3618072
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [Qi.Chen@windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

