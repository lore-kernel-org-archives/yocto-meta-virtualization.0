Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37956E00ED0; Thu,  8 Mar 2018 18:09:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CFCAE00DA5
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Mar 2018 18:09:44 -0800 (PST)
Received: by mail-qt0-f182.google.com with SMTP id t6so9143003qtn.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 08 Mar 2018 18:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0svGuBj3dukGdqJTlKNrxQfhPhyKi2uEvHRgg6xapEM=;
	b=RGJC/Ha0u28U66OEIL63niyk1wmCJ4vamauPYwCzbPlmzkvwPxa4GC3pmnUeLTD1Bi
	ZGeq4Xyn9pxWMF0HeVIYjI1STuHVFnGwaZ8NS9uWHi6qJ0w3xcAW58N7AhGW6c1Bj6Gj
	CpLhOPFtRztAR1i6AjomUzhtZNFaCYSVVjd4WZQ8rGFhElV6F1JQrUlNwuJUJEB3Efdi
	iTPTLwyYGtuMNS/ImZMkitr0t65gRO4n6GaJ7KyYFFZA6QCHXwQTQRdu19y9c4O9TxPe
	rr/a77Psp6nfDXgIEuYQmsxbwLZlBeEH+lDHYuRwU//gZ5OXZf1x/dW2gdVdFHSiYHUT
	CLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0svGuBj3dukGdqJTlKNrxQfhPhyKi2uEvHRgg6xapEM=;
	b=Sx8p72GwfFQvQpo/qkuBHSirZdaAtK0uUxaAlUdVCkLfnUP2sjrzXaZKdYBqYlpxn2
	UW348NV5I4MxpOVpb1ZUAktqtk2i5xs2/hfm6PWKeVYqqNFdP92RoaQjxsnX8yV4chcw
	dN4x6+re9Rti8lIAFlkiquvSIBR0dice1uyoZwaFvGOIwSUZ+Bk1Ekz1ek6HJATnseRU
	+dCL1HI5rIFFl5DcHsGD2MRumv4hiH5OdAM5vJPBAuC4w0njDgi4VU4/W2xBProGmRx7
	GxFyVBVCGrGWEaamDz6zFIUzem/IcrRUxqIWI1P8EIGzMPqtReKfP9mTPxOb1OjZAAtn
	MZkg==
X-Gm-Message-State: AElRT7FiXcZTFhfng5Zp+Wqh/bWwr6qqGabBiYE9Md4bbeGwf8KE6DV1
	T3WjZRLNnt7j1oIEEDA4KJ3l4kaZrCTYcMy2ass=
X-Google-Smtp-Source: AG47ELu2gI5S1+e8IdsAfG3kCHaeODWVAQVnLYV9kkFzwiac5XW31DAt+CpKJrwgmNp79rZYWTITPvOtuwajY2hGJZU=
X-Received: by 10.237.38.229 with SMTP id q92mr43494482qtd.294.1520561384055; 
	Thu, 08 Mar 2018 18:09:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.178 with HTTP; Thu, 8 Mar 2018 18:09:43 -0800 (PST)
In-Reply-To: <CADkTA4PBpA5d4zg0XgChtcmzaGSSso+gDro9QfO+WKk3propzQ@mail.gmail.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
	<CADkTA4PBpA5d4zg0XgChtcmzaGSSso+gDro9QfO+WKk3propzQ@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 8 Mar 2018 18:09:43 -0800
Message-ID: <CACMJ4GZMBTKvjYNLLqm_-pY5XzTZMWAT==zPskxPxbkkrju+Bg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org,
	Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Subject: Re: [PATCH 0/7] Xen vTPM stubdomains
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
X-List-Received-Date: Fri, 09 Mar 2018 02:09:46 -0000
Content-Type: multipart/alternative; boundary="94eb2c0bb94e27e8210566f149a4"

--94eb2c0bb94e27e8210566f149a4
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 8, 2018 at 12:58 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Mon, Mar 5, 2018 at 10:35 AM, Kurt Bodiker
> <kurt.bodiker@braintrust-us.com> wrote:
> > This patchset introduces the basic recipes necessary to build Xen
> > stubdomains, in particular the vTPM and vTPM Manager stubdomains. vTPM
> > stubdomains provide Xen guest domains access to a virtualized TPM. The
> > vTPM Manager stubdomain manages each of the vTPM domains and seals them
> > to the physical TPM. The intention of this patchset is to provide the
> > ability to build Xen stubdomains separately from the rest of the Xen
> > components since the stubdomains have separate dependencies that are
> > hard-coded within the Xen build and configuration files.  Separating the
> > stubdomain recipes and dependencies from the rest of the Xen build gives
> > the ability to use newer or different libraries than what is currently
> > used.
> >
> > The stubdom.inc file defines a set of CPPFLAGS, CFLAGS, and LDFLAGS
> > common for building all Xen stubdomains. Xen stubdomains are
> > cross-compiled with the MiniOS, which creates some issues when trying to
> > compile stubdomains in an OpenEmbedded environment. To address these
> > issues and to ensure the stubdoms are built as Xen had intended, all of
> > the build flags and build tools that are exported into the environment
> > by OE have been unset. Each of the new recipes introduced here then
> > implements the build flags and the tools as though the build had been
> > run in the bare-metal environment.
> >
> > Xen vTPM stubdomains have depencencies on static libraries for newlib,
> > polarssl, gmp, and tpm emulator. Xen vTPM Manager stubdomain has
> > dependencies on static libraries for newlib and polarssl.
> >
> > The newlib, polarssl, gmp, and tpm emulator recipes are constructed to
> > behave the same as a bare-metal build. These recipes are cross-compiled
> > against both the Xen and MiniOS source code.
> >
> > The xen-vtpm recipe is responsible for building and installing the vTPM
> > and vTPM Manager stubdomain images into the Xen boot directory. xen-vtpm
> > would need to be added to DISTRO_FEATURES the similar for what is done
> > for Xen.
>
> I don't have any major issues with the series, I'll wait another day
> or so to see
> if there are any comments, and will merge it after that.
>


I'm supportive of this work going into meta-virtualization.

The recipes are well-structured, clear, commented and comprehensible. The
components of the stubdom are built with individual OE recipes, which is
good, and much preferred over driving a single build with the monolithic
upstream Makefile: it will make it easier to work with the individual
recipes to upgrade component versions in a standard OE manner.

Location of recipe files:
This series introduces many recipes into recipes-extended/xen. I think that
is fair and appropriate to locate them there - they are the set of external
components and versions specified in the Xen stubdom code base, they are
built to be deployed in conjunction with the Xen binaries, and it makes
sense to co-locate them.

README:
It think it would helpful to add some introduction text to
recipes-extended/xen/README to explain that the recipes for these
components are there because they are the software specified in the
upstream Xen stubdom tree, and also include some of the text from this
series's cover letter -- in particular noting that the build for these
recipes will proceed with the host machine's compiler and build tools, not
those of OE native due to the minios cross-compile challenges.

Christopher

--94eb2c0bb94e27e8210566f149a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Thu, Mar 8, 2018 at 12:58 PM, Bruce Ashfield <span dir=
=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">=
bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Mon, Mar 5, 2018 at 10:35 =
AM, Kurt Bodiker<br>
&lt;<a href=3D"mailto:kurt.bodiker@braintrust-us.com">kurt.bodiker@braintru=
st-us.<wbr>com</a>&gt; wrote:<br>
&gt; This patchset introduces the basic recipes necessary to build Xen<br>
&gt; stubdomains, in particular the vTPM and vTPM Manager stubdomains. vTPM=
<br>
&gt; stubdomains provide Xen guest domains access to a virtualized TPM. The=
<br>
&gt; vTPM Manager stubdomain manages each of the vTPM domains and seals the=
m<br>
&gt; to the physical TPM. The intention of this patchset is to provide the<=
br>
&gt; ability to build Xen stubdomains separately from the rest of the Xen<b=
r>
&gt; components since the stubdomains have separate dependencies that are<b=
r>
&gt; hard-coded within the Xen build and configuration files.=C2=A0 Separat=
ing the<br>
&gt; stubdomain recipes and dependencies from the rest of the Xen build giv=
es<br>
&gt; the ability to use newer or different libraries than what is currently=
<br>
&gt; used.<br>
&gt;<br>
&gt; The stubdom.inc file defines a set of CPPFLAGS, CFLAGS, and LDFLAGS<br=
>
&gt; common for building all Xen stubdomains. Xen stubdomains are<br>
&gt; cross-compiled with the MiniOS, which creates some issues when trying =
to<br>
&gt; compile stubdomains in an OpenEmbedded environment. To address these<b=
r>
&gt; issues and to ensure the stubdoms are built as Xen had intended, all o=
f<br>
&gt; the build flags and build tools that are exported into the environment=
<br>
&gt; by OE have been unset. Each of the new recipes introduced here then<br=
>
&gt; implements the build flags and the tools as though the build had been<=
br>
&gt; run in the bare-metal environment.<br>
&gt;<br>
&gt; Xen vTPM stubdomains have depencencies on static libraries for newlib,=
<br>
&gt; polarssl, gmp, and tpm emulator. Xen vTPM Manager stubdomain has<br>
&gt; dependencies on static libraries for newlib and polarssl.<br>
&gt;<br>
&gt; The newlib, polarssl, gmp, and tpm emulator recipes are constructed to=
<br>
&gt; behave the same as a bare-metal build. These recipes are cross-compile=
d<br>
&gt; against both the Xen and MiniOS source code.<br>
&gt;<br>
&gt; The xen-vtpm recipe is responsible for building and installing the vTP=
M<br>
&gt; and vTPM Manager stubdomain images into the Xen boot directory. xen-vt=
pm<br>
&gt; would need to be added to DISTRO_FEATURES the similar for what is done=
<br>
&gt; for Xen.<br>
<br>
</div></div>I don&#39;t have any major issues with the series, I&#39;ll wai=
t another day<br>
or so to see<br>
if there are any comments, and will merge it after that.<br></blockquote><d=
iv><br></div><div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;tex=
t-decoration-style:initial;text-decoration-color:initial"><br class=3D"gmai=
l-Apple-interchange-newline">I&#39;m supportive of this work going into met=
a-virtualization.</div><div style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;text-decoration-style:initial;text-decoration-color:initial"><br></div><d=
iv style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:smal=
l;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;text-decoration-style:i=
nitial;text-decoration-color:initial">The recipes are well-structured, clea=
r, commented and comprehensible. The components of the stubdom are built wi=
th individual OE recipes, which is good, and much preferred over driving a =
single build with the monolithic upstream Makefile: it will make it easier =
to work with the individual recipes to upgrade component versions in a stan=
dard OE manner.</div><div style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
text-decoration-style:initial;text-decoration-color:initial"><br></div><div=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;text-decoration-style:ini=
tial;text-decoration-color:initial">Location of recipe files:</div><div sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;text-decoration-style:initial=
;text-decoration-color:initial">This series introduces many recipes into re=
cipes-extended/xen. I think that is fair and appropriate to locate them the=
re - they are the set of external components and versions specified in the =
Xen stubdom code base, they are built to be deployed in conjunction with th=
e Xen binaries, and it makes sense to co-locate them.</div><div style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;text-decoration-style:initial;text-de=
coration-color:initial"><br></div><div style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;text-decoration-style:initial;text-decoration-color:initial">R=
EADME:</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:small;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-deco=
ration-style:initial;text-decoration-color:initial">It think it would helpf=
ul to add some introduction text to recipes-extended/xen/README to explain =
that the recipes for these components are there because they are the softwa=
re specified in the upstream Xen stubdom tree, and also include some of the=
 text from this series&#39;s cover letter -- in particular noting that the =
build for these recipes will proceed with the host machine&#39;s compiler a=
nd build tools, not those of OE native due to the minios cross-compile chal=
lenges.</div><br class=3D"gmail-Apple-interchange-newline">Christopher</div=
></div></div></div>

--94eb2c0bb94e27e8210566f149a4--
