Received: from mx02.optimcloud.com (mx02.optimcloud.com [46.23.93.22])
 by mx.groups.io with SMTP id smtpd.web11.2575.1615696330274109111
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 13 Mar 2021 20:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=obsd header.b=sP5lK+H7;
 spf=none, err=permanent DNS error (domain: optimcloud.com, ip: 46.23.93.22, mailfrom: yocto@optimcloud.com)
Received: from mx02.optimcloud.com (localhost [127.0.0.1])
	by mx02.optimcloud.com (OpenSMTPD) with ESMTP id 3b39c1ef
	for <meta-virtualization@lists.yoctoproject.org>;
	Sun, 14 Mar 2021 05:32:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=optimcloud.com; h=
	subject:to:references:from:message-id:date:mime-version
	:in-reply-to:content-type; s=obsd; bh=IXu6FcDkWpS5c4f1FJ2cxBulmh
	NxpkYk/tO0UPuaK/o=; b=sP5lK+H7s/6I9eh9imRKEfk/ClPPqSoKl6/aZpeEyh
	BrfqX1uSGYqOejZ4HqBmWqlms0w/+hxlIlJ7ar4DRAlHDJycQLqJqh24dLm2K9EM
	F+Yi1bcifL9tOjyyi6tJChVbukLimtU5vywD5mr7mZrLeEARbdttfd8Ld6UO2WM7
	lc1I9oDxGrT0IUTFuQq/u31wFTfzgqa8JHIWnT1KUy7L2lOkhVuOhvn9klSmtJzp
	fR/qoIO5akLU/e35nNRz9AdaqlkXfFJThkYRgUh8t216PqK4zUhL+pZAgts8LNij
	O+8Nr+gobTYF7tgQwN5z6E2Hno76j9UTnDIeoou2QdyQ==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=optimcloud.com; h=subject:to
	:references:from:message-id:date:mime-version:in-reply-to
	:content-type; q=dns; s=obsd; b=HX/dkzcLhaAdk3hxGt4jfKDNZZoMhQCU
	gmSXMsjFJlKBREM5fCp7aLSaz9yeysCrK2vrHiBldXedqz4mlq2OtfuBNd4Rw3CF
	oUTROX2DG6dNPlrsDcEDypQV6PZrvpTue4A+k0v3HAIDfG4Z52r2jMOHAOFttDcT
	hdKmCJfF6dkuYCz3V9nQxaHiMO5Xa1OvvYO0Gqz66hztquDXJtD0xe5eUsYghkJF
	CarvE1uxzmejs8caEGJ86JH49qjpeJVItDoTWDLa6HL9VJRozz8NRQ5vgJeN/HoJ
	f5KLAD5vGWwKln5jYoBJtP7hBVQcVTjVLnJFLWrHgnObPWqcuzznDQ==
Received: 
	by mx02.optimcloud.com (OpenSMTPD) with ESMTPSA id 67208a61 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) auth=yes user=yocto@optimcloud.com
	for <meta-virtualization@lists.yoctoproject.org>;
	Sun, 14 Mar 2021 05:32:06 +0100 (CET)
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: meta-virtualization@lists.yoctoproject.org
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com>
 <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <16462648E2B320A8.24110@lists.yoctoproject.org>
 <164627F27D18DB55.10479@lists.yoctoproject.org>
 <CADkTA4MKnhDuf85C3X=CxqrMkCKy1ka3fWxVNfSN9U=m2cJWaw@mail.gmail.com>
 <DBBPR08MB4725AF4604F11A7DF0A83E0491E80@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <CADkTA4PgwD1OwPa4kjAGHANjHYG7fbgmZAvGSw6nEt1x1Mvh3Q@mail.gmail.com>
 <DBBPR08MB4725692B5248F6A8064C6CEC91E70@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <2a18b921-a876-5880-2f7a-43b1600695c8@axis.com>
 <CADkTA4Po_1y09qXiMF3Mh5-d9fkVNQJfyqyhMrEbkiOq8Ew8eQ@mail.gmail.com>
From: "Yocto" <yocto@optimcloud.com>
Message-ID: <4e890cce-1534-d2a0-435b-4530c27e34b5@optimcloud.com>
Date: Sun, 14 Mar 2021 11:32:01 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Po_1y09qXiMF3Mh5-d9fkVNQJfyqyhMrEbkiOq8Ew8eQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------B29C5FDB1F2F0B0717E70737"
Content-Language: en-US

--------------B29C5FDB1F2F0B0717E70737
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/14/21 2:30 AM, Bruce Ashfield wrote:
> On Tue, Nov 17, 2020 at 9:14 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
>> On 2020-11-12 08:04, Lance Yang wrote:
>>> I started k3s server without agent and confirmed the node is ready. Then
>>> I copied the node_token and then ran k3s agent with that token and
>>> specified the server url.
>> Did you do this on the same device?
>> I always run the k3s master on one device and the k3s agents on other
>> machines (and thought that was how it is supposed to work).
>>
> FYI: after literally 5 months of on and off (most off) debugging and
> integration, I have finally gotten to the bottom of this, and now can
> bring up my all in one node out of the box!
>
bravo kube-edge next, or starlingx simplex aio ---- meta-stx

which combines k8s and openstack into a single platform

which i thought would be the ultimate goal for OverC :)

just thinking to myself outloud...



> I can now pull k3s into lots of little bits and am confident that I
> can support it, given my recent findings and debug.
>
> I'm cleaning up changes, and will push a fully updated k3s to
> meta-virt master in the coming week.
>
> Cheers,
>
> Bruce
>
>
>> BR,
>>
>> /Joakim
>>
>>
>>
>>
>
>
> 
>

--------------B29C5FDB1F2F0B0717E70737
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/14/21 2:30 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4Po_1y09qXiMF3Mh5-d9fkVNQJfyqyhMrEbkiOq8Ew8eQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Nov 17, 2020 at 9:14 AM Joakim Roubert <a class="moz-txt-link-rfc2396E" href="mailto:joakim.roubert@axis.com">&lt;joakim.roubert@axis.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 2020-11-12 08:04, Lance Yang wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
I started k3s server without agent and confirmed the node is ready. Then
I copied the node_token and then ran k3s agent with that token and
specified the server url.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Did you do this on the same device?
I always run the k3s master on one device and the k3s agents on other
machines (and thought that was how it is supposed to work).

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
FYI: after literally 5 months of on and off (most off) debugging and
integration, I have finally gotten to the bottom of this, and now can
bring up my all in one node out of the box!

</pre>
    </blockquote>
    <p>bravo kube-edge next, or starlingx simplex aio ---- meta-stx<br>
    </p>
    <p>which combines k8s and openstack into a single platform</p>
    <p>which i thought would be the ultimate goal for OverC :)</p>
    <p>just thinking to myself outloud... <br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CADkTA4Po_1y09qXiMF3Mh5-d9fkVNQJfyqyhMrEbkiOq8Ew8eQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">I can now pull k3s into lots of little bits and am confident that I
can support it, given my recent findings and debug.

I'm cleaning up changes, and will push a fully updated k3s to
meta-virt master in the coming week.

Cheers,

Bruce


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">BR,

/Joakim




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

--------------B29C5FDB1F2F0B0717E70737--
