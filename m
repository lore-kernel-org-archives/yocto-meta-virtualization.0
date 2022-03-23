Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFCCC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 21:17:48 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.2827.1648070267476275992
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 14:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HocfGYdW;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id t1so3385978edc.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 14:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DxouHVr58p0aHvwZBD+GosIkrjfdWOk444THfEdliKM=;
        b=HocfGYdWWFGnR0seid9ugeNuCYVqplwTZnVvIPxf9lPdl/M6mZ0wyoBbs38Q1D37oB
         FSF3CYLRTkmQkWV25FGinyeuOcSh9ZzLIy0sg/pRC1vkHg4z0aolow+SFW3+hRcDVqsp
         XEQtPdP/IyIsSS4ALXA3YZbRVe7id9D3yAIMhaKDGV3AEQ/rebW0a22l8V3OViEtA0DW
         LccNpGAKdsaKl7sCp0UB/GvEq2MT+hZreIVU8uuCmSuvWqPcxFRXrEXMsqF4YJ49XPFR
         pXiCSz76WH396sS2NJM3Jvh7FdIKLjRknFjVd3/UJWiOnoJqHKISyKErz2kYi3BELSsp
         KcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DxouHVr58p0aHvwZBD+GosIkrjfdWOk444THfEdliKM=;
        b=218cabmLTmV0PVbV/cej+tdFcpljjXXUGkSy8oQbxJe9Z/p7b9KKxpei99xLYV9sI3
         TbMb0snTstBjGaPYBtQX5Ldse6CbfIZy+IxsmA9oXBK+RfuhMygN6U/wfe9EU/dhYoRF
         YEUoSoS+KxrwM6hBvvulSTxOevE9IKYbKwcSI4iWipqRpcioQS+29KxsZNbI9YHXyPlE
         Zmif9LlxGXK9oud03OTYVmsp6dhaHWIrIX2AgsYcSJo2+KNuEWN+aLd8ZNwj8fiHL5gm
         SdjJLmF5MkJBE1jGY/Qc4wgpJReHqZEWyX8GDBhFDSaYwrNuklRHnCDUY0KchGfpUlBW
         CQxA==
X-Gm-Message-State: AOAM531J5VP+Zoam4GHqlgAnSmtdzA287mUc131oBTb+oQlzgf6AhXb0
	rSVtSui99mdxyFAmCfftqWNPobqsaEWKPzHGya4=
X-Google-Smtp-Source: 
 ABdhPJzCHU/HOQj7+hluC0iJX1UrGEq1B4xq7VRvptVxImdmHPqGt5bH4VlC3JKG7aqnTTmz1p/kVpKc4ZHT4ZnoJAo=
X-Received: by 2002:a05:6402:1385:b0:413:2bc6:4400 with SMTP id
 b5-20020a056402138500b004132bc64400mr2751236edv.94.1648070265890; Wed, 23 Mar
 2022 14:17:45 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
 <3336072A-2629-42A6-AB37-5999A2098157@arm.com>
 <CAG9RwPKUk+cY4wOStyFqHchmm9vJYrFZxtjpC0V9iwrQ+9XdYw@mail.gmail.com>
 <E80D57C8-590D-4B2C-9A6A-5C4F5BEEA24E@arm.com>
 <CAG9RwPL2adysD-Wyu7eN2jmo85b-Ufx6TWoSe82dJ-XQRr02EQ@mail.gmail.com>
 <D673A4B9-BB22-41AA-A13C-E19F1EC52BCF@arm.com>
 <CAG9RwPKbpORfL3FkARJuT=fAM5PZGY-Lkv+PQ-rEjt1+j9qVeQ@mail.gmail.com>
 <26959151-CAA8-4FDC-808D-51F58228EC06@arm.com>
 <AM6PR08MB34615752123840EC55863F2492179@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CAG9RwP+_FzmRwL9O7wMuGPOtVDjh30Z=UZNfeav4ELxga=8n5A@mail.gmail.com>
 <7ABFA491-0F02-43BD-A187-1EBD36E6DB97@arm.com>
 <7c3e09f6d8b36e7e8573384f4dac48f93f5f40ff.camel@linuxfoundation.org>
In-Reply-To: 
 <7c3e09f6d8b36e7e8573384f4dac48f93f5f40ff.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Mar 2022 17:17:34 -0400
Message-ID: 
 <CADkTA4OWyu3qpbUqtjVCGAmsAaZcMMsitX+R8J_X_tSa3vY01Q@mail.gmail.com>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Paulo Sherring <pauloasherring@gmail.com>,
	Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000c36d4f05dae94283"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Mar 2022 21:17:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7112

--000000000000c36d4f05dae94283
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 23, 2022 at 6:30 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2022-03-23 at 08:38 +0000, Bertrand Marquis wrote:
> > Hi Paulo
> >
> > > On 22 Mar 2022, at 16:52, Paulo Sherring via lists.yoctoproject.org
> <pauloasherring=gmail.com@lists.yoctoproject.org> wrote:
> > >
> > > Hello Diego, Bertrand,
> > > Just confirmed that by bringing these changes into hardknott, the
> > > modules get correctly probed on bootup.
> >
> > Great thanks for the info.
> >
> > @Bruce: Maybe it would make sense to backport this as hardknott is LTS ?
> > If yes, please ping me if you need support to do it.
>
> hardknott is not LTS, it is about to go EOL.
>
>
Agreed. I don't like to leave things broken either .. but we really
shouldn't encourage people to keep using the branches that are going out of
support. If I fix this one, there will be other issues that aren't
fixed/patched in the future (and potentially security issues) .. so I'm
leaning towards leaving this not backported.

Bruce



> https://wiki.yoctoproject.org/wiki/Releases
>
> Cheers,
>
> Richard
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c36d4f05dae94283
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Mar 23, 2022 at 6:30 AM Richard Purdie &lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxf=
oundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Wed, 2022-03-23 at 08:38 +0000, Bertrand Marquis wrote:<br>
&gt; Hi Paulo<br>
&gt; <br>
&gt; &gt; On 22 Mar 2022, at 16:52, Paulo Sherring via <a href=3D"http://li=
sts.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproje=
ct.org</a> &lt;pauloasherring=3D<a href=3D"mailto:gmail.com@lists.yoctoproj=
ect.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<=
br>
&gt; &gt; <br>
&gt; &gt; Hello Diego, Bertrand,<br>
&gt; &gt; Just confirmed that by bringing these changes into hardknott, the=
<br>
&gt; &gt; modules get correctly probed on bootup.<br>
&gt; <br>
&gt; Great thanks for the info.<br>
&gt; <br>
&gt; @Bruce: Maybe it would make sense to backport this as hardknott is LTS=
 ?<br>
&gt; If yes, please ping me if you need support to do it.<br>
<br>
hardknott is not LTS, it is about to go EOL.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Agreed. I don&#39;t like to leave things broken either .. =
but we really shouldn&#39;t encourage people to keep using the branches tha=
t are going out of support. If I fix this one, there will be other issues t=
hat aren&#39;t fixed/patched in the future (and potentially security issues=
) .. so I&#39;m leaning towards leaving this not backported. </div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<a href=3D"https://wiki.yoctoproject.org/wiki/Releases" rel=3D"noreferrer" =
target=3D"_blank">https://wiki.yoctoproject.org/wiki/Releases</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000c36d4f05dae94283--

