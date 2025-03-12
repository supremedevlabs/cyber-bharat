class ServiceResult<T> {
  StatusCode? statusCode;
  T data;
  String? message;
  ServiceResult(
      {required this.statusCode, required this.data, required this.message});
}

enum StatusCode {
  // 1xx Informational Responses

  /// 100 Continue: The initial part of a request has been received and the client should continue with the request.
  continue100(100),

  /// 101 Switching Protocols: The server is switching protocols as requested by the client.
  switchingProtocols(101),

  /// 102 Processing: The server has received the request and is processing it, but no response is available yet.
  processing(102),

  /// 103 Early Hints: The server is sending some headers before the final HTTP message.
  earlyHints(103),

  // 2xx Success

  /// 200 OK: The request has succeeded. Used for successful GET, POST, PUT, DELETE, etc.
  ok(200),

  /// 201 Created: The request has been fulfilled and resulted in a new resource being created. Used for successful POST requests.
  created(201),

  /// 202 Accepted: The request has been accepted for processing, but the processing is not yet complete.
  accepted(202),

  /// 203 Non-Authoritative Information: The request was successful but the information returned is from a third-party source.
  nonAuthoritativeInformation(203),

  /// 204 No Content: The server successfully processed the request, but is not returning any content. Often used for DELETE operations.
  noContent(204),

  /// 205 Reset Content: The server successfully processed the request, but requires the client to reset the document view.
  resetContent(205),

  /// 206 Partial Content: The server is delivering only part of the resource due to a range header sent by the client.
  partialContent(206),

  /// 207 Multi-Status: Conveys information about multiple resources in WebDAV operations.
  multiStatus(207),

  /// 208 Already Reported: Used inside a `<dav:propstat>` response element to avoid repeatedly enumerating internal members of the same collection (WebDAV).
  alreadyReported(208),

  /// 226 IM Used: The server has fulfilled a GET request for the resource with instance-manipulations applied.
  imUsed(226),

  // 3xx Redirection

  /// 300 Multiple Choices: Indicates multiple options for the resource that the client may follow.
  multipleChoices(300),

  /// 301 Moved Permanently: The resource requested has been permanently moved to a new URL.
  movedPermanently(301),

  /// 302 Found: The resource was found at a different URL temporarily.
  found(302),

  /// 303 See Other: The server is redirecting the client to a different resource, typically after a POST operation.
  seeOther(303),

  /// 304 Not Modified: Indicates that the resource has not been modified since the version specified by the request headers. Used for caching.
  notModified(304),

  /// 305 Use Proxy: The requested resource must be accessed through the proxy given by the `Location` header.
  useProxy(305),

  /// 306 Unused: This status code is no longer used and is reserved.
  unused(306),

  /// 307 Temporary Redirect: The resource has been temporarily moved to a different URL, but the original URL should be used for future requests.
  temporaryRedirect(307),

  /// 308 Permanent Redirect: The resource has been permanently moved to a different URL, and the client should update the request URL.
  permanentRedirect(308),

  // 4xx Client Errors

  /// 400 Bad Request: The server could not understand the request due to invalid syntax.
  badRequest(400),

  /// 401 Unauthorized: The client must authenticate itself to get the requested response.
  unauthorized(401),

  /// 402 Payment Required: Reserved for future use, typically for digital payment processing.
  paymentRequired(402),

  /// 403 Forbidden: The client does not have access rights to the content.
  forbidden(403),

  /// 404 Not Found: The server cannot find the requested resource.
  notFound(404),

  /// 405 Method Not Allowed: The request method is known by the server but is not supported by the target resource.
  methodNotAllowed(405),

  /// 406 Not Acceptable: The server cannot produce a response matching the list of acceptable values defined in the request's `Accept` headers.
  notAcceptable(406),

  /// 407 Proxy Authentication Required: The client must authenticate itself with the proxy before sending the request.
  proxyAuthenticationRequired(407),

  /// 408 Request Timeout: The server timed out waiting for the request.
  requestTimeout(408),

  /// 409 Conflict: The request could not be completed due to a conflict with the current state of the resource.
  conflict(409),

  /// 410 Gone: The resource requested is no longer available and will not be available again.
  gone(410),

  /// 411 Length Required: The server refuses to accept the request without a `Content-Length` header.
  lengthRequired(411),

  /// 412 Precondition Failed: The server does not meet one of the preconditions that the requester put on the request.
  preconditionFailed(412),

  /// 413 Payload Too Large: The request entity is larger than the server is willing or able to process.
  payloadTooLarge(413),

  /// 414 URI Too Long: The request URI is longer than the server is willing to interpret.
  uriTooLong(414),

  /// 415 Unsupported Media Type: The media format of the requested data is not supported by the server.
  unsupportedMediaType(415),

  /// 416 Range Not Satisfiable: The range specified by the `Range` header cannot be fulfilled.
  rangeNotSatisfiable(416),

  /// 417 Expectation Failed: The server cannot meet the requirements of the `Expect` request-header field.
  expectationFailed(417),

  /// 418 I'm a Teapot: An Easter egg code indicating that the server refuses to brew coffee because it is, permanently, a teapot.
  imATeapot(418),

  /// 421 Misdirected Request: The request was directed at a server that is unable or unwilling to produce a response.
  misdirectedRequest(421),

  /// 422 Unprocessable Entity: The request was well-formed but could not be followed due to semantic errors (WebDAV).
  unprocessableEntity(422),

  /// 423 Locked: The resource that is being accessed is locked (WebDAV).
  locked(423),

  /// 424 Failed Dependency: The request failed due to failure of a previous request (WebDAV).
  failedDependency(424),

  /// 425 Too Early: The server is unwilling to process the request because it might be replayed.
  tooEarly(425),

  /// 426 Upgrade Required: The client should switch to a different protocol.
  upgradeRequired(426),

  /// 428 Precondition Required: The server requires that the request be conditional.
  preconditionRequired(428),

  /// 429 Too Many Requests: The client has sent too many requests in a given amount of time ("rate limiting").
  tooManyRequests(429),

  /// 431 Request Header Fields Too Large: The server is unwilling to process the request because its header fields are too large.
  requestHeaderFieldsTooLarge(431),

  /// 451 Unavailable For Legal Reasons: The client is requesting a resource that is unavailable due to legal reasons, such as censorship or government-mandated restrictions.
  unavailableForLegalReasons(451),

  // 5xx Server Errors

  /// 500 Internal Server Error: The server encountered an unexpected condition that prevented it from fulfilling the request.
  internalServerError(500),

  /// 501 Not Implemented: The server does not support the functionality required to fulfill the request.
  notImplemented(501),

  /// 502 Bad Gateway: The server was acting as a gateway or proxy and received an invalid response from the upstream server.
  badGateway(502),

  /// 503 Service Unavailable: The server is currently unavailable (because it is overloaded or down for maintenance).
  serviceUnavailable(503),

  /// 504 Gateway Timeout: The server was acting as a gateway or proxy and did not receive a timely response from the upstream server.
  gatewayTimeout(504),

  /// 505 HTTP Version Not Supported: The server does not support the HTTP protocol version used in the request.
  httpVersionNotSupported(505),

  /// 506 Variant Also Negotiates: Transparent content negotiation for the request results in a circular reference.
  variantAlsoNegotiates(506),

  /// 507 Insufficient Storage: The server is unable to store the representation needed to complete the request (WebDAV).
  insufficientStorage(507),

  /// 508 Loop Detected: The server detected an infinite loop while processing the request (WebDAV).
  loopDetected(508),

  /// 510 Not Extended: Further extensions to the request are required for the server to fulfill it.
  notExtended(510),

  /// 511 Network Authentication Required: The client needs to authenticate to gain network access.
  networkAuthenticationRequired(511),

  unknownError(999);

  final int code;

  const StatusCode(this.code);
}
