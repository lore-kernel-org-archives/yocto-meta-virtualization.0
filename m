Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2411BE00D6D; Wed, 24 Feb 2016 08:04:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A59C6E00D3F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Feb 2016 08:04:50 -0800 (PST)
Received: by mail-vk0-f54.google.com with SMTP id c3so20784285vkb.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Feb 2016 08:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=L9IYBhLiHG59mzNSDqL5GO7vTbhGJDAt0xxrxH5e6jU=;
	b=Pm1DS9uF6d7kO8vvzbIIE9UAq9lNMt2ApA+/fg1O7jFivY5nUuiOG4Me+khyoai+RR
	4JYtaYwut9IyOHSwKucQT2xrj9YF+icWTBWhtO+1l5v8xrtEAFnZPtUbOFzZddHVuI3s
	IHR6OdQwWz5eDLNgZBsqW9LkJs2THSrUfnKdmuDClEt6G2kAJ7Ua9hiyD0Lw9rAJkRpO
	K3YMtni1fRXei/r415YWgQSMzV6iq53kt1/tQaql7hIBy5SRsJATNuZPFKDIJ7CKp/sf
	9JwegsAyUvTEvgJC2sR+Qi+L0T9FM3fS5fw82dWyyXiH3C0Cr+2blKNwrygo1AgGLu9z
	de6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=L9IYBhLiHG59mzNSDqL5GO7vTbhGJDAt0xxrxH5e6jU=;
	b=TbaAqEL+3aFWXgMX7j7PO3SNGHYlPjntKsrcaFphO07jgUoAYs/Dls5cgFrUxxgB4f
	ienn0Y2Trivnjp9YpDLtjMObzc0AmkXwsGaKsi/41AIxjN6s9Ax9PdKDVA6fQa66WhHQ
	vaVAfZEyhYM8cPk8HM2dvbQJmRTcBwsjCMfagK1Yr3fCXLkCkeXXjS+YCGVnmTYwAmRX
	jVavjimryJ7hrsBrhMNI1mXo3vk+ucztFUpo8U89NwcSDgAlAdaEh4EpFl2FTEGaeJoW
	SCAFA2pt5GhsFaO6Eul9/BQ7fVhs9xWbSCkLi/+eMtRk4jSnv+osDvvxaAAR2ds9DkoZ
	MuoA==
X-Gm-Message-State: AG10YOSTmKTU2gnMZkUMqU6ebvE9GOQGXuFPdcepQmW0bwCPsup8+0pc0jkeTe26GncJoDztAuDD660IlAnJwg==
MIME-Version: 1.0
X-Received: by 10.31.52.134 with SMTP id b128mr32564690vka.124.1456329889932; 
	Wed, 24 Feb 2016 08:04:49 -0800 (PST)
Received: by 10.176.0.50 with HTTP; Wed, 24 Feb 2016 08:04:49 -0800 (PST)
In-Reply-To: <CADkTA4MW9xP254y=tBQU33pztWGJwqqQUb+BwEApFb3UvUg8Ag@mail.gmail.com>
References: <1455291269-32533-1-git-send-email-cjp256@gmail.com>
	<CADkTA4MW9xP254y=tBQU33pztWGJwqqQUb+BwEApFb3UvUg8Ag@mail.gmail.com>
Date: Wed, 24 Feb 2016 11:04:49 -0500
Message-ID: <CADkTA4NLHMjkY92WYWam7zzPqKXeD_S48bWKvQq3wgvao_20BA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen.inc: fix ordering of stubs task
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Feb 2016 16:04:53 -0000
Content-Type: multipart/alternative; boundary=001a114402bec3eb35052c8639eb

--001a114402bec3eb35052c8639eb
Content-Type: text/plain; charset=UTF-8

Someone was pinging me about cherry-picking a patch to Jethro, but I can't
find any trace of that email any more.

I can't even remember 100% who it was, but this patch rings a bell.

Does anyone know of this, or other Xen patches that should also be pulled
into
the jethro branch ?

Bruce

On Wed, Feb 17, 2016 at 11:26 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> merged.
>
> Bruce
>
> On Fri, Feb 12, 2016 at 10:34 AM, Chris Patterson <cjp256@gmail.com>
> wrote:
>
>> Placing the stubs function between patch and configure steps
>> breaks because it has dependencies which are not guranteed
>> until the configure step.
>>
>> Build error:
>> "fatal error: gnu/stubs-32.h: No such file or directory"
>>
>> This patch simply moves the step between configure and compile
>> to resolve the dependency issue.
>>
>> Reported-by: Machon Gregory <mbgrego@tycho.nsa.gov>
>> Signed-off-by: Chris Patterson <cjp256@gmail.com>
>> ---
>>  recipes-extended/xen/xen.inc |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>> index 5555ed3..d35bc3f 100644
>> --- a/recipes-extended/xen/xen.inc
>> +++ b/recipes-extended/xen/xen.inc
>> @@ -782,7 +782,7 @@ do_stubs() {
>>      fi
>>  }
>>
>> -addtask stubs after do_patch before do_configure
>> +addtask stubs after do_configure before do_compile
>>
>>  do_configure() {
>>
>> --
>> 1.7.10.4
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114402bec3eb35052c8639eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Someone was pinging me about cherry-picking a patch to Jet=
hro, but I can&#39;t<div>find any trace of that email any more.</div><div><=
br></div><div>I can&#39;t even remember 100% who it was, but this patch rin=
gs a bell.</div><div><br></div><div>Does anyone know of this, or other Xen =
patches that should also be pulled into</div><div>the jethro branch ?</div>=
<div><br></div><div>Bruce</div></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Wed, Feb 17, 2016 at 11:26 PM, Bruce Ashfield <span =
dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blan=
k">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div =
class=3D"gmail_extra"><div><div class=3D"h5"><br><div class=3D"gmail_quote"=
>On Fri, Feb 12, 2016 at 10:34 AM, Chris Patterson <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:cjp256@gmail.com" target=3D"_blank">cjp256@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Placing the stubs functio=
n between patch and configure steps<br>
breaks because it has dependencies which are not guranteed<br>
until the configure step.<br>
<br>
Build error:<br>
&quot;fatal error: gnu/stubs-32.h: No such file or directory&quot;<br>
<br>
This patch simply moves the step between configure and compile<br>
to resolve the dependency issue.<br>
<br>
Reported-by: Machon Gregory &lt;<a href=3D"mailto:mbgrego@tycho.nsa.gov" ta=
rget=3D"_blank">mbgrego@tycho.nsa.gov</a>&gt;<br>
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com" targ=
et=3D"_blank">cjp256@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc |=C2=A0 =C2=A0 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 5555ed3..d35bc3f 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -782,7 +782,7 @@ do_stubs() {<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
-addtask stubs after do_patch before do_configure<br>
+addtask stubs after do_configure before do_compile<br>
<br>
=C2=A0do_configure() {<br>
<span><font color=3D"#888888"><br>
--<br>
1.7.10.4<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div></div=
></div><span class=3D"HOEnZb"><font color=3D"#888888">-- <br><div>&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div>

--001a114402bec3eb35052c8639eb--
