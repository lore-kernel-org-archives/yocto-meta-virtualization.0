Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ECFC636F4
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.29680.1649684497143767221
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 06:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TaI7qQON;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id v4so4959127edl.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 06:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iJk4buUGS/yTUZyiVL99GIdu6/REOODTg+T3SR7hERY=;
        b=TaI7qQONZJFzrJDt6uMPr3sKLZdnIUEO6DYrzBGVTG3pePBDZ1IDmFy4W7bbtXRgcS
         P0JVnLO4iyMJeqcNYn+OQ9qn4euBf8o95fKmE4OP74bZbAEaS4DJApMEpc2wRWM/rgU2
         2oE8z+O8THNf7C7HxTmaQwE2ge68s5u3fBkfkuTUcMLBcSKHJt0eF44r7b5bWjiq8hFO
         baUc/B+cVk9Zga2Nl64ML/JppStqEHTUP/O5lafLF2/8QGGQ5zkLNZu4Sael8CQwKdWE
         52vH6nV2oldCxNXO+HS2s/VGqxv/GWLp26Tv6viQlxVwFJv7VRDM0+fYYlRuQ1sYdYiJ
         Vk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iJk4buUGS/yTUZyiVL99GIdu6/REOODTg+T3SR7hERY=;
        b=RvSbEpxp1re7D0DA4MW5qBaBm4U7UcV7Q23R1XFvIXKFxOuyWonLfPPkGAqDTeeesD
         P9+40l461w1+hhgvvaogBCYcseztb53CzXbs+R3KK3ZwbzUNEhol7sPcE8ne0E79MV2/
         eGGt3iyplYdKNWDNQFu4awvean+Eq9JSpnRhPJDEpsHgDBpF5mVll7pySG6p8SzmZf5s
         PAmjgiGRZ5yhD+z3CSYugi++Xz0FOGeU5py5chJHfqn5rVvVvPk9QB2BBn1rixPRBh5/
         ac8YbcWk7c72NTRehP1/Q9GBWMkS52a2mGqe1cYu+odkpnoEuSjAPhW8F6ph52JEOOF2
         pKgw==
X-Gm-Message-State: AOAM533J5S2ANsYSG/wgE8pyfNn79g34ODvYw/s2Zfd2om5kWykU6Jyq
	3c+I/1PNVz5EFpy29FqvpJiJk81tOsgEePWjssA=
X-Google-Smtp-Source: 
 ABdhPJzHYktQRMykY3X9IVcbDlu08dzx+vWPvmbdlIv4iPU1fOk/6B/RI7qV0h1ilqtSkMrcFLtDnMKSlN+ynL15xUY=
X-Received: by 2002:a05:6402:1b07:b0:41d:7abf:8337 with SMTP id
 by7-20020a0564021b0700b0041d7abf8337mr5478708edb.185.1649684495641; Mon, 11
 Apr 2022 06:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220408123346.1493384-1-adrian.freihofer@siemens.com>
 <16E3ECED528B7F3F.29738@lists.yoctoproject.org>
 <CADkTA4Nt6_gN3cVY5r5SMJ2ZtfDLO3_N6zQ9+N2Ht0e5p-vD=g@mail.gmail.com>
 <61bb8330149e3c795baf1b72f443c68e43b5de72.camel@gmail.com>
 <16E3FCB436E5E39A.13739@lists.yoctoproject.org>
In-Reply-To: <16E3FCB436E5E39A.13739@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Apr 2022 09:41:24 -0400
Message-ID: 
 <CADkTA4OXxw_EJqZ5Rz2EBHqM_9RVFUYG3ewcFFFVG=B8kvVvSw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: do not use a go file as patch
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
 meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005aae2305dc611a3f"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7159

--0000000000005aae2305dc611a3f
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 8, 2022 at 1:42 PM Bruce Ashfield via lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:

>
>
> On Fri, Apr 8, 2022 at 1:31 PM Adrian Freihofer <
> adrian.freihofer@gmail.com> wrote:
>
>> Hi Bruce
>>
>> Build with empty download folder works:
>>   bitbake k3s -c cleanall
>>   (cd downloads; find -name \*andreyvit\* -delete )
>>   bitbake k3s
>>
>> My download folder looks like that after building K3S
>> downloads]$ find -name \*andreyvit\*
>> ./git2/github.com.andreyvit.diff
>> ./git2/github.com.andreyvit.diff.done
>> ./gitshallow_github.com.andreyvit.diff_c7f18ee-1.tar.gz
>> ./gitshallow_github.com.andreyvit.diff_c7f18ee-1.tar.gz.done
>>
>>
>> This does not work:
>>   bitbake k3s -c cleanall
>>
>>   downloads]$ find -name \*andreyvit\*
>>   ./gitshallow_github.com.andreyvit.diff_c7f18ee-1.tar.gz
>>   ./gitshallow_github.com.andreyvit.diff_c7f18ee-1.tar.gz.done
>>
>>   bitbake k3s
>>   ERROR: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-
>>   r0 do_patch: Importing patch 'github.com.andreyvit.diff' with
>>   striplevel '1' FileNotFoundError(2, 'No such file or directory')
>>
>> Conclusion: After bitbake k3s -c cleanall the error occurs.
>>
>>
> I'll see if I see the same behaviour, as i've done a LOT of cleanalls as I
> battled the uprev of k3s, and didn't see that. But it could have been
> hidden in a fail -> restart cycle as things moved past the issue.
>

I've done multiple executions of that exact set of steps, and I've never
seen the error you are encountering. Clearly there's something different in
the various build environments.

We are also getting reports of k3s working in other CI setups and runtime
success, so it also isn't happening everywhere.

That being said, the patch is simple enough, and as long as it doesn't
break my tests (re-running with it queued now), I'll merge it and just keep
an eye out for other similar behaviour popping up.

Bruce



>
>
>> I also spent some time to analyze what the function "patch_path" in
>> patch.py does: It matches ".diff" against "github.com.andreyvit.diff".
>>
>
> Indeed, I suppose something could be done to allow that repo to have that
> name, and not be picked up as a patch, but it isn't a common problem, so
> the complexity wouldn't really be worth it.
>
> Once i've reproduced the issue, i'll test with your patch, as it is the
> simplest way to avoid the problem.
>
> Bruce
>
>
>
>>
>> Regards,
>> Adrian
>>
>>
>> On Fri, 2022-04-08 at 10:29 -0400, Bruce Ashfield wrote:
>> >
>> >
>> > On Fri, Apr 8, 2022 at 8:53 AM Bruce Ashfield via
>> > lists.yoctoproject.org
>> > <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>> > >
>> > >
>> > > On Fri, Apr 8, 2022 at 8:34 AM Adrian Freihofer
>> > > <adrian.freihofer@gmail.com> wrote:
>> > > > Compiling k3s failed with:
>> > > > do_patch: Importing patch 'github.com.andreyvit.diff' with
>> > > > striplevel '1'
>> > > >
>> > > > The problem is that github.com/andreyvit/diff ends up as
>> > > > github.com.andreyvit.diff
>> > > > in the download folder which than matches the test in patch.py.
>> > > >
>> > > >
>> > >
>> > >
>> > > I've built this K3S hundreds of times, and have never seen this, so
>> > > I won't apply this until I figure out what is the difference
>> > > between your environment and mine.
>> > >
>> > > Can you share more details about your build environment, etc.
>> > >
>> >
>> >
>> > I am seeing a different fetch issue on a new/fresh machine I brought
>> > up this morning, using the -tip of master for all layers. My
>> > cached downloads were keeping it working on my other machines.
>> >
>> > I'll get past that issue and see if I get the patch issue.
>> >
>> > Cheers,
>> >
>> > Bruce
>> >
>> >
>> >
>> > >
>> > >
>> > > > Not sure how you create this huge SRC_URI list. Probably it would
>> > > > be the
>> > > > best to add the apply=no to all urls.
>> > > >
>> > > >
>> > >
>> > >
>> > > Eh, no. I'm not going to append that to all the URIs just because
>> > > of one outlier that matched.
>> > >
>> > > Bruce
>> > >
>> > >
>> > > > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>> > > > ---
>> > > >  recipes-containers/k3s/k3s_git.bb | 2 +-
>> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-
>> > > > containers/k3s/k3s_git.bb
>> > > > index e2a3ffc..53a8677 100644
>> > > > --- a/recipes-containers/k3s/k3s_git.bb
>> > > > +++ b/recipes-containers/k3s/k3s_git.bb
>> > > > @@ -219,7 +219,7 @@ SRC_URI += "git://github.com/alexflint/go-
>> > > > filemutex;name=go-filemutex;protocol=h
>> > > >  # github.com/andreyvit/diff v0.0.0-20170406064948-c7f18ee00883
>> > > >  # [1] git ls-remote https://github.com/andreyvit/diff
>> > > > c7f18ee00883bfd3b00e0a2bf7607827e0148ad4
>> > > >  SRCREV_diff="c7f18ee00883bfd3b00e0a2bf7607827e0148ad4"
>> > > > -SRC_URI +=
>> > > > "git://github.com/andreyvit/diff;name=diff;protocol=https;nobranc
>> > > > h=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.co
>> > > > m/andreyvit/diff"
>> > > > +SRC_URI +=
>> > > > "git://github.com/andreyvit/diff;name=diff;protocol=https;nobranc
>> > > > h=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.co
>> > > > m/andreyvit/diff;apply=no"
>> > > >
>> > > >  # github.com/andybalholm/cascadia v1.0.0
>> > > >  # [1] git ls-remote https://github.com/andybalholm/cascadia
>> > > > 901648c87902174f774fac311d7f176f8647bdaa
>> > > > --
>> > > > 2.35.1
>> > > >
>> > > >
>> > > >
>> > > >
>> > >
>> > >
>> > > --
>> > > - Thou shalt not follow the NULL pointer, for chaos and madness
>> > > await thee at its end
>> > > - "Use the force Harry" - Gandalf, Star Trek II
>> > >
>> > >
>> > >
>> > >
>> >
>> >
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7141):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7141
> Mute This Topic: https://lists.yoctoproject.org/mt/90334188/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000005aae2305dc611a3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Apr 8, 2022 at 1:42 PM Bruce Ashfield via <=
a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;bru=
ce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com=
@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font=
-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Apr 8, 2022 at 1:31 PM Adrian Freihofer &lt;=
<a href=3D"mailto:adrian.freihofer@gmail.com" target=3D"_blank">adrian.frei=
hofer@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi Bruce<br>
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
<br></blockquote><div><br></div><div><div style=3D"font-size:small">I&#39;l=
l see if I see the same behaviour, as i&#39;ve done a LOT of cleanalls as I=
 battled the uprev of k3s, and didn&#39;t see that. But it could have been =
hidden in a fail -&gt; restart cycle as things moved past the issue.</div><=
/div></div></div></blockquote><div><br></div><div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">I&#39;ve done multiple executions of that exa=
ct set of steps, and I&#39;ve never seen the error you are encountering. Cl=
early there&#39;s something different in the various build environments.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">We are also getting reports=
 of k3s working in other CI setups and runtime success, so it also isn&#39;=
t happening everywhere.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">T=
hat being said, the patch is simple enough, and as long as it doesn&#39;t b=
reak my tests (re-running with it queued now), I&#39;ll merge it and just k=
eep an eye out for other similar behaviour popping up.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
I also spent some time to analyze what the function &quot;patch_path&quot; =
in<br>
patch.py does: It matches &quot;.diff&quot; against &quot;github.com.andrey=
vit.diff&quot;.<br></blockquote><div><br></div><div style=3D"font-size:smal=
l">Indeed, I suppose something could be done to allow that repo to have tha=
t name, and not be picked up as a patch, but it isn&#39;t a common problem,=
 so the complexity wouldn&#39;t really be worth it.</div><div style=3D"font=
-size:small"><br></div><div style=3D"font-size:small">Once i&#39;ve reprodu=
ced the issue, i&#39;ll test with your patch, as it is the simplest way to =
avoid the problem.</div><div style=3D"font-size:small"><br></div><div style=
=3D"font-size:small">Bruce</div><div><br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
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
&gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>- Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7141): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7141" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7141</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90334188/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/90334188/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000005aae2305dc611a3f--

