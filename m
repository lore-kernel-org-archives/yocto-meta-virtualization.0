Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.5842.1575858254229499080
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Dec 2019 18:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xB92ODHq001418
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 8 Dec 2019 18:24:13 -0800 (PST)
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.468.0; Sun, 8 Dec 2019
 18:24:12 -0800
Subject: Re: [meta-virtualization] [meta-selinux][PATCH] rename sed_4.2.2.bbappend to sed_4.%.bbappend
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <joe_macdonald@mentor.com>
References: <15DE9290A772E316.1382@lists.yoctoproject.org>
Message-ID: <cbf4a140-c92a-5fbd-c6ad-c21084481579@windriver.com>
Date: Mon, 9 Dec 2019 10:24:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <15DE9290A772E316.1382@lists.yoctoproject.org>
Content-Type: multipart/alternative;
	boundary="------------374674A6C10BA8E76FC62E98"
Content-Language: en-US

--------------374674A6C10BA8E76FC62E98
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/9/19 10:20 AM, hongxu wrote:
> Since upstream oe-core [bd40260cba sed: upgrade to 4.7],
> renme bbappend to match the new version
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   recipes-extended/sed/{sed_4.2.2.bbappend => sed_4.%.bbappend} | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename recipes-extended/sed/{sed_4.2.2.bbappend => sed_4.%.bbappend} (100%)
>
> diff --git a/recipes-extended/sed/sed_4.2.2.bbappend b/recipes-extended/sed/sed_4.%.bbappend
> similarity index 100%
> rename from recipes-extended/sed/sed_4.2.2.bbappend
> rename to recipes-extended/sed/sed_4.%.bbappend
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4840): https://lists.yoctoproject.org/g/meta-virtualization/message/4840
> Mute This Topic: https://lists.yoctoproject.org/mt/67785146/3617049
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [hongxu.jia@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-

Sorry for the wrong mailing list, please ignore the noise

//Hongxu


--------------374674A6C10BA8E76FC62E98
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 12/9/19 10:20 AM, hongxu wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:15DE9290A772E316.1382@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">Since upstream oe-core [bd40260cba sed: upgrade to 4.7],
renme bbappend to match the new version

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 recipes-extended/sed/{sed_4.2.2.bbappend =&gt; sed_4.%.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-extended/sed/{sed_4.2.2.bbappend =&gt; sed_4.%.bbappend} (100%)

diff --git a/recipes-extended/sed/sed_4.2.2.bbappend b/recipes-extended/sed/sed_4.%.bbappend
similarity index 100%
rename from recipes-extended/sed/sed_4.2.2.bbappend
rename to recipes-extended/sed/sed_4.%.bbappend
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.

View/Reply Online (#4840): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/4840">https://lists.yoctoproject.org/g/meta-virtualization/message/4840</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/67785146/3617049">https://lists.yoctoproject.org/mt/67785146/3617049</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>  [<a class="moz-txt-link-abbreviated" href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-
</pre>
    </blockquote>
    <p>Sorry for the wrong mailing list, please ignore the noise<br>
    </p>
    <p>//Hongxu<br>
    </p>
  </body>
</html>

--------------374674A6C10BA8E76FC62E98--
