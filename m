Received: from mx02.optimcloud.com (mx02.optimcloud.com [46.23.93.22])
 by mx.groups.io with SMTP id smtpd.web11.11816.1603793099684122761
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 03:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=obsd header.b=bcWbAVaA;
 spf=none, err=SPF record not found (domain: optimcloud.com, ip: 46.23.93.22, mailfrom: yocto@optimcloud.com)
Received: from mx02.optimcloud.com (localhost [127.0.0.1])
	by mx02.optimcloud.com (OpenSMTPD) with ESMTP id 4bfdc70f
	for <meta-virtualization@lists.yoctoproject.org>;
	Tue, 27 Oct 2020 11:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=optimcloud.com; h=
	subject:to:references:from:message-id:date:mime-version
	:in-reply-to:content-type; s=obsd; bh=cTtLRUFPQKZVf/Mwhxb2bEaRAF
	Gc1gGcZcMv2qSMU7o=; b=bcWbAVaAYrMQ/9+SJz6LCGf68z/lZMc8isu/00TjOS
	Ts/AHmd9caChZee2kqEcrKvKxpgWTNn/IHcskl/+W10r8vtTONj9zhnzYFAeqwH3
	iu0LlJz9Rg+vO92IZcstmYZbdH5OfTS+FbJFgW1dQJmtDP09KFEsCQsNptzfIWOL
	MpVn/sSEj1uZTYHIlMKJm5gUHy3j3eSjVBfO80cSWpAXcxXn24ap6V8kHTbh6TZ1
	NskPZH8J60IrGJgIBQlEKP5ycHAdXc7lBFvDpKzQGH6sz/BlC0s60QnkmEFNWNHT
	sGL20CTaAd/r71LyPC9E6dDfuPG1Jty3yTroJOrdh++A==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=optimcloud.com; h=subject:to
	:references:from:message-id:date:mime-version:in-reply-to
	:content-type; q=dns; s=obsd; b=GxVku4Ww31eIQYm7ARLK6QM+veDBOye3
	ghTN3W6jZVRyRfeVEOfByvb09nPzppUKXjOKHt5Z+bpEIKbRQ+13dqOqqwpexvVw
	nPwUPoHtiu6jKse31XDnpM4d6cHYk7jHEbLRf1t/YMTG1RjdptrUKtZvf3raAjMx
	wF/wFr05i+EoNh2NM9/ZRwUVz2MiQWR/NHRMjfqZ3+VKP4hio56bGdMCEjsbDcs2
	1q1cPxM2JdZ5wyNf2lzw17AILi6QE82kTv3eyjzJicWEgjHrH3uGZ7QBvyu3fZ0S
	AXS3CeRNhwrIvJFqZl4K5S1aTWZwFz2ufSCzS8hkOS7uqnFVEdQfWA==
Received: 
	by mx02.optimcloud.com (OpenSMTPD) with ESMTPSA id 83d1b2f0 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO) auth=yes user=yocto@optimcloud.com
	for <meta-virtualization@lists.yoctoproject.org>;
	Tue, 27 Oct 2020 11:04:56 +0100 (CET)
Subject: Re: [meta-virtualization] is meta-cloud-services/meta-openstack useable, or a WIP ?
To: meta-virtualization@lists.yoctoproject.org
References: <b2b268d8-8c1a-2424-2029-7238e52404f8@optimcloud.com>
 <CAM9ZRVuxy0VJg45OiQy4OW4P5b7ioV_Gyq1fheCmDxatTG=TSg@mail.gmail.com>
From: "Yocto" <yocto@optimcloud.com>
Message-ID: <24a6f227-7d2b-cd96-e35b-d3f16546f51f@optimcloud.com>
Date: Tue, 27 Oct 2020 17:04:52 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVuxy0VJg45OiQy4OW4P5b7ioV_Gyq1fheCmDxatTG=TSg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------8A4CD8A7686136C283FA25FC"
Content-Language: en-US

--------------8A4CD8A7686136C283FA25FC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/27/20 4:30 PM, Paul Barker wrote:
> On Tue, 27 Oct 2020 at 09:16, Yocto <yocto@optimcloud.com> wrote:
> Please set your name in your email client to something other than
> "Yocto" so as not to mislead & confuse people.

I already did that, its Y L Reddy, email addie is yocto@domain.com which 
gets mail for literally every yocto list, as it was mentioned before i 
did change the name... to Y L Reddy


>
>
> 
>

--------------8A4CD8A7686136C283FA25FC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/27/20 4:30 PM, Paul Barker wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAM9ZRVuxy0VJg45OiQy4OW4P5b7ioV_Gyq1fheCmDxatTG=TSg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, 27 Oct 2020 at 09:16, Yocto <a class="moz-txt-link-rfc2396E" href="mailto:yocto@optimcloud.com">&lt;yocto@optimcloud.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please set your name in your email client to something other than
"Yocto" so as not to mislead &amp; confuse people.</pre>
    </blockquote>
    <p>I already did that, its Y L Reddy, email addie is
      <a class="moz-txt-link-abbreviated" href="mailto:yocto@domain.com">yocto@domain.com</a> which gets mail for literally every yocto list,
      as it was mentioned before i did change the name... to Y L Reddy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAM9ZRVuxy0VJg45OiQy4OW4P5b7ioV_Gyq1fheCmDxatTG=TSg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------8A4CD8A7686136C283FA25FC--
