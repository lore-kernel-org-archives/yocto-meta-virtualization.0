Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.11409.1589977400842137419
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 May 2020 05:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04KCMBDB005011
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 20 May 2020 05:22:53 -0700
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 20 May 2020
 05:22:47 -0700
Subject: Re: [meta-virtualization] [PATCH 1/1] notary: Define SRCREV_FORMAT to make it work with archiver.bbclass
To: Paul Barker <pbarker@konsulko.com>
CC: <meta-virtualization@lists.yoctoproject.org>
References: <20200520082737.76973-1-liezhi.yang@windriver.com>
 <3873.1589968841005157960@lists.yoctoproject.org>
 <CAM9ZRVvppkewhy94Gq2XHLReJnAQC8nSVCKpLKeu+YZ+-RRO8Q@mail.gmail.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <a8f8d3da-4a8c-7923-d06e-1bee5afefc3b@windriver.com>
Date: Wed, 20 May 2020 20:22:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVvppkewhy94Gq2XHLReJnAQC8nSVCKpLKeu+YZ+-RRO8Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Paul,

On 5/20/20 7:26 PM, Paul Barker wrote:
> On Wed, 20 May 2020 at 11:00, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Hi Bruce,
>>
>> Please ignore this patch, I found more recipes in meta-virt have this issue, we need fix all of them or find a better solutions.
> 
> I think the issue should probably be logged against the archiver
> itself in the Yocto bugzilla. If the archiver is changing SRC_URI it
> should handle any consequences, not require recipes to adapt for it.

Seems that I've figured the problem, do_ar_original has copy SRC_URI into
the variable urls, then when call fetch = bb.fetch2.Fetch(urls, d), there
would be duplicated urls as the error reported:

     git://github.com/docker/notary.git;destsuffix=git/src/github.com/docker/notary
     git://github.com/docker/notary.git


The first one is from original SRC_URI, the second one is from the
variable 'urls', so cleanup SRC_URI before call bb.fetch2.Fetch() can fix the
problem.

Here is the patch, I appreciate it if you can help to review before I send it to
oe-core mailing list.

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 817b91207f..73d5aa7787 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -193,7 +193,13 @@ python do_ar_original() {
                  del decoded[5][param]
          encoded = bb.fetch2.encodeurl(decoded)
          urls[i] = encoded
-    fetch = bb.fetch2.Fetch(urls, d)
+
+    # Cleanup SRC_URI before call bb.fetch2.Fetch() since now SRC_URI is in the
+    # variable "urls", otherwise there might be errors like:
+    # The SRCREV_FORMAT variable must be set when multiple SCMs are used
+    ld = bb.data.createCopy(d)
+    ld.setVar('SRC_URI', '')
+    fetch = bb.fetch2.Fetch(urls, ld)
      tarball_suffix = {}
      for url in fetch.urls:
          local = fetch.localpath(url).rstrip("/");


// Robert

> 
> 
> 
> 
