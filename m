Return-Path: <kamalgmbh32@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D953C54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 12:35:08 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.14519.1711629298885561593
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Mar 2024 05:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JO5Vrx8a;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: kamalgmbh32@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so11135701fa.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Mar 2024 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711629297; x=1712234097; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uv43rK4BN3bft89TIRIEm7M9XqeIidDTwzhoQ+Hecds=;
        b=JO5Vrx8ah6hjX5B/74UVjmb/QesOW/OVciMxjqYcPoDoBYfhcEXzlPK4iNXFPHxMa6
         +mR/WDAxyvJYSCIraqvUOsJfqNpZXkhnXjGpKQPy/ey/5HcgjCmJCl+pnZze8vJyNLVT
         n0cmW1lAc57KD8x+cX8daTMKw2a9O+j+13VV80Z8/8sbmDC5lVbAdP5yPGInLkRthGsv
         pMn6HpsFE5iWuynrOOqbtGsai9OPNm56YRefV/2DQKNufWZKpfknTuHqCL6SIZU5exQL
         JgneaBR1dIpLXGED0aLcrLCWYGM/E/iIbhAuGP83X4AcEG8AIMhZi/1xuGpzfxntgcxU
         qmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711629297; x=1712234097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uv43rK4BN3bft89TIRIEm7M9XqeIidDTwzhoQ+Hecds=;
        b=eB5kJ4iI/Kl2kq6YvksqIWo4TCw9PsZh0g0fDvCr10WdkZiUJrzutJycFKZNLLrZzp
         BQqy7WJBtIB6Y118l4/9sUG7hmLQUUOtU3xouJcG9rpCVUfjPkGqWZ9rtozMUDdUkSEp
         tloY4Yfc6uxQ/NeTBWizksoV6bxw6gmCa3Pfb91ra7r5JLZqx+JMWLWM+TdgorCwmsKM
         2MbU0+fZyJ4UjfvznVMVUA1U2VU9FC7EL/aYuihxS5e2jMEr9okE5aVIdSPovrWOJ92H
         mvrFnSKrTHrPtp1B6yZbn0UOo2FnDUVzWhVyoQt0Mb5KzUBZnFT5Lq9FZz4QwPF6v99V
         bhIg==
X-Forwarded-Encrypted: i=1; AJvYcCWw0EPkxs/RJHY1ENnmgrhxXD/RXv4GUdXSnboMjas0yOUhN86bHOTY77bsFrRXa4Bkjx0di+SKONHbLbuOWNTGgL/C/sC5zTLVERrspACPMCRL6aPKs/YJI0M=
X-Gm-Message-State: AOJu0YyPcTg+kyf0qKRpLWflJ3NDRNTGFRbG9ACFq+xzb2FpDShev0Cp
	4YZ8fxERwLj6iMC6bJsqCt2QCFhI29b5HTWkFuxpI5mU7TEdTe/VgvgoUdyLCU1uWeURhqoiS8g
	/Zcf9UImmjDQj/QgpNrAtgtVcbMU=
X-Google-Smtp-Source: AGHT+IEnAQsrYsF8LpmViS1Wj9gnqgFI6NmDbWy/iIJ+w+dxZmgpEb/goKdC/v7z2kYcWHo8LhUxjPzMxDPNJZqTVls=
X-Received: by 2002:a2e:7e12:0:b0:2d2:ed31:9fb7 with SMTP id
 z18-20020a2e7e12000000b002d2ed319fb7mr2526709ljc.4.1711629296577; Thu, 28 Mar
 2024 05:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <CA+u1R=SecJj4yY_Lu9SmQUyLa-qisJmyLuaxTP9HOBCZ=8DVYQ@mail.gmail.com>
 <CACMJ4GbBieBMV4PsPA-4PhnwG1MYq-FUO_TTf3=ui=i3E_ZqWg@mail.gmail.com>
 <CA+u1R=SitnBsyd4REgz-bqS3=B972BEeoPHxtXVC8P35qV2B-Q@mail.gmail.com> <CADkTA4OVtAuZ1Ay6aCrtFBJpnKZXDH_SFeUMVi=Yk4tDL9Cd0A@mail.gmail.com>
In-Reply-To: <CADkTA4OVtAuZ1Ay6aCrtFBJpnKZXDH_SFeUMVi=Yk4tDL9Cd0A@mail.gmail.com>
From: Kamal GMBH <kamalgmbh32@gmail.com>
Date: Thu, 28 Mar 2024 18:04:45 +0530
Message-ID: <CA+u1R=Q2QXgMQONFgY4zboY3Ec_VqZhyS0SFJGxOkt3QKq0UZg@mail.gmail.com>
Subject: Re: [meta-virtualization] Need Support: XEN is not installing and not
 booting in yocto!!
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000035b8220614b7c075"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Mar 2024 12:35:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8658

--00000000000035b8220614b7c075
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
>
> Kamal GMBH <kamalgmbh32@gmail.com>
> Wed, Mar 27, 11:30=E2=80=AFPM (18 hours ago)
> to Bruce
> Hello Bruce,
>
> I am building using below command
>
> bitbake-layers add-layer ../meta-openembedded/meta-oe
> bitbake-layers add-layer ../meta-openembedded/meta-python
> bitbake-layers add-layer ../meta-openembedded/meta-networking
> bitbake-layers add-layer ../meta-dpdk
> bitbake-layers add-layer ../meta-amd/meta-amd-distro
> bitbake-layers add-layer ../meta-amd/meta-amd-bsp
> bitbake-layers add-layer ../meta-openembedded/meta-filesystems
> bitbake-layers add-layer ../meta-virtualization
> bitbake-layers add-layer ../meta-security/meta-tpm/
> bitbake core-image-sato -k
>
> I am trying to  install xen and boot xen in x86_64 hardware.
>
> how can i change grub configuration in yocto inside meta-amd folder ?
>
> how can i enable multiboot and module and change grub file?
>
> how can I change local.conf file for grub below change? can you please
> provide step.
>
> *in the target HW:*
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> root@v3000:/boot/EFI/BOOT# *vi grub.cfg (My expected grub.cfg file)*
>
> serial --unit=3D0 --speed=3D115200 --word=3D8 --parity=3Dno --stop=3D1
> default=3Dboot
> timeout=3D10
> menuentry 'boot'{
> multiboot2 /xen dom0=3Dpvh dom0_mem=3D8G dom0_max_vcpus=3D4 dom0_vcpus_pi=
n
> loglvl=3Dall guest_loglvl=3Dall
> com1=3D115200/3000000,8n1,0xfedc9000,4,reg-width=3D4,reg-shift=3D2
> console=3Dcom1,vga console_timestamps=3Dboot
> module2 /bzImage ramdisk_size=3D32768
> root=3DPARTUUID=3Dcc63eebd-9861-4ec8-a941-a0e5b80374dd rw rootwait quiet
>  console=3Dhvc0 earlyprintk=3Dxen console=3DttyS0 panic=3D10 LABEL=3Dboot=
 debugshell=3D5
> module2 /initrd
> }
> root@v3000:/boot/EFI/BOOT#
>
>
> NOTE:
> i am building using bitbake  core-image-sato.
>
> Regards,
> Kamal
>
>

--00000000000035b8220614b7c075
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_signatu=
re"><br><div class=3D"gmail-aju" style=3D"display:flex;float:none;height:80=
px;padding:0px 16px;min-width:40px"><div class=3D"gmail-aCi" style=3D""><im=
g id=3D"gmail-:m7_9-e" name=3D"gmail-:m7" src=3D"https://lh3.googleusercont=
ent.com/a/ACg8ocJJvndhsxaarRp64KRf0q4xmVwqSOWZ7p5yFMAm0kJl=3Ds80-p-mo" clas=
s=3D"gmail-ajn" aria-hidden=3D"true" style=3D"width: 40px; height: 40px; bo=
rder-radius: 50%; display: block; background-color: rgb(204, 204, 204);"></=
div></div><div class=3D"gmail-gs" style=3D"margin:0px;min-width:0px;padding=
:0px 0px 20px;width:initial"><div class=3D"gmail-gE gmail-iv gmail-gt" styl=
e=3D"font-size:0.875rem;padding:20px 0px 0px"><table cellpadding=3D"0" clas=
s=3D"gmail-cf gmail-gJ" style=3D"border-collapse:collapse;margin-top:0px;wi=
dth:auto;font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helvetica,A=
rial,sans-serif;font-size:0.875rem;display:block"><tbody style=3D"display:b=
lock"><tr class=3D"gmail-acZ" style=3D"display:flex;height:auto"><td class=
=3D"gmail-gF gmail-gK" style=3D"padding:0px;vertical-align:top;width:506.33=
3px;line-height:20px;display:block;max-height:20px"><table cellpadding=3D"0=
" class=3D"gmail-cf gmail-ix" style=3D"border-collapse:collapse;table-layou=
t:fixed;width:506.333px"><tbody><tr><td class=3D"gmail-c2" style=3D"display=
:flex"><h3 class=3D"gmail-iw" style=3D"overflow:hidden;font-size:0.75rem;fo=
nt-weight:inherit;margin:inherit;text-overflow:ellipsis;color:rgb(95,99,104=
);line-height:20px"><span class=3D"gmail-qu" role=3D"gridcell" tabindex=3D"=
-1"><span name=3D"Kamal GMBH" class=3D"gmail-gD" style=3D"color:rgb(31,31,3=
1);font-size:0.875rem;font-weight:bold;display:inline;vertical-align:top;li=
ne-height:20px"><span style=3D"vertical-align:top">Kamal GMBH</span></span>=
=C2=A0<span class=3D"gmail-cfXrwd"></span><span class=3D"gmail-go" style=3D=
"vertical-align:top;color:rgb(94,94,94)"><span aria-hidden=3D"true">&lt;</s=
pan><a href=3D"mailto:kamalgmbh32@gmail.com">kamalgmbh32@gmail.com</a><span=
 aria-hidden=3D"true">&gt;</span></span></span></h3></td></tr></tbody></tab=
le></td><td class=3D"gmail-gH gmail-bAk" style=3D"text-align:right;vertical=
-align:top;display:block;max-height:20px"><div class=3D"gmail-gK" style=3D"=
padding:0px;display:flex"><span id=3D"gmail-:173" class=3D"gmail-g3" title=
=3D"Mar 27, 2024, 11:30=E2=80=AFPM" alt=3D"Mar 27, 2024, 11:30=E2=80=AFPM" =
role=3D"gridcell" tabindex=3D"-1" style=3D"vertical-align:top;margin:0px;fo=
nt-size:0.75rem;color:rgb(94,94,94);display:block;line-height:20px">Wed, Ma=
r 27, 11:30=E2=80=AFPM (18 hours ago)</span><div class=3D"gmail-zd gmail-bi=
4" aria-label=3D"Not starred" tabindex=3D"0" role=3D"checkbox" aria-checked=
=3D"false" style=3D"display:inline-block;height:20px;margin-left:20px;outli=
ne:0px"><span class=3D"gmail-T-KT" style=3D"display:inline-flex;height:20px=
;text-align:center;width:20px;padding:0px;margin:0px;border:none;outline:no=
ne"></span></div></div></td><td class=3D"gmail-gH" style=3D"text-align:righ=
t;vertical-align:top;display:flex"></td><td class=3D"gmail-gH gmail-acX gma=
il-bAm" rowspan=3D"2" style=3D"text-align:right;vertical-align:top;display:=
block;max-height:20px"><div class=3D"gmail-T-I gmail-J-J5-Ji gmail-T-I-Js-I=
F gmail-R1Zuwf gmail-T-I-ax7 gmail-L3" role=3D"button" tabindex=3D"0" aria-=
label=3D"Add reaction" style=3D"display:inline-flex;border-radius:2px 0px 0=
px 2px;font-size:0.875rem;text-align:center;margin:0px 0px 0px 20px;height:=
20px;line-height:18px;min-width:auto;outline:none;padding:0px;background:tr=
ansparent;color:rgb(68,68,68);border:none"><img class=3D"gmail-qfynfc gmail=
-T-I-J3" role=3D"button" src=3D"https://mail.google.com/mail/u/0/images/cle=
ardot.gif" alt=3D"" style=3D"background-image: url(&quot;//ssl.gstatic.com/=
ui/v1/icons/mail/gm3/2x/mood_baseline_nv700_20dp.png&quot;); background-pos=
ition: 50% 50%; background-repeat: no-repeat; background-size: 20px; margin=
: 0px; vertical-align: middle; opacity: 1; display: inline-block; height: 2=
0px; padding: 0px; transition: opacity 0.15s cubic-bezier(0.4, 0, 0.2, 1) 0=
s; width: 20px;"></div><div class=3D"gmail-T-I gmail-J-J5-Ji gmail-T-I-Js-I=
F gmail-aaq gmail-T-I-ax7 gmail-L3" role=3D"button" tabindex=3D"0" aria-lab=
el=3D"Reply" style=3D"display:inline-flex;border-radius:2px 0px 0px 2px;fon=
t-size:0.875rem;text-align:center;margin:0px 0px 0px 20px;height:20px;line-=
height:18px;min-width:0px;outline:none;padding:0px;background:transparent;c=
olor:rgb(68,68,68);border:none"><img class=3D"gmail-hB gmail-T-I-J3" role=
=3D"button" src=3D"https://mail.google.com/mail/u/0/images/cleardot.gif" al=
t=3D"" style=3D"background: url(&quot;//ssl.gstatic.com/ui/v1/icons/mail/gm=
3/2x/reply_baseline_nv700_20dp.png&quot;) 50% 50% / 20px no-repeat; height:=
 20px; margin: 0px; vertical-align: middle; width: 20px; opacity: 1; displa=
y: inline-block; padding: 0px; transition: opacity 0.15s cubic-bezier(0.4, =
0, 0.2, 1) 0s;"></div><div id=3D"gmail-:17d" class=3D"gmail-T-I gmail-J-J5-=
Ji gmail-T-I-Js-Gs gmail-aap gmail-T-I-awG gmail-T-I-ax7 gmail-L3" role=3D"=
button" tabindex=3D"0" aria-expanded=3D"false" aria-haspopup=3D"true" aria-=
label=3D"More message options" style=3D"display:inline-flex;border-radius:0=
px 2px 2px 0px;font-size:0.875rem;text-align:center;margin:0px 0px 0px 20px=
;height:20px;line-height:18px;min-width:0px;outline:none;padding:0px;backgr=
ound:transparent;color:rgb(68,68,68);border:none"><img class=3D"gmail-hA gm=
ail-T-I-J3" role=3D"menu" src=3D"https://mail.google.com/mail/u/0/images/cl=
eardot.gif" alt=3D"" style=3D"background: url(&quot;//ssl.gstatic.com/ui/v1=
/icons/mail/gm3/2x/more_vert_baseline_nv700_20dp.png&quot;) 50% 50% / 20px =
no-repeat; height: 20px; width: 20px; margin: 0px; vertical-align: middle; =
opacity: 1; display: inline-block; padding: 0px; transition: opacity 0.15s =
cubic-bezier(0.4, 0, 0.2, 1) 0s;"></div></td></tr><tr class=3D"gmail-acZ gm=
ail-xD" style=3D"display:flex;height:auto"><td colspan=3D"3"><table cellpad=
ding=3D"0" class=3D"gmail-cf gmail-adz" style=3D"border-collapse:collapse;t=
able-layout:fixed;width:864.042px"><tbody><tr><td class=3D"gmail-ady" style=
=3D"overflow:visible;text-overflow:ellipsis;display:flex;line-height:20px">=
<div class=3D"gmail-iw gmail-ajw" style=3D"overflow:hidden;max-width:92%;di=
splay:inline-block"><span class=3D"gmail-hb" style=3D"vertical-align:top;co=
lor:rgb(94,94,94);font-size:0.75rem;line-height:20px">to=C2=A0<span name=3D=
"Bruce" class=3D"gmail-g2" style=3D"vertical-align:top">Bruce</span></span>=
</div><div id=3D"gmail-:17c" aria-haspopup=3D"true" class=3D"gmail-ajy" rol=
e=3D"button" tabindex=3D"0" aria-label=3D"Show details" style=3D"display:in=
line-flex;margin-left:4px;vertical-align:top;border:none;outline:none"><img=
 class=3D"gmail-ajz" src=3D"https://mail.google.com/mail/u/0/images/cleardo=
t.gif" alt=3D"" style=3D"background: url(&quot;https://www.gstatic.com/imag=
es/icons/material/system_gm/2x/arrow_drop_down_black_20dp.png&quot;) 50% 50=
% / 20px no-repeat; cursor: pointer; padding: 0px; vertical-align: baseline=
; height: 20px; width: 20px; border: none; margin: 0px 0px 0px auto; right:=
 0px; top: 0px; display: flex; opacity: 0.71;"></div></td></tr></tbody></ta=
ble></td></tr></tbody></table></div><div id=3D"gmail-:16z"><div class=3D"gm=
ail-qQVYZb"></div><div class=3D"gmail-utdU2e"></div><div class=3D"gmail-lQs=
8Hd"></div><div class=3D"gmail-wl4W9b" style=3D"display:flex"></div></div><=
div class=3D"gmail-"><div class=3D"gmail-aHl" style=3D""></div><div id=3D"g=
mail-:17b" tabindex=3D"-1"></div><div id=3D"gmail-:171" class=3D"gmail-ii g=
mail-gt" style=3D"direction:ltr;margin:8px 0px 0px;padding:0px;font-size:0.=
875rem;overflow-x:hidden"><div id=3D"gmail-:170" class=3D"gmail-a3s gmail-a=
iL" style=3D"direction:initial;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;font-kerning:auto;font-featur=
e-settings:normal;font-stretch:normal;font-size:small;line-height:1.5;overf=
low:auto hidden"><div dir=3D"ltr">Hello Bruce,<div><br></div><div>I am buil=
ding=C2=A0using below command</div><div><br></div><div>bitbake-layers add-l=
ayer ../meta-openembedded/meta-oe<span class=3D"gmail-im" style=3D"color:rg=
b(80,0,80)"><br>bitbake-layers add-layer ../meta-openembedded/meta-python<b=
r>bitbake-layers add-layer ../meta-openembedded/meta-networking<br></span>b=
itbake-layers add-layer ../meta-dpdk<br>bitbake-layers add-layer ../meta-am=
d/meta-amd-distro<br>bitbake-layers add-layer ../meta-amd/meta-amd-bsp<span=
 class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br>bitbake-layers add-lay=
er ../meta-openembedded/meta-filesystems<br>bitbake-layers add-layer ../met=
a-virtualization<br></span>bitbake-layers add-layer ../meta-security/meta-t=
pm/<br>bitbake core-image-sato -k<br></div><div><br></div><div>I am trying =
to=C2=A0 install xen and boot xen in=C2=A0x86_64 hardware.</div><div><br></=
div><div>how can i change=C2=A0grub configuration=C2=A0in yocto inside meta=
-amd=C2=A0folder ?</div><div><br></div><div>how can i enable multiboot and =
module=C2=A0and change=C2=A0grub file?</div><div><br></div><div><div>how ca=
n I change=C2=A0local.conf file for grub below change? can you please provi=
de step.</div><div><br></div><div><b>in the target HW:</b></div><div>=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div></div></div><div>root@v3000:=
/boot/EFI/BOOT#=C2=A0<b>vi grub.cfg (My expected grub.cfg file)</b><br><br>=
serial --unit=3D0 --speed=3D115200 --word=3D8 --parity=3Dno --stop=3D1<br>d=
efault=3Dboot<br>timeout=3D10<br>menuentry &#39;boot&#39;{<br>multiboot2 /x=
en dom0=3Dpvh dom0_mem=3D8G dom0_max_vcpus=3D4 dom0_vcpus_pin loglvl=3Dall =
guest_loglvl=3Dall com1=3D115200/3000000,8n1,0xfedc9000,4,reg-width=3D4,reg=
-shift=3D2 console=3Dcom1,vga console_timestamps=3Dboot<br>module2 /bzImage=
 ramdisk_size=3D32768 root=3DPARTUUID=3Dcc63eebd-9861-4ec8-a941-a0e5b80374d=
d rw rootwait quiet =C2=A0console=3Dhvc0 earlyprintk=3Dxen console=3DttyS0 =
panic=3D10 LABEL=3Dboot debugshell=3D5<br>module2 /initrd<br>}<br>root@v300=
0:/boot/EFI/BOOT#<br></div><div><br></div><div><br></div><div>NOTE:</div><d=
iv>i am building using bitbake=C2=A0 core-image-sato.</div><div><br></div><=
div>Regards,</div><div>Kamal</div><div class=3D"gmail-yj6qo"></div><div cla=
ss=3D"gmail-adL"><br></div></div></div></div></div></div></div></div>
</blockquote></div></div>

--00000000000035b8220614b7c075--

