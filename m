Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97668C3A589
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.8705.1649437496122975328
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 10:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AWsrLh11;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id bq8so18510389ejb.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 10:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vAISw/h9ZKr7tcoMC30kweCaI7YHV6Diea6c+oq0cTE=;
        b=AWsrLh11pbuSLhadvXqRkK99+7MmDqHvuvkLeMqrr0jwnvPsJcXVYXiDUVq5YrI8I1
         L+QUTqGBS4Jws19KVNqIgQvfivDTboZ148ChTgfIGMhJV8xHM/jQEez2X2XvJT3E0djS
         ebk61e8LgYPI6gMdhpWI6wgUpuRMjVb89+77X15+XSS4BpyrOV9173oxz2Xv7AMy7XR5
         tUdpenT6ITshjlwySKFF+rD5uH4iK742kLfU/SJZp/p3Wlwxsx4rDZTt+amXAe1x+vgf
         4mi7Pf5BjcSQpQQvNw81riM1ewCzAI3Yxw6GCw7MRCFgrXcTRKwXRl/d1+jd+C8BcCEr
         kSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vAISw/h9ZKr7tcoMC30kweCaI7YHV6Diea6c+oq0cTE=;
        b=h2fFskeD9es1HV2h7qo1YSd1uT9hBos7fl8Ktlng6tVxS5KK0BFjW2sHnYtm6YHuJl
         sgYBaKTeh4Sr/0uEd/qsFwAdfS22owEHIco37f5EOpNgL1qAx8XJC7g4nEFdL7JXxKkZ
         0oVDPwyOwAlsnDBPO9cxkyxEnz3atQ532X0l14q/a/RFyzx4gL0k5sotebR/hdtEaVnT
         I7A4iwegYpwvPfm0TIX6sDL+zEt0GxlMp4wG7PA/XqMguo+pkjp7DOfWAe1pRsfQwFar
         qAwBJzBdPyJdPPHjxmX0prbFeiak87GeIBEsjDhfGNWRV/0B+eZg4BTiU5TFsQklKSuo
         5Pcw==
X-Gm-Message-State: AOAM530SycCyzNXGXhB6RYWye8Tl1XesHeIJfdsh6n7dZ0LH6XFmjzhK
	WmL4lUH4bctBInWDUFgcHAv8kUpCiyadhgd2ocQ=
X-Google-Smtp-Source: 
 ABdhPJxNL0ET1JDpHf88TKpe964LxVYrN+Q8uGSM6qdWc2aI2e8x3YyHKrDUG+seTIvQ29qSEtfDKNEDYPK9/KPgtc4=
X-Received: by 2002:a17:907:6d11:b0:6df:f38b:b698 with SMTP id
 sa17-20020a1709076d1100b006dff38bb698mr19746290ejc.711.1649437494529; Fri, 08
 Apr 2022 10:04:54 -0700 (PDT)
MIME-Version: 1.0
References: 
 <AM6PR08MB3461FBC64EAFE017BD3EDFBC92E99@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM6PR08MB3461FBC64EAFE017BD3EDFBC92E99@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Apr 2022 13:04:43 -0400
Message-ID: 
 <CADkTA4N1p=UcPFRgwhNr=Ss-eJ1AA5E-zHi5u7JeDi41rgY2+A@mail.gmail.com>
Subject: Re: Issues with k3s runtime on master
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	Richard Neill <Richard.Neill@arm.com>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000f0d26705dc2797b6"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7138

--000000000000f0d26705dc2797b6
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 8, 2022 at 12:54 PM Diego Sueiro <Diego.Sueiro@arm.com> wrote:

> Hi Bruce,
>
> I'm having k3s runtime issues where during the k3s.service start I'm
> getting error messages about missing /usr/libexec/cni/flannel.
>
> I saw that the cni_git.bb recipe was bumped to versions where flannel and
> its plugin are not available anymore.
>
>
In this case, should we have a recipe to provide both flannel and its
> plugin?
>
>
>
Yep. I don't use flannel, so it wasn't something that I had done. That
being said, I wanted to avoid maintaining separate recipes per-plugin, so
when the need arose, I was going to add it to cni_git as an entry on the
SRC_URI.

I can have a go at doing that, now that I know there is a need.

Bruce

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000f0d26705dc2797b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Apr 8, 2022 at 12:54 PM Diego Sueiro &lt;<a=
 href=3D"mailto:Diego.Sueiro@arm.com">Diego.Sueiro@arm.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi Bruce,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
I&#39;m having k3s runtime issues where during the k3s.service start I&#39;=
m getting error messages about missing
<span style=3D"font-size:12pt;font-variant-ligatures:none;text-align:left;b=
ackground-color:rgba(0,0,0,0);display:inline">
/usr/libexec/cni/flannel</span><span style=3D"color:rgb(0,0,0);font-family:=
Calibri,Arial,Helvetica,sans-serif;font-size:12pt">.</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
I saw that the <a href=3D"http://cni_git.bb" target=3D"_blank">cni_git.bb</=
a> recipe was bumped to versions where flannel and its plugin are not avail=
able anymore.</div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)"><span style=3D"font-family:Arial,Helvetica,sans-serif;fo=
nt-size:small;color:rgb(34,34,34)">=C2=A0</span><br></div></div></blockquot=
e><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div s=
tyle=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
In this case, should we have a recipe to provide both flannel and its plugi=
n?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
</div>

</blockquote></div><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Yep. I don&#39;t use flannel, so it wasn&#39;t somethi=
ng that I had done. That being said, I wanted to avoid maintaining separate=
 recipes per-plugin, so when the need arose, I was going to add it to cni_g=
it as an entry on the SRC_URI.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I can have a go at doing that, now that I know there is a need.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><div><br></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>- &quot;U=
se the force Harry&quot; - Gandalf, Star Trek II<br><br></div></div>

--000000000000f0d26705dc2797b6--

