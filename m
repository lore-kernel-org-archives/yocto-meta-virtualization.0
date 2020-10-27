Received: from mx02.optimcloud.com (mx02.optimcloud.com [46.23.93.22])
 by mx.groups.io with SMTP id smtpd.web08.11851.1603794575661494862
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 03:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=obsd header.b=BLnT/FSb;
 spf=none, err=SPF record not found (domain: optimcloud.com, ip: 46.23.93.22, mailfrom: yocto@optimcloud.com)
Received: from mx02.optimcloud.com (localhost [127.0.0.1])
	by mx02.optimcloud.com (OpenSMTPD) with ESMTP id d89ff6d4
	for <meta-virtualization@lists.yoctoproject.org>;
	Tue, 27 Oct 2020 11:29:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=optimcloud.com; h=
	subject:to:references:from:message-id:date:mime-version
	:in-reply-to:content-type; s=obsd; bh=z8vXuwPYd0g3cqqwLl4w7/5baI
	o5GyOSp4MW5VvtzLA=; b=BLnT/FSbHLOXILzhmMfpk3o7GD87IWQq8TjsT2Fv7v
	5obQ7AQxqVq+Is8QPW9qGpgaoZVJcCqmYyEePpiGGkkn0+EymdC2Kv3DGXKoRO5i
	YT8ZN3xfqfs6cBctIN4CyQnnRX+bYKpyX3xvn8nIIxL8TaqCuUklz9PgYfND+3hl
	+V1mAjylrAf+kxMpw9Dl6cbycQCpVnuHbWUYjS4SwfCJOCfm68awukRW3U6nUhff
	md7hMJjpdrH5thKHbGfTeeasb4RonahzJ+aOTfTY/5xU7AT4PZ0HdSgOgiWCc+oR
	r4vcYhWpyJBnRHasTvXzCnjo+fXhtFbI13VOScVnP66A==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=optimcloud.com; h=subject:to
	:references:from:message-id:date:mime-version:in-reply-to
	:content-type; q=dns; s=obsd; b=Pca19JBKdke3FL+D/P+N2jxzwV74R2OK
	hY16ayYV43Unwqp9t/doq8zt+pk+TJimhlUIVZ+mhoz0xyxAEpVBtj2U3rSYLH3e
	Ycnwauzb0WvrX4HzqcGnSgv3goV+k94oKipsLwD8Ps6O2gpqjQH46XhsYBsTRh0e
	EPw25FQwFFJTF1giQP/pjIpfM8T1UTysoUr71o3pzd9hRniS1BNqhxS8NWgb2RWD
	4u9djN0jr2jSLp4fm55kfalbhMvoXvCyJ4Vv/P16wlZ8Kfn+v9fRj9N7eOF9VVty
	cxpS4egIZQiYhcVDRuHgVIU4mDdTNGfy4bpAI1ET+7n43gfWQaHv9A==
Received: 
	by mx02.optimcloud.com (OpenSMTPD) with ESMTPSA id 2318ca0b (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO) auth=yes user=yocto@optimcloud.com
	for <meta-virtualization@lists.yoctoproject.org>;
	Tue, 27 Oct 2020 11:29:32 +0100 (CET)
Subject: Re: [meta-virtualization] is meta-cloud-services/meta-openstack useable, or a WIP ?
To: meta-virtualization@lists.yoctoproject.org
References: <b2b268d8-8c1a-2424-2029-7238e52404f8@optimcloud.com>
 <CAM9ZRVuxy0VJg45OiQy4OW4P5b7ioV_Gyq1fheCmDxatTG=TSg@mail.gmail.com>
 <1641D1540454F162.12047@lists.yoctoproject.org>
From: "Yocto" <yocto@optimcloud.com>
Message-ID: <7a864b51-a89e-bdb4-769f-d5565ecd62e5@optimcloud.com>
Date: Tue, 27 Oct 2020 17:29:29 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1641D1540454F162.12047@lists.yoctoproject.org>
Content-Type: multipart/alternative;
 boundary="------------7B310C6A304C9216D78C9409"
Content-Language: en-US

--------------7B310C6A304C9216D78C9409
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/20 5:04 PM, Yocto wrote:
>
>
> On 10/27/20 4:30 PM, Paul Barker wrote:
>> On Tue, 27 Oct 2020 at 09:16, Yocto<yocto@optimcloud.com>  wrote:
>> Please set your name in your email client to something other than
>> "Yocto" so as not to mislead & confuse people.
>
> I already did that, its Y L Reddy, email addie is yocto@domain.com 
> which gets mail for literally every yocto list, as it was mentioned 
> before i did change the name... to Y L Reddy
>
maybe that fixed it
>
>
>>
>
> 
>


--------------7B310C6A304C9216D78C9409
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 10/27/20 5:04 PM, Yocto wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1641D1540454F162.12047@lists.yoctoproject.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 10/27/20 4:30 PM, Paul Barker
        wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CAM9ZRVuxy0VJg45OiQy4OW4P5b7ioV_Gyq1fheCmDxatTG=TSg@mail.gmail.com">
        <pre class="moz-quote-pre" wrap="">On Tue, 27 Oct 2020 at 09:16, Yocto <a class="moz-txt-link-rfc2396E" href="mailto:yocto@optimcloud.com" moz-do-not-send="true">&lt;yocto@optimcloud.com&gt;</a> wrote:
</pre>
        <blockquote type="cite"> </blockquote>
        <pre class="moz-quote-pre" wrap="">Please set your name in your email client to something other than
"Yocto" so as not to mislead &amp; confuse people.</pre>
      </blockquote>
      <p>I already did that, its Y L Reddy, email addie is <a
          class="moz-txt-link-abbreviated"
          href="mailto:yocto@domain.com" moz-do-not-send="true">yocto@domain.com</a>
        which gets mail for literally every yocto list, as it was
        mentioned before i did change the name... to Y L Reddy<br>
      </p>
    </blockquote>
    maybe that fixed it<br>
    <blockquote type="cite"
      cite="mid:1641D1540454F162.12047@lists.yoctoproject.org">
      <p> </p>
      <p><br>
      </p>
      <blockquote type="cite"
cite="mid:CAM9ZRVuxy0VJg45OiQy4OW4P5b7ioV_Gyq1fheCmDxatTG=TSg@mail.gmail.com">
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------7B310C6A304C9216D78C9409--
