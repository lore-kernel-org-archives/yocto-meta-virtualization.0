Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B27EDE00720; Mon, 19 Sep 2016 13:04:43 -0700 (PDT)
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
	*      [209.85.216.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40052E006B3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 13:04:40 -0700 (PDT)
Received: by mail-qt0-f176.google.com with SMTP id 38so77702743qte.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 13:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UmPd5A5ThkPM9v/Y+4CT6JXt6Eh7wKSZ4bh9hEQEhuE=;
	b=M06epiGWT2CZOuomHETcju8EzmO0nSPqy0wdZCdeIKYKhud5N1EClKR+0axm3hwaAC
	iAlaXmCVLZssOiV6gnOYGuDTn3M23tV3fUK4ZlH4P/+Rdi1QqW6UTFp69d87PyZohaDb
	OS1+EXRLksb6VnCR4Rf2yc2NxaVof6AKWWqwQTDlR5ELz0qXgKAh2RqWw8XeUMQe6EUi
	HpIOWW+p7KHWCPDiTfXLczOXKCOb2dmM7g5ApjpXCP4Y9KXx5aBcyKwHV4d8c1O83utb
	PWxJUrMthtNbpn3BinWPXjo9euFkOUwVQzKrhCjW5Gx7VRXuDU0L2rN9adpJNGoB/NWL
	7OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UmPd5A5ThkPM9v/Y+4CT6JXt6Eh7wKSZ4bh9hEQEhuE=;
	b=Azfpm8NvieTQuHreaU/r8R6t/oth5LEEiKloBlGIttCtLYU5hXHhzB0y5v87Obnnla
	Y59L9gC5nIiW8/t3+w8g5KV2qTjwZw5qWTb8mNSTY1X5+QZJMsNVye9kZV/LK4+ycDHY
	8BfimGw15JCIC/O6HAjyUSsyFgCDUD7D2pZ0Lpu1lvmrJTtVKrfPy/Ym+REWhTI/QN9Z
	zQjI7+3/P0N/eQYknZpxbLkyrSDVlwemP10EO2gge6i3KeAnUwj31ATVlnd0ZQ3uF4YM
	+S7fuGE2dSX2bgIsxIL6lZ1qJRx0hGwpm2dXw2hwkVrOw7xscMlONqKQIHEf1rwIZzJ8
	f1pA==
X-Gm-Message-State: AE9vXwNYj1G5y1tf04kIospYPA8mYfaNi+V9FvTxvLIBhMGY5riuehkmeZ0qh2Dgq9M3nz9gL4wQKd/5sc1q3Q==
X-Received: by 10.200.49.81 with SMTP id h17mr31688883qtb.48.1474315480112;
	Mon, 19 Sep 2016 13:04:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.38.166 with HTTP; Mon, 19 Sep 2016 13:04:39 -0700 (PDT)
In-Reply-To: <1474035149-23539-1-git-send-email-adrian.dudau@enea.com>
References: <1474035149-23539-1-git-send-email-adrian.dudau@enea.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 19 Sep 2016 16:04:39 -0400
Message-ID: <CADkTA4OZ9ymTK7_3DJn+ZaFP-6QzBL4X0Kqm10AT5DpLSywjHQ@mail.gmail.com>
To: Adrian Dudau <adrian.dudau@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] openstackchef_inc.bbclass: Update python synthax for except
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
X-List-Received-Date: Mon, 19 Sep 2016 20:04:43 -0000
Content-Type: multipart/alternative; boundary=001a113a7cd67aa567053ce1d207

--001a113a7cd67aa567053ce1d207
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Fri, Sep 16, 2016 at 10:12 AM, Adrian Dudau <adrian.dudau@enea.com>
wrote:

> The synthax used is deprecated and causes errors.
>
> Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
> ---
>  meta-openstack/classes/openstackchef_inc.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/classes/openstackchef_inc.bbclass
> b/meta-openstack/classes/openstackchef_inc.bbclass
> index b8757be..048fce6 100644
> --- a/meta-openstack/classes/openstackchef_inc.bbclass
> +++ b/meta-openstack/classes/openstackchef_inc.bbclass
> @@ -248,7 +248,7 @@ def deploychef_make_startup_shutdown_list(d):
>                      raise bb.build.FuncFailed(msg)
>              hStartup.close()
>              hShutdown.close()
> -        except IOError, e:
> +        except IOError as e:
>              bb.error("Error opening startup/shutdown files %s %s,  %s %s"
> % \
>              (startup_file, shutdown_file, d.getVar('FILE'), e))
>      else:
> @@ -381,7 +381,7 @@ def deploychef_make_templates( d, conf_tuple=tuple()):
>                          deploychef_make_substitutions(d, sub_dict,
> attr_file, file_name)
>                      else:
>                          bb.build.FuncFailed(msg)
> -        except IOError, e:
> +        except IOError as e:
>              bb.error("Could not write to attribute file %s: in %s,  %s" %
> \
>              (attr_file, d.getVar('FILE'), e))
>
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

--001a113a7cd67aa567053ce1d207
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Fri, Sep 16, 2016 at 10:12 AM, =
Adrian Dudau <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.dudau@enea.com"=
 target=3D"_blank">adrian.dudau@enea.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">The synthax used is deprecated and causes errors.<br>
<br>
Signed-off-by: Adrian Dudau &lt;<a href=3D"mailto:adrian.dudau@enea.com">ad=
rian.dudau@enea.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/classes/<wbr>openstackchef_inc.bbclass | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-openstack/classes/<wbr>openstackchef_inc.bbclass b/meta-o=
penstack/classes/<wbr>openstackchef_inc.bbclass<br>
index b8757be..048fce6 100644<br>
--- a/meta-openstack/classes/<wbr>openstackchef_inc.bbclass<br>
+++ b/meta-openstack/classes/<wbr>openstackchef_inc.bbclass<br>
@@ -248,7 +248,7 @@ def deploychef_make_startup_<wbr>shutdown_list(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0raise bb.build.FuncFailed(msg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hStartup.close()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hShutdown.close()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 except IOError, e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except IOError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error(&quot;Error openin=
g startup/shutdown files %s %s,=C2=A0 %s %s&quot; % \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(startup_file, shutdown_fil=
e, d.getVar(&#39;FILE&#39;), e))<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
@@ -381,7 +381,7 @@ def deploychef_make_templates( d, conf_tuple=3Dtuple())=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0deploychef_make_substitutions(<wbr>d, sub_dict, attr_file,=
 file_name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bb.build.FuncFailed(msg)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 except IOError, e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except IOError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error(&quot;Could not wr=
ite to attribute file %s: in %s,=C2=A0 %s&quot; % \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(attr_file, d.getVar(&#39;F=
ILE&#39;), e))<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
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

--001a113a7cd67aa567053ce1d207--
