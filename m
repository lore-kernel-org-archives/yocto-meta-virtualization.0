Received: from mx02.optimcloud.com (mx02.optimcloud.com [46.23.93.22])
 by mx.groups.io with SMTP id smtpd.web10.13148.1603801632302607735
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 05:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=obsd header.b=Yxgcvv1d;
 spf=none, err=SPF record not found (domain: optimcloud.com, ip: 46.23.93.22, mailfrom: dingo@optimcloud.com)
Received: from mx02.optimcloud.com (localhost [127.0.0.1])
	by mx02.optimcloud.com (OpenSMTPD) with ESMTP id 76e39bb0
	for <meta-virtualization@lists.yoctoproject.org>;
	Tue, 27 Oct 2020 13:27:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=optimcloud.com; h=
	subject:to:references:from:message-id:date:mime-version
	:in-reply-to:content-type; s=obsd; bh=taEiJ0EuCTr0f62AXWtE3/rMB3
	/bYIN0V076AHcmurI=; b=Yxgcvv1divWkqG7nKAtOqOzQNr9E3XyX1N6i40h4Xo
	dmdbPiuslS5XMbRE083GENN9YLVzTMpf8HKbKwE3BPwaHHeoiko+WDtE1+07u7z1
	ECuvEkp0W/sURmSF6ePLMYQHYzoynSx+sd5RkyLPTULZyu27v/hmilBIM8IU4LNb
	8JsCb4qLJjn0LEL/yObFWOvkoWLNlaqDJEh+W3XDg5ViJpgnmUCKenYSZsw/nzRA
	SmXZD2l1pneEFpWC6R55l6Gz91/HdrJF9WSeUEAFzmS8OkX7lPkz8djX8fA97d44
	zrQ3nLzUd9wuz3inJcBPohUa8cbmxvgLqvFkRFmGG83Q==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=optimcloud.com; h=subject:to
	:references:from:message-id:date:mime-version:in-reply-to
	:content-type; q=dns; s=obsd; b=C+T2BZAnrYqjba2XaMg2WlF3pI7bsL4D
	zZg1cDvnTyo8kntwirCR7ikwNgKZKwGV8d5LdKqNv2x4j+gDFnCy4GUmD0xXE5i2
	mGsobxULsrIvL+n1G/9fH4bTcfsH0agkfccywSzgtHXbh34MADsYk7ZFgvGeEvAP
	swhRgj1T2jDIa0ioONpdiNAyc3Le4k+Laif58rWBWjrJG0N1FkemAsvVQcOayDrl
	EpWhxYQF1pdMnlkAhf+zAMs+IpoldgJCm1cDtXw2mj6csguv6Z7Ui89pUM+h7+nJ
	j4/DIU8bM/m9Y8O869cpUF/mFw8kp2Yn/hg5JCI0KPaYnbPPVSPNBA==
Received: 
	by mx02.optimcloud.com (OpenSMTPD) with ESMTPSA id 2bb1ab87 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO) auth=yes user=support@optimcloud.com
	for <meta-virtualization@lists.yoctoproject.org>;
	Tue, 27 Oct 2020 13:27:09 +0100 (CET)
Subject: Re: [meta-virtualization] is meta-cloud-services/meta-openstack useable, or a WIP ?
To: meta-virtualization@lists.yoctoproject.org
References: <b2b268d8-8c1a-2424-2029-7238e52404f8@optimcloud.com>
 <CAM9ZRVuxy0VJg45OiQy4OW4P5b7ioV_Gyq1fheCmDxatTG=TSg@mail.gmail.com>
 <24a6f227-7d2b-cd96-e35b-d3f16546f51f@optimcloud.com>
 <CADkTA4MJOgFdLUdPS8AY-+Hy3-dGqsSD5uKWWdpVWZuHj0mfWw@mail.gmail.com>
From: "Dingo" <dingo@optimcloud.com>
Message-ID: <6c39df0f-5444-1b9c-dbf2-8a7640494def@optimcloud.com>
Date: Tue, 27 Oct 2020 19:27:05 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4MJOgFdLUdPS8AY-+Hy3-dGqsSD5uKWWdpVWZuHj0mfWw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------8DB3177491524A80335882F3"
Content-Language: en-US

--------------8DB3177491524A80335882F3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/27/20 7:05 PM, Bruce Ashfield wrote:
> On Tue, Oct 27, 2020 at 6:05 AM Yocto <yocto@optimcloud.com> wrote:
>>
>> On 10/27/20 4:30 PM, Paul Barker wrote:
>>
>> On Tue, 27 Oct 2020 at 09:16, Yocto <yocto@optimcloud.com> wrote:
>>
>> Please set your name in your email client to something other than
>> "Yocto" so as not to mislead & confuse people.
>>
>> I already did that, its Y L Reddy, email addie is yocto@domain.com which gets mail for literally every yocto list, as it was mentioned before i did change the name... to Y L Reddy
>>
> Your mail client (or however you are sending messages) is still
> misconfigured. It isn't filling in your real name, along with the
> actual address.
>
> Hence why I agree with Paul, very confusing as it comes through. In
> particular, since your message isn't closed with your name, we'd
> otherwise have no idea who was sending it.

Yeah using firefox and i already unsubbed everything and will be using 
this addie from now on, appears its a bug in groups, we tested and 
modified, no matter what it still comes as Yocto


>
> Bruce
>
>>
>>
>>
>>
>>
>>
>>
>
>
> 
>

--------------8DB3177491524A80335882F3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/27/20 7:05 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4MJOgFdLUdPS8AY-+Hy3-dGqsSD5uKWWdpVWZuHj0mfWw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Oct 27, 2020 at 6:05 AM Yocto <a class="moz-txt-link-rfc2396E" href="mailto:yocto@optimcloud.com">&lt;yocto@optimcloud.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 10/27/20 4:30 PM, Paul Barker wrote:

On Tue, 27 Oct 2020 at 09:16, Yocto <a class="moz-txt-link-rfc2396E" href="mailto:yocto@optimcloud.com">&lt;yocto@optimcloud.com&gt;</a> wrote:

Please set your name in your email client to something other than
"Yocto" so as not to mislead &amp; confuse people.

I already did that, its Y L Reddy, email addie is <a class="moz-txt-link-abbreviated" href="mailto:yocto@domain.com">yocto@domain.com</a> which gets mail for literally every yocto list, as it was mentioned before i did change the name... to Y L Reddy

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Your mail client (or however you are sending messages) is still
misconfigured. It isn't filling in your real name, along with the
actual address.

Hence why I agree with Paul, very confusing as it comes through. In
particular, since your message isn't closed with your name, we'd
otherwise have no idea who was sending it.</pre>
    </blockquote>
    <p>Yeah using firefox and i already unsubbed everything and will be
      using this addie from now on, appears its a bug in groups, we
      tested and modified, no matter what it still comes as Yocto<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CADkTA4MJOgFdLUdPS8AY-+Hy3-dGqsSD5uKWWdpVWZuHj0mfWw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Bruce

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">







</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------8DB3177491524A80335882F3--
