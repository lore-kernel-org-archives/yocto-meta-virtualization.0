Return-Path: <iurii.mykhalskyi@globallogic.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01338E009AA; Fri, 28 Apr 2017 09:44:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.46 listed in list.dnswl.org]
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77CB3E009A0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Apr 2017 09:44:06 -0700 (PDT)
Received: by mail-wm0-f46.google.com with SMTP id r190so52277648wme.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Apr 2017 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rXWWRTY3bmbWpw2wjnlsmL3g5Pby7gTj3KTqrFrGJ6Q=;
	b=J6Q8hRPJ85KFUV58CZSGTJ9H60Ew2ob2v2TkA+VRlBZYQ6OjBmHuo5NF5vV/IDZe2E
	bH5mhBvVhuO+dUJz+kvYaaTm/8dQ6efGgkGWhJdc1orDS3eYE2+sSnfWqVDUcaIY5rUX
	HczqxGk53YX6CS2D/N4oD3jZ0NNtnHlO9WtAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rXWWRTY3bmbWpw2wjnlsmL3g5Pby7gTj3KTqrFrGJ6Q=;
	b=X7vOuwJNQnpQZiUKBP7NT4z8HpMKnMu69VeTjKI4Z+cAJlmSL9ShWPqN4KiOllkklk
	euS8q70iRHRe7exs9SYTjm1c7RKZ5WtnMSvLuTD8CnNWxc6Wxfb0UU0m0u9rDadfrlEO
	2kfLDAHC2Q+IdKh+6ETz91YZ1SbPXPd3xAH9IEdrI4QSuwGu4xJmIj4tNTh2xd1i0Qlx
	EgMYUl4qX6aAfcKB8pJl2MNIaxiW0TPxKZQgBC7GF/f1mM0HI9Yt3oRTe84ScVo8fKiy
	xW8JbGf043+TB27oxFS6xnW1dMtaFEeJia5AXhCjhm7ZiS7xOuoLEcZO2mia+TiDuwEJ
	AB4g==
X-Gm-Message-State: AN3rC/6rfeDtRAf5HgpsCKTKbbJC+ldxCnClkVGrf8P9LOapmvvq4cHh
	unbVE5F+5yJspEVXS8SsoUOmqTiFImf1
X-Received: by 10.28.91.77 with SMTP id p74mr6536926wmb.123.1493397845885;
	Fri, 28 Apr 2017 09:44:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.154.13 with HTTP; Fri, 28 Apr 2017 09:43:35 -0700 (PDT)
In-Reply-To: <805a504a-92ee-2764-deac-24126350a06b@windriver.com>
References: <1490280257-11855-1-git-send-email-iurii.mykhalskyi@globallogic.com>
	<CAC+yBMvfnV8iH713WgDyNO6mdJ969GX8EwT4wLCFzds+U0FX=g@mail.gmail.com>
	<805a504a-92ee-2764-deac-24126350a06b@windriver.com>
From: Iurii Mykhalskyi <iurii.mykhalskyi@globallogic.com>
Date: Fri, 28 Apr 2017 19:43:35 +0300
Message-ID: <CAC+yBMtH_xARNSLTFUcicPRVdHAZTtx-RcJuY=DG+h5M9Wj67A@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: meta-virtualization@yoctoproject.org, mark.asselstine@windriver.com
Subject: Re: [PATCH] xen: Fix mistype error in xen-watchdog systemd service
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
X-List-Received-Date: Fri, 28 Apr 2017 16:44:11 -0000
Content-Type: multipart/alternative; boundary=001a114431321cf96f054e3cc854

--001a114431321cf96f054e3cc854
Content-Type: text/plain; charset=UTF-8

Hi!

Thanks for replay.

Patch have been sent.

Iurii

On Fri, Apr 28, 2017 at 4:43 PM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> On 04/28/2017 07:11 AM, Iurii Mykhalskyi wrote:
>
>> Hello guys,
>>
>> any updates regarding this patch?
>>
>>
> I have no record of the patch, or this follow up ever making it to
> my meta-virt gmail filter .. so it looks like it was grabbed by
> spam or has otherwise, gone missing.
>
> This email is in my spam folder on gmail with:
>
> ------
> It has a from address in globallogic.com but has failed globallogic.com's
> required tests for authentication.
> ------
>
> Can you send the patch again and make sure to cc' me explicitly ?
>
> Bruce
>
>
> On Thu, Mar 23, 2017 at 4:44 PM, Iurii Mykhalskyi
>> <iurii.mykhalskyi@globallogic.com
>> <mailto:iurii.mykhalskyi@globallogic.com>> wrote:
>>
>>     Due to error in naming this service will not be autoenabled in
>>     systems with systemd init manager
>>
>>     Signed-off-by: Iurii Mykhalskyi <iurii.mykhalskyi@globallogic.com
>>     <mailto:iurii.mykhalskyi@globallogic.com>>
>>     ---
>>      recipes-extended/xen/xen.inc | 2 +-
>>      1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>     diff --git a/recipes-extended/xen/xen.inc
>> b/recipes-extended/xen/xen.inc
>>     index 0084274..a28d474 100644
>>     --- a/recipes-extended/xen/xen.inc
>>     +++ b/recipes-extended/xen/xen.inc
>>     @@ -720,7 +720,7 @@ INITSCRIPT_PARAMS_${PN}-devd = "defaults 82"
>>
>>      # systemd packages
>>      SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons
>>     ${PN}-xendomains"
>>     -SYSTEMD_SERVICE_${PN}-watchdog = "xen-watchdog.service"
>>     +SYSTEMD_SERVICE_${PN}-xen-watchdog = "xen-watchdog.service"
>>      SYSTEMD_SERVICE_${PN}-xencommons = " \
>>          proc-xen.mount \
>>          var-lib-xenstored.mount \
>>     --
>>     2.7.4
>>
>>
>>
>>
>> --
>>
>> Iurii Mykhalskyi | Lead Software Engineer
>> GlobalLogic
>> P +38.044.492.9695x3664 <tel:%2B38.044.492.9695x3664>  M
>> +38.096.311.5467  S mad-nemoi
>> www.globallogic.com <http://www.globallogic.com/>
>> <http://www.globallogic.com/>
>> http://www.globallogic.com/email_disclaimer.txt
>>
>
>


-- 

Iurii Mykhalskyi | Lead Software Engineer
GlobalLogic
P +38.044.492.9695x3664  M +38.096.311.5467  S mad-nemoi
www.globallogic.com
<http://www.globallogic.com/>
http://www.globallogic.com/email_disclaimer.txt

--001a114431321cf96f054e3cc854
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<div><br></div><div>Thanks for replay.</div><div><br></=
div><div>Patch have been sent.</div><div><br></div><div>Iurii</div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Apr 28, 201=
7 at 4:43 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.=
ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 04/=
28/2017 07:11 AM, Iurii Mykhalskyi wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hello guys,<br>
<br>
any updates regarding this patch?<br>
<br>
</blockquote>
<br></span>
I have no record of the patch, or this follow up ever making it to<br>
my meta-virt gmail filter .. so it looks like it was grabbed by<br>
spam or has otherwise, gone missing.<br>
<br>
This email is in my spam folder on gmail with:<br>
<br>
------<br>
It has a from address in <a href=3D"http://globallogic.com" rel=3D"noreferr=
er" target=3D"_blank">globallogic.com</a> but has failed <a href=3D"http://=
globallogic.com" rel=3D"noreferrer" target=3D"_blank">globallogic.com</a>&#=
39;s required tests for authentication.<br>
------<br>
<br>
Can you send the patch again and make sure to cc&#39; me explicitly ?<br>
<br>
Bruce<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">
On Thu, Mar 23, 2017 at 4:44 PM, Iurii Mykhalskyi<br>
&lt;<a href=3D"mailto:iurii.mykhalskyi@globallogic.com" target=3D"_blank">i=
urii.mykhalskyi@globallogic.<wbr>com</a><br></span><span class=3D"">
&lt;mailto:<a href=3D"mailto:iurii.mykhalskyi@globallogic.com" target=3D"_b=
lank">iurii.mykhalskyi@globa<wbr>llogic.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Due to error in naming this service will not be autoenabled i=
n<br>
=C2=A0 =C2=A0 systems with systemd init manager<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Iurii Mykhalskyi &lt;<a href=3D"mailto:iurii.m=
ykhalskyi@globallogic.com" target=3D"_blank">iurii.mykhalskyi@globallogic.<=
wbr>com</a><br></span>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:iurii.mykhalskyi@globallogic.com=
" target=3D"_blank">iurii.mykhalskyi@globa<wbr>llogic.com</a>&gt;&gt;<span =
class=3D""><br>
=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0recipes-extended/xen/xen.inc | 2 +-<br>
=C2=A0 =C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0 =C2=A0 diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/=
xen/xen.inc<br>
=C2=A0 =C2=A0 index 0084274..a28d474 100644<br>
=C2=A0 =C2=A0 --- a/recipes-extended/xen/xen.inc<br>
=C2=A0 =C2=A0 +++ b/recipes-extended/xen/xen.inc<br>
=C2=A0 =C2=A0 @@ -720,7 +720,7 @@ INITSCRIPT_PARAMS_${PN}-devd =3D &quot;de=
faults 82&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0# systemd packages<br>
=C2=A0 =C2=A0 =C2=A0SYSTEMD_PACKAGES =3D &quot;${PN}-xen-watchdog ${PN}-xen=
commons<br>
=C2=A0 =C2=A0 ${PN}-xendomains&quot;<br>
=C2=A0 =C2=A0 -SYSTEMD_SERVICE_${PN}-watchdo<wbr>g =3D &quot;xen-watchdog.s=
ervice&quot;<br>
=C2=A0 =C2=A0 +SYSTEMD_SERVICE_${PN}-xen-wat<wbr>chdog =3D &quot;xen-watchd=
og.service&quot;<br>
=C2=A0 =C2=A0 =C2=A0SYSTEMD_SERVICE_${PN}-xencomm<wbr>ons =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proc-xen.mount \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0var-lib-xenstored.mount \<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 2.7.4<br>
<br>
<br>
<br>
<br>
--<br>
<br>
Iurii Mykhalskyi | Lead Software Engineer<br>
GlobalLogic<br></span>
P <a href=3D"tel:%2B38.044.492.9695x3664" value=3D"+380444929695" target=3D=
"_blank">+38.044.492.9695x3664</a> &lt;tel:%2B38.044.492.9695x3664&gt;=C2=
=A0 M<span class=3D""><br>
<a href=3D"tel:%2B38.096.311.5467" value=3D"+380963115467" target=3D"_blank=
">+38.096.311.5467</a>=C2=A0 S mad-nemoi<br>
<a href=3D"http://www.globallogic.com" rel=3D"noreferrer" target=3D"_blank"=
>www.globallogic.com</a> &lt;<a href=3D"http://www.globallogic.com/" rel=3D=
"noreferrer" target=3D"_blank">http://www.globallogic.com/</a>&gt;<br></spa=
n>
&lt;<a href=3D"http://www.globallogic.com/" rel=3D"noreferrer" target=3D"_b=
lank">http://www.globallogic.com/</a>&gt;<br>
<a href=3D"http://www.globallogic.com/email_disclaimer.txt" rel=3D"noreferr=
er" target=3D"_blank">http://www.globallogic.com/ema<wbr>il_disclaimer.txt<=
/a><br>
</blockquote>
<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><font =
size=3D"-1"><br><span style=3D"vertical-align:baseline;font-variant:normal;=
font-style:normal;font-size:12px;background-color:transparent;text-decorati=
on:none;font-family:Arial;font-weight:bold">Iurii Mykhalskyi | Lead Softwar=
e Engineer </span><br><span style=3D"vertical-align:baseline;font-variant:n=
ormal;font-style:normal;font-size:12px;background-color:transparent;text-de=
coration:none;font-family:Arial;font-weight:normal">GlobalLogic</span><br><=
span style=3D"vertical-align:baseline;font-variant:normal;font-style:normal=
;font-size:12px;background-color:transparent;text-decoration:none;font-fami=
ly:Arial;font-weight:normal">P=C2=A0</span></font><a href=3D"tel:%2B38.044.=
492.9695x3664" value=3D"+380444929695" style=3D"color:rgb(17,85,204);font-f=
amily:Arial;font-size:12px" target=3D"_blank">+38.044.492.9695x3664</a><fon=
t size=3D"-1"><span style=3D"vertical-align:baseline;font-variant:normal;fo=
nt-style:normal;font-size:12px;background-color:transparent;text-decoration=
:none;font-family:Arial;font-weight:normal">=C2=A0 M +38.096.311.5467=C2=A0=
 S mad-nemoi</span><br><a href=3D"http://www.globallogic.com/" target=3D"_b=
lank"><span style=3D"font-size:12px;font-family:Arial;color:#1155cc;backgro=
und-color:transparent;font-weight:normal;font-style:normal;font-variant:nor=
mal;text-decoration:underline;vertical-align:baseline">www.globallogic.com<=
/span></a><span style=3D"vertical-align:baseline;font-variant:normal;font-s=
tyle:normal;font-size:12px;background-color:transparent;text-decoration:non=
e;font-family:Arial;font-weight:normal"></span><br><a href=3D"http://www.gl=
oballogic.com/" target=3D"_blank"><span style=3D"font-size:12px;font-family=
:Arial;color:#1155cc;background-color:transparent;font-weight:normal;font-s=
tyle:normal;font-variant:normal;text-decoration:underline;vertical-align:ba=
seline"></span></a><br><a href=3D"http://www.globallogic.com/email_disclaim=
er.txt" target=3D"_blank"><span style=3D"font-size:11px;font-family:Arial;c=
olor:#1155cc;background-color:transparent;font-weight:normal;font-style:nor=
mal;font-variant:normal;text-decoration:underline;vertical-align:baseline">=
http://www.globallogic.com/email_disclaimer.txt</span></a><span style=3D"ve=
rtical-align:baseline;font-variant:normal;font-style:normal;font-size:11px;=
background-color:transparent;text-decoration:none;font-family:Arial;font-we=
ight:normal"></span></font></div></div></div></div></div></div></div></div>=
</div>
</div>

--001a114431321cf96f054e3cc854--
