Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4563C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 17:45:27 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.40406.1701193523930343305
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Nov 2023 09:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I/qhRZXz;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-549070a04baso7800605a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Nov 2023 09:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701193522; x=1701798322; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IRnPsWQjwO7+TBnCJ9FBNTwMUHgv364RkpNPGovx+oc=;
        b=I/qhRZXzq+ST1E3lLvMMNHqIy3d4NJtJDXWPHXWVRBcz07yF2bzN40dr4b2NBc5W77
         YBihhSapJJGSJVfbRUSvLhH5PY+AVdR8+yt5rlrfn8am3z/tym+om3shfgBW9UV3soOX
         ruq1wdtYqeFZ12i988EhCshnKB7+UN2rcZCQ/4T5yjSjUYlKp/2eNThtnvYb3hC7Ecjj
         6Dd5BYk0cDrrPUKi+Gt8VMko39AVRJXFshpbqXyd44isQqZgxabD3jhKOkF/yuNfRUnG
         Ve8Kd33TGO+wTnT9reEZhQGhPuw0sjs9cm/L6zeqXVc0HPVX989EjdF0kv0sTSG1O7IW
         ebvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701193522; x=1701798322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRnPsWQjwO7+TBnCJ9FBNTwMUHgv364RkpNPGovx+oc=;
        b=pA34AwRoNutdXCcyNHcUta8ywjAMFf5kM1BcXpcnC4fSdQJeJWiXodO9yr6cJG4SpV
         4ruPLn12u6bHYQ95T6aGLpe1wyL3UbamlTASSuTKa9nC8USh2pQxV3fJfWQinJUv5Tot
         edcustJe338MW4+VW66XaZ/ywnUFCXKJK37BDgL84kSFsLwiWCP6yVP+QeYnjSpVLB/v
         u4TFo+eXRRK/ObteMIcxF67f3tUGSeC41RgjCo5hT0q44xDhM/gu48UuyzEVoiLwDg9J
         Bd0v0Ua+QDRKRCCDoUX9ZwW73gJXvh48TojfXVYXusD+jMP33eBLf+foQ1skEWYFI1n1
         RIpg==
X-Gm-Message-State: AOJu0YxnfkKvpL8pybYHoiUt8BsfKhKs1eruraVv/2rhMv9h0nTixYdO
	/xINgnSRf6VA+JdEQmdyUP5jbpKW3qQgFR57uEY=
X-Google-Smtp-Source: AGHT+IGq1jsAIMnsb0+7JyfGAZ5d+jCmyIHAE+do/BV8MWoCe/SANLTyeZsur9LKnxH/UYNDOaANeLactp2ob5Vjfro=
X-Received: by 2002:a05:6402:1a38:b0:54b:922:1f4f with SMTP id
 be24-20020a0564021a3800b0054b09221f4fmr9500466edb.28.1701193522052; Tue, 28
 Nov 2023 09:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20231127103811.319149-1-michal.orzel@amd.com> <CADkTA4P7xjs7Db+_j6NTde3j0gyKS0R5kGYm9O5pPp+Vu54mMA@mail.gmail.com>
 <7f42849e-6ea3-4530-9a73-f1bc1bcc61be@amd.com> <CACMJ4GYJdMYGgQSoTUzD7MLu+U11Xd4H2ccYjpJDg_y64W4HbQ@mail.gmail.com>
 <e4512578-4783-4ea2-943e-4187bda3184b@amd.com> <179BCAB522548B7D.22216@lists.yoctoproject.org>
 <CADkTA4OhvqXU432-x0J6n2bods+rDorC03fGY4Vjinxnca+UQA@mail.gmail.com>
In-Reply-To: <CADkTA4OhvqXU432-x0J6n2bods+rDorC03fGY4Vjinxnca+UQA@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 28 Nov 2023 09:45:09 -0800
Message-ID: <CACMJ4GZAXXVpiaAXJZt_z6Ev1bw1AieG2_Qotgtx3RUpVm83Sw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/2] xen: follow-up to recent recipes update
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Michal.Orzel@amd.com, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009383e2060b39fbeb"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Nov 2023 17:45:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8481

--0000000000009383e2060b39fbeb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 5:49=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> On Tue, Nov 28, 2023 at 7:56=E2=80=AFAM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Tue, Nov 28, 2023 at 3:42=E2=80=AFAM Orzel, Michal via
> > lists.yoctoproject.org <Michal.Orzel=3Damd.com@lists.yoctoproject.org>
> > wrote:
> > >
> > > On 28/11/2023 04:11, Christopher Clark wrote:
> > > >
> > > > On Mon, Nov 27, 2023 at 6:08=E2=80=AFAM Michal Orzel <michal.orzel@=
amd.com
> <mailto:michal.orzel@amd.com>> wrote:
> > > >
> > > >     On 27/11/2023 14:55, Bruce Ashfield wrote:
> > > >     >
> > > >     > On Mon, Nov 27, 2023 at 5:38=E2=80=AFAM Michal Orzel <
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> wrote:
> > > >     >>
> > > >     >> Some follow-up patches after a recent Xen recipes update.
> > > >     >>
> > > >     >> Open question:
> > > >     >> Shouldn't we set 4.18 as a default version?
> > > >     >
> > > >     > Not yet (and definitely not for nanbield). Perhaps once it ha=
s
> been under
> > > >     > test for a few weeks. I did the updates to get them some extr=
a
> soak time
> > > >     > and make them available in both the upcoming release
> (nanbield) and
> > > >     > master for those that want to use the latest, without making
> it a default
> > > >     > version jump so late in the cycle.
> > > >     Ok.
> > > >
> > > > Thanks, Bruce.
> > > >
> > > >     > As for the changes in master, the 4.18 version on the _git
> recipes is
> > > >     > intentional, as there's been no 4.19 tag that I can find and =
I
> don't bump
> > > >     > versions until I see that in the repo .. so for now, it is
> just the +git
> > > >     > and +stable that is the difference between the 4.18 and _git
> versions.
> > > >     You won't see any 4.19 tag until the next release. The version
> is advertised in
> > > >     the main Makefile [1] and this is what user can see in the syst=
em
> > > >     (e.g. in the boot log, xl info, xen_version hypercall).
> > > >     Bumping the XEN_REL of master recipes
> > > >
> > > > I think it could be helpful for the context of this thread to
> describe them as the "git recipes" rather than using the term "master
> recipe", because the latter unfortunately seems to convey that they are
> somehow superior to the other, versioned, Xen recipes, when in practice
> they are not -- they are deliberately not the default version of Xen that
> is built since, as you note, they are defined:
> > > >
> > > >     to reflect the current development version
> > > >
> > > > of Xen. ie. The git recipes are present alongside the other recipes
> that provide the stable release version(s) of Xen.
> > > >
> > > > As Michal has noted above, putting 4.19 for XEN_REL into the git
> recipe does look right from a Xen source tree perspective for that SRCREV=
,
> even though there is not a 4.19 Xen release, but the proposed commit
> message should be updated to avoid the term "master recipe".
> > > Sounds good to me.
> > >
> > > @Bruce, may I please ask you to take my patch modifying XEN_REL and d=
o
> s/master/git in title on commit?
> > > If not, I will push a v2 of this patch.
> >
> > Regardless of what I've done in the past, I'm still inclined to hold
> > the line on the versioning until at least the first -rc is released.
> >
>
> FWIW, I also don't change the version of the linux-yocto-dev kernels
> until a valid
> -rc1 is released, even though the "version' has moved on from the previou=
s
> release.
>
> That being said, until I find a better option to keep the versions
> reported via
> the runtime to match the package version, I can either bump the version o=
r
> hold / revert the _git recipe until the first release candidates are out.
>
> I'll go ahead and stage the change with the fixup, even if I don't like t=
he
> version management scheme :)
>

Thanks for the extra info, Bruce. So there is still a way to meet your
versioning scheme and have the runtime version match the package version by
changing the default Xen branch selector in the git recipe via the
XEN_BRANCH variable to the latest stable branch, thus:

diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/
xen_git.bb
index 784e71ce..547a7943 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -2,7 +2,7 @@
 SRCREV ?=3D "f96e2f64576cdbb147391c7cb399d393385719a9"

 XEN_REL ?=3D "4.18"
-XEN_BRANCH ?=3D "master"
+XEN_BRANCH ?=3D "stable-4.18"

 SRC_URI =3D " \
     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \

and then anyone building a development version of Xen can update both the
XEN_BRANCH and XEN_REL variables to match the revision that they are
choosing to build.
Does that look OK?

Or another option is to use the XEN_REL value to select the default stable
branch to use:

diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/
xen_git.bb
index 784e71ce..35e6b859 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -2,7 +2,7 @@
 SRCREV ?=3D "f96e2f64576cdbb147391c7cb399d393385719a9"

 XEN_REL ?=3D "4.18"
-XEN_BRANCH ?=3D "master"
+XEN_BRANCH ?=3D "stable-${XEN_REL}"

 SRC_URI =3D " \
     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRAN

Christopher



>
> Bruce
>
> > Bruce
> >
> > >
> > > ~Michal
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8479):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8479
> > Mute This Topic: https://lists.yoctoproject.org/mt/102826507/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/leave/6693017/105081=
0/978058475/xyzzy
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

--0000000000009383e2060b39fbeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Nov 28, 2023 at 5:49=E2=80=AFAM B=
ruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfiel=
d@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Tue, Nov 28, 2023 at 7:56=E2=80=AF=
AM Bruce Ashfield via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a><br>
&lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" ta=
rget=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Nov 28, 2023 at 3:42=E2=80=AFAM Orzel, Michal via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a> &lt;Michal.Orzel=3D<a href=3D"mailto:am=
d.com@lists.yoctoproject.org" target=3D"_blank">amd.com@lists.yoctoproject.=
org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>&gt; &gt; On 28/11/2023 04:11, Christopher Clark wrote:<br>&gt=
; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Nov 27, 2023 at 6:08=E2=80=AFAM Michal Orzel &lt;<a =
href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com=
</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">m=
ichal.orzel@amd.com</a>&gt;&gt; wrote:<br>
&gt; &gt; &gt;<br>&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0On 27/11/2023 14:55, Br=
uce Ashfield wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=
=A0&gt; On Mon, Nov 27, 2023 at 5:38=E2=80=AFAM Michal Orzel &lt;<a href=3D=
"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &l=
t;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.o=
rzel@amd.com</a>&gt;&gt; wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Some follow-up patches after a r=
ecent Xen recipes update.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Open question:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Shouldn&#39;t we set 4.18 as a d=
efault version?<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Not yet (and definitely not for nanb=
ield). Perhaps once it has been under<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; test for a few weeks. I did the upda=
tes to get them some extra soak time<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; and make them available in both the =
upcoming release (nanbield) and<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; master for those that want to use th=
e latest, without making it a default<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; version jump so late in the cycle.<b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Ok.<br>
&gt; &gt; &gt;<br>&gt; &gt; &gt; Thanks, Bruce.<br>&gt; &gt; &gt;<br>&gt; &=
gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; As for the changes in master, the 4.18 ver=
sion on the _git recipes is<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; intentional, as there&#39;s been no =
4.19 tag that I can find and I don&#39;t bump<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; versions until I see that in the rep=
o .. so for now, it is just the +git<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; and +stable that is the difference b=
etween the 4.18 and _git versions.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0You won&#39;t see any 4.19 tag until the =
next release. The version is advertised in<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0the main Makefile [1] and this is what us=
er can see in the system<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0(e.g. in the boot log, xl info, xen_versi=
on hypercall).<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Bumping the XEN_REL of master recipes<br>=
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I think it could be helpful for the context of this thread t=
o describe them as the &quot;git recipes&quot; rather than using the term &=
quot;master recipe&quot;, because the latter unfortunately seems to convey =
that they are somehow superior to the other, versioned, Xen recipes, when i=
n practice they are not -- they are deliberately not the default version of=
 Xen that is built since, as you note, they are defined:<br>
&gt; &gt; &gt;<br>&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0to reflect the current =
development version<br>&gt; &gt; &gt;<br>
&gt; &gt; &gt; of Xen. ie. The git recipes are present alongside the other =
recipes that provide the stable release version(s) of Xen.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; As Michal has noted above, putting 4.19 for XEN_REL into the=
 git recipe does look right from a Xen source tree perspective for that SRC=
REV, even though there is not a 4.19 Xen release, but the proposed commit m=
essage should be updated to avoid the term &quot;master recipe&quot;.<br>
&gt; &gt; Sounds good to me.<br>
&gt; &gt;<br>
&gt; &gt; @Bruce, may I please ask you to take my patch modifying XEN_REL a=
nd do s/master/git in title on commit?<br>
&gt; &gt; If not, I will push a v2 of this patch.<br>
&gt;<br>
&gt; Regardless of what I&#39;ve done in the past, I&#39;m still inclined t=
o hold<br>
&gt; the line on the versioning until at least the first -rc is released.<b=
r>
&gt;<br>
<br>
FWIW, I also don&#39;t change the version of the linux-yocto-dev kernels<br=
>
until a valid<br>
-rc1 is released, even though the &quot;version&#39; has moved on from the =
previous<br>
release.<br>
<br>
That being said, until I find a better option to keep the versions reported=
 via<br>
the runtime to match the package version, I can either bump the version or<=
br>
hold / revert the _git recipe until the first release candidates are out.<b=
r>
<br>
I&#39;ll go ahead and stage the change with the fixup, even if I don&#39;t =
like the<br>
version management scheme :)<br></blockquote><div><br></div><div>Thanks for=
 the extra info, Bruce. So there is still a way to meet your versioning sch=
eme and have the runtime version match the package version by changing the =
default Xen branch selector in the git recipe via the XEN_BRANCH variable t=
o the latest stable branch, thus:</div><div><br></div><div>diff --git a/rec=
ipes-extended/xen/<a href=3D"http://xen_git.bb">xen_git.bb</a> b/recipes-ex=
tended/xen/<a href=3D"http://xen_git.bb">xen_git.bb</a><br>index 784e71ce..=
547a7943 100644<br>--- a/recipes-extended/xen/<a href=3D"http://xen_git.bb"=
>xen_git.bb</a><br>+++ b/recipes-extended/xen/<a href=3D"http://xen_git.bb"=
>xen_git.bb</a><br>@@ -2,7 +2,7 @@<br>=C2=A0SRCREV ?=3D &quot;f96e2f64576cd=
bb147391c7cb399d393385719a9&quot;<br>=C2=A0<br>=C2=A0XEN_REL ?=3D &quot;4.1=
8&quot;<br>-XEN_BRANCH ?=3D &quot;master&quot;<br>+XEN_BRANCH ?=3D &quot;st=
able-4.18&quot;<br>=C2=A0<br>=C2=A0SRC_URI =3D &quot; \<br>=C2=A0 =C2=A0 =
=C2=A0git://<a href=3D"http://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH=
}">xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH}</a> \<br></div><div><br><=
/div><div>and then anyone building a development version of Xen can update =
both the XEN_BRANCH and XEN_REL variables to match the revision that they a=
re choosing to build.<br></div><div>Does that look OK?</div><div><br></div>=
<div>Or another option is to use the XEN_REL value to select the default st=
able branch to use:</div><div><br></div><div>diff --git a/recipes-extended/=
xen/<a href=3D"http://xen_git.bb">xen_git.bb</a> b/recipes-extended/xen/<a =
href=3D"http://xen_git.bb">xen_git.bb</a><br>index 784e71ce..35e6b859 10064=
4<br>--- a/recipes-extended/xen/<a href=3D"http://xen_git.bb">xen_git.bb</a=
><br>+++ b/recipes-extended/xen/<a href=3D"http://xen_git.bb">xen_git.bb</a=
><br>@@ -2,7 +2,7 @@<br>=C2=A0SRCREV ?=3D &quot;f96e2f64576cdbb147391c7cb39=
9d393385719a9&quot;<br>=C2=A0<br>=C2=A0XEN_REL ?=3D &quot;4.18&quot;<br>-XE=
N_BRANCH ?=3D &quot;master&quot;<br>+XEN_BRANCH ?=3D &quot;stable-${XEN_REL=
}&quot;<br>=C2=A0<br>=C2=A0SRC_URI =3D &quot; \<br>=C2=A0 =C2=A0 =C2=A0git:=
//<a href=3D"http://xenbits.xen.org/xen.git;branch=3D${XEN_BRAN">xenbits.xe=
n.org/xen.git;branch=3D${XEN_BRAN</a><br></div><div><br></div><div>Christop=
her</div><div><br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Bruce<br>
<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; ~Michal<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8479): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8479" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/8479</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10282650=
7/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/102826507/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/leave/6693017/1050810/978058475/xyzzy" rel=3D"noreferrer" target=3D"=
_blank">https://lists.yoctoproject.org/g/meta-virtualization/leave/6693017/=
1050810/978058475/xyzzy</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" ta=
rget=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div></div>

--0000000000009383e2060b39fbeb--

