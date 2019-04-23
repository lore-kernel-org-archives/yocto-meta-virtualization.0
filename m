Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6F8BE00B81; Tue, 23 Apr 2019 13:03:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.44 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B88CE0033D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Apr 2019 13:03:02 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id o16so1885800lfl.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Apr 2019 13:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q1qcXB2Fx1jP8urKtG3irRylI02HIW+23RaB5vI5FdQ=;
	b=vR01ajkVWVI4KTfAHwOoBJ4omx6jX0HP12HaQ+LdfrfZSVfVf1suf+xB226vF6H8up
	QKilj1vAJUAesDrw979ZQabVxUYDNUyXh5JSGjqmvYDxSlhlL3LZsATCzdy0JghAWWca
	5Kt0rqLE1/6GkbXNocKAFZ+/7Sox/d4fQ4Xf3Qh62mnIGvfuEMkXFFTpQWeC5TTygEN3
	rHuj3NjPjcdZEtGn+y0utKgCzqbVVlfWStGfLsXjP0sXCgDon0pNVUDeCPtAZuO38JXS
	N/VtHnk4zWd3ExOa/X/NbZdJwmTA0hOerzveNf24YIeNOjNHt8/Kk2WrxIWR3U13odnq
	WOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q1qcXB2Fx1jP8urKtG3irRylI02HIW+23RaB5vI5FdQ=;
	b=Wnl+wUTIh85gM1Sw+7I5R1Y8MD2IoGYcYQApeI4zyc4Z0a4d+vBriEB1wtuRzOStVz
	+Z1vA2JHUMgNygqpPgMJgC/pTB3zoGXuOjB80DLFB10kEIazONVtyw1dAMMewTE7YpmS
	FuNwLdd3396aMzS+5mI2Mr77B1dPa2PEfHRgxQqISpQQZbp1TwBWxDvvn0mBOSPq3VD0
	Ns2RQnveFtgzqY9/1aGI0FIY5TKy5W3aailvyyOneo4peuUrXnewqvqV9TalODfOUxbe
	jiA9lk+rL/yg60OWQBQn6KfNefiQxMapr5Iu5GUQNXgFCMQpnW1hRDri51hsj7nh65EJ
	vjyg==
X-Gm-Message-State: APjAAAWw7AhCgUwfEMgPZ0XaB7IrYsjQiaQGRyrHruYH/PviPMJtHLeH
	RLTDiQ5PixumRr+84toD4N065Tx/N1KK/gqtIec=
X-Google-Smtp-Source: APXvYqyjpYbP8wghiItvtY3bHxdtzZ5lzhE5GyBwqdEHTC1Po25zG/GI1bA9MKDKZbHGN8GEXEWzl2IWzac3RauPWNE=
X-Received: by 2002:a19:1949:: with SMTP id 70mr6927119lfz.103.1556049781070; 
	Tue, 23 Apr 2019 13:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <1555633569-13203-1-git-send-email-yi.zhao@windriver.com>
In-Reply-To: <1555633569-13203-1-git-send-email-yi.zhao@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 Apr 2019 16:02:50 -0400
Message-ID: <CADkTA4N=HFb_97WdfvNyjLFP-yi=sds0W1G_TfcW9Dj3Pk5tDg@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] apache2: remove bbappend
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
X-List-Received-Date: Tue, 23 Apr 2019 20:03:03 -0000
Content-Type: multipart/alternative; boundary="0000000000007421e60587381218"

--0000000000007421e60587381218
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Apr 18, 2019 at 8:26 PM Yi Zhao <yi.zhao@windriver.com> wrote:

> The apache2 in meta-webserver has been upgraded to 2.4.39. This bbappend
> has been integrated into apache2 recipe. So remove it.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../recipes-httpd/apache2/apache2_2.4.%.bbappend           | 14
> --------------
>  1 file changed, 14 deletions(-)
>  delete mode 100644
> meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend
>
> diff --git a/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend
> b/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend
> deleted file mode 100644
> index 5fc832d..0000000
> --- a/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -do_install_append() {
> -    sed -i -e 's/#ServerName.*$/ServerName 127.0.0.1:80/'
> ${D}${sysconfdir}/apache2/httpd.conf
> -    # Keep our logs together, also matches ubuntu and debian
> -    sed -i -e 's@^\(.*\)/var/apache2/logs\(.*\)$@\1/var/log/apache2\2@g'
> ${D}${sysconfdir}/apache2/httpd.conf
> -
> -    # default layout for htdocsdir in 2.4.7 is different, create the
> following for
> -    # backward compatibility reasons
> -
> -    mkdir -p ${D}${datadir}/${BPN}/default-site
> -    ln -sf ../htdocs ${D}${datadir}/${BPN}/default-site/htdocs
> -}
> -
> -FILES_${PN} += "${datadir}/${BPN}/default-site"
> -SYSTEMD_AUTO_ENABLE_${PN} = "enable"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000007421e60587381218
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, A=
pr 18, 2019 at 8:26 PM Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com"=
>yi.zhao@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">The apache2 in meta-webserver has been upgraded to 2.=
4.39. This bbappend<br>
has been integrated into apache2 recipe. So remove it.<br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-httpd/apache2/apache2_2.4.%.bbappend=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 14 --------------<br>
=C2=A01 file changed, 14 deletions(-)<br>
=C2=A0delete mode 100644 meta-openstack/recipes-httpd/apache2/apache2_2.4.%=
.bbappend<br>
<br>
diff --git a/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend b/=
meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend<br>
deleted file mode 100644<br>
index 5fc832d..0000000<br>
--- a/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend<br>
+++ /dev/null<br>
@@ -1,14 +0,0 @@<br>
-do_install_append() {<br>
-=C2=A0 =C2=A0 sed -i -e &#39;s/#ServerName.*$/ServerName <a href=3D"http:/=
/127.0.0.1:80/" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:80/</a>&#39;=
 ${D}${sysconfdir}/apache2/httpd.conf<br>
-=C2=A0 =C2=A0 # Keep our logs together, also matches ubuntu and debian<br>
-=C2=A0 =C2=A0 sed -i -e &#39;s@^\(.*\)/var/apache2/logs\(.*\)$@\1/var/log/=
apache2\2@g&#39; ${D}${sysconfdir}/apache2/httpd.conf<br>
-<br>
-=C2=A0 =C2=A0 # default layout for htdocsdir in 2.4.7 is different, create=
 the following for<br>
-=C2=A0 =C2=A0 # backward compatibility reasons<br>
-<br>
-=C2=A0 =C2=A0 mkdir -p ${D}${datadir}/${BPN}/default-site<br>
-=C2=A0 =C2=A0 ln -sf ../htdocs ${D}${datadir}/${BPN}/default-site/htdocs<b=
r>
-}<br>
-<br>
-FILES_${PN} +=3D &quot;${datadir}/${BPN}/default-site&quot;<br>
-SYSTEMD_AUTO_ENABLE_${PN} =3D &quot;enable&quot;<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--0000000000007421e60587381218--
