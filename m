Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.2880.1627500704958541954
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 12:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lI6OtPiS;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id jg2so6481669ejc.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Jul 2021 12:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ROCKuskiXccrvlF1LpWijE4Yp3cCaUtql0rDyVeFS2g=;
        b=lI6OtPiSH2UQLTN1m2iqQKirKFP71bMv2Gj/nF5Ivy+AWvKVd4K6fpHz+/6TELUiPt
         B/d+B3SMW8v/3OVpFgBQZ44mD/qRMUIPKWfF29Mq4Lr5jCEDIFHLKGLsjN4vBdYAelRu
         AzNiWefGSFS7kZqmjDZoUDze39ejhdGip6kEMu9HQqb0S9tOkDgi8rbSHxoWYJqlKamk
         owK/O0Gg4psngQ5Uhlq63XvgZ/v0DEg1sDnH9zarsRCu5WabC/QWG0ziG1K9uhikABgl
         TcZTz5RBYvBbvQ4aaIsp3SIFMGiEMf9cQTsXTku6wqKieHgopALdfVu/kmLQ8AtUz9Vm
         U6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ROCKuskiXccrvlF1LpWijE4Yp3cCaUtql0rDyVeFS2g=;
        b=rtDTHPJXd2uO65HkeJmWuAD8KuUoPD4PfjhwuRczSwLCv1+GGRlhkbioMxe2Ba9IdP
         Gr/OT6JZKqOhJNATe3SfYUUS89B+LCmGlgUOksys12ZfhV3S2Yv9Ys12C3ryToSgrEcS
         6d/qTPMCErS+SR5yQMXtQIc+SDSfsm+HxRCXxIL97vKBY/NCumijbnRcG4m4lrrqRI7B
         QTsjtZnlS+Bwc+GSy3oeNNSe3PZGwMijnrNSFUFp20goY2oCojns8xsYvYVPI+m3GtG3
         D2xPYrPnTqs8sz1OlhXGDkNezj0jvbXxOZgLDKHQdVSfPc/WK3rn4L4D/ou9JiBCnqOF
         ja8g==
X-Gm-Message-State: AOAM532RO3L95WIGyZCcSuHEujiqI/xU5DfGFeZe24qhd6crg3GW3ixy
	n40CAIODVIQLxTpV/Y6/vW9ZGnoTdSBJxmfyUqE=
X-Google-Smtp-Source: ABdhPJzRY3bUD4lfITmnwR5yejFxzXDgIvaS6cEBwSKhc7gm1BPWFUwwxGlAknJ3zLhJsuJIV+LsGGHSMFJRTF9Q5uA=
X-Received: by 2002:a17:906:76d8:: with SMTP id q24mr1016955ejn.22.1627500703221;
 Wed, 28 Jul 2021 12:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <ea3f1ccf-b659-631f-460f-bc69be735728@windriver.com>
In-Reply-To: <ea3f1ccf-b659-631f-460f-bc69be735728@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 28 Jul 2021 15:31:32 -0400
Message-ID: <CADkTA4O4TFL0oyKsDZWSKE7R5DhDjU71tj7ktxVdsdZHTDR9TA@mail.gmail.com>
Subject: Re: uprev k8s from v1.20.4 to v1.20.9
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000498bed05c834090a"

--000000000000498bed05c834090a
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 28, 2021 at 2:37 PM Sakib Sajal <sakib.sajal@windriver.com>
wrote:

> Hi Bruce,
>
> I was thinking of upgrading kubernetes on the hardknott branch from
> v1.20.4 to 1.20.9. This change will bring fixes for CVE-2021-25735 and
> CVE-2021-25737 as well as other fixes.
>
> This will bring in 309 commits:
>
> kubernetes.git$ git log --oneline v1.20.4...v1.20.9 | wc -l
> 309
>
> I was wondering if you had already started the work or should I go ahead
> with the uprev to v1.20.9 or any other release.
>

Go ahead. That's still in the same major version, so it is ok to version
bump.

I've already moved master to 1.23 (but see that I messed up the shortlog),

Bruce




>
> Sakib
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000498bed05c834090a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 28, 2021 at 2:37 PM Sakib Sajal &lt;<a =
href=3D"mailto:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Bruce=
,<br>
<br>
I was thinking of upgrading kubernetes on the hardknott branch from <br>
v1.20.4 to 1.20.9. This change will bring fixes for CVE-2021-25735 and <br>
CVE-2021-25737 as well as other fixes.<br>
<br>
This will bring in 309 commits:<br>
<br>
kubernetes.git$ git log --oneline v1.20.4...v1.20.9 | wc -l<br>
309<br>
<br>
I was wondering if you had already started the work or should I go ahead <b=
r>
with the uprev to v1.20.9 or any other release.<br></blockquote><div><br></=
div><div><div class=3D"gmail_default" style=3D"font-size:small">Go ahead. T=
hat&#39;s still in the same major version, so it is ok to version bump.</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">I&#39;ve already moved maste=
r to 1.23 (but see that I messed up the shortlog),=C2=A0</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Bruce<br></div><br></div><div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Sakib<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000498bed05c834090a--
