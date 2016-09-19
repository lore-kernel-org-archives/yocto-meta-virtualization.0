Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5AE8E007A2; Mon, 19 Sep 2016 13:04:55 -0700 (PDT)
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
	*      [209.85.216.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B767E00724
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 13:04:54 -0700 (PDT)
Received: by mail-qt0-f177.google.com with SMTP id 11so77649343qtc.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 13:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C4UssfBWEnzP3WQg81hZ14rwfHrOErqmfeenYOQLkjY=;
	b=EHJLBIHzF7s9UJ+xp6dF1U7h74oHAaBc6KvoFGePpPze/+V98tMubKYCyKcFFTAgBv
	CkYo6tFISJoDwQNXChsFfwPViG0VLc3V7wJQtQh0Q7ysrgRiuW67MgafnWgnY2lUtsjq
	Y5yceKL6fyGmqRh1dTL+6mzAGgE5wtm8BTMbj1WsvlZyr/B2muw+Z/nfr4winYUkLRBh
	vE/FCD81HR8w+VS2lMuqsEPsWLX7i0DFaWe7WLKMFUWdyYR5V4Y4/rHv+W51nLIwIRFX
	ooDN5aDSZ/6cg2y8rVUHklr4AoSooUB6iZXBk28wVuYwXpqqq3+4WXinsdq4t7lvPGF2
	zO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C4UssfBWEnzP3WQg81hZ14rwfHrOErqmfeenYOQLkjY=;
	b=hiRezxyGxToR1gKM3Cp20qyjWABlQCrH6tufAfMctTIPPuMwm4SJv0AKitSvdA0j1Y
	gV+iDWUIWOJfUl9MzaVncZ8MnBnixLGQWHR9nA5laoC2ulPFqTQtdX4wIwf1YkjvO84R
	rTQx2vGcAag7/4PgZ6wnup9gRjskxA6IWBgirW+gYUklgqPQo4WtOo30ccuHj7MEmIOu
	k9Pw7TJssoE2ZhuqzX6rh7s6/iBmajwaiM3y++eT5yBqjFUIcncXYD2jFN0bQgX9t+Cs
	8UefiykVhWEe2gsA7vJU1yURrkBQBZV1F2yKWf7OjoYZCpvkf0UnSoi29h+Z6TE4qxiX
	4fkA==
X-Gm-Message-State: AE9vXwNdGiUbzxj/6w3TXdv3+2vqh1fMOHK53dPWxi9GGiifFvI04ZpCUBAsrxxDYAQ8I+sWnQ3Ct03Tq1VoYA==
X-Received: by 10.200.45.153 with SMTP id p25mr32315707qta.32.1474315493508;
	Mon, 19 Sep 2016 13:04:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.38.166 with HTTP; Mon, 19 Sep 2016 13:04:52 -0700 (PDT)
In-Reply-To: <1474272577-38176-1-git-send-email-adrian.dudau@enea.com>
References: <1474272577-38176-1-git-send-email-adrian.dudau@enea.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 19 Sep 2016 16:04:52 -0400
Message-ID: <CADkTA4P=7NXu-8w5o0bWPYfnba+0pAdamEdLyDs6k4U73rJNig@mail.gmail.com>
To: Adrian Dudau <adrian.dudau@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] identity.bbclass: Enforce octal literal representation in os.chmod
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
X-List-Received-Date: Mon, 19 Sep 2016 20:04:55 -0000
Content-Type: multipart/alternative; boundary=001a11394376471116053ce1d35f

--001a11394376471116053ce1d35f
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Mon, Sep 19, 2016 at 4:09 AM, Adrian Dudau <adrian.dudau@enea.com> wrote:

> Python 3 changed to the explicit representation and throws errors
> otherwise.
>
> Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
> ---
>  meta-openstack/classes/monitor.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-openstack/classes/monitor.bbclass
> b/meta-openstack/classes/monitor.bbclass
> index 83aaea2..a959f09 100644
> --- a/meta-openstack/classes/monitor.bbclass
> +++ b/meta-openstack/classes/monitor.bbclass
> @@ -19,7 +19,8 @@ def copy_check_files(d, check_var_name, src, dest):
>          for check in mon_checks.split():
>              if os.path.exists(src + "/" + check):
>                  shutil.copy(src + "/" + check, dest)
> -                os.chmod(dest + "/" + check, 0755)
> +                os.chmod(dest + "/" + check, 0o755)
> +
>
>  python do_monitor_install() {
>      import shutil
> --
> 1.9.1
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

--001a11394376471116053ce1d35f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Mon, Sep 19, 2016 at 4:09 AM, A=
drian Dudau <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.dudau@enea.com" =
target=3D"_blank">adrian.dudau@enea.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Python 3 changed to the explicit representation and th=
rows errors<br>
otherwise.<br>
<br>
Signed-off-by: Adrian Dudau &lt;<a href=3D"mailto:adrian.dudau@enea.com">ad=
rian.dudau@enea.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/classes/<wbr>monitor.bbclass | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-openstack/classes/<wbr>monitor.bbclass b/meta-openstack/c=
lasses/<wbr>monitor.bbclass<br>
index 83aaea2..a959f09 100644<br>
--- a/meta-openstack/classes/<wbr>monitor.bbclass<br>
+++ b/meta-openstack/classes/<wbr>monitor.bbclass<br>
@@ -19,7 +19,8 @@ def copy_check_files(d, check_var_name, src, dest):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for check in mon_checks.split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(src + &qu=
ot;/&quot; + check):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copy(s=
rc + &quot;/&quot; + check, dest)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(dest + &q=
uot;/&quot; + check, 0755)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(dest + &q=
uot;/&quot; + check, 0o755)<br>
+<br>
<br>
=C2=A0python do_monitor_install() {<br>
=C2=A0 =C2=A0 =C2=A0import shutil<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--001a11394376471116053ce1d35f--
