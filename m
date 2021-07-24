Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web08.11047.1627159989445383515
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 24 Jul 2021 13:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QpmMQ9p0;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: krussell7711@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id t128so6202635oig.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 24 Jul 2021 13:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pX2oIvdsiImUDfjwJWjMoo+o/jj3ovK6lYU/xaN62eE=;
        b=QpmMQ9p0zy2G7T9sFrzhfS0zLAS18d/LzqNTFH5AbfUD+GElhXa8DtZsXaV1qiC/Cx
         HshcSt5oObamxJrJP5rpCqFh41aYQdJPhJMGEQelVgJDxGSkke/7DdYqtUnhd/ihHCWH
         bFayQsyXRGC0rYiAXo58hHcvc2/Z74bnDMQFfMJySUXAmlozfhO9KYjEAYcZW0I209IM
         aHZIfXUCotYxjTVrHx38rLGkOOWovXETeq0GBgDacUACyqschq7zjxK8Y2zrcKAo+kFc
         D9JU7nvPVNzrTU7AwOCHJAFr9XIe8YItJpqlqfIHLkrYixLVdZ5v6/cAjPdX0x09h0nv
         OLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pX2oIvdsiImUDfjwJWjMoo+o/jj3ovK6lYU/xaN62eE=;
        b=pGV45dFpn/5OBOQ09VghcjNXrGq3jNyfuq2PVTN/MvJF14CGAZJdLGOH8LU4Qi6ZKv
         gpctpjRWX5mY5RWvI5UrCu+/1cT52j5d3YHe2jFQApf4zEDp23VxOCcDA8XsA/A7hzKj
         vrsDWLp2e6XPGwApmJwZfPrPjT8E1Vpv8z6qZi09TC6zU71c7REYExIb5sBCNBc/IgNm
         SCgiAln8xST6wvynszNkizkng+fDuBwcKMDrSrhM5Eu9sKPjX3qqyAtayV9vN98daevh
         70HCvYlm0DaoYIucIGrVQUMS150ht29+C1Xzem8hIa0Ru6uoPsVQe+jq4vxRF6ySSdiH
         ufVg==
X-Gm-Message-State: AOAM532JMBw38L2zMFfCPgTbTvEszhmUM0hp2C6EzNCd50WB64EGwkDE
	hlrpMqsQiWyVwXy5ufGuDVnIgtTTKFTl9KmQUUw=
X-Google-Smtp-Source: ABdhPJwXGGdbNbZRkFmwaIJe69xMkgnfT1gaTKMyHcuU8xWHL6TOBSSS9nKSyY2Qo6F2lIgArzYFrUfxkL9y3MlSjVI=
X-Received: by 2002:aca:a98f:: with SMTP id s137mr6885519oie.122.1627159988748;
 Sat, 24 Jul 2021 13:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAFrQVPN-a-5DPmxe3A9-o6U=bwsdGQForwQ-qYUPXsJS1pgdCw@mail.gmail.com>
 <32271.1627021942920151318@lists.yoctoproject.org> <CADkTA4Ny_xbg9Tw9zTBVJxzF2d_UAsfaR_Bt9ZWSUsCmzquxuw@mail.gmail.com>
In-Reply-To: <CADkTA4Ny_xbg9Tw9zTBVJxzF2d_UAsfaR_Bt9ZWSUsCmzquxuw@mail.gmail.com>
From: "Kyle Russell" <bkylerussell@gmail.com>
Date: Sat, 24 Jul 2021 15:52:57 -0500
Message-ID: <CAFrQVPMdv14a6XikBcLZPVBO-Xfu5j=Yb3PHn2+rqta8pYVHtQ@mail.gmail.com>
Subject: Re: [meta-virtualization] linux-yocto virtualization requires virtio.scc from yocto-kernel-cache
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <diego.sueiro@arm.com>, meta-virtualization@lists.yoctoproject.org, 
	Wes Lindauer <wesley.lindauer@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001f464005c7e4b59f"

--0000000000001f464005c7e4b59f
Content-Type: text/plain; charset="UTF-8"

Thanks, Bruce!  That's very helpful.  I agree having two copies isn't
ideal, so it's nice to know an approach that allows decoupling has already
been considered.  We'll take a look at these and consider our options.

Kyle

On Fri, Jul 23, 2021 at 1:02 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Fri, Jul 23, 2021 at 2:32 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
> >
> > On Fri, Jul 23, 2021 at 05:03 AM, Kyle Russell wrote:
> >
> > >
> > > Hello,
> > >
> > > meta-virtualization's linux-yocto_virtualization.inc includes
> > > cfg/virtio.scc in KERNEL_FEATURES, which is a dependency from
> > > yocto-kernel-cache.  However, we do not use yocto-kernel-cache with our
> > > custom linux-* recipe, so we're hitting a metadata error because of a
> > > missing virtio.scc.  It seems like the creation of linux-%.bbappend (in
> > > f2f36a8061c600b35b5f0ce1599d59f1d144a3aa) was intentional to match
> kernel
> > > recipes other than linux-yocto*, which we could benefit from, but the
> lack
> > > of yocto-kernel-cache is problematic with virtio.scc.
> > >
> > > Can meta-virtualization provide virtio.scc like it does for the other
> > > kernel features to allow decoupling from yocto-kernel-cache?
> > >
> >
> > Your question made me remember about the docker.scc. Which is being
> maintained
> > both on meta-virt and yocto-kernel-cache. And
> linux-yocto_virtualization.inc makes
> > usage of the one from meta-virt, which feels strange to me since it is a
> > **linux-yocto**_virtualization.inc file that supposedly extends
> linux-yocto*.bb from
> > oe-core.
> > IMHO, for scc/cfg files we should try to rely on a single canonical
> source, and in this
> > case, I believe is yocto-kernel-cache repo. Maintaining the same file
> for the same
> > purpose in two different places brings the risk of diversion and
> increases maintenance
> > effort to keep the instances aligned.
> > Also, the yocto-kernel-cache gives us the ability to easily manage .scc
> files
> > per kernel version.
>
> Yes .. precisely! I'll reply to both email here, so I'm mixing replies
> to Diego and
> Kyle throughout.
>
> We had a similar discussion in #meta-virt about a month ago, when some AGL
> builds were running into a similar issue. The layout of the includes
> and requirement
> for the fragment were intentional, as was the broad nature of the bbappend
> matching.
>
> Without those fragments, I end up debugging end users' subtle runtime
> errors for
> any number of packages in meta-virt, so having issues pop up when the
> fragments can't be found, while annoying, is a useful flag for potential
> issues.
>
> I resisted making a copy of virtio.cfg available in meta-virt for exactly
> the
> reason Diego is bringing up. Maintaining them in two places is not ideal,
> and
> having them centralized is the goal.
>
> To solve the short term issue as we were talking about in #meta-virt, I did
> a couple of things:
>
> A "hack":
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=master-wip&id=40cae93f631e77286de7fa79101abee2f6c04618
>
> But if you use that, you'll need to ensure via other means that you get the
> right configuration enabled.
>
> And something that I had wanted to do for a while, which is the actual
> solution I'm heading towards.
>
>
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/log/?h=master-test
>
> see commits:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=master-test&id=44db8ee6ddf7c9eb1b5ffb22e9b83b3840997da9
> and
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=master-test&id=8db75f2809318cfb4dbe1c6873c5a6bcfefc4d8c
>
> I still haven't done extensive testing with a lot of different kernels,
> hence
> why I haven't moved them to master yet.
>
> But with those two commits, I can remove all of the fragments in the layer
> and rely on the one true reference in the kernel-cache.
>
> Bruce
>
> >
> > > meta-virtualization used to allow this decoupling by configuring the
> virtio
> > > feature without the yocto-kernel-cache in
> > > f1c03f390e95b63d5c2dfba9140d1b07c4d17acf, but that was restructured in
> > > 21d8bcdb791a1ea766a3e7e7663c7b6d49bc861a.  The dependency was not
> required
> > > unless you were using linux-yocto, but as of f2f36a8061c60 is now
> required
> > > for all linux-% recipes.  (We just now noticed because our linux
> recipe has
> > > recently been updated to match a kernel version supported by
> > > meta-virtualization.
> > >
> > > Thanks,
> > >
> > > Kyle
> > >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>
>

--0000000000001f464005c7e4b59f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, Bruce!=C2=A0 That&#39;s very helpful.=C2=A0 I agre=
e having two copies isn&#39;t ideal, so it&#39;s nice to know an approach t=
hat allows decoupling has already been considered.=C2=A0 We&#39;ll take a l=
ook at these and consider our options.<div><br></div><div>Kyle</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri,=
 Jul 23, 2021 at 1:02 PM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfiel=
d@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Fri, Jul 23, 2021 at 2:32 AM Diego =
Sueiro &lt;<a href=3D"mailto:diego.sueiro@arm.com" target=3D"_blank">diego.=
sueiro@arm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Jul 23, 2021 at 05:03 AM, Kyle Russell wrote:<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; meta-virtualization&#39;s linux-yocto_virtualization.inc include=
s<br>
&gt; &gt; cfg/virtio.scc in KERNEL_FEATURES, which is a dependency from<br=
>
&gt; &gt; yocto-kernel-cache.=C2=A0 However, we do not use yocto-kernel-ca=
che with our<br>
&gt; &gt; custom linux-* recipe, so we&#39;re hitting a metadata error bec=
ause of a<br>
&gt; &gt; missing virtio.scc.=C2=A0 It seems like the creation of linux-%.=
bbappend (in<br>
&gt; &gt; f2f36a8061c600b35b5f0ce1599d59f1d144a3aa) was intentional to mat=
ch kernel<br>
&gt; &gt; recipes other than linux-yocto*, which we could benefit from, bu=
t the lack<br>
&gt; &gt; of yocto-kernel-cache is problematic with virtio.scc.<br>
&gt; &gt;<br>
&gt; &gt; Can meta-virtualization provide virtio.scc like it does for the =
other<br>
&gt; &gt; kernel features to allow decoupling from yocto-kernel-cache?<br>
&gt; &gt;<br>
&gt;<br>
&gt; Your question made me remember about the docker.scc. Which is being m=
aintained<br>
&gt; both on meta-virt and yocto-kernel-cache. And linux-yocto_virtualizat=
ion.inc makes<br>
&gt; usage of the one from meta-virt, which feels strange to me since it i=
s a<br>
&gt; **linux-yocto**_virtualization.inc file that supposedly extends linux=
-yocto*.bb from<br>
&gt; oe-core.<br>
&gt; IMHO, for scc/cfg files we should try to rely on a single canonical s=
ource, and in this<br>
&gt; case, I believe is yocto-kernel-cache repo. Maintaining the same file=
 for the same<br>
&gt; purpose in two different places brings the risk of diversion and incr=
eases maintenance<br>
&gt; effort to keep the instances aligned.<br>
&gt; Also, the yocto-kernel-cache gives us the ability to easily manage .s=
cc files<br>
&gt; per kernel version.<br>
<br>
Yes .. precisely! I&#39;ll reply to both email here, so I&#39;m mixing rep=
lies<br>
to Diego and<br>
Kyle throughout.<br>
<br>
We had a similar discussion in #meta-virt about a month ago, when some AGL=
<br>
builds were running into a similar issue. The layout of the includes<br>
and requirement<br>
for the fragment were intentional, as was the broad nature of the bbappend=
<br>
matching.<br>
<br>
Without those fragments, I end up debugging end users&#39; subtle runtime =
errors for<br>
any number of packages in meta-virt, so having issues pop up when the<br>
fragments can&#39;t be found, while annoying, is a useful flag for potenti=
al issues.<br>
<br>
I resisted making a copy of virtio.cfg available in meta-virt for exactly =
the<br>
reason Diego is bringing up. Maintaining them in two places is not ideal, =
and<br>
having them centralized is the goal.<br>
<br>
To solve the short term issue as we were talking about in #meta-virt, I di=
d<br>
a couple of things:<br>
<br>
A &quot;hack&quot;: <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/=
meta-virtualization/commit/?h=3Dmaster-wip&amp;id=3D40cae93f631e77286de7fa7=
9101abee2f6c04618" rel=3D"noreferrer" target=3D"_blank">https://git.yoctopr=
oject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=3Dmaster-wip&amp;id=
=3D40cae93f631e77286de7fa79101abee2f6c04618</a><br>
<br>
But if you use that, you&#39;ll need to ensure via other means that you ge=
t the<br>
right configuration enabled.<br>
<br>
And something that I had wanted to do for a while, which is the actual<br>
solution I&#39;m heading towards.<br>
<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/=
log/?h=3Dmaster-test" rel=3D"noreferrer" target=3D"_blank">https://git.yoct=
oproject.org/cgit/cgit.cgi/meta-virtualization/log/?h=3Dmaster-test</a><br>
<br>
see commits: <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-vi=
rtualization/commit/?h=3Dmaster-test&amp;id=3D44db8ee6ddf7c9eb1b5ffb22e9b83=
b3840997da9" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.=
org/cgit/cgit.cgi/meta-virtualization/commit/?h=3Dmaster-test&amp;id=3D44db=
8ee6ddf7c9eb1b5ffb22e9b83b3840997da9</a><br>
and <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizat=
ion/commit/?h=3Dmaster-test&amp;id=3D8db75f2809318cfb4dbe1c6873c5a6bcfefc4d=
8c" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/cgit/=
cgit.cgi/meta-virtualization/commit/?h=3Dmaster-test&amp;id=3D8db75f2809318=
cfb4dbe1c6873c5a6bcfefc4d8c</a><br>
<br>
I still haven&#39;t done extensive testing with a lot of different kernels=
, hence<br>
why I haven&#39;t moved them to master yet.<br>
<br>
But with those two commits, I can remove all of the fragments in the layer=
<br>
and rely on the one true reference in the kernel-cache.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; &gt; meta-virtualization used to allow this decoupling by configuring=
 the virtio<br>
&gt; &gt; feature without the yocto-kernel-cache in<br>
&gt; &gt; f1c03f390e95b63d5c2dfba9140d1b07c4d17acf, but that was restructu=
red in<br>
&gt; &gt; 21d8bcdb791a1ea766a3e7e7663c7b6d49bc861a.=C2=A0 The dependency w=
as not required<br>
&gt; &gt; unless you were using linux-yocto, but as of f2f36a8061c60 is no=
w required<br>
&gt; &gt; for all linux-% recipes.=C2=A0 (We just now noticed because our =
linux recipe has<br>
&gt; &gt; recently been updated to match a kernel version supported by<br>
&gt; &gt; meta-virtualization.<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt;<br>
&gt; &gt; Kyle<br>
&gt; &gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
--<br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000001f464005c7e4b59f--
