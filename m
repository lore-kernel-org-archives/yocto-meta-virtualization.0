Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EA5CD37AA
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 21:37:01 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.136.1778189814403374096
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 May 2026 14:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OH/Uquib;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bab2548e8bso6428525ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 07 May 2026 14:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778189814; cv=none;
        d=google.com; s=arc-20240605;
        b=KSA7KyiZ7dfdtzUpmFR10sjvbmHt91TvDFFLgu5BDIaryB9fdukOjua9xbAyw7KveQ
         p3sahNgdD50E91Tuj0qr7Dx20zEEvPwxFwXXg9njG9I7/8ABk03ja3aYIasVmBGP2Gl5
         BwS5qRz+X+CJn4JMFBUtWBHWTVvyxBigxgrYf6d/ESVR5aNZXpPhZYpPFtflJWkzHTDG
         FlP1I/xkzqeMS17kcsOctPwsQsObFiJooFdB5foOYdCTV2zm6zFsKO0QoAs57zxfAJKa
         w+wmOcYw9UkExZfsEAwQ2mEsD4TKLrbcI1AFRTpCfdnP/WAnGw/0jEDmSQh/8lmCW1rt
         MApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SyVFZPBLdJjyQpKqH5cOJOoCg9Bj/3/KAysaCGkmpWg=;
        fh=R6ZEH/+UwfMn6KXNFIwxqhXAJcIVc6Vn1OWDd4EudME=;
        b=JoZaPKZ7xFsa0FUjt+PxiU/ruRyvFIUzr90XtEqvDGVXa6k4KOknKcc2wDsaVSS9d8
         bj/cnifoh0HViYZKXNcd1y2xFm53dSVzN3wvsGJW+X9SiwWeTMvvzmsqnrZCT5aE0ZEq
         0BdZ1IadntLGGgZuqK6Ppf2Z0dqGWRbnldv4SdHQRnpJkonaVFfb5HhYI35fE4Tb60xt
         +udS033LPSTAEGSdzU+yoYkXRs7wDFF1ThmYkS6zOgPtrYna+O1rQBM0Dk//hcsoJzCO
         eO6jDV9ZhJah3iIj5k65Gg2+QzAvzpPYkFlVQnipGAbMQbXrq4VouszOCjn2R0pDsA16
         EsBw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778189814; x=1778794614; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SyVFZPBLdJjyQpKqH5cOJOoCg9Bj/3/KAysaCGkmpWg=;
        b=OH/UquibkJ8akXjbJAhNV9lXwd5cp5hLYf0aUQDUI3j1Eu5R6x778pE0flt6NdVWio
         KGELTvVt9nOIYugIpWI9pqWUJgwOB5qagx8yKC9w59moQy/DBzlVEUEzd7xrGdbG5egj
         TWWYVmUkXY1f5LSVFP/nlWKzZeMTHhmluWlyGN+YalqYnEdYJ1QS4325XqwtoDXq4xHp
         r2pBxcbZxRWmuquQGkSAg5UUi4bnAJJGk981ALHQ73GOCF6qHoTSj6tg1/JKsW43TzxN
         J9NDanOFmOaWCU6qU2jpjXFGcLhsBR1FwQui5guc8nLCpdNf3NG2IOEGG8AAMquaGs9d
         DVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778189814; x=1778794614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyVFZPBLdJjyQpKqH5cOJOoCg9Bj/3/KAysaCGkmpWg=;
        b=Goerb3n3F3DmD/t/v+3mF79eYC0a9ZS5ju07Hh3erpcDB6e0geS7J53l6SVokj7mNz
         UKGemu2ARs8xKPcUT5fq9EvKDC3g6ntO4TRVOuccWbRSGlCEr4WGsGQUVXK6gemZyNxp
         48KXdy311rckEhEKiL36L3jpQEkr6Gso23n6nCTalM4rSKLLPyUlK68OSLJ1x1Jv9SMA
         sN8XgyGfEb4orxyils6h7Jdvu+u5V4+4w4l1xGKrpkfSkM6px/DrF8UoKLMDwxYiWtte
         feZWy1dPlA4VdAXyIqe9XHC0T8+gD3xNbcfYqt0zeLlToNTaBAmdpK4ztZRysZd3tMYh
         Cb8w==
X-Gm-Message-State: AOJu0Yzmjsv1MdiuhvzwETIXdMstc0UbRIdvoahXEodLjz/JvJ6wpGf9
	3A01VrkMzWh5m+pM/c3ji8on2lrzC7ZXYoxDfjqXFLx9kN0aZQD/OoK8zYWM5V0Bl5DI/WahIJH
	0kJ/MuO7XlwzogWl0fNa2WpkOXhTuPok=
X-Gm-Gg: Acq92OEy4UtbzFI7cXFLhDxBw6liyUN7RvNwh9DBP130Vs1afZa9I/FEySjW+K8EWa4
	qHO/X4Ywd1EHmc98IVmbthBLscaIWRmC+2lA/7R3KPptHO4njAfwGr6thFhUL/jEhwHG0tFu2oO
	aq1eG6VMxOXc5bH5hJo6qQOM6AWP5H+cmcM8/OXOoSNf8PXa0gHjx4uL7QUFSI1MCmPtQMIPj21
	lZmqQZaX7/rJGaLCbXXVkFNTHDpIA0V3NmQT+5TZScvCbeXBFa3D7RFhNo41B379sSqxA6/moZ/
	RRFDOunR7umjbJIfBBizFEVDrzN+/pxynxRtsNZSPeUOFLlvAH8=
X-Received: by 2002:a17:903:48f:b0:2ba:4f37:d3a7 with SMTP id
 d9443c01a7336-2ba794c4db4mr76693585ad.27.1778189813657; Thu, 07 May 2026
 14:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <DM4PR11MB61893678145DA76AD96D0B39C43F2@DM4PR11MB6189.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB61893678145DA76AD96D0B39C43F2@DM4PR11MB6189.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 7 May 2026 18:36:42 -0300
X-Gm-Features: AVHnY4KEtV4UbZSpfXIUq-I_tFiEkJRmDFsGeNa79mLmXW9ItYH5El_HYe5SLT0
Message-ID: <CADkTA4OtgHjeGJRWY9mjfar+Kn9DAOjBkm1SdJkVmLMiMVFYDQ@mail.gmail.com>
Subject: Re: meta-virtualization: Wrynose (Yocto 6.0) Release Timeline
To: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"Viral Chavda (vchavda)" <vchavda@cisco.com>
Content-Type: multipart/alternative; boundary="0000000000002fb77c06514114af"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 May 2026 21:37:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9788

--0000000000002fb77c06514114af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 7:11=E2=80=AFAM Deepak Rathore -X (deeratho - E INFO=
CHIPS
PRIVATE LIMITED at Cisco) <deeratho@cisco.com> wrote:

> Hi Bruce,
>
> I hope this message finds you well.
> I understand that the Yocto Project *Wrynose (6.0)* release is now
> available, and that corresponding branches have been created for *OE-Core=
,
> meta-openembedded, meta-selinux, and bitbake*. However, I do not see a
> dedicated *Wrynose branch* for the *meta-virtualization* layer at this
> time.
> Could you please advise whether there is a planned timeline for Wrynose
> release for *meta-virtualization* layer?
>

There's no planned timeline, just when it passes my release testing. I'm
debugging a few things now.

That being said, I expect it'll be about mid next week when I'm ready to
make the branch.

Bruce



> Thank you for your time and guidance.
> Regards,
> Deepak
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000002fb77c06514114af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 6, 2026 at 7:11=
=E2=80=AFAM Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Ci=
sco) &lt;<a href=3D"mailto:deeratho@cisco.com">deeratho@cisco.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg6663165593243063656">




<div dir=3D"ltr">
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Hi Bruce,</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
I hope this message finds you well.</div>
<div style=3D"text-align:left;text-indent:0px;line-height:20px;background-c=
olor:rgb(255,255,255);margin:1em 0px;font-family:Aptos,Aptos_EmbeddedFont,A=
ptos_MSFontService,Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,=
0,0)">
I understand that the Yocto Project <b>Wrynose (6.0)</b>=C2=A0release is no=
w available, and that corresponding branches have been created for
<b>OE-Core, meta-openembedded, meta-selinux, and bitbake</b>. However, I do=
 not see a dedicated
<b>Wrynose branch</b>=C2=A0for the <b>meta-virtualization</b>=C2=A0layer at=
 this time.</div>
<div style=3D"text-align:left;text-indent:0px;line-height:20px;background-c=
olor:rgb(255,255,255);margin:1em 0px;font-family:Aptos,Aptos_EmbeddedFont,A=
ptos_MSFontService,Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,=
0,0)">
Could you please advise whether there is a planned timeline for Wrynose rel=
ease for
<b>meta-virtualization</b>=C2=A0layer?</div></div></div></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">There&=
#39;s no planned timeline, just when it passes my release testing. I&#39;m =
debugging a few things now.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">That being said, I expect it&#39;ll be about mid next week when I&#39;m =
ready to make the branch.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div class=3D"msg6663165593243063656"><div dir=3D"ltr">
<div style=3D"text-align:left;text-indent:0px;line-height:20px;background-c=
olor:rgb(255,255,255);margin:1em 0px;font-family:Aptos,Aptos_EmbeddedFont,A=
ptos_MSFontService,Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,=
0,0)">
Thank you for your time and guidance.</div>
<div style=3D"text-align:left;text-indent:0px;line-height:20px;background-c=
olor:rgb(255,255,255);margin:1em 0px;font-family:Aptos,Aptos_EmbeddedFont,A=
ptos_MSFontService,Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,=
0,0)">
Regards,<br>
Deepak</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--0000000000002fb77c06514114af--

