Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D964DC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 11:03:18 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.4171.1646996597850822483
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 03:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lfyXska4;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id b15so6359665edn.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 03:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x827Ph4+pVKQQKeD9zkwz/xOmLjQWrc/ShsYrw+arMA=;
        b=lfyXska4AL+LS8Hx5kgs7wFfemjee7NYXO5k9c63J+zae7wiydcTRh230+6Q0JxkPP
         +q1YGBlsQ/cQr+yo2cMzvCuKo+d/sOwOrt1wWTNwkUGow66ANMRf0psCmPcZ84Xvii6i
         BJkwZKQNHVDRSxtOBeHNzGaG+UWSYHmbhnsBSgaBDBrAk+0dQB87LDKNqoPcuEHh7Ed1
         LZ2YzltDmucI1c4BlKp45sK6g/beV98Fmo7q4ach8KgOgB4Nh1PLBc4E0Ha5aicSPkCC
         4O5+on6MxWgmp8hUoxPwWUyn4kx9DF9DUpsN5YBA6YliOriosZX2TnohdqNVGO1iS2uL
         RHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x827Ph4+pVKQQKeD9zkwz/xOmLjQWrc/ShsYrw+arMA=;
        b=KyDENflNTY12cmREfNLm5sRHkO2Ilzm3d/OUYfIOr0NAQB/406mopsP7Ieaw77oXcl
         IiZ5Ond2VYnMsGdA0oNsEwpsADQSyY17iWQ7/pjHm4SUBEAbxVdU8HSMuQjvX/TJ3ddF
         J45lHrm/V3ndfe5L8Cqy0zhV0FDlLDD4hDKOtvtBotW8iPN/MvL8WZ2MAxuEbGSMglNK
         YWqQxLzPi73OW1aN2vKFF+dFpAzSZsdgRfi9kFmsY3c3aR/ezfKoUd+epWT5yUtlrt2k
         2Q5z5pTSqS/N7zqi/GvYWeWcuV74pCqvEap4vCSnKtQzbk0q0wJ/7LLah69KpFiB73je
         MFfw==
X-Gm-Message-State: AOAM531sFJCghHRmj8bVk6YqcRlH56bgxZbTk48jPxiiBrgyT7UqBi0B
	YZ0hzQkpgZvFHVDlLXAKtGVIZTXBvpsjXofdcs4=
X-Google-Smtp-Source: 
 ABdhPJzWhw1bK2QCPJTPvYkvDrw03Jaw5C+KJ5qaLR04uKxRy8riJTTyhPIN0spCh+49wzRtYpenj414I3L5Ror3EZ0=
X-Received: by 2002:a05:6402:1385:b0:413:2bc6:4400 with SMTP id
 b5-20020a056402138500b004132bc64400mr8355969edv.94.1646996595777; Fri, 11 Mar
 2022 03:03:15 -0800 (PST)
MIME-Version: 1.0
References: <20220311042018.39631-1-tim.orling@konsulko.com>
In-Reply-To: <20220311042018.39631-1-tim.orling@konsulko.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 11 Mar 2022 06:03:04 -0500
Message-ID: 
 <CADkTA4OsUX=cQ-8Jr+BVoRaL13+ppCBkDddZnXH6u35WcRVhvQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] cloud-init: inherit
 setuptools3_legacy
To: Tim Orling <ticotimo@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="00000000000009a39c05d9ef47f1"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Mar 2022 11:03:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7091

--00000000000009a39c05d9ef47f1
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Mar 10, 2022 at 11:20 PM Tim Orling <ticotimo@gmail.com> wrote:

> cloud-init still requires legacy setup.py behavior.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  recipes-extended/cloud-init/cloud-init_21.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb
> b/recipes-extended/cloud-init/cloud-init_21.4.bb
> index 37cf303..f549db9 100644
> --- a/recipes-extended/cloud-init/cloud-init_21.4.bb
> +++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
> @@ -22,7 +22,7 @@ do_install:append() {
>  }
>
>  inherit pkgconfig
> -inherit setuptools3
> +inherit setuptools3_legacy
>  inherit update-rc.d
>  inherit systemd
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7089):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7089
> Mute This Topic: https://lists.yoctoproject.org/mt/89704346/1050810
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

--00000000000009a39c05d9ef47f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Ma=
r 10, 2022 at 11:20 PM Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com"=
>ticotimo@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">cloud-init still requires legacy setup.py behavior.<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/cloud-init/<a href=3D"http://cloud-init_21.4.bb" rel=
=3D"noreferrer" target=3D"_blank">cloud-init_21.4.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/cloud-init/<a href=3D"http://cloud-init_21.4.=
bb" rel=3D"noreferrer" target=3D"_blank">cloud-init_21.4.bb</a> b/recipes-e=
xtended/cloud-init/<a href=3D"http://cloud-init_21.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">cloud-init_21.4.bb</a><br>
index 37cf303..f549db9 100644<br>
--- a/recipes-extended/cloud-init/<a href=3D"http://cloud-init_21.4.bb" rel=
=3D"noreferrer" target=3D"_blank">cloud-init_21.4.bb</a><br>
+++ b/recipes-extended/cloud-init/<a href=3D"http://cloud-init_21.4.bb" rel=
=3D"noreferrer" target=3D"_blank">cloud-init_21.4.bb</a><br>
@@ -22,7 +22,7 @@ do_install:append() {<br>
=C2=A0}<br>
<br>
=C2=A0inherit pkgconfig<br>
-inherit setuptools3 <br>
+inherit setuptools3_legacy<br>
=C2=A0inherit update-rc.d<br>
=C2=A0inherit systemd<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7089): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7089" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7089</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/89704346/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/89704346/1050810</a><br>
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
- Gandalf, Star Trek II<br><br></div>

--00000000000009a39c05d9ef47f1--

