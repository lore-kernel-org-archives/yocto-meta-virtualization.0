Subject: Re: [raspberry-pi4-xen-series] : Console login failure for xen-image-minimal
To: meta-virtualization@lists.yoctoproject.org
From: "Ashishx88" <ashish.emailaddress@gmail.com>
X-Originating-Location: Pune, Maharashtra, IN (106.193.251.32)
X-Originating-Platform: Linux Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 08 Jul 2020 23:31:28 -0700
References: <22011.1594271013736061823@lists.yoctoproject.org>
In-Reply-To: <22011.1594271013736061823@lists.yoctoproject.org>
Message-ID: <3070.1594276288139379212@lists.yoctoproject.org>
X-Groupsio-MsgNum: 5562
Content-Type: multipart/mixed; boundary="RyjMfmikRUXPOMDR4xzi"

--RyjMfmikRUXPOMDR4xzi
Content-Type: multipart/alternative; boundary="BUy9F5c1DFSh6i5cbbiW"

--BUy9F5c1DFSh6i5cbbiW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I created an patch for this as per inputs shared above.
Can team please review and share feedback if any as this being my first pa=
tch for community.

Thanks
Ashish.

--BUy9F5c1DFSh6i5cbbiW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I created an patch for this as per inputs shared above.&nbsp;<br />Can team=
 please review and share feedback if any as this being my first patch for c=
ommunity.&nbsp;<br /><br />Thanks&nbsp;<br />Ashish.<br />

--BUy9F5c1DFSh6i5cbbiW--

--RyjMfmikRUXPOMDR4xzi
Content-Type: text/x-patch; name="0001-Prevents-two-getty-running-on-single-serial-console-.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-Prevents-two-getty-running-on-single-serial-console-.patch"

RnJvbSBlZDkxYzNjODNkNDcxYTg4NThmZDc3YzM5NWQ0MWZkMDYxOThjM2YwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBc2hpc2ggPGFzaGlzaG1AbXZpc3RhLmNvbT4KRGF0ZTogVGh1
LCA5IEp1bCAyMDIwIDExOjM5OjAwICswNTMwClN1YmplY3Q6IFtQQVRDSF0gUHJldmVudHMgdHdv
IGdldHR5IHJ1bm5pbmcgb24gc2luZ2xlIHNlcmlhbCBjb25zb2xlIChodmMwKQoKV2hlbiB4ZW4g
aXMgZW5hYmxlZCBvbiByYXNwYmVycnlwaTQtNjQgbWFjaGluZSB1c2VyIGhhZAp0d28gZ2V0dHkn
cyBydW5uaW5nIG9uIHRoZSBzZXJpYWwgY29uc29sZSBkZXZpY2UgKGh2YzApClRoaXMgbGVkIHRv
IHJvb3QgY3JlZGVudGlhbHMgZmFpbHVyZSBjb250aW51b3VzbHkgZm9yIGZldyB0aW1lCmZvbGxv
d2VkIGJ5IHVzZXIgZ2V0dGluZyB0aGUgcm9vdCBwcm9tcHQuCkJ1dCB1c2VyIHdvdWxkIGJlIHVu
YWJsZSB0byBvcGVyYXRlIG9uIHNlcmlhbCBjb25zb2xlIGFzCmhlIGdldHMgIkxvZ2luIHRpbWVk
IG91dCBhZnRlciA2MCBzZWNvbmRzIiB3aXRoaW4gZmV3IHNlY29uZHMKYW5kIHRoZSBjb250cm9s
IGdvZXMgYmFjayBhZ2FpbiBhc2tpbmcgbG9naW4gY3JlZGVudGlhbHMuCi0tLQogcmVjaXBlcy1j
b3JlL3N5c3Zpbml0L3N5c3Zpbml0LWluaXR0YWJfeGVuLmluYyB8IDEgLQogMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9yZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lz
dmluaXQtaW5pdHRhYl94ZW4uaW5jIGIvcmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0LWlu
aXR0YWJfeGVuLmluYwppbmRleCBkZTBhZjIwLi4wNGZkOGY5IDEwMDY0NAotLS0gYS9yZWNpcGVz
LWNvcmUvc3lzdmluaXQvc3lzdmluaXQtaW5pdHRhYl94ZW4uaW5jCisrKyBiL3JlY2lwZXMtY29y
ZS9zeXN2aW5pdC9zeXN2aW5pdC1pbml0dGFiX3hlbi5pbmMKQEAgLTEsNCArMSwzIEBACiBkb19p
bnN0YWxsX2FwcGVuZCgpIHsKICAgICAgICAgICAgICAgICBlY2hvICIiID4+ICR7RH0ke3N5c2Nv
bmZkaXJ9L2luaXR0YWIKLSAgICAgICAgICAgICAgICBlY2hvICJYMDoxMjM0NTpyZXNwYXduOiR7
YmFzZV9zYmluZGlyfS9nZXR0eS13cmFwcGVyIDExNTIwMCBodmMwIiA+PiAke0R9JHtzeXNjb25m
ZGlyfS9pbml0dGFiCiB9Ci0tIAoyLjcuNAoK

--RyjMfmikRUXPOMDR4xzi--
