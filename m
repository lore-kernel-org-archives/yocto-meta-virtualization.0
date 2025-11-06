Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772B2CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 15:32:40 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15.1762443158003997204
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 07:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PHRfy0ii;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63bc1aeb427so1062736d50.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Nov 2025 07:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762443157; x=1763047957; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+l59VrOMvMML/IaJdfzymVLf7qUV7xO93rJhlHGAjVI=;
        b=PHRfy0iizrnEtV5s+flHn/8c4Qqlpnqgn7oBFzmqSWEkTX5mUakhzCZBn8Gq5E6I2Y
         VhwpfRKbzRYP/NukMShy6c4vTaN8OLhn1nvRRcPc/JJ71KxnhBBo3N1fLPZeEKZgv28x
         rBfbWY2i9q1DA9QzcffdPQuzUYL18SGh4soa2o5cU3uY4VSg910cjZISaTztdLNC2zZJ
         9eJWT/6OLulWWfALnhR1ORYSuMIPZ4GyvKNQcvzW5VAM/F2KGDzwvr8c1mECeq07Add+
         uhttGex6ktrs0cxl45KRibxe1EzQlfEYmpgnVBc3AB4eeEbm4hEsVG0zBApm1OhsBYKb
         3udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443157; x=1763047957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+l59VrOMvMML/IaJdfzymVLf7qUV7xO93rJhlHGAjVI=;
        b=MY8QjpORUY7phKl/u1MNZfHhD8Sizzykfe2YFavcYrDHqkcwwaNKSz84hOGXI2Gjh/
         CEP4VOJHMjMf5mgZBsulpnfeTTlEDpXRwIv5EVwbWu4vZ/zoM7CWiDsmwvOOury2PN0n
         RkSS+ZZriQhK923ltukxBICjM3ihDBsAXKmwRtRdQ1ZZiih4nwCx+G6b20LAlDmy3dXE
         Jy3DpydFGKoyxwmqJX7za4F7b4SOOBXK14u+hS+zYJnZ4fu3ie+EN+ziWGyB4VngrWEF
         p+qzE8pq7CDCf3aUU2Wx57yvahcM7ZXIEbTqnuxkLnnRpBYlAFKviWuHfqB/qsRUlB2T
         dl/g==
X-Gm-Message-State: AOJu0Yz3GW1klBVzrkWVTunQ+Jbdyug2DLmKMkBJ9ObA2ZkmRzExec8O
	Xw3jOffkZ/5+ZU/q1eYhMJs7dGZ701oevuRi/NfC69V0HNJx9/LyUXbekBmFx9pyavUImsH408z
	H9lbuv+WTm9Gn8VE5LxrI6wpkr3UXsdg=
X-Gm-Gg: ASbGncvkdteuTEKRfXu8g9f9k5/ztrbLgDGL0NGbUUMqbmbnvz8yEyGOsbiz/J4AKsT
	WmcYoHe3rBfdDASWX7hzgZ3ocxMORjlyVFN5T09K0xEprJXze1g4y9Hl1a9MUXJy2ki7XRoXYCx
	s5Fwa1yI3RrFxoyOFlPhl9mSKhyw1CPuHgqagju5c2dUvjObUrbr5GN25BVSltHx35CGS7bifhW
	gewfXGpz0AyuwMqqc2nMWfeTXkDI1yol6WXB13QN5pO4Av9i/449FDUij0V2iMcBafVORNl
X-Google-Smtp-Source: AGHT+IGAdwdPb7SorpNMw5JfmmlOWNBTW5aoXOuN/QxEKVR5f1M7vsv2hzWoP+IhYMaqWIKaYcIMbH/5fMIQgj5k1A8=
X-Received: by 2002:a53:b10b:0:b0:63e:350c:aea4 with SMTP id
 956f58d0204a3-63fd3571502mr5272279d50.32.1762443156855; Thu, 06 Nov 2025
 07:32:36 -0800 (PST)
MIME-Version: 1.0
References: <20251106131437.589960-1-tom.hochstein@oss.nxp.com>
 <CADkTA4PDjQ9MhCSdCtwnTFPmT0ETfDJfhVKj5a3xUekJQCm4Wg@mail.gmail.com> <62baad0b-a697-4065-b956-2b9b71fef33d@oss.nxp.com>
In-Reply-To: <62baad0b-a697-4065-b956-2b9b71fef33d@oss.nxp.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Nov 2025 10:32:23 -0500
X-Gm-Features: AWmQ_bnnGl0A6E0QC6miTeZARALrP1Wtr65rf2vubBlMEyXYFclnoq3__jdLpu4
Message-ID: <CADkTA4Pn-0ox=etTAeCk4jUq5PyMB4YnEorP15Agtt+VmJoLyA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] libvirt: Fix missing libvirt-python
To: Tom Hochstein <tom.hochstein@oss.nxp.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004d1f3c0642eec6f2"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Nov 2025 15:32:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9433

--0000000000004d1f3c0642eec6f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 10:23=E2=80=AFAM Tom Hochstein <tom.hochstein@oss.nx=
p.com>
wrote:

>
> On 11/6/2025 8:18 AM, Bruce Ashfield wrote:
>
>
> You don't often get email from bruce.ashfield@gmail.com. Learn why this
> is important <https://aka.ms/LearnAboutSenderIdentification>
>
>
>
> On Thu, Nov 6, 2025 at 8:15=E2=80=AFAM Tom Hochstein via lists.yoctoproje=
ct.org
> <tom.hochstein=3Doss.nxp.com@lists.yoctoproject.org> wrote:
>
>> From: Tom Hochstein <tom.hochstein@oss.nxp.com>
>>
>> The do_rootfs task for an image that includes libvirt-python fails.
>> ```
>>   - nothing provides libvirt-python needed by
>> packagegroup-fsl-virtualization-1.0-r0.ls1012afrwy from oe-repo
>> ```
>>
>> The log shows that the do_compile:append() from libvirt-python.inc is
>> failing but not reporting the failure.
>> ```
>> 174: cd: can't cd to
>> /.../libvirt/v11.8.0+git/sources/libvirt-v11.8.0+git/libvirt-python-11.8=
.0
>> ```
>>
>> The root cause is the archive folder format is changed from
>> libvirt-python-VERSION to libvirt_python-VERSION, but the do_compile
>> and do_install tasks are hard-coded to the old format.
>>
>> Fix the root cause by encoding the archive folder name in a common
>> variable. Also, fix the build and install commands so the cd failure is
>> not ignored.
>>
>> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
>> ---
>>  recipes-extended/libvirt/libvirt-python.inc | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/recipes-extended/libvirt/libvirt-python.inc
>> b/recipes-extended/libvirt/libvirt-python.inc
>> index c430ffe5..0a99296a 100644
>> --- a/recipes-extended/libvirt/libvirt-python.inc
>> +++ b/recipes-extended/libvirt/libvirt-python.inc
>> @@ -18,8 +18,8 @@ FILES:${PN}-python =3D "${bindir}/* ${libdir}/*
>> ${libdir}/${PYTHON_DIR}/*"
>>  # Currently the libvirt-python debug libraries contain buildpaths
>>  INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
>>
>> -SRC_URI +=3D "
>> http://libvirt.org/sources/python/${BPN}_python-${LIBVIRT_VERSION}.tar.g=
z;name=3Dlibvirt_python;subdir=3D${BP}
>> "
>> -
>> +SRC_URI +=3D "
>> http://libvirt.org/sources/python/${LIBVIRT_PYTHON_ARCHIVE_NAME}.tar.gz;=
name=3Dlibvirt_python;subdir=3D${BP}
>> "
>> +LIBVIRT_PYTHON_ARCHIVE_NAME =3D "${BPN}_python-${LIBVIRT_VERSION}"
>>  SRC_URI[libvirt_python.sha256sum] =3D
>> "5d80e13e0cfb96dd254d765ee60e77e5f9b6925172540056cec0aa0e6f0ca83c"
>>
>>  export LIBVIRT_API_PATH =3D "${S}/docs/libvirt-api.xml"
>> @@ -46,8 +46,8 @@ do_compile:append() {
>>                 # the syroot staged pkgconfig entries. So we clear the
>> sysroot
>>                 # for just this portion.
>>                 export PKG_CONFIG_SYSROOT_DIR=3D
>> -               cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} &=
&
>> \
>> -                 ${STAGING_BINDIR_NATIVE}/python3-native/python3
>> setup.py build
>> +               cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
>> +               ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py
>> build
>>                 cd -
>>         fi
>>  }
>> @@ -58,9 +58,9 @@ do_install:append() {
>>                 # the syroot staged pkgconfig entries. So we clear the
>> sysroot
>>                 # for just this portion.
>>                 export PKG_CONFIG_SYSROOT_DIR=3D
>> -               cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} &=
&
>> \
>> -                 ${STAGING_BINDIR_NATIVE}/python3-native/python3
>> setup.py install \
>> -                       --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR}
>> ${LIBVIRT_INSTALL_ARGS}
>> +               cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
>>
>
> As I hinted at in my other reply just a minute ago, I'd actually prefer
> that if we are
> changing this to fail on the directory not existing (which really has onl=
y
> happened
> once in the decade or so this exists), then we should put a test for the
> directory
> and output a clearer error message. Otherwise, someone getting that faile=
d
> cd will have no idea why it happened.
>
> Bruce
>
> I think it's good to keep exceptional logic to a minimum. We might not
> ever see this failure again. Plus, I'd argue that failing on the cd comma=
nd
> gives a straightforward clue for how to debug. Let me know if you disagre=
e,
> and I'll add the logic as you request.
>
> Tom
>


I'll insist on this one, since I completely disagree on a failed cd to what
will appear to be an arcane and magic directory is useful to any end user.

Bruce

>
>
>
>> +               ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py
>> install \
>> +                       --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR}
>> ${LIBVIRT_INSTALL_ARGS}
>>                 cd -
>>         fi
>>  }
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9429):
>> https://lists.yoctoproject.org/g/meta-virtualization/message/9429
>> Mute This Topic: https://lists.yoctoproject.org/mt/116152179/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[
>> bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004d1f3c0642eec6f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 6, 2025 at 10:23=
=E2=80=AFAM Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@oss.nxp.com">=
tom.hochstein@oss.nxp.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p><br>
    </p>
    <div>On 11/6/2025 8:18 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%=
" style=3D"background:revert;color:revert;direction:revert;font-size:revert=
;height:revert;letter-spacing:revert;line-height:revert;margin:revert;opaci=
ty:revert;outline:revert;overflow:revert;padding:revert;text-align:revert;t=
ext-indent:revert;text-orientation:revert;text-overflow:revert;text-transfo=
rm:revert;vertical-align:revert;white-space:revert;word-break:revert;word-s=
pacing:revert;writing-mode:revert;zoom:revert;border:0px;display:table;widt=
h:100%;table-layout:fixed;float:none;border-spacing:0px" align=3D"left">
        <tbody style=3D"background:revert;border:revert;color:revert;direct=
ion:revert;font-size:revert;height:revert;letter-spacing:revert;line-height=
:revert;margin:revert;opacity:revert;outline:revert;overflow:revert;padding=
:revert;table-layout:revert;text-align:revert;text-indent:revert;text-orien=
tation:revert;text-overflow:revert;text-transform:revert;vertical-align:rev=
ert;white-space:revert;width:revert;word-break:revert;word-spacing:revert;w=
riting-mode:revert;zoom:revert;display:block">
          <tr style=3D"background:revert;border:revert;color:revert;directi=
on:revert;display:revert;font-size:revert;height:revert;letter-spacing:reve=
rt;line-height:revert;margin:revert;opacity:revert;outline:revert;overflow:=
revert;padding:revert;table-layout:revert;text-align:revert;text-indent:rev=
ert;text-orientation:revert;text-overflow:revert;text-transform:revert;vert=
ical-align:revert;white-space:revert;width:revert;word-break:revert;word-sp=
acing:revert;writing-mode:revert;zoom:revert">
            <td valign=3D"middle" width=3D"1px" bgcolor=3D"#A6A6A6" cellpad=
ding=3D"7px 2px 7px 2px" style=3D"background-image:revert;background-positi=
on:revert;background-size:revert;background-repeat:revert;background-origin=
:revert;background-clip:revert;border:revert;color:revert;direction:revert;=
display:revert;font-size:revert;height:revert;letter-spacing:revert;line-he=
ight:revert;margin:revert;opacity:revert;outline:revert;overflow:revert;tab=
le-layout:revert;text-align:revert;text-indent:revert;text-orientation:reve=
rt;text-overflow:revert;text-transform:revert;vertical-align:revert;white-s=
pace:revert;word-break:revert;word-spacing:revert;writing-mode:revert;zoom:=
revert;padding:7px 2px;background-color:rgb(166,166,166);width:0px"><br>
            </td>
            <td valign=3D"middle" width=3D"100%" bgcolor=3D"#EAEAEA" cellpa=
dding=3D"7px 5px 7px 15px" color=3D"#212121" style=3D"background-image:reve=
rt;background-position:revert;background-size:revert;background-repeat:reve=
rt;background-origin:revert;background-clip:revert;border:revert;direction:=
revert;display:revert;height:revert;letter-spacing:revert;line-height:rever=
t;margin:revert;opacity:revert;outline:revert;overflow:revert;table-layout:=
revert;text-indent:revert;text-orientation:revert;text-overflow:revert;text=
-transform:revert;vertical-align:revert;white-space:revert;word-break:rever=
t;word-spacing:revert;writing-mode:revert;zoom:revert;width:100%;background=
-color:rgb(234,234,234);padding:7px 5px 7px 15px;font-family:wf_segoe-ui_no=
rmal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;font=
-size:12px;font-weight:normal;color:rgb(33,33,33);text-align:left">
              <div style=3D"background:revert;border:revert;color:revert;di=
rection:revert;display:revert;font-size:revert;height:revert;letter-spacing=
:revert;line-height:revert;margin:revert;opacity:revert;outline:revert;over=
flow:revert;padding:revert;table-layout:revert;text-align:revert;text-inden=
t:revert;text-orientation:revert;text-overflow:revert;text-transform:revert=
;vertical-align:revert;white-space:revert;width:revert;word-break:revert;wo=
rd-spacing:revert;writing-mode:revert;zoom:revert">
                You don&#39;t often get email from <a href=3D"mailto:bruce.=
ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>.
                <a href=3D"https://aka.ms/LearnAboutSenderIdentification" s=
tyle=3D"background:revert;color:revert;direction:revert;display:revert;font=
-size:revert;opacity:revert" target=3D"_blank">
                  Learn why this is important</a> </div>
            </td>
            <td valign=3D"middle" align=3D"left" width=3D"75px" bgcolor=3D"=
#EAEAEA" cellpadding=3D"7px 5px 7px 5px" color=3D"#212121" style=3D"backgro=
und-image:revert;background-position:revert;background-size:revert;backgrou=
nd-repeat:revert;background-origin:revert;background-clip:revert;border:rev=
ert;direction:revert;display:revert;height:revert;letter-spacing:revert;lin=
e-height:revert;margin:revert;opacity:revert;outline:revert;overflow:revert=
;table-layout:revert;text-indent:revert;text-orientation:revert;text-overfl=
ow:revert;text-transform:revert;vertical-align:revert;white-space:revert;wo=
rd-break:revert;word-spacing:revert;writing-mode:revert;zoom:revert;width:7=
5px;background-color:rgb(234,234,234);padding:7px 5px;font-family:wf_segoe-=
ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif=
;font-size:12px;font-weight:normal;color:rgb(33,33,33);text-align:left"><br=
>
            </td>
          </tr>
        </tbody>
      </table>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div style=3D"font-size:small"><br>
            </div>
          </div>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 6, 2025 at
              8:15=E2=80=AFAM Tom Hochstein via
              <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">l=
ists.yoctoproject.org</a>
              &lt;tom.hochstein=3D<a href=3D"mailto:oss.nxp.com@lists.yocto=
project.org" target=3D"_blank">oss.nxp.com@lists.yoctoproject.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              From: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@oss.n=
xp.com" target=3D"_blank">tom.hochstein@oss.nxp.com</a>&gt;<br>
              <br>
              The do_rootfs task for an image that includes
              libvirt-python fails.<br>
              ```<br>
              =C2=A0 - nothing provides libvirt-python needed by
              packagegroup-fsl-virtualization-1.0-r0.ls1012afrwy from
              oe-repo<br>
              ```<br>
              <br>
              The log shows that the do_compile:append() from
              libvirt-python.inc is<br>
              failing but not reporting the failure.<br>
              ```<br>
              174: cd: can&#39;t cd to
/.../libvirt/v11.8.0+git/sources/libvirt-v11.8.0+git/libvirt-python-11.8.0<=
br>
              ```<br>
              <br>
              The root cause is the archive folder format is changed
              from<br>
              libvirt-python-VERSION to libvirt_python-VERSION, but the
              do_compile<br>
              and do_install tasks are hard-coded to the old format.<br>
              <br>
              Fix the root cause by encoding the archive folder name in
              a common<br>
              variable. Also, fix the build and install commands so the
              cd failure is<br>
              not ignored.<br>
              <br>
              Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochst=
ein@oss.nxp.com" target=3D"_blank">tom.hochstein@oss.nxp.com</a>&gt;<br>
              ---<br>
              =C2=A0recipes-extended/libvirt/libvirt-python.inc | 14
              +++++++-------<br>
              =C2=A01 file changed, 7 insertions(+), 7 deletions(-)<br>
              <br>
              diff --git a/recipes-extended/libvirt/libvirt-python.inc
              b/recipes-extended/libvirt/libvirt-python.inc<br>
              index c430ffe5..0a99296a 100644<br>
              --- a/recipes-extended/libvirt/libvirt-python.inc<br>
              +++ b/recipes-extended/libvirt/libvirt-python.inc<br>
              @@ -18,8 +18,8 @@ FILES:${PN}-python =3D &quot;${bindir}/*
              ${libdir}/* ${libdir}/${PYTHON_DIR}/*&quot;<br>
              =C2=A0# Currently the libvirt-python debug libraries contain
              buildpaths<br>
              =C2=A0INSANE_SKIP:${PN}-dbg +=3D &quot;buildpaths&quot;<br>
              <br>
              -SRC_URI +=3D &quot;<a href=3D"http://libvirt.org/sources/pyt=
hon/$%7BBPN%7D_python-$%7BLIBVIRT_VERSION%7D.tar.gz;name=3Dlibvirt_python;s=
ubdir=3D$%7BBP%7D" rel=3D"noreferrer" target=3D"_blank">http://libvirt.org/=
sources/python/${BPN}_python-${LIBVIRT_VERSION}.tar.gz;name=3Dlibvirt_pytho=
n;subdir=3D${BP}</a>&quot;<br>
              -<br>
              +SRC_URI +=3D &quot;<a href=3D"http://libvirt.org/sources/pyt=
hon/$%7BLIBVIRT_PYTHON_ARCHIVE_NAME%7D.tar.gz;name=3Dlibvirt_python;subdir=
=3D$%7BBP%7D" rel=3D"noreferrer" target=3D"_blank">http://libvirt.org/sourc=
es/python/${LIBVIRT_PYTHON_ARCHIVE_NAME}.tar.gz;name=3Dlibvirt_python;subdi=
r=3D${BP}</a>&quot;<br>
              +LIBVIRT_PYTHON_ARCHIVE_NAME =3D
              &quot;${BPN}_python-${LIBVIRT_VERSION}&quot;<br>
              =C2=A0SRC_URI[libvirt_python.sha256sum] =3D
              &quot;5d80e13e0cfb96dd254d765ee60e77e5f9b6925172540056cec0aa0=
e6f0ca83c&quot;<br>
              <br>
              =C2=A0export LIBVIRT_API_PATH =3D &quot;${S}/docs/libvirt-api=
.xml&quot;<br>
              @@ -46,8 +46,8 @@ do_compile:append() {<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the=
 syroot staged pkgconfig entries. So
              we clear the sysroot<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # for=
 just this portion.<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expor=
t PKG_CONFIG_SYSROOT_DIR=3D<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd
              ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION}
              &amp;&amp; \<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              =C2=A0${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.p=
y
              build<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd
              ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              =C2=A0${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.p=
y
              build<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd -<=
br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
              =C2=A0}<br>
              @@ -58,9 +58,9 @@ do_install:append() {<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the=
 syroot staged pkgconfig entries. So
              we clear the sysroot<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # for=
 just this portion.<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expor=
t PKG_CONFIG_SYSROOT_DIR=3D<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd
              ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION}
              &amp;&amp; \<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              =C2=A0${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.p=
y
              install \<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
              =C2=A0--install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR}
              ${LIBVIRT_INSTALL_ARGS}<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd
              ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div style=3D"font-size:small">As I
                hinted at in my other reply just a minute ago, I&#39;d
                actually prefer that if we are</div>
              <div style=3D"font-size:small">changing
                this to fail on the directory not existing (which really
                has only happened</div>
              <div style=3D"font-size:small">once in
                the decade or so this exists), then we should put a test
                for the directory</div>
              <div style=3D"font-size:small">and
                output a clearer error message. Otherwise, someone
                getting that failed</div>
              <div style=3D"font-size:small">cd will
                have no idea why it happened.</div>
              <div style=3D"font-size:small"><br>
              </div>
              <div style=3D"font-size:small">Bruce</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>I think it&#39;s good to keep exceptional logic to a minimum. We
      might not ever see this failure again. Plus, I&#39;d argue that
      failing on the cd command gives a straightforward clue for how to
      debug. Let me know if you disagree, and I&#39;ll add the logic as you
      request.</p>
    <p>Tom</p></div></blockquote><div><br></div><div><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">I&#39;ll insist on this one, s=
ince I completely disagree on a failed cd to what will appear to be an arca=
ne and magic directory is useful to any end user.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Bruce</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div>
    <blockquote type=3D"cite">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote">
            <div>
              <br>
            </div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              =C2=A0${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.p=
y
              install \<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
              =C2=A0--install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR}
              ${LIBVIRT_INSTALL_ARGS}<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd -<=
br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
              =C2=A0}<br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#9429): <a href=3D"https://lists.yoctoproj=
ect.org/g/meta-virtualization/message/9429" rel=3D"noreferrer" target=3D"_b=
lank">
https://lists.yoctoproject.org/g/meta-virtualization/message/9429</a><br>
              Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt=
/116152179/1050810" rel=3D"noreferrer" target=3D"_blank">
                https://lists.yoctoproject.org/mt/116152179/1050810</a><br>
              Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@li=
sts.yoctoproject.org" target=3D"_blank">
                meta-virtualization+owner@lists.yoctoproject.org</a><br>
              Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/unsub" rel=3D"noreferrer" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follo=
w
            the NULL pointer, for chaos and madness await thee at its
            end<br>
            - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000004d1f3c0642eec6f2--

