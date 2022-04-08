Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D27C433FE
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:51:27 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.235.1649439738890564328
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 10:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zcf7yzWC;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id i27so18722967ejd.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 10:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ey6B2gHPK7kaIpnMYQDW8qDKhAa6NtatgLAVbZEVgMg=;
        b=Zcf7yzWCln3+rpd2pwKTSXNjjtzdH5yLXX6AuTnoti/pp7Vq3E4rd5nD5sGTxZ/XHK
         a6qB4AmwZXnrDcrapZL288QfPqyWUa9DnXiMd4pQO5XA2PqwdXajukzKhV8YhwgpeQ1Q
         QNs74tiDPBZG028KsC8V4zW0V41RCI8VuJjZHBxFSEUuYWVPNTI4nHI/Sf5eHpDrDffm
         rSVcZCy7Fs+UIQpZjtESAKi+29AYeJcXKgqVC/93r0i8vrBuUoaiFNTZhkjKD6rcF+OV
         /xw+Wy0i9Bt/B0IG1wkZKc199rCmh5YM6Cf8IUc4SZNfLDsP+c46tGbWSH8u3DJGWct9
         4VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ey6B2gHPK7kaIpnMYQDW8qDKhAa6NtatgLAVbZEVgMg=;
        b=lZE74tjLOev/c6CArmLzH6YAo5iFKHl8zGkiF8qS03R+OllQ1w4TetyIHhtEM50cG/
         6vtWOCw7Q3HETsv2ZALLyWSFjx5JOIx75Dr49NF2la6od/dRNLYUTLjk1eGefe6H69eP
         767gVEVYZ5qy+vCrAtVLZOyZKyLcV2u6D+RUQM6/uj7UTx8xXGfsDxsq/YicjLhs6lju
         enyy6mXN2bngAcStPhgo1LKZMZYbEoTUWb4iirxM0pSFMwujk6eNNHPcN/iaaLyHueHF
         w1/zoEQZGoen/CV60tcuHePbi5TE8AUxoVREYcAF1GuzyTBB0mNCEqCyKRt37aUy26z9
         CotA==
X-Gm-Message-State: AOAM5326jkXx3FKvOzRaU7d5G1UoS4gEjzvyV1U83iNGSyI9ARp0Y9BP
	55CxYDEGc9uyuXAzMTR4gNqs1WdPe37kzhcQZo8=
X-Google-Smtp-Source: 
 ABdhPJxR8sPLBrFQs7KVysuvbHw1F8f9xHlcbz3fpKv/lRCGn75GM97nSjGqIOG5aiV3xFH1FulpT+lUaJTpYTPFZ68=
X-Received: by 2002:a17:907:1ca3:b0:6e0:5a9:37a1 with SMTP id
 nb35-20020a1709071ca300b006e005a937a1mr19569972ejc.651.1649439737027; Fri, 08
 Apr 2022 10:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220408123346.1493384-1-adrian.freihofer@siemens.com>
 <16E3ECED528B7F3F.29738@lists.yoctoproject.org>
 <CADkTA4Nt6_gN3cVY5r5SMJ2ZtfDLO3_N6zQ9+N2Ht0e5p-vD=g@mail.gmail.com>
 <61bb8330149e3c795baf1b72f443c68e43b5de72.camel@gmail.com>
In-Reply-To: <61bb8330149e3c795baf1b72f443c68e43b5de72.camel@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Apr 2022 13:42:05 -0400
Message-ID: 
 <CADkTA4OaZ1=frgL_wCsJi6VwJq7OuA2D2VCEuWjkycbgbPAGWA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: do not use a go file as patch
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009aa30c05dc281df9"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Apr 2022 17:51:27 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7141

--0000000000009aa30c05dc281df9
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 8, 2022 at 1:31 PM Adrian Freihofer <adrian.freihofer@gmail.com>
wrote:

> Hi Bruce
>
> Build with empty download folder works:
>   bitbake k3s -c cleanall
>   (cd downloads; find -name \*andreyvit\* -delete )
>   bitbake k3s
>
> My download folder looks like that after building K3S
> downloads]$ find -name \*andreyvit\*
> ./git2/github.com.andreyvit.diff
> ./git2/github.com.andreyvit.diff.done
> ./gitshallow_github.com.andreyvit.diff_c7f18ee-1.tar.gz
> ./gitshallow_github.com.andreyvit.diff_c7f18ee-1.tar.gz.done
>
>
> This does not work:
>   bitbake k3s -c cleanall
>
>   downloads]$ find -name \*andreyvit\*
>   ./gitshallow_github.com.andreyvit.diff_c7f18ee-1.tar.gz
>   ./gitshallow_github.com.andreyvit.diff_c7f18ee-1.tar.gz.done
>
>   bitbake k3s
>   ERROR: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-
>   r0 do_patch: Importing patch 'github.com.andreyvit.diff' with
>   striplevel '1' FileNotFoundError(2, 'No such file or directory')
>
> Conclusion: After bitbake k3s -c cleanall the error occurs.
>
>
I'll see if I see the same behaviour, as i've done a LOT of cleanalls as I
battled the uprev of k3s, and didn't see that. But it could have been
hidden in a fail -> restart cycle as things moved past the issue.


> I also spent some time to analyze what the function "patch_path" in
> patch.py does: It matches ".diff" against "github.com.andreyvit.diff".
>

Indeed, I suppose something could be done to allow that repo to have that
name, and not be picked up as a patch, but it isn't a common problem, so
the complexity wouldn't really be worth it.

Once i've reproduced the issue, i'll test with your patch, as it is the
simplest way to avoid the problem.

Bruce



>
> Regards,
> Adrian
>
>
> On Fri, 2022-04-08 at 10:29 -0400, Bruce Ashfield wrote:
> >
> >
> > On Fri, Apr 8, 2022 at 8:53 AM Bruce Ashfield via
> > lists.yoctoproject.org
> > <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
> > >
> > >
> > > On Fri, Apr 8, 2022 at 8:34 AM Adrian Freihofer
> > > <adrian.freihofer@gmail.com> wrote:
> > > > Compiling k3s failed with:
> > > > do_patch: Importing patch 'github.com.andreyvit.diff' with
> > > > striplevel '1'
> > > >
> > > > The problem is that github.com/andreyvit/diff ends up as
> > > > github.com.andreyvit.diff
> > > > in the download folder which than matches the test in patch.py.
> > > >
> > > >
> > >
> > >
> > > I've built this K3S hundreds of times, and have never seen this, so
> > > I won't apply this until I figure out what is the difference
> > > between your environment and mine.
> > >
> > > Can you share more details about your build environment, etc.
> > >
> >
> >
> > I am seeing a different fetch issue on a new/fresh machine I brought
> > up this morning, using the -tip of master for all layers. My
> > cached downloads were keeping it working on my other machines.
> >
> > I'll get past that issue and see if I get the patch issue.
> >
> > Cheers,
> >
> > Bruce
> >
> >
> >
> > >
> > >
> > > > Not sure how you create this huge SRC_URI list. Probably it would
> > > > be the
> > > > best to add the apply=no to all urls.
> > > >
> > > >
> > >
> > >
> > > Eh, no. I'm not going to append that to all the URIs just because
> > > of one outlier that matched.
> > >
> > > Bruce
> > >
> > >
> > > > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > > > ---
> > > >  recipes-containers/k3s/k3s_git.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-
> > > > containers/k3s/k3s_git.bb
> > > > index e2a3ffc..53a8677 100644
> > > > --- a/recipes-containers/k3s/k3s_git.bb
> > > > +++ b/recipes-containers/k3s/k3s_git.bb
> > > > @@ -219,7 +219,7 @@ SRC_URI += "git://github.com/alexflint/go-
> > > > filemutex;name=go-filemutex;protocol=h
> > > >  # github.com/andreyvit/diff v0.0.0-20170406064948-c7f18ee00883
> > > >  # [1] git ls-remote https://github.com/andreyvit/diff
> > > > c7f18ee00883bfd3b00e0a2bf7607827e0148ad4
> > > >  SRCREV_diff="c7f18ee00883bfd3b00e0a2bf7607827e0148ad4"
> > > > -SRC_URI +=
> > > > "git://github.com/andreyvit/diff;name=diff;protocol=https;nobranc
> > > > h=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.co
> > > > m/andreyvit/diff"
> > > > +SRC_URI +=
> > > > "git://github.com/andreyvit/diff;name=diff;protocol=https;nobranc
> > > > h=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.co
> > > > m/andreyvit/diff;apply=no"
> > > >
> > > >  # github.com/andybalholm/cascadia v1.0.0
> > > >  # [1] git ls-remote https://github.com/andybalholm/cascadia
> > > > 901648c87902174f774fac311d7f176f8647bdaa
> > > > --
> > > > 2.35.1
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness
> > > await thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#7135):
> > > https://lists.yoctoproject.org/g/meta-virtualization/message/7135
> > > Mute This Topic: https://lists.yoctoproject.org/mt/90334188/1050810
> > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > Unsubscribe:
> > > https://lists.yoctoproject.org/g/meta-virtualization/unsub
> > > [bruce.ashfield@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >
> >
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009aa30c05dc281df9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Apr 8, 2022 at 1:31 PM Adrian Freihofer &lt=
;<a href=3D"mailto:adrian.freihofer@gmail.com">adrian.freihofer@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi=
 Bruce<br>
<br>
Build with empty download folder works:<br>
=C2=A0 bitbake k3s -c cleanall<br>
=C2=A0 (cd downloads; find -name \*andreyvit\* -delete )<br>
=C2=A0 bitbake k3s<br>
<br>
My download folder looks like that after building K3S<br>
downloads]$ find -name \*andreyvit\*<br>
./git2/github.com.andreyvit.diff<br>
./git2/github.com.andreyvit.diff.done<br>
./<a href=3D"http://gitshallow_github.com" target=3D"_blank">gitshallow_git=
hub.com</a>.andreyvit.diff_c7f18ee-1.tar.gz<br>
./<a href=3D"http://gitshallow_github.com" target=3D"_blank">gitshallow_git=
hub.com</a>.andreyvit.diff_c7f18ee-1.tar.gz.done<br>
<br>
<br>
This does not work:<br>
=C2=A0 bitbake k3s -c cleanall<br>
<br>
=C2=A0 downloads]$ find -name \*andreyvit\*<br>
=C2=A0 ./<a href=3D"http://gitshallow_github.com" target=3D"_blank">gitshal=
low_github.com</a>.andreyvit.diff_c7f18ee-1.tar.gz<br>
=C2=A0 ./<a href=3D"http://gitshallow_github.com" target=3D"_blank">gitshal=
low_github.com</a>.andreyvit.diff_c7f18ee-1.tar.gz.done<br>
<br>
=C2=A0 bitbake k3s<br>
=C2=A0 ERROR: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-=
<br>
=C2=A0 r0 do_patch: Importing patch &#39;github.com.andreyvit.diff&#39; wit=
h=C2=A0<br>
=C2=A0 striplevel &#39;1&#39; FileNotFoundError(2, &#39;No such file or dir=
ectory&#39;)<br>
<br>
Conclusion: After bitbake k3s -c cleanall the error occurs.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I&#39;ll see if I see the same behaviour, as i&#39;ve done=
 a LOT of cleanalls as I battled the uprev of k3s, and didn&#39;t see that.=
 But it could have been hidden in a fail -&gt; restart cycle as things move=
d past the issue.</div></div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
I also spent some time to analyze what the function &quot;patch_path&quot; =
in<br>
patch.py does: It matches &quot;.diff&quot; against &quot;github.com.andrey=
vit.diff&quot;.<br></blockquote><div><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">Indeed, I suppose something could be done to all=
ow that repo to have that name, and not be picked up as a patch, but it isn=
&#39;t a common problem, so the complexity wouldn&#39;t really be worth it.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Once i&#39;ve reproduced=
 the issue, i&#39;ll test with your patch, as it is the simplest way to avo=
id the problem.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Regards,<br>
Adrian<br>
<br>
<br>
On Fri, 2022-04-08 at 10:29 -0400, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Apr 8, 2022 at 8:53 AM Bruce Ashfield via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a><br>
&gt; &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.or=
g" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; On Fri, Apr 8, 2022 at 8:34 AM Adrian Freihofer<br>
&gt; &gt; &lt;<a href=3D"mailto:adrian.freihofer@gmail.com" target=3D"_blan=
k">adrian.freihofer@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; Compiling k3s failed with:<br>
&gt; &gt; &gt; do_patch: Importing patch &#39;github.com.andreyvit.diff&#39=
; with<br>
&gt; &gt; &gt; striplevel &#39;1&#39;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The problem is that <a href=3D"http://github.com/andreyvit/d=
iff" rel=3D"noreferrer" target=3D"_blank">github.com/andreyvit/diff</a> end=
s up as<br>
&gt; &gt; &gt; github.com.andreyvit.diff<br>
&gt; &gt; &gt; in the download folder which than matches the test in patch.=
py.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; I&#39;ve built this K3S hundreds of times, and have never seen th=
is, so<br>
&gt; &gt; I won&#39;t apply this until I figure out what is the difference<=
br>
&gt; &gt; between your environment and mine.<br>
&gt; &gt; <br>
&gt; &gt; Can you share more details=C2=A0about your build environment, etc=
.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; I am seeing a different fetch issue on a new/fresh machine I brought<b=
r>
&gt; up this morning, using the -tip of master for all layers. My<br>
&gt; cached=C2=A0downloads were keeping it working on my other machines.<br=
>
&gt; <br>
&gt; I&#39;ll get past that issue and see if I get the patch issue.<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt; <br>
&gt; =C2=A0<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0<br>
&gt; &gt; &gt; Not sure how you create this huge SRC_URI list. Probably it =
would<br>
&gt; &gt; &gt; be the<br>
&gt; &gt; &gt; best to add the apply=3Dno to all urls.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Eh, no. I&#39;m not going to append that to all the URIs just bec=
ause<br>
&gt; &gt; of one outlier that matched.<br>
&gt; &gt; <br>
&gt; &gt; Bruce<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0<br>
&gt; &gt; &gt; Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian=
.freihofer@siemens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&=
gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; =C2=A0recipes-containers/k3s/<a href=3D"http://k3s_git.bb" r=
el=3D"noreferrer" target=3D"_blank">k3s_git.bb</a> | 2 +-<br>
&gt; &gt; &gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/recipes-containers/k3s/<a href=3D"http://k3s_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">k3s_git.bb</a> b/recipes-<br>
&gt; &gt; &gt; containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"noreferr=
er" target=3D"_blank">k3s_git.bb</a><br>
&gt; &gt; &gt; index e2a3ffc..53a8677 100644<br>
&gt; &gt; &gt; --- a/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" r=
el=3D"noreferrer" target=3D"_blank">k3s_git.bb</a><br>
&gt; &gt; &gt; +++ b/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" r=
el=3D"noreferrer" target=3D"_blank">k3s_git.bb</a><br>
&gt; &gt; &gt; @@ -219,7 +219,7 @@ SRC_URI +=3D &quot;git://<a href=3D"http=
://github.com/alexflint/go-" rel=3D"noreferrer" target=3D"_blank">github.co=
m/alexflint/go-</a><br>
&gt; &gt; &gt; filemutex;name=3Dgo-filemutex;protocol=3Dh<br>
&gt; &gt; &gt; =C2=A0# <a href=3D"http://github.com/andreyvit/diff" rel=3D"=
noreferrer" target=3D"_blank">github.com/andreyvit/diff</a> v0.0.0-20170406=
064948-c7f18ee00883<br>
&gt; &gt; &gt; =C2=A0# [1] git ls-remote <a href=3D"https://github.com/andr=
eyvit/diff" rel=3D"noreferrer" target=3D"_blank">https://github.com/andreyv=
it/diff</a><br>
&gt; &gt; &gt; c7f18ee00883bfd3b00e0a2bf7607827e0148ad4 <br>
&gt; &gt; &gt; =C2=A0SRCREV_diff=3D&quot;c7f18ee00883bfd3b00e0a2bf7607827e0=
148ad4&quot;<br>
&gt; &gt; &gt; -SRC_URI +=3D<br>
&gt; &gt; &gt; &quot;git://<a href=3D"http://github.com/andreyvit/diff;name=
=3Ddiff;protocol=3Dhttps;nobranc" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/andreyvit/diff;name=3Ddiff;protocol=3Dhttps;nobranc</a><br>
&gt; &gt; &gt; h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
<a href=3D"http://github.co" rel=3D"noreferrer" target=3D"_blank">github.co=
</a><br>
&gt; &gt; &gt; m/andreyvit/diff&quot;<br>
&gt; &gt; &gt; +SRC_URI +=3D<br>
&gt; &gt; &gt; &quot;git://<a href=3D"http://github.com/andreyvit/diff;name=
=3Ddiff;protocol=3Dhttps;nobranc" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/andreyvit/diff;name=3Ddiff;protocol=3Dhttps;nobranc</a><br>
&gt; &gt; &gt; h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
<a href=3D"http://github.co" rel=3D"noreferrer" target=3D"_blank">github.co=
</a><br>
&gt; &gt; &gt; m/andreyvit/diff;apply=3Dno&quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; =C2=A0# <a href=3D"http://github.com/andybalholm/cascadia" r=
el=3D"noreferrer" target=3D"_blank">github.com/andybalholm/cascadia</a> v1.=
0.0<br>
&gt; &gt; &gt; =C2=A0# [1] git ls-remote <a href=3D"https://github.com/andy=
balholm/cascadia" rel=3D"noreferrer" target=3D"_blank">https://github.com/a=
ndybalholm/cascadia</a><br>
&gt; &gt; &gt; 901648c87902174f774fac311d7f176f8647bdaa <br>
&gt; &gt; &gt; -- <br>
&gt; &gt; &gt; 2.35.1<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; -- <br>
&gt; &gt; - Thou shalt not follow the NULL pointer, for chaos and madness<b=
r>
&gt; &gt; await thee at its end<br>
&gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#7135):<br>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/g/meta-virtualization/m=
essage/7135" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoprojec=
t.org/g/meta-virtualization/message/7135</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/903=
34188/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/mt/90334188/1050810</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.=
yoctoproject.org" target=3D"_blank">meta-virtualization+owner@lists.yoctopr=
oject.org</a><br>
&gt; &gt; Unsubscribe:<br>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/g/meta-virtualization/u=
nsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g=
/meta-virtualization/unsub</a><br>
&gt; &gt; [<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">br=
uce.ashfield@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000009aa30c05dc281df9--

