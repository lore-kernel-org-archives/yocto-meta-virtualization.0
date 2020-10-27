Received: from mx02.optimcloud.com (mx02.optimcloud.com [46.23.93.22])
 by mx.groups.io with SMTP id smtpd.web10.13163.1603801701259238554
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 05:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=obsd header.b=BZT10xt6;
 spf=none, err=SPF record not found (domain: optimcloud.com, ip: 46.23.93.22, mailfrom: dingo@optimcloud.com)
Received: from mx02.optimcloud.com (localhost [127.0.0.1])
	by mx02.optimcloud.com (OpenSMTPD) with ESMTP id 8b76bd63
	for <meta-virtualization@lists.yoctoproject.org>;
	Tue, 27 Oct 2020 13:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=optimcloud.com; h=
	subject:to:references:from:message-id:date:mime-version
	:in-reply-to:content-type; s=obsd; bh=XmAaKL2HaUtly+COWGGVQZwjl4
	VU0Df7PJ1ik8XR5+M=; b=BZT10xt6J8p/mzVS8tmz9Dfk+973anNRhwiDTziTJD
	n+QTWBiTaR5XDMiD+xZAf6YxT/bR6pCLBZedjQ54bnuGni+y3in+Z470UtkRwFQv
	2IUkdsmy3UgplAQk6p5GceqSNo729OV1hLVtUExNPprGuyA4mVVf5cPXO639Twy2
	iE335uEayKoiqvMf3I4XEpsC822Coo9PvtB4TX/C5D3FYHIBi77ElwsqKmNV4mbd
	8fNq+Ww74VymzkvTvTvSOkzBQhGQep/tyKLyejZoIzCW8iKvQS9ZmI5HXq2cEZgf
	YwQ3vVJYLcJWILeaIxAZXoJYBX+hdRTylqQ3bwqSNulw==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=optimcloud.com; h=subject:to
	:references:from:message-id:date:mime-version:in-reply-to
	:content-type; q=dns; s=obsd; b=lp7P4SG+qB9I0W3fwiIDwhj9+LO6x7T6
	PqEbgDgEyzGDIhZcDwXuSKU466cKubMaLJl4UOs4krdj93znpbJpGvitu/Kbfi38
	Saq03daF10USV8GNwWWYVMC09qFEJvfV1LkACYygWoZLGipYQ/tKne5A2bbvkiFB
	uBWLguDqgQuSPtxyyR3yU8TkPpxyaQzueXZxRD4pUcWrSo1cN7v4TLNkbun+SfDD
	9xXAmsW8P5AUmz3AH2kOuoTK5dPpKQHaD11rxz/fzNC1Ypy9/oEwaRXIsHoQUaYE
	8ovFAHPfAgriN0tQpK8ros8sFhU7novmn1HS1ZWXryR+QbndX4QIQA==
Received: 
	by mx02.optimcloud.com (OpenSMTPD) with ESMTPSA id 5d0dfb54 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO) auth=yes user=support@optimcloud.com
	for <meta-virtualization@lists.yoctoproject.org>;
	Tue, 27 Oct 2020 13:28:18 +0100 (CET)
Subject: Re: [meta-virtualization] is meta-cloud-services/meta-openstack useable, or a WIP ?
To: meta-virtualization@lists.yoctoproject.org
References: <b2b268d8-8c1a-2424-2029-7238e52404f8@optimcloud.com>
 <CADkTA4MwLP4ScGjjZN4uhA=sAj1g2fZefWj71rpotrPrhVdLXA@mail.gmail.com>
From: "Dingo" <dingo@optimcloud.com>
Message-ID: <f0be59b1-3e21-8520-ecc4-934d0a84df38@optimcloud.com>
Date: Tue, 27 Oct 2020 19:28:15 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4MwLP4ScGjjZN4uhA=sAj1g2fZefWj71rpotrPrhVdLXA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------23095E870DDD45187942DA16"
Content-Language: en-US

--------------23095E870DDD45187942DA16
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/27/20 7:07 PM, Bruce Ashfield wrote:
> On Tue, Oct 27, 2020 at 5:16 AM Yocto <yocto@optimcloud.com> wrote:
>> okay reading the doc README it states
>>
>> There are six openstack layers that are used to build a controller/compute
>> node image pair. The dependencies of these layers are also required for a
>> build, and are listed in the layers themselves.
>>
>>     - meta-cloud-services/meta-openstack
>>     - meta-cloud-services/meta-openstack-compute-deploy
>>     - meta-cloud-services/meta-openstack-controller-deploy
>>     - meta-cloud-services/meta-openstack-qemu
>>     - meta-cloud-services/meta-openstack-compute-test-config
>>     - meta-cloud-services/meta-openstack-controller-test-config
>>
>> so the question is, is this actually usable to bitbake openstack based images ? or a Work in progress ?
>>
> They are now a work in progress. They *worked*, but we didn't have a
> dedicated maintainer, so we make sure the re-usable recipes work (and
> a few have migrated to the main meta-virt over time), but to build and
> deploy working controller and compute nodes, they wouldn't be usable
> out of the box.
>
> Bruce

So they need updating, maintaining, i see alot of python2 and python3 
mixed in here.

guess they would have to be gone through one by one to get it back to 
functional.

Ill take a look.


>
>>
>>
>
>
> 
>

--------------23095E870DDD45187942DA16
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/27/20 7:07 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4MwLP4ScGjjZN4uhA=sAj1g2fZefWj71rpotrPrhVdLXA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Oct 27, 2020 at 5:16 AM Yocto <a class="moz-txt-link-rfc2396E" href="mailto:yocto@optimcloud.com">&lt;yocto@optimcloud.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
okay reading the doc README it states

There are six openstack layers that are used to build a controller/compute
node image pair. The dependencies of these layers are also required for a
build, and are listed in the layers themselves.

   - meta-cloud-services/meta-openstack
   - meta-cloud-services/meta-openstack-compute-deploy
   - meta-cloud-services/meta-openstack-controller-deploy
   - meta-cloud-services/meta-openstack-qemu
   - meta-cloud-services/meta-openstack-compute-test-config
   - meta-cloud-services/meta-openstack-controller-test-config

so the question is, is this actually usable to bitbake openstack based images ? or a Work in progress ?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
They are now a work in progress. They *worked*, but we didn't have a
dedicated maintainer, so we make sure the re-usable recipes work (and
a few have migrated to the main meta-virt over time), but to build and
deploy working controller and compute nodes, they wouldn't be usable
out of the box.

Bruce</pre>
    </blockquote>
    <p>So they need updating, maintaining, i see alot of python2 and
      python3 mixed in here.</p>
    <p>guess they would have to be gone through one by one to get it
      back to functional.</p>
    <p>Ill take a look.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CADkTA4MwLP4ScGjjZN4uhA=sAj1g2fZefWj71rpotrPrhVdLXA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

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

--------------23095E870DDD45187942DA16--
