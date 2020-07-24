Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web12.4098.1595589881983339446
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Jul 2020 04:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AvFyqoGG;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id r12so6908383ilh.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Jul 2020 04:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=idoumz3uvAYSIr0d+9dM56eQ8AAxCqu2w49igwU+Udo=;
        b=AvFyqoGGHvZGOTkR84qHatrAlozxab5HgCV4J9JTFLSLmZvRRWxDgieptDO5ODMPOb
         8xf2cqNnpaMRtvjGcesk31dtC/ZAJjqJ8ebpXLx1z16nCXbQthhZTa9BICHl6ptpZnnd
         kgUV7TcNRajuODdIocxG1bRAS2ZW0dxaKPGMbCmbY30iARgrMCWnyS12JV3ds/Ho0BFS
         HAiBKLf8cEu8TGqc51o7rjdmERbw4SGNnmdTuNvo90RctTvg5ompHlS9c/QaAOe/TCAA
         O3HrHODUV7Gr9uTnpJxLjyXYJbydY0vmoX7Fjt3Vj2g+8MON1VyUVa4w3+QXosPcNN5P
         yU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=idoumz3uvAYSIr0d+9dM56eQ8AAxCqu2w49igwU+Udo=;
        b=JUID1p5nsYXhOHuXjh3ezGr+bCTHF3Y+pO46AiFqIe+uRg6+tij9rgSFR8nxuKRbTe
         b/qch0Sik6HnQan1LzXN/zjW11LtVKHE3rihfMiNxI1Qloow4N5QJuX7ncX/cg3v09Jo
         f9DztU983fohB7hWNV542bQ53PqBkUDJD3Tcn2C7OLZnP5kMB/zS0vWfZEVkpfdDUoSD
         1ZZEypC+1zVvb6jrSbtfZAjr8rFOeIQhfxTQd8ZtUOD8iHwPstkXO5JFSHBMaJB3rtqE
         DDegsPH/uxRMFbGotImpHNgCmgWaM/plskn6Cs3q5c/Xw3V70BdyiBv3m7xeo62K1xyD
         uemQ==
X-Gm-Message-State: AOAM532xykd5tJet8T69EZej+69lJfk5iWWQXq5NDgf5VHM12XXTFnYB
	u6eNykQVr82s4+I1eaYnvEn6XdeZe638rf3reRE=
X-Google-Smtp-Source: ABdhPJzuv4OIdadOvte2jftNCmRTo3XB+Gj2dpe22gnkhostR95tXe7C2jufuhWA1PhCe/vtEUN1chMBpaRGqLcUP5Q=
X-Received: by 2002:a05:6e02:e05:: with SMTP id a5mr9064678ilk.92.1595589881359;
 Fri, 24 Jul 2020 04:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAEkELtCLCEar4fLH=jp7kJTarUb-h_Fkceyi7F2jd6y6U1891A@mail.gmail.com>
 <27576.1595505436667253209@lists.yoctoproject.org>
In-Reply-To: <27576.1595505436667253209@lists.yoctoproject.org>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Fri, 24 Jul 2020 16:54:29 +0530
Message-ID: <CAEkELtBMJ1z1rujwx-60-J0RFo3RXJRDbTFyfX_rxbJoPNG2AQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Starting Xen guest on Raspberry-Pi4. #meta-virtualization #yocto
To: Ashish <ashishm@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000015f37105ab2e384a"

--00000000000015f37105ab2e384a
Content-Type: text/plain; charset="UTF-8"

Hello sir,

  As you suggested I tried *"bitbake -c fetchall xen-image-minimal "* but
it was not able to run I got below error:



*ERROR: Task do_fetchall does not exist for target xen-image-minimal
(/home/siddhu/Documents/yocto/zindagi/sources1/meta-virtualization/recipes-extended/images/xen-image-minimal.bb:do_fetchall).
Close matches:  do_fetchERROR: Command execution failed: *1

Later I tried *"bitbake -c fetch linux-raspberrypi"* to check if I can
fetch the linux alone but even here I couldn't It doesn't look like the
network issue. But am not getting what's going wrong here:

Below is the error log for "bitbake -c fetch linux-raspberrypi" command:














*WARNING: linux-raspberrypi-1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0
do_fetch: Failed to fetch URL
git://github.com/raspberrypi/linux.git;branch=rpi-5.4.y
<http://github.com/raspberrypi/linux.git;branch=rpi-5.4.y>, attempting
MIRRORS if availableERROR:
linux-raspberrypi-1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0 do_fetch:
Fetcher failure: Unable to find revision
97badb4baeb8999263a9bc2fa85c3060ffff344b in branch rpi-5.4.y even from
upstreamERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0
do_fetch: Fetcher failure for URL:
'git://github.com/raspberrypi/linux.git;branch=rpi-5.4.y
<http://github.com/raspberrypi/linux.git;branch=rpi-5.4.y>'. Unable to
fetch URL from any source.ERROR: Logfile of failure stored in:
/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/linux-raspberrypi/1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0/temp/log.do_fetch.3919ERROR:
Task
(/home/siddhu/Documents/yocto/zindagi/sources1/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bb:do_fetch)
failed with exit code '1'NOTE: Tasks Summary: Attempted 1 tasks of which 0
didn't need to be rerun and 1 failed.Summary: 1 task failed:
/home/siddhu/Documents/yocto/zindagi/sources1/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bb:do_fetchSummary:
There was 1 WARNING message shown.Summary: There were 2 ERROR messages
shown, returning a non-zero exit
code.siddhu@siddhu:~/Documents/yocto/zindagi/build$ *
What can I do now?

--
Thanks and Regards.
Siddhartha V.



On Thu, Jul 23, 2020 at 5:27 PM Ashish <ashishm@mvista.com> wrote:

> Based on my understanding , it seems problem with your network
> (* fatal: read error: Connection reset by peer* )
>
> Can you try just fetching all the prerequisites first :
>     $ bitbake -c cleanall linux-raspberrypi
>     $ bitbake -c fetch linux-raspberrypi            ( Fetch only Linux )
>                   or
>     $ bitbake -c fetchall xen-image-minimal    ( Fetch all packages for
> concerned image )
>
>
> 
>

--00000000000015f37105ab2e384a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello sir,<div><br></div><div>=C2=A0 As you suggested I tr=
ied <b>&quot;bitbake -c fetchall xen-image-minimal &quot;</b> but it was no=
t able to run I got below error:</div><div><br></div><div><i><font color=3D=
"#0000ff">ERROR: Task do_fetchall does not exist for target xen-image-minim=
al (/home/siddhu/Documents/yocto/zindagi/sources1/meta-virtualization/recip=
es-extended/images/xen-image-minimal.bb:do_fetchall). Close matches:<br>=C2=
=
=A0 do_fetch<br>ERROR: Command execution failed: </font></i>1<br></div><di=
v><br></div><div>Later I tried <b>&quot;bitbake -c fetch linux-raspberrypi&=
quot;</b> to check if I can fetch the linux alone but even here I couldn&#3=
9;t It=C2=A0doesn&#39;t look like the network issue. But am not getting wha=
t&#39;s going wrong here:</div><div><br></div><div>Below is the error log f=
or &quot;bitbake -c fetch linux-raspberrypi&quot; command:</div><div><br></=
div><div><br><i><font color=3D"#0000ff">WARNING: linux-raspberrypi-1_5.4.40=
+gitAUTOINC+aafb8f095e_machine-r0 do_fetch: Failed to fetch URL git://<a hr=
ef=3D"http://github.com/raspberrypi/linux.git;branch=3Drpi-5.4.y">github.co=
m/raspberrypi/linux.git;branch=3Drpi-5.4.y</a>, attempting MIRRORS if avail=
able<br>ERROR: linux-raspberrypi-1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0 =
do_fetch: Fetcher failure: Unable to find revision 97badb4baeb8999263a9bc2f=
a85c3060ffff344b in branch rpi-5.4.y even from upstream<br>ERROR: linux-ras=
pberrypi-1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0 do_fetch: Fetcher failur=
e for URL: &#39;git://<a href=3D"http://github.com/raspberrypi/linux.git;br=
anch=3Drpi-5.4.y">github.com/raspberrypi/linux.git;branch=3Drpi-5.4.y</a>&#=
39;. Unable to fetch URL from any source.<br>ERROR: Logfile of failure stor=
ed in: /home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-=
poky-linux/linux-raspberrypi/1_5.4.40+gitAUTOINC+aafb8f095e_machine-r0/temp=
/log.do_fetch.3919<br>ERROR: Task (/home/siddhu/Documents/yocto/zindagi/sou=
rces1/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bb:do_fet=
ch) failed with exit code &#39;1&#39;<br>NOTE: Tasks Summary: Attempted 1 t=
asks of which 0 didn&#39;t need to be rerun and 1 failed.<br><br>Summary: 1=
 task failed:<br>=C2=A0 /home/siddhu/Documents/yocto/zindagi/sources1/meta-=
raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bb:do_fetch<br>Summa=
ry: There was 1 WARNING message shown.<br>Summary: There were 2 ERROR messa=
ges shown, returning a non-zero exit code.<br>siddhu@siddhu:~/Documents/yoc=
to/zindagi/build$ <br></font></i><br></div><div>What can I do now?</div><di=
v><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr"><div>--</div><div>Thanks and Rega=
rds.</div>Siddhartha V.<div>=C2=A0</div></div></div></div><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Jul 23, 2020 at 5:27 PM Ashish &lt;<a href=3D"mailto:ashishm@mvista.com">a=
shishm@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Based on my understanding , it seems problem with your net=
work <br>(<span style=3D"text-decoration:underline"><strong> fatal: read er=
ror: Connection reset by peer</strong></span> )<br><br>Can you try just fet=
ching all the prerequisites first :<br>=C2=A0 =C2=A0 $ bitbake -c cleanall =
linux-raspberrypi<br>=C2=A0 =C2=A0=C2=A0$ bitbake -c fetch linux-raspberryp=
i=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ( Fetch only Linux )<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or=C2=A0<br>=C2=A0=
 =C2=A0=C2=A0$ bitbake -c fetchall xen-image-minimal=C2=A0 =C2=A0 ( Fetch a=
ll packages for concerned image )<br><br><br>
<br>
</blockquote></div>
<br>-- <br>Best Regards,<br />Siddhartha V

--00000000000015f37105ab2e384a--
