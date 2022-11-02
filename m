Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5622C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 14:36:55 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web12.7107.1667399814516259497
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Nov 2022 07:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H94Fnw+X;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id g13so9569495ile.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Nov 2022 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OYy+R8bSeKPtuHmUoEItTQbq2/2NTGQHCzXIlmFsmfU=;
        b=H94Fnw+XnsyA7Z7VUXfqDR35vchsiMO4haqvKhXJU2gEA0e4JivqXoIbtT5ewE7z/I
         lgRsQqq8EZKg53oB91kIE7Y2MaiowoRyBTTXA17XhJsVRCTwyo2by5XlBFC3J19pmD/i
         oVTps6oFsI5N0newza34C5JDmNPMnJCmw13+FdM6sUOe52RD96ZGYjniBLpPHWdgSF1H
         t6BeS5O0TPhT3TPqd5/JDEuAi5BX/ohQ/jK6rpUbgxZhDa/A5Ffk5Dk3E8H5TS9j7YIU
         qVYQOnCeS7rtYpxTiE3I9F1LrBzG1klMpNTjJLtZLcv9fY2E689ERj3JA45QE1W5oASj
         KB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYy+R8bSeKPtuHmUoEItTQbq2/2NTGQHCzXIlmFsmfU=;
        b=dp00bmjwPXMPXHOB7fP2XIOJR61Pqn6hmy3os+NELmG8dlogoDS5n55LMpwd8pCdik
         1e1QSHoZjdVxBQLrinth6oiEWkK6ZXdvi5xs1ViZ4ZQBk7anwI0GRtXXaeKdTkaD34na
         RmKRhyG6VMBswa/yKrtnbVKxvFJjlnu36dfa0qEyI4fdtYOrt9BHWBdQ9CJAZbeRlTyO
         4zA7nz7GBiyPbXgJEkLpgsru7YAt+fCc57CPjcLUNooIE4yyqTXobN1raP1j3vWlgR0v
         oKE4SUI/QVdwAiXCyU/kLr32E1tj6jZz1oXipzk6uJS3ur5VOAstwVsSoUeOt6+qlmmn
         GmWw==
X-Gm-Message-State: ACrzQf1XkR6csIZC2oSqtANdHyu8yit2m64yT6YSTXafiVINrO/JFMKK
	acafiiwM3pN212ghfwdcir9EGDXjSJMq64+aBXg=
X-Google-Smtp-Source: AMsMyM5lMJA+LxmXvOs1HVKqxHvX/EAm6qyrDD3hm7j3zih2B7f66ZlN76DNw427UA84LUQoIUU0q0NYZfKVLpf0OD0=
X-Received: by 2002:a92:c910:0:b0:300:bfb8:65fa with SMTP id
 t16-20020a92c910000000b00300bfb865famr6944411ilp.276.1667399813884; Wed, 02
 Nov 2022 07:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221030161333.12430-1-f_l_k@t-online.de> <20221030161333.12430-2-f_l_k@t-online.de>
 <CADkTA4PfHFDrq5McxwSLg957MpFVjZgWpUiBzFm18AM4xUO-sg@mail.gmail.com> <6GGOKR.9UDK9PG7M6LM3@t-online.de>
In-Reply-To: <6GGOKR.9UDK9PG7M6LM3@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 2 Nov 2022 10:36:42 -0400
Message-ID: <CADkTA4O0LB3vt2cUsnF=TMGTNLefwYxTCP5Osh5p4V1d1hWaQw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] virt-viewer: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009af0dc05ec7dc59a"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Nov 2022 14:36:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7674

--0000000000009af0dc05ec7dc59a
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 1, 2022 at 12:29 PM Markus Volk <f_l_k@t-online.de> wrote:

> Am Mo, 31. Okt 2022 um 12:04:37 -0400 schrieb Bruce Ashfield <
> bruce.ashfield@gmail.com>:
>
> These dependencies are the biggest "issue" with the recipe.
> meta-virtualization doesn't currently have a dependency on the layers that
> provide those packages.
>
>
> Hi Bruce,
>
> thanks for the review. I tried to follow your suggestions, but since I
> didn't know of a suitable distro feature that would ensure meta-gnome is
> included, I cleaned up the dependencies and used a configuration that
> doesn't include it by default. This way, the recipe hopefully doesn't have
> to be skipped and can be built with only the layers that README says are
> needed. (Assuming that spice-gtk, which is currently being tested in
> meta-networking master-next, will be good to merge).
>
Thanks for the quick turnaround on the v2!

The packageconfig route solves the problem, and I'll pull these in for
testing.

Bruce



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009af0dc05ec7dc59a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 1, 2022 at 12:29 PM Markus Volk &lt;<a =
href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div i=
d=3D"m_6608397856802233588m_8730113892122364741geary-body" dir=3D"auto">Am =
Mo, 31. Okt 2022 um 12:04:37 -0400 schrieb Bruce Ashfield &lt;<a href=3D"ma=
ilto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</=
a>&gt;:<br><blockquote type=3D"cite">These dependencies are the biggest &qu=
ot;issue&quot; with the recipe. meta-virtualization doesn&#39;t currently h=
ave a dependency on the layers that provide those packages.=C2=A0</blockquo=
te><div><br></div><div>Hi Bruce,</div><div><br></div><div>thanks for the re=
view. I tried to follow your suggestions, but since I didn&#39;t know of a =
suitable distro feature that would ensure meta-gnome is included, I cleaned=
 up the dependencies and used a configuration that doesn&#39;t include it b=
y default. This way, the recipe hopefully doesn&#39;t have to be skipped an=
d can be built with only the layers that README says are needed. (Assuming =
that spice-gtk, which is currently being tested in meta-networking master-n=
ext, will be good to merge).</div></div></blockquote></div><div class=3D"gm=
ail_default" style=3D"font-size:small"></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Thanks for the quick turnaround on the v2!</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">The packageconfig route solves=
 the problem, and I&#39;ll pull these in for testing.</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Bruce</div><div><br></div><br clear=3D"all"><d=
iv><br></div>-- <br><div dir=3D"ltr">- Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end<br>- &quot;Use the force Ha=
rry&quot; - Gandalf, Star Trek II<br><br></div></div>

--0000000000009af0dc05ec7dc59a--

