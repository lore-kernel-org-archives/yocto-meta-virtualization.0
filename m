Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DABE7E00720; Mon, 19 Sep 2016 13:03:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.196 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E4FEE006E9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 13:03:24 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id b204so10504157qkc.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 13:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MNz9rpLeR2C/vO6LhayBoPAdo6gR5dPpFC0d9RliE/U=;
	b=l9UNZhTs5m4gssEM8+LrxyQsL1fmanWgFjqJoWkI9uN5kAldrAZFVOqbR8JeiTlpIo
	0+BxDU7nl6R2uHq4gOMvFq7iI20dkaXtideOC5nMyMuEmG6ss98QclXtbS+/Zv47bBhE
	WLApyRCGFqBXH650QDmiwFw6MEfPHaupH8xn4AWyisDQ7bzAx/AkafFuzgAJIxxukXgg
	qCQUAa2cfMNmrk2KtvLUXERXlNv8Axakq1QkdZdplhugMPURXle4XUg1PuJcXuRrA1/u
	h7UiY6j/VSFvK4nMoIWRuCc4ivovx3S5FcjcN6BScVYt8pUvB/KNtLORoM3qI7DkKXzf
	LOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MNz9rpLeR2C/vO6LhayBoPAdo6gR5dPpFC0d9RliE/U=;
	b=HkPQqZYPy4z/KobpPXBZ3tI/RWYIUvs3ODMnUiKQXAs6IVyTxgXx2q6nzAp6Xg4hRz
	TOEHA0JmXlgHKMHyW0EojcaVNHJuK3hj5/HEbEAvBnqvZC9ReiwG9yKXPIHNW10ryJt0
	h6tlR3fz1CMkPGoQwnvrkm9KWuXIoa+81QJQpZ0N8QAJiA+i75bIfaRAmtlNRyCVKzvF
	t+m37s8x2O64pB9BUa3zHn7760ja4MKutjVp7oBGgn/zQU1MdY5eYqjlJEEuAWRiZ1KO
	VLRCcMM+DPuXRjAz8Hu7hnwQK8GdVwZ505KVPxhmDmhshmc5s/d2c2G9A45aH9m63DT9
	5uuA==
X-Gm-Message-State: AE9vXwO7fVzcxrk5Eutf5V/0DOzLHdtrC4qOSbeyYaA/NKfzqlvezv/MBSe02PKDQIxiiMqjwMxddKcZCp2jeQ==
X-Received: by 10.55.192.24 with SMTP id o24mr31442689qki.113.1474315403683;
	Mon, 19 Sep 2016 13:03:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.38.166 with HTTP; Mon, 19 Sep 2016 13:03:23 -0700 (PDT)
In-Reply-To: <1473831088-3555-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <1473831088-3555-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 19 Sep 2016 16:03:23 -0400
Message-ID: <CADkTA4NdwHjt4fLE5tBnnm98eUJM94EruBiSBiBJxiFQj7oy_Q@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-eventlet: 0.17.4 -> 0.18.4
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
X-List-Received-Date: Mon, 19 Sep 2016 20:03:26 -0000
Content-Type: multipart/alternative; boundary=001a113c7066ec9d52053ce1cd1f

--001a113c7066ec9d52053ce1cd1f
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Sep 14, 2016 at 1:31 AM, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> Upgrade python-eventlet from 0.17.4 to 0.18.4.
>
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-eventlet_0.17.4.bb => python-eventlet_0.18.4.bb}   |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-eventlet_0.17.4.bb
> => python-eventlet_0.18.4.bb} (73%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> eventlet_0.17.4.bb b/meta-openstack/recipes-devtools/python/python-
> eventlet_0.18.4.bb
> similarity index 73%
> rename from meta-openstack/recipes-devtools/python/python-
> eventlet_0.17.4.bb
> rename to meta-openstack/recipes-devtools/python/python-eventlet_0.18.4.bb
> index 32494e1..8c5e904 100644
> --- a/meta-openstack/recipes-devtools/python/python-eventlet_0.17.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.18.4.bb
> @@ -8,8 +8,8 @@ SRCNAME = "eventlet"
>
>  SRC_URI = "http://pypi.python.org/packages/source/e/${SRCNAME}/$
> {SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "fea0993b14cc7322f944bdd535c4f24a"
> -SRC_URI[sha256sum] = "8721e9714eaff8d20f2407e0d3a800
> 69db6b57c9226c26ee9db25c541d06556d"
> +SRC_URI[md5sum] = "8d1c646d8cc10a4958c92fe8a30f3676"
> +SRC_URI[sha256sum] = "74ef11d67ee5e85e009b0fced733c9
> 07620bca1ab8e6b0489d9f247405ab2685"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113c7066ec9d52053ce1cd1f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Wed, Sep 14, 2016 at 1:31 AM, W=
ang Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:wangxin2015.fnst@cn.fujitsu=
.com" target=3D"_blank">wangxin2015.fnst@cn.fujitsu.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5=
">Upgrade python-eventlet from 0.17.4 to 0.18.4.<br>
<br>
Signed-off-by: Wang Xin &lt;<a href=3D"mailto:wangxin2015.fnst@cn.fujitsu.c=
om">wangxin2015.fnst@cn.fujitsu.<wbr>com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python-eventlet_0.17.4.bb" rel=3D"noref=
errer" target=3D"_blank">python-eventlet_0.<wbr>17.4.bb</a> =3D&gt; <a href=
=3D"http://python-eventlet_0.18.4.bb" rel=3D"noreferrer" target=3D"_blank">=
python-eventlet_0.18.4.bb</a>}=C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-<wbr>devtools/python/{<a href=3D"http:/=
/python-eventlet_0.17.4.bb" rel=3D"noreferrer" target=3D"_blank">python-<wb=
r>eventlet_0.17.4.bb</a> =3D&gt; <a href=3D"http://python-eventlet_0.18.4.b=
b" rel=3D"noreferrer" target=3D"_blank">python-eventlet_0.18.4.bb</a>} (73%=
)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-eventlet_0.17.4.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr=
>eventlet_0.17.4.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a hr=
ef=3D"http://python-eventlet_0.18.4.bb" rel=3D"noreferrer" target=3D"_blank=
">python-<wbr>eventlet_0.18.4.bb</a><br>
similarity index 73%<br>
rename from meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://p=
ython-eventlet_0.17.4.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>=
eventlet_0.17.4.bb</a><br>
rename to meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://pyt=
hon-eventlet_0.18.4.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>ev=
entlet_0.18.4.bb</a><br>
index 32494e1..8c5e904 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
eventlet_0.17.4.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>eventl=
et_0.17.4.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
eventlet_0.18.4.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>eventl=
et_0.18.4.bb</a><br>
@@ -8,8 +8,8 @@ SRCNAME =3D &quot;eventlet&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/e=
/${SRCNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">h=
ttp://pypi.python.org/<wbr>packages/source/e/${SRCNAME}/$<wbr>{SRCNAME}-${P=
V}.tar.gz</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>fea0993b14cc7322f944bdd535c4f2<wbr>4a&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>8721e9714eaff8d20f2407e0d3a800<wbr>69db6=
b57c9226c26ee9db25c541d06<wbr>556d&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>8d1c646d8cc10a4958c92fe8a30f36<wbr>76&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>74ef11d67ee5e85e009b0fced733c9<wbr>07620=
bca1ab8e6b0489d9f247405ab<wbr>2685&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<br>
--<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div>

--001a113c7066ec9d52053ce1cd1f--
