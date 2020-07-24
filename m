Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.5320.1595594612973985892
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Jul 2020 05:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VBjocXFW;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id c16so9644555ioi.9
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Jul 2020 05:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fD7p/rcIMZpwi32ddHJh2noHP70uWJi6uJF2IBB194o=;
        b=VBjocXFWARdlI+aTGXlnxHnIhVujcE3CWaIB1wwsz2chA6qE65T3XBqOI1Zj7sTq6p
         F7oObcEV85CBwEUa7MiasSKqKL3dBjN5n+XA0/SCHmOHxwkgH6WCawm+/HrNOVnIxhPN
         Q0vNYJCcqEe+Ww4XZiJXliMC2RtlgRlSGCTKi/hMbQG1p8s6k07ylKqdMlzmd5e8EEE5
         ErVRKfzsOgND3gATD/5C3tJezGc2rrNJvQCasm1NvzWwAwptdYSnXVE2sA/YnIwdjGon
         ndNE2J8EKuFU0CXbuL5+vDvV7ybw8W5qNuITIkEk68jyqPfZ6Vh3zWVKmqhH2xWkLLYh
         M3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fD7p/rcIMZpwi32ddHJh2noHP70uWJi6uJF2IBB194o=;
        b=TINZ1muNEMlpXcpMP9aOeYAaEdT+YrNshV+ySN5JouVksyKUR2Eq4bDtD6MjKZ1Hlc
         Wo/jXNzdLhYoHlFfvgPuKJCuGtb3NGfhhD/bwfPsCEkWDpcXb3E4NwqhHIfqJjenhvZM
         2Xnj/kPBiPTnM59BbaHl/yQJHI7mnubTRjrkZ1r1iLK9Ib1m+3+HjoXbcL1bOsKsDOLP
         O2B7qTlfhdijVGmw+S9aAZz2HLFnZ+EN/OEfR7rm+BWmrY0CSgbfyqgIxmdJUWWEWC/m
         6BiQGC2bdtmdJqtDlQfZIeskQfDFckmL5xX+oEYDrettAOB7x6RV2IIrRPb/m7r1rsqp
         LrUw==
X-Gm-Message-State: AOAM532Ahfnmtf6G7dEpnPa0016Hq+dYPkB0cEoCFtRGfSt1F7WaYFCY
	juaBAdUx4hmrhHqnkwygAkMFwz2ZnCrN8cVhU0c=
X-Google-Smtp-Source: ABdhPJx22iDjfk8c6OUrVOnvWFsurZj/HmhMWnOP+dHtkPLfuVwK5j/DKsbV6/sfmjjxLlvfIb/dB3x8DY7GQUu3Vtc=
X-Received: by 2002:a6b:9246:: with SMTP id u67mr10069025iod.51.1595594612336;
 Fri, 24 Jul 2020 05:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAEkELtCLCEar4fLH=jp7kJTarUb-h_Fkceyi7F2jd6y6U1891A@mail.gmail.com>
 <27576.1595505436667253209@lists.yoctoproject.org> <CAEkELtBMJ1z1rujwx-60-J0RFo3RXJRDbTFyfX_rxbJoPNG2AQ@mail.gmail.com>
 <CAOe0dAXrkJ2ztg491yNK1+YtNEfNCG83oYUL8hNukxor0efH_Q@mail.gmail.com>
In-Reply-To: <CAOe0dAXrkJ2ztg491yNK1+YtNEfNCG83oYUL8hNukxor0efH_Q@mail.gmail.com>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Fri, 24 Jul 2020 18:13:20 +0530
Message-ID: <CAEkELtAxJgHLWfHRFJ_FEOpHew2jcCR3=Mq9FwQL8s03hJ+4yw@mail.gmail.com>
Subject: Re: [meta-virtualization] Starting Xen guest on Raspberry-Pi4. #meta-virtualization #yocto
To: AshishKumar Mishra <ashish.emailaddress@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000012e9d805ab2f5205"

--00000000000012e9d805ab2f5205
Content-Type: text/plain; charset="UTF-8"

Sure sir I will try and check that.
Thank you
--
Thanks and Regards.
Siddhartha V.



On Fri, Jul 24, 2020 at 5:13 PM AshishKumar Mishra <
ashish.emailaddress@gmail.com> wrote:

> For an quick check , can you try to build at "dunfell" branch for all the
> layer
>  ( poky / meta-openembedded / met-rasberrypie & meta-virtualization )
>
> @dunfell expectation is it should be able to fetch kernel
> as the rpi4 patches doesn't come into picture.
>
>
>
>
>

--00000000000012e9d805ab2f5205
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure sir I will try and check that.=C2=A0<div>Thank you<br=
 clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature"><div dir=3D"ltr"><div>--</div><div>Thanks and Regard=
s.</div>Siddhartha V.<div>=C2=A0</div></div></div></div><br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, J=
ul 24, 2020 at 5:13 PM AshishKumar Mishra &lt;<a href=3D"mailto:ashish.emai=
laddress@gmail.com">ashish.emailaddress@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">For an q=
uick check , can you try to build at &quot;dunfell&quot; branch for all the=
 layer<div dir=3D"auto"><div dir=3D"auto">=C2=A0( poky / meta-openembedded =
/ met-rasberrypie &amp; meta-virtualization )</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">@dunfell expectation is it should be able to fetch ke=
rnel</div><div dir=3D"auto">as the rpi4 patches doesn&#39;t come into pictu=
re.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div></div></div>
</blockquote></div>
<br>-- <br>Best Regards,<br />Siddhartha V

--00000000000012e9d805ab2f5205--
