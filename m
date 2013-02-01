Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2073FE0073D
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Feb 2013 06:10:25 -0800 (PST)
Received: by mail-lb0-f178.google.com with SMTP id n1so4492608lba.23
	for <meta-virtualization@yoctoproject.org>;
	Fri, 01 Feb 2013 06:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=ExDyu13n31WD+suFcqSv5lKMjgtpM8bkB1qnDXeuU8M=;
	b=DO4wyPEykwfN/ldekGNgt+rsg3SrjCKt1h7sdQA5lPC8qQfbHDw0nuS8zTAuCreiOj
	1GuaqPWXEIEA7pP+f+fVdt6ApakiwmA5fWgJDFA3J0tlUHvI9S5kuorsxqgn09Yg2apK
	IoW6MafyMigZN+tU+lpE6NXz+p3jgkMlm1t6EykbeIokrMJs7SuEXFefhjLfVoILsM2L
	iyM7iy2C9MDu7ZLa8rUdeeIgSKNrmcDbSwMdNA/RM1zV5265+i955aavhnK18halTsH1
	zhfm9v5kkPejtZEnXeORdFfHy44PJvDRsxYRrjFihKGUfhk0ESZ77tOn3EKW4GGMOTUU
	z7Kw==
MIME-Version: 1.0
X-Received: by 10.152.147.103 with SMTP id tj7mr11377440lab.54.1359727824608; 
	Fri, 01 Feb 2013 06:10:24 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Fri, 1 Feb 2013 06:10:24 -0800 (PST)
In-Reply-To: <510B3C84.5060009@windriver.com>
References: <1359616727-15082-1-git-send-email-lei.yang@windriver.com>
	<CADkTA4M6MPUeC6XfHnWOgbYEbC3tiWauf7NyyZm0UPq05SjD9w@mail.gmail.com>
	<510B3C84.5060009@windriver.com>
Date: Fri, 1 Feb 2013 09:10:24 -0500
Message-ID: <CADkTA4PCO0Dpt6DSXPrafYmwW5ETMtoxorjbAVf2=4p059D97w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: lei yang <lei.yang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswtich: start openvswitch at the boot time
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
X-List-Received-Date: Fri, 01 Feb 2013 14:10:26 -0000
Content-Type: multipart/alternative; boundary=e89a8f234d2bfa1f1c04d4aa4d93

--e89a8f234d2bfa1f1c04d4aa4d93
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 31, 2013 at 10:54 PM, lei yang <lei.yang@windriver.com> wrote:

> On 01/31/2013 09:39 PM, Bruce Ashfield wrote:
>
>>
>>
>>
>> On Thu, Jan 31, 2013 at 2:18 AM, <lei.yang@windriver.com <mailto:
>> lei.yang@windriver.com**>> wrote:
>>
>>     From: Lei Yang <lei.yang@windriver.com
>>     <mailto:lei.yang@windriver.com**>>
>>
>>
>>     When I define the bridge, I get below error
>>
>>     root@intel_5500_server:~# ovs-vsctl add-br ovsbr0
>>     Jan 25 17:34:07|00002|stream_unix|**ERR|/tmp/stream-unix.1487.0:
>>     connection to /var/run/openvswitch/db.sock
>>     failed: No such file or directory
>>     ........
>>     ........
>>
>>     This is because openvswitch damon isn't running,so we'd better
>>     start it at the boot time.
>>     The split-pacakage ${PN}-switch ${PN}-controller provide us to
>>     start nessary damon with update-rc.d
>>
>>
>> s/pacakage/package/
>> s/nessary/necessary/
>> s/damon/daemon/
>>
>>     so we add them to the RDEPENDS.
>>
>>     Since openvswtich depends on openvswtich kernel module,so auto
>>     load the kernel module too.
>>
>>
>> s/openvswtich/openvswitch/
>>
>>
>>     Signed-off-by: Lei Yang <lei.yang@windriver.com
>>     <mailto:lei.yang@windriver.com**>>
>>     Tested-by: Lei Yang <lei.yang@windriver.com
>>     <mailto:lei.yang@windriver.com**>>
>>
>>
>>
>> We can drop the Tested-by: since it is your patch :)
>>
>> I can make the changes below if you agree with them, and save us another
>> revision
>> of the patch.
>>
>>
> Agree, I don't trust "set spell" again in vim :-( , it doesn't help me for
> this spelling error
>
>
No worries, we all make spelling mistakes and typos.

I wrapped the commit message to 72 chars, fixed the few issues and pushed it
to master.

Bruce


> Lei
>
>
>
>  Cheers,
>>
>> Bruce
>>
>>     ---
>>      recipes-kernel/linux/linux-**yocto_3.4.bbappend      |    2 +-
>>      .../openvswitch/openvswitch_1.**4.3.bb <http://openvswitch_1.4.3.bb>
>>     <http://openvswitch_1.4.3.bb>               |    2 +-
>>
>>      2 files changed, 2 insertions(+), 2 deletions(-)
>>
>>     diff --git a/recipes-kernel/linux/linux-**yocto_3.4.bbappend
>>     b/recipes-kernel/linux/linux-**yocto_3.4.bbappend
>>     index 5b163ff..918302a 100644
>>     --- a/recipes-kernel/linux/linux-**yocto_3.4.bbappend
>>     +++ b/recipes-kernel/linux/linux-**yocto_3.4.bbappend
>>     @@ -5,4 +5,4 @@ SRC_URI += "file://xt-checksum.scc \
>>                 file://vswitch.scc \
>>                 file://lxc.scc \
>>                 "
>>     -
>>     +module_autoload_openvswitch = "openvswitch"
>>     diff --git a/recipes-networking/**openvswitch/openvswitch_1.4.3.**bb<http://openvswitch_1.4.3.bb>
>>     <http://openvswitch_1.4.3.bb>
>>     b/recipes-networking/**openvswitch/openvswitch_1.4.3.**bb<http://openvswitch_1.4.3.bb>
>>     <http://openvswitch_1.4.3.bb>
>>
>>     index 88f0114..6764073 100644
>>     --- a/recipes-networking/**openvswitch/openvswitch_1.4.3.**bb<http://openvswitch_1.4.3.bb>
>>     <http://openvswitch_1.4.3.bb>
>>     +++ b/recipes-networking/**openvswitch/openvswitch_1.4.3.**bb<http://openvswitch_1.4.3.bb>
>>     <http://openvswitch_1.4.3.bb>
>>
>>     @@ -7,7 +7,7 @@ LICENSE = "Apache-2"
>>      DEPENDS += "bridge-utils openssl python perl"
>>
>>      RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid \
>>     -              python perl perl-module-strict"
>>     +              python perl perl-module-strict ${PN}-switch
>>     ${PN}-controller"
>>      RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
>>      RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
>>      RDEPENDS_${PN}-pki = "${PN}"
>>     --
>>     1.7.1
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e89a8f234d2bfa1f1c04d4aa4d93
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jan 31, 2013 at 10:54 PM, lei yang <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:lei.yang@windriver.com" target=3D"_blank">lei.yang@windrive=
r.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 01/31/2013 09:39 PM, Bruce Ashfield wrote=
:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">
<br>
<br>
<br>
On Thu, Jan 31, 2013 at 2:18 AM, &lt;<a href=3D"mailto:lei.yang@windriver.c=
om" target=3D"_blank">lei.yang@windriver.com</a> &lt;mailto:<a href=3D"mail=
to:lei.yang@windriver.com" target=3D"_blank">lei.yang@windriver.com</a><u><=
/u>&gt;&gt; wrote:<br>

<br>
=A0 =A0 From: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com" target=
=3D"_blank">lei.yang@windriver.com</a><br></div>
=A0 =A0 &lt;mailto:<a href=3D"mailto:lei.yang@windriver.com" target=3D"_bla=
nk">lei.yang@windriver.com</a><u></u>&gt;&gt;<div class=3D"im"><br>
<br>
=A0 =A0 When I define the bridge, I get below error<br>
<br>
=A0 =A0 root@intel_5500_server:~# ovs-vsctl add-br ovsbr0<br>
=A0 =A0 Jan 25 17:34:07|00002|stream_unix|<u></u>ERR|/tmp/stream-unix.1487.=
0:<br>
=A0 =A0 connection to /var/run/openvswitch/db.sock<br>
=A0 =A0 failed: No such file or directory<br>
=A0 =A0 ........<br>
=A0 =A0 ........<br>
<br>
=A0 =A0 This is because openvswitch damon isn&#39;t running,so we&#39;d bet=
ter<br>
=A0 =A0 start it at the boot time.<br>
=A0 =A0 The split-pacakage ${PN}-switch ${PN}-controller provide us to<br>
=A0 =A0 start nessary damon with update-rc.d<br>
<br>
<br>
s/pacakage/package/<br>
s/nessary/necessary/<br>
s/damon/daemon/<br>
<br>
=A0 =A0 so we add them to the RDEPENDS.<br>
<br>
=A0 =A0 Since openvswtich depends on openvswtich kernel module,so auto<br>
=A0 =A0 load the kernel module too.<br>
<br>
<br>
s/openvswtich/openvswitch/<br>
<br>
<br>
=A0 =A0 Signed-off-by: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.co=
m" target=3D"_blank">lei.yang@windriver.com</a><br></div>
=A0 =A0 &lt;mailto:<a href=3D"mailto:lei.yang@windriver.com" target=3D"_bla=
nk">lei.yang@windriver.com</a><u></u>&gt;&gt;<br>
=A0 =A0 Tested-by: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com" t=
arget=3D"_blank">lei.yang@windriver.com</a><br>
=A0 =A0 &lt;mailto:<a href=3D"mailto:lei.yang@windriver.com" target=3D"_bla=
nk">lei.yang@windriver.com</a><u></u>&gt;&gt;<div class=3D"im"><br>
<br>
<br>
We can drop the Tested-by: since it is your patch :)<br>
<br>
I can make the changes below if you agree with them, and save us another re=
vision<br>
of the patch.<br>
<br>
</div></blockquote>
<br>
Agree, I don&#39;t trust &quot;set spell&quot; again in vim :-( , it doesn&=
#39;t help me for this spelling error<br>
<br></blockquote><div><br></div><div style>No worries, we all make spelling=
 mistakes and typos.</div><div style><br></div><div style>I wrapped the com=
mit message to 72 chars, fixed the few issues and pushed it</div><div style=
>
to master.</div><div style><br></div><div style>Bruce</div><div>=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
Lei<br>
<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">
Cheers,<br>
<br>
Bruce<br>
<br>
=A0 =A0 ---<br>
=A0 =A0 =A0recipes-kernel/linux/linux-<u></u>yocto_3.4.bbappend =A0 =A0 =A0=
| =A0 =A02 +-<br>
=A0 =A0 =A0.../openvswitch/<a href=3D"http://openvswitch_1.4.3.bb" target=
=3D"_blank">openvswitch_1.<u></u>4.3.bb</a><br></div>
=A0 =A0 &lt;<a href=3D"http://openvswitch_1.4.3.bb" target=3D"_blank">http:=
//openvswitch_1.4.3.bb</a>&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<di=
v class=3D"im"><br>
=A0 =A0 =A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=A0 =A0 diff --git a/recipes-kernel/linux/linux-<u></u>yocto_3.4.bbappend<b=
r>
=A0 =A0 b/recipes-kernel/linux/linux-<u></u>yocto_3.4.bbappend<br>
=A0 =A0 index 5b163ff..918302a 100644<br>
=A0 =A0 --- a/recipes-kernel/linux/linux-<u></u>yocto_3.4.bbappend<br>
=A0 =A0 +++ b/recipes-kernel/linux/linux-<u></u>yocto_3.4.bbappend<br>
=A0 =A0 @@ -5,4 +5,4 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://vswitch.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://lxc.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
=A0 =A0 -<br>
=A0 =A0 +module_autoload_openvswitch =3D &quot;openvswitch&quot;<br>
=A0 =A0 diff --git a/recipes-networking/<u></u>openvswitch/<a href=3D"http:=
//openvswitch_1.4.3.bb" target=3D"_blank">openvswitch_1.4.3.<u></u>bb</a><b=
r></div>
=A0 =A0 &lt;<a href=3D"http://openvswitch_1.4.3.bb" target=3D"_blank">http:=
//openvswitch_1.4.3.bb</a>&gt;<br>
=A0 =A0 b/recipes-networking/<u></u>openvswitch/<a href=3D"http://openvswit=
ch_1.4.3.bb" target=3D"_blank">openvswitch_1.4.3.<u></u>bb</a><br>
=A0 =A0 &lt;<a href=3D"http://openvswitch_1.4.3.bb" target=3D"_blank">http:=
//openvswitch_1.4.3.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 index 88f0114..6764073 100644<br>
=A0 =A0 --- a/recipes-networking/<u></u>openvswitch/<a href=3D"http://openv=
switch_1.4.3.bb" target=3D"_blank">openvswitch_1.4.3.<u></u>bb</a><br></div=
>
=A0 =A0 &lt;<a href=3D"http://openvswitch_1.4.3.bb" target=3D"_blank">http:=
//openvswitch_1.4.3.bb</a>&gt;<br>
=A0 =A0 +++ b/recipes-networking/<u></u>openvswitch/<a href=3D"http://openv=
switch_1.4.3.bb" target=3D"_blank">openvswitch_1.4.3.<u></u>bb</a><br>
=A0 =A0 &lt;<a href=3D"http://openvswitch_1.4.3.bb" target=3D"_blank">http:=
//openvswitch_1.4.3.bb</a>&gt;<div class=3D"im"><br>
=A0 =A0 @@ -7,7 +7,7 @@ LICENSE =3D &quot;Apache-2&quot;<br>
=A0 =A0 =A0DEPENDS +=3D &quot;bridge-utils openssl python perl&quot;<br>
<br>
=A0 =A0 =A0RDEPENDS_${PN} +=3D &quot;util-linux-uuidgen util-linux-libuuid =
\<br>
=A0 =A0 - =A0 =A0 =A0 =A0 =A0 =A0 =A0python perl perl-module-strict&quot;<b=
r>
=A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 =A0python perl perl-module-strict ${PN}-s=
witch<br>
=A0 =A0 ${PN}-controller&quot;<br>
=A0 =A0 =A0RDEPENDS_${PN}-controller =3D &quot;${PN} lsb ${PN}-pki&quot;<br=
>
=A0 =A0 =A0RDEPENDS_${PN}-switch =3D &quot;${PN} openssl procps util-linux-=
uuidgen&quot;<br>
=A0 =A0 =A0RDEPENDS_${PN}-pki =3D &quot;${PN}&quot;<br>
=A0 =A0 --<br>
=A0 =A0 1.7.1<br>
<br>
<br>
<br>
<br>
-- <br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;<br>
</div></blockquote>
<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;
</div></div>

--e89a8f234d2bfa1f1c04d4aa4d93--
