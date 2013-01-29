Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-da0-f47.google.com (mail-da0-f47.google.com
	[209.85.210.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AF7CE0072F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 08:46:39 -0800 (PST)
Received: by mail-da0-f47.google.com with SMTP id s35so305507dak.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 08:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=GDVXaE0gXdGC1Vwmokmp/z19Ie7rgegUYPLi4UMufO8=;
	b=J2LgGfaOuvO19fIjcQIBrrDjqnEmVdC6ixvLlOK2zvB4+76BFEQawa0LULchvl4Ejz
	HJjroBIFP/ya+hB4nR5LwaKx2Qs1QkjGZdB4INuksSAMoCv4ZoGXZGx9XlXDxktgsKc1
	izCdd9s3l/9H0idj3y7WTEuH4vG80rgmVTuNE69n8IPnb4DP8Rkw+POIpWnnE7tzF/8B
	mI8g8AK/N/pA4IupfM44N5kKjmLXd3hkY1c/JpR2qucPLhBfGQW+TbiTY69izH07K+WW
	Ek+GjWEa7LIQaT/KKMICvJdj1YRTFZjs+yhcgZEUnqYgLqZUQ8yf+WSD9MJ+hOHLNsrt
	ydZw==
MIME-Version: 1.0
X-Received: by 10.68.211.42 with SMTP id mz10mr4054214pbc.100.1359477994773;
	Tue, 29 Jan 2013 08:46:34 -0800 (PST)
Received: by 10.68.224.4 with HTTP; Tue, 29 Jan 2013 08:46:34 -0800 (PST)
In-Reply-To: <5107F9B9.10500@windriver.com>
References: <1359370883-2033-1-git-send-email-lei.yang@windriver.com>
	<CADkTA4N0LWxDXWSGnUzUQKgGWPEtZ0wyzNF4p9Jf68xTZ5uDWw@mail.gmail.com>
	<5107F9B9.10500@windriver.com>
Date: Tue, 29 Jan 2013 11:46:34 -0500
Message-ID: <CADkTA4MWt9r+6m9JcgQqA9JbMPhWd7kKd2ZwL5nU9BfmunRVcw@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 Jan 2013 16:46:39 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1ca38f55c3b04d4702215

--e89a8ff1ca38f55c3b04d4702215
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 29, 2013 at 11:32 AM, lei yang <lei.yang@windriver.com> wrote:

> On 01/29/2013 09:46 PM, Bruce Ashfield wrote:
>
>>
>>
>> On Mon, Jan 28, 2013 at 6:01 AM, <lei.yang@windriver.com <mailto:
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
>>     This is becasue openvswitch isn't running,so we'd better start it
>>     at the boot time.
>>
>>
>> s/becasue/because/
>>
>> Can you elaborate on this a bit more as well. What you are actually doing
>> in the
>> patch is adding to the RDEPENDS of openvswitch and it's the dependencies
>> that
>> you are adding, that once installed are starting the switch at runtime ..
>> right ? The
>> reason I'd like it clarified is that when I read your patch, I expected
>> to see an initscript
>> update, or inherit rc.d, but found the RDEPENDS update instead.
>>
>
>
> because : those tow packages used rc.d. so we only need to install them
>
> inherit autotools update-rc.d
>
> INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-controller"
> INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
> INITSCRIPT_PARAMS_${PN}-switch = "defaults 71"
>
> INITSCRIPT_NAME_${PN}-**controller = "openvswitch-controller"
> INITSCRIPT_PARAMS_${PN}-**controller = "defaults 72"
>
>
>
Exactly, that's what I saw when I checked .. but it's worth being clear in
the
message.

Bruce


> I will send V2 tomorrow
>
> LeI
>
>
>
>
>
>      Since openvswtich depends on openvswtich module,so auto load the
>>     kernel module too.
>>
>>
>>     Signed-off-by: Lei Yang <lei.yang@windriver.com
>>     <mailto:lei.yang@windriver.com**>>
>>     Tested-by: Lei Yang <lei.yang@windriver.com
>>     <mailto:lei.yang@windriver.com**>>
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
>>
>>
>> This looks fine. I double checked that the vswitch kernel fragment
>> enables the module,
>> so our autoload is fine.
>>
>> Bruce
>>
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
>>     ______________________________**_________________
>>     meta-virtualization mailing list
>>     meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject.org>
>>     <mailto:meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject.org>
>> >
>>
>>     https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https://lists.yoctoproject.org/listinfo/meta-virtualization>
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>>
>>
>> On Mon, Jan 28, 2013 at 6:01 AM, <lei.yang@windriver.com <mailto:
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
>>     This is becasue openvswitch isn't running,so we'd better start it
>>     at the boot time.
>>     Since openvswtich depends on openvswtich module,so auto load the
>>     kernel module too.
>>
>>     Signed-off-by: Lei Yang <lei.yang@windriver.com
>>     <mailto:lei.yang@windriver.com**>>
>>     Tested-by: Lei Yang <lei.yang@windriver.com
>>     <mailto:lei.yang@windriver.com**>>
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
>>     ______________________________**_________________
>>     meta-virtualization mailing list
>>     meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject.org>
>>     <mailto:meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject.org>
>> >
>>
>>     https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https://lists.yoctoproject.org/listinfo/meta-virtualization>
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

--e89a8ff1ca38f55c3b04d4702215
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Jan 29, 2013 at 11:32 AM, lei yang <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:lei.yang@windriver.com" target=3D"_blank">lei.yang@windrive=
r.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 01/29/2013 09:46 PM, Bruce Ashfield wrote=
:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">
<br>
<br>
On Mon, Jan 28, 2013 at 6:01 AM, &lt;<a href=3D"mailto:lei.yang@windriver.c=
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
=A0 =A0 This is becasue openvswitch isn&#39;t running,so we&#39;d better st=
art it<br>
=A0 =A0 at the boot time.<br>
<br>
<br>
s/becasue/because/<br>
<br>
Can you elaborate on this a bit more as well. What you are actually doing i=
n the<br>
patch is adding to the RDEPENDS of openvswitch and it&#39;s the dependencie=
s that<br>
you are adding, that once installed are starting the switch at runtime .. r=
ight ? The<br>
reason I&#39;d like it clarified is that when I read your patch, I expected=
 to see an initscript<br>
update, or inherit rc.d, but found the RDEPENDS update instead.<br>
</div></blockquote>
<br>
<br>
because : those tow packages used rc.d. so we only need to install them<br>
<br>
inherit autotools update-rc.d<br>
<br>
INITSCRIPT_PACKAGES =3D &quot;${PN}-switch ${PN}-controller&quot;<br>
INITSCRIPT_NAME_${PN}-switch =3D &quot;openvswitch-switch&quot;<br>
INITSCRIPT_PARAMS_${PN}-switch =3D &quot;defaults 71&quot;<br>
<br>
INITSCRIPT_NAME_${PN}-<u></u>controller =3D &quot;openvswitch-controller&qu=
ot;<br>
INITSCRIPT_PARAMS_${PN}-<u></u>controller =3D &quot;defaults 72&quot;<br>
<br>
<br></blockquote><div><br></div><div style>Exactly, that&#39;s what I saw w=
hen I checked .. but it&#39;s worth being clear in the</div><div style>mess=
age.</div><div style><br></div><div style>Bruce</div><div>=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">

I will send V2 tomorrow<br>
<br>
LeI<br>
<br>
<br>
<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">
=A0 =A0 Since openvswtich depends on openvswtich module,so auto load the<br=
>
=A0 =A0 kernel module too.<br>
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
<br>
<br>
This looks fine. I double checked that the vswitch kernel fragment enables =
the module,<br>
so our autoload is fine.<br>
<br>
Bruce<br>
<br>
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
=A0 =A0 ______________________________<u></u>_________________<br>
=A0 =A0 meta-virtualization mailing list<br>
=A0 =A0 <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_=
blank">meta-virtualization@<u></u>yoctoproject.org</a><br></div>
=A0 =A0 &lt;mailto:<a href=3D"mailto:meta-virtualization@yoctoproject.org" =
target=3D"_blank">meta-virtualization@<u></u>yoctoproject.org</a>&gt;<div c=
lass=3D"im"><br>
=A0 =A0 <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualizat=
ion" target=3D"_blank">https://lists.yoctoproject.<u></u>org/listinfo/meta-=
<u></u>virtualization</a><br>
<br>
<br>
<br>
<br>
-- <br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;<br>
<br>
<br></div><div class=3D"im">
On Mon, Jan 28, 2013 at 6:01 AM, &lt;<a href=3D"mailto:lei.yang@windriver.c=
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
=A0 =A0 This is becasue openvswitch isn&#39;t running,so we&#39;d better st=
art it<br>
=A0 =A0 at the boot time.<br>
=A0 =A0 Since openvswtich depends on openvswtich module,so auto load the<br=
>
=A0 =A0 kernel module too.<br>
<br>
=A0 =A0 Signed-off-by: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.co=
m" target=3D"_blank">lei.yang@windriver.com</a><br></div>
=A0 =A0 &lt;mailto:<a href=3D"mailto:lei.yang@windriver.com" target=3D"_bla=
nk">lei.yang@windriver.com</a><u></u>&gt;&gt;<br>
=A0 =A0 Tested-by: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com" t=
arget=3D"_blank">lei.yang@windriver.com</a><br>
=A0 =A0 &lt;mailto:<a href=3D"mailto:lei.yang@windriver.com" target=3D"_bla=
nk">lei.yang@windriver.com</a><u></u>&gt;&gt;<div class=3D"im"><br>
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
=A0 =A0 ______________________________<u></u>_________________<br>
=A0 =A0 meta-virtualization mailing list<br>
=A0 =A0 <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_=
blank">meta-virtualization@<u></u>yoctoproject.org</a><br></div>
=A0 =A0 &lt;mailto:<a href=3D"mailto:meta-virtualization@yoctoproject.org" =
target=3D"_blank">meta-virtualization@<u></u>yoctoproject.org</a>&gt;<div c=
lass=3D"im"><br>
=A0 =A0 <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualizat=
ion" target=3D"_blank">https://lists.yoctoproject.<u></u>org/listinfo/meta-=
<u></u>virtualization</a><br>
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

--e89a8ff1ca38f55c3b04d4702215--
