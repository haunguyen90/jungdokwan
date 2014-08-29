<?php

/*
 * This file is part of the Predis package.
 *
 * (c) Daniele Alessandri <suppakilla@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Predis;

use Predis\Connection\AggregatedConnectionInterface;
use Predis\Connection\ClusterConnectionInterface;
use Predis\Connection\ConnectionInterface;

/**
 * Defines a few helper methods.
 *
 * @author Daniele Alessandri <suppakilla@gmail.com>
 * @deprecated Deprecated since v0.8.3.
 */
class Helpers
{
    /**
     * Offers a generic and reusable method to handle exceptions generated by
     * a connection object.
     *
     * @deprecated Deprecated since v0.8.3 - moved in Predis\CommunicationException::handle()
     * @param CommunicationException $exception Exception.
     */
    public static function onCommunicationException(CommunicationException $exception)
    {
        if ($exception->shouldResetConnection()) {
            $connection = $exception->getConnection();

            if ($connection->isConnected()) {
                $connection->disconnect();
            }
        }

        throw $exception;
    }

    /**
     * Normalizes the arguments array passed to a Redis command.
     *
     * @deprecated Deprecated since v0.8.3 - moved in Predis\Command\AbstractCommand::normalizeArguments()
     * @param array $arguments Arguments for a command.
     * @return array
     */
    public static function filterArrayArguments(Array $arguments)
    {
        if (count($arguments) === 1 && is_array($arguments[0])) {
            return $arguments[0];
        }

        return $arguments;
    }

    /**
     * Normalizes the arguments array passed to a variadic Redis command.
     *
     * @deprecated Deprecated since v0.8.3 - moved in Predis\Command\AbstractCommand::normalizeVariadic()
     * @param array $arguments Arguments for a command.
     * @return array
     */
    public static function filterVariadicValues(Array $arguments)
    {
        if (count($arguments) === 2 && is_array($arguments[1])) {
            return array_merge(array($arguments[0]), $arguments[1]);
        }

        return $arguments;
    }
}
